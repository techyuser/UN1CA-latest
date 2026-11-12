package com.android.systemui.dynamicisland;

import android.app.PendingIntent;
import android.content.Context;
import android.content.pm.PackageManager;
import android.graphics.Bitmap;
import android.graphics.drawable.Drawable;
import android.media.MediaMetadata;
import android.media.session.MediaController;
import android.media.session.MediaSession;
import android.media.session.MediaSessionManager;
import android.media.session.PlaybackState;
import android.os.Handler;
import android.os.Looper;
import android.text.TextUtils;

import java.util.List;

/**
 * Listens directly to MediaSessionManager inside SystemUI (MEDIA_CONTENT_CONTROL).
 */
public final class MediaIslandSource {

    public interface Listener {
        void onItemUpdated(IslandItem item);
        void onItemRemoved(String key);
    }

    public static final String MEDIA_KEY = "island:media";
    private static final long PAUSED_HIDE_DELAY_MS = 45_000L;

    private final Context mContext;
    private final Handler mHandler = new Handler(Looper.getMainLooper());
    private final Listener mListener;
    private final MediaSessionManager mSessionManager;

    private MediaController mActiveController;
    private Bitmap mLastArtworkSrc;
    private Bitmap mRoundedThumb;
    private int mCachedAccent = 0xFF1ED760;

    private final Runnable mPauseTimeoutRunnable = new Runnable() {
        @Override
        public void run() {
            mListener.onItemRemoved(MEDIA_KEY);
        }
    };

    private final MediaController.Callback mControllerCallback = new MediaController.Callback() {
        @Override
        public void onPlaybackStateChanged(PlaybackState state) {
            publishCurrentState();
        }

        @Override
        public void onMetadataChanged(MediaMetadata metadata) {
            publishCurrentState();
        }

        @Override
        public void onSessionDestroyed() {
            mHandler.removeCallbacks(mPauseTimeoutRunnable);
            clearController();
            mListener.onItemRemoved(MEDIA_KEY);
        }
    };

    private final MediaSessionManager.OnActiveSessionsChangedListener mSessionsListener =
            this::pickBestController;

    public MediaIslandSource(Context context, Listener listener) {
        mContext = context.getApplicationContext();
        mListener = listener;
        mSessionManager = (MediaSessionManager) mContext.getSystemService(Context.MEDIA_SESSION_SERVICE);
    }

    public void start() {
        if (mSessionManager == null) {
            return;
        }
        try {
            mSessionManager.addOnActiveSessionsChangedListener(mSessionsListener, null, mHandler);
            pickBestController(mSessionManager.getActiveSessions(null));
        } catch (Throwable ignored) {
        }
    }

    public void stop() {
        mHandler.removeCallbacks(mPauseTimeoutRunnable);
        clearController();
        if (mSessionManager != null) {
            try {
                mSessionManager.removeOnActiveSessionsChangedListener(mSessionsListener);
            } catch (Throwable ignored) {
            }
        }
    }

    private void pickBestController(List<MediaController> controllers) {
        if (controllers == null || controllers.isEmpty()) {
            mHandler.removeCallbacks(mPauseTimeoutRunnable);
            clearController();
            mListener.onItemRemoved(MEDIA_KEY);
            return;
        }

        MediaController chosen = null;
        for (MediaController c : controllers) {
            PlaybackState ps = c.getPlaybackState();
            if (ps != null && isPlayingState(ps.getState())) {
                chosen = c;
                break;
            }
        }
        if (chosen == null) {
            for (MediaController c : controllers) {
                MediaMetadata md = c.getMetadata();
                if (md != null) {
                    chosen = c;
                    break;
                }
            }
        }
        if (chosen == null) {
            mHandler.removeCallbacks(mPauseTimeoutRunnable);
            clearController();
            mListener.onItemRemoved(MEDIA_KEY);
            return;
        }

        MediaSession.Token newTok = chosen.getSessionToken();
        MediaSession.Token oldTok = mActiveController != null ? mActiveController.getSessionToken() : null;
        if (!newTok.equals(oldTok)) {
            clearController();
            mActiveController = chosen;
            mActiveController.registerCallback(mControllerCallback, mHandler);
        }
        publishCurrentState();
    }

    private void clearController() {
        if (mActiveController != null) {
            try {
                mActiveController.unregisterCallback(mControllerCallback);
            } catch (Throwable ignored) {
            }
            mActiveController = null;
        }
        mLastArtworkSrc = null;
        mRoundedThumb = null;
    }

    private void publishCurrentState() {
        MediaController c = mActiveController;
        if (c == null) {
            return;
        }
        PlaybackState ps = c.getPlaybackState();
        MediaMetadata md = c.getMetadata();
        int state = ps != null ? ps.getState() : PlaybackState.STATE_NONE;
        if (state == PlaybackState.STATE_NONE || state == PlaybackState.STATE_STOPPED) {
            mHandler.removeCallbacks(mPauseTimeoutRunnable);
            mListener.onItemRemoved(MEDIA_KEY);
            return;
        }

        String title = md != null ? md.getString(MediaMetadata.METADATA_KEY_TITLE) : null;
        String artist = md != null ? md.getString(MediaMetadata.METADATA_KEY_ARTIST) : null;
        if (TextUtils.isEmpty(artist) && md != null) {
            artist = md.getString(MediaMetadata.METADATA_KEY_ALBUM_ARTIST);
        }
        if (TextUtils.isEmpty(title)) {
            title = resolveAppName(c.getPackageName());
        }

        Bitmap rawArt = null;
        if (md != null) {
            rawArt = md.getBitmap(MediaMetadata.METADATA_KEY_ALBUM_ART);
            if (rawArt == null) {
                rawArt = md.getBitmap(MediaMetadata.METADATA_KEY_ART);
            }
            if (rawArt == null) {
                rawArt = md.getBitmap(MediaMetadata.METADATA_KEY_DISPLAY_ICON);
            }
        }
        if (rawArt != mLastArtworkSrc) {
            mLastArtworkSrc = rawArt;
            if (rawArt != null && !rawArt.isRecycled()) {
                mCachedAccent = ColorExtractor.extractVibrantAccent(rawArt, 0xFF1ED760);
                mRoundedThumb = ColorExtractor.createRoundedSquare(rawArt, 144, 28);
            } else {
                mCachedAccent = 0xFF1ED760;
                mRoundedThumb = null;
            }
        }

        boolean playing = isPlayingState(state);
        mHandler.removeCallbacks(mPauseTimeoutRunnable);
        if (!playing) {
            mHandler.postDelayed(mPauseTimeoutRunnable, PAUSED_HIDE_DELAY_MS);
        }

        IslandItem item = new IslandItem(MEDIA_KEY, IslandItem.Category.MEDIA);
        item.title = title != null ? title : "";
        item.subtitle = artist != null ? artist : resolveAppName(c.getPackageName());
        item.artwork = mRoundedThumb;
        item.iconDrawable = resolveAppIcon(c.getPackageName());
        item.accentColor = mCachedAccent;
        item.showWaveform = true;
        item.waveformPlaying = playing;
        item.mediaController = c;

        long duration = md != null ? Math.max(0L, md.getLong(MediaMetadata.METADATA_KEY_DURATION)) : 0L;
        if (duration > 0L && ps != null) {
            item.hasProgress = true;
            item.progressMax = duration;
            item.progressValue = Math.max(0L, ps.getPosition());
            item.mediaSpeed = ps.getPlaybackSpeed();
            item.mediaPositionUpdateElapsedMs = ps.getLastPositionUpdateTime();
            item.canSeekMedia = (ps.getActions() & PlaybackState.ACTION_SEEK_TO) != 0L;
        }

        try {
            PendingIntent pi = c.getSessionActivity();
            item.contentIntent = pi;
        } catch (Throwable ignored) {
        }

        mListener.onItemUpdated(item);
    }

    private static boolean isPlayingState(int s) {
        return s == PlaybackState.STATE_PLAYING
                || s == PlaybackState.STATE_BUFFERING
                || s == PlaybackState.STATE_CONNECTING;
    }

    private String resolveAppName(String pkg) {
        if (TextUtils.isEmpty(pkg)) {
            return "Media";
        }
        try {
            PackageManager pm = mContext.getPackageManager();
            return String.valueOf(pm.getApplicationLabel(pm.getApplicationInfo(pkg, 0)));
        } catch (Throwable ignored) {
            return "Media";
        }
    }

    private Drawable resolveAppIcon(String pkg) {
        if (TextUtils.isEmpty(pkg)) {
            return null;
        }
        try {
            return mContext.getPackageManager().getApplicationIcon(pkg);
        } catch (Throwable ignored) {
            return null;
        }
    }
}
