package com.android.systemui.dynamicisland;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.database.ContentObserver;
import android.graphics.Path;
import android.graphics.PathMeasure;
import android.graphics.PixelFormat;
import android.graphics.Rect;
import android.graphics.RectF;
import android.hardware.display.DisplayManager;
import android.net.Uri;
import android.os.Handler;
import android.os.Looper;
import android.os.PowerManager;
import android.os.SystemClock;
import android.provider.Settings;
import android.service.notification.StatusBarNotification;
import android.view.Display;
import android.view.DisplayCutout;
import android.view.Gravity;
import android.view.Surface;
import android.view.View;
import android.view.WindowInsets;
import android.view.WindowManager;

import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.atomic.AtomicBoolean;

/**
 * Central coordinator injected into SystemUIApplication.startSystemUserServicesIfNeeded().
 * Eliminates wake/unlock appearance lag by preserving pre-measured window bounds during sleep
 * and restoring visibility synchronously on Display.STATE_ON / ACTION_SCREEN_ON.
 */
public final class DynamicIslandController implements
        MediaIslandSource.Listener,
        SystemEventSource.Listener,
        NotificationIslandSource.Listener,
        IslandOverlayView.Callbacks {

    private static final AtomicBoolean sInitialized = new AtomicBoolean(false);
    private static volatile DynamicIslandController sInstance;

    private final Context mContext;
    private final Handler mMainHandler = new Handler(Looper.getMainLooper());
    private final WindowManager mWindowManager;
    private final PowerManager mPowerManager;
    private final DisplayManager mDisplayManager;

    private final MediaIslandSource mMediaSource;
    private final SystemEventSource mSystemSource;
    private final NotificationIslandSource mNotifSource;
    private final LiveAlertsPrefs mPrefs = new LiveAlertsPrefs();
    private long mLastPreviewNonce = 0L;

    private static final String KEY_LIVE_PREVIEW = "sys:live_preview";

    private IslandOverlayView mOverlayView;
    private WindowManager.LayoutParams mLayoutParams;
    private boolean mWindowAttached = false;

    private final Map<String, IslandItem> mItems = new LinkedHashMap<>();
    private String mManualSelectedKey = null;

    private int mCutoutCenterOffsetX = 0;
    private int mCutoutTopPx = 29;
    private int mCutoutWidthPx = 70;
    private int mCutoutHeightPx = 70;
    private boolean mCutoutKnown = false;

    private boolean mInteractive = true;
    private boolean mDisplayOn = true;
    private boolean mLandscapeOrFullscreenHidden = false;
    private boolean mWasSuspended = false;

    private final Runnable mExpireRunnable = this::pruneExpiredAndRender;

    private final ContentObserver mPrefsObserver = new ContentObserver(mMainHandler) {
        @Override
        public void onChange(boolean selfChange, Uri uri) {
            if (uri != null) {
                String seg = uri.getLastPathSegment();
                if (seg != null && !seg.startsWith(LiveAlertsPrefs.PREFIX)) {
                    return;
                }
            }
            onLivePrefsChanged();
        }
    };

    private final DisplayManager.DisplayListener mDisplayListener = new DisplayManager.DisplayListener() {
        @Override
        public void onDisplayAdded(int displayId) {
        }

        @Override
        public void onDisplayRemoved(int displayId) {
        }

        @Override
        public void onDisplayChanged(int displayId) {
            if (displayId == Display.DEFAULT_DISPLAY) {
                updateDisplayVisibilityAndRotation();
            }
        }
    };

    private final BroadcastReceiver mPowerReceiver = new BroadcastReceiver() {
        @Override
        public void onReceive(Context context, Intent intent) {
            String act = intent != null ? intent.getAction() : null;
            if (Intent.ACTION_SCREEN_OFF.equals(act)) {
                mInteractive = false;
                if (mOverlayView != null && mOverlayView.isExpanded()) {
                    mOverlayView.collapse();
                }
                render(true);
            } else if (Intent.ACTION_SCREEN_ON.equals(act)) {
                mInteractive = true;
                mDisplayOn = true;
                render(true);
            }
            // Note: Do NOT tear down or re-animate on ACTION_USER_PRESENT so unlock is 0ms seamless
        }
    };

    private DynamicIslandController(Context context) {
        mContext = context.getApplicationContext();
        mWindowManager = (WindowManager) mContext.getSystemService(Context.WINDOW_SERVICE);
        mPowerManager = (PowerManager) mContext.getSystemService(Context.POWER_SERVICE);
        mDisplayManager = (DisplayManager) mContext.getSystemService(Context.DISPLAY_SERVICE);

        mMediaSource = new MediaIslandSource(mContext, this);
        mSystemSource = new SystemEventSource(mContext, this);
        mNotifSource = new NotificationIslandSource(mContext, this);
    }

    public static void init(final Context context) {
        if (context == null || !sInitialized.compareAndSet(false, true)) {
            return;
        }
        final DynamicIslandController ctrl = new DynamicIslandController(context);
        sInstance = ctrl;
        if (Looper.myLooper() == Looper.getMainLooper()) {
            ctrl.startInternal();
        } else {
            ctrl.mMainHandler.post(ctrl::startInternal);
        }
    }

    public static void onNotificationPosted(final StatusBarNotification sbn) {
        final DynamicIslandController ctrl = sInstance;
        if (ctrl == null || sbn == null) {
            return;
        }
        if (Looper.myLooper() == Looper.getMainLooper()) {
            ctrl.mNotifSource.onPosted(sbn);
        } else {
            ctrl.mMainHandler.post(() -> ctrl.mNotifSource.onPosted(sbn));
        }
    }

    public static void onNotificationRemoved(final StatusBarNotification sbn) {
        final DynamicIslandController ctrl = sInstance;
        if (ctrl == null || sbn == null) {
            return;
        }
        if (Looper.myLooper() == Looper.getMainLooper()) {
            ctrl.mNotifSource.onRemoved(sbn);
        } else {
            ctrl.mMainHandler.post(() -> ctrl.mNotifSource.onRemoved(sbn));
        }
    }

    public static void onStatusBarAttachedOrInsetsChanged(final View statusBarView) {
        final DynamicIslandController ctrl = sInstance;
        if (ctrl == null || statusBarView == null) {
            return;
        }
        if (Looper.myLooper() == Looper.getMainLooper()) {
            ctrl.inspectStatusBarView(statusBarView);
        } else {
            ctrl.mMainHandler.post(() -> ctrl.inspectStatusBarView(statusBarView));
        }
    }

    private void startInternal() {
        try {
            mInteractive = mPowerManager == null || mPowerManager.isInteractive();
            mPrefs.reload(mContext);
            mLastPreviewNonce = mPrefs.previewNonce;
            try {
                mContext.getContentResolver().registerContentObserver(
                        Settings.Secure.CONTENT_URI, true, mPrefsObserver);
            } catch (Throwable ignored) {
            }

            IntentFilter pf = new IntentFilter();
            pf.addAction(Intent.ACTION_SCREEN_OFF);
            pf.addAction(Intent.ACTION_SCREEN_ON);
            mContext.registerReceiver(mPowerReceiver, pf, Context.RECEIVER_EXPORTED);

            if (mDisplayManager != null) {
                mDisplayManager.registerDisplayListener(mDisplayListener, mMainHandler);
            }

            setupWindow();
            if (mOverlayView != null) {
                mOverlayView.applyTuningConfig(mPrefs);
            }
            updateDisplayVisibilityAndRotation();

            mMediaSource.start();
            mSystemSource.start();
        } catch (Throwable ignored) {
        }
    }

    private void onLivePrefsChanged() {
        mPrefs.reload(mContext);
        if (mOverlayView != null) {
            mOverlayView.applyTuningConfig(mPrefs);
        }
        if (mPrefs.previewNonce > 0L && mPrefs.previewNonce != mLastPreviewNonce) {
            mLastPreviewNonce = mPrefs.previewNonce;
            if (mPrefs.enabled) {
                IslandItem preview = new IslandItem(KEY_LIVE_PREVIEW, IslandItem.Category.FLASH_EVENT);
                preview.transientItem = true;
                preview.expiresAtElapsedMs = SystemClock.elapsedRealtime() + 12_000L;
                preview.vectorKind = GlyphIconView.GLYPH_BOLT;
                preview.accentColor = 0xFF30D158;
                preview.title = "OxygenOS 16 Live Alerts";
                preview.subtitle = "SUPERVOOC • Fluid Glass preview";
                preview.compactRightText = "100%";
                preview.hasProgress = true;
                preview.progressValue = 82L;
                preview.progressMax = 100L;
                mItems.put(KEY_LIVE_PREVIEW, preview);
                mManualSelectedKey = KEY_LIVE_PREVIEW;
                scheduleNextExpiration();
            }
        }
        render(false);
    }

    private void setupWindow() {
        if (mWindowManager == null || mOverlayView != null) {
            return;
        }
        mCutoutTopPx = dp(11);
        mCutoutWidthPx = dp(26.5f);
        mCutoutHeightPx = dp(26.5f);
        try {
            WindowInsets wmInsets = mWindowManager.getCurrentWindowMetrics().getWindowInsets();
            if (wmInsets != null && wmInsets.getDisplayCutout() != null) {
                applyDisplayCutout(wmInsets.getDisplayCutout());
            }
        } catch (Throwable ignored) {
        }

        mOverlayView = new IslandOverlayView(mContext, this);
        mOverlayView.setCutoutGeometry(mCutoutCenterOffsetX, mCutoutTopPx, mCutoutWidthPx, mCutoutHeightPx);
        mOverlayView.setVisibility(View.GONE);

        mLayoutParams = new WindowManager.LayoutParams();
        // Fixed transparent overlay canvas + OnComputeInternalInsetsListener touchableRegion
        // ensures 0 WindowManager relayout IPC calls during 120fps spring animations!
        mLayoutParams.width = WindowManager.LayoutParams.MATCH_PARENT;
        mLayoutParams.height = dp(360);
        mLayoutParams.type = WindowManager.LayoutParams.TYPE_SYSTEM_ERROR;
        mLayoutParams.flags = WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE
                | WindowManager.LayoutParams.FLAG_NOT_TOUCH_MODAL
                | WindowManager.LayoutParams.FLAG_LAYOUT_IN_SCREEN
                | WindowManager.LayoutParams.FLAG_LAYOUT_NO_LIMITS
                | WindowManager.LayoutParams.FLAG_HARDWARE_ACCELERATED;
        mLayoutParams.format = PixelFormat.TRANSLUCENT;
        mLayoutParams.gravity = Gravity.TOP | Gravity.CENTER_HORIZONTAL;
        mLayoutParams.layoutInDisplayCutoutMode = WindowManager.LayoutParams.LAYOUT_IN_DISPLAY_CUTOUT_MODE_ALWAYS;
        mLayoutParams.setFitInsetsTypes(0);
        mLayoutParams.x = 0;
        mLayoutParams.y = 0;
        mLayoutParams.setTitle("DynamicIslandOverlay");
        invokeSetTrustedOverlay(mLayoutParams);

        try {
            mWindowManager.addView(mOverlayView, mLayoutParams);
            mWindowAttached = true;
        } catch (Throwable ignored) {
            mWindowAttached = false;
        }
    }

    private void inspectStatusBarView(View statusBarView) {
        if (!mWindowAttached || mOverlayView == null) {
            return;
        }
        WindowInsets insets = statusBarView.getRootWindowInsets();
        boolean cutoutUpdated = false;
        boolean wakeSync = false;
        if (insets != null) {
            DisplayCutout dc = insets.getDisplayCutout();
            if (dc != null && applyDisplayCutout(dc)) {
                cutoutUpdated = true;
            }
            boolean statusBarVisible = insets.isVisible(WindowInsets.Type.statusBars());
            int rotation = statusBarView.getDisplay() != null
                    ? statusBarView.getDisplay().getRotation()
                    : Surface.ROTATION_0;
            boolean hide = (rotation != Surface.ROTATION_0) || !statusBarVisible;
            if (hide != mLandscapeOrFullscreenHidden) {
                mLandscapeOrFullscreenHidden = hide;
                if (hide && mOverlayView.isExpanded()) {
                    mOverlayView.collapse();
                }
            }
            if (mPowerManager != null && mPowerManager.isInteractive() && !mInteractive) {
                mInteractive = true;
                mDisplayOn = true;
                wakeSync = true;
            }
        }
        if (cutoutUpdated) {
            mOverlayView.setCutoutGeometry(mCutoutCenterOffsetX, mCutoutTopPx, mCutoutWidthPx, mCutoutHeightPx);
        }
        render(wakeSync);
    }

    private void updateDisplayVisibilityAndRotation() {
        if (mDisplayManager != null) {
            Display d = mDisplayManager.getDisplay(Display.DEFAULT_DISPLAY);
            if (d != null) {
                mDisplayOn = (d.getState() == Display.STATE_ON);
                if (mPowerManager != null) {
                    mInteractive = mPowerManager.isInteractive();
                }
                boolean rotated = d.getRotation() != Surface.ROTATION_0;
                if (rotated) {
                    mLandscapeOrFullscreenHidden = true;
                } else if (mLandscapeOrFullscreenHidden) {
                    mLandscapeOrFullscreenHidden = false;
                }
                if (!mCutoutKnown && d.getCutout() != null && applyDisplayCutout(d.getCutout())) {
                    if (mOverlayView != null) {
                        mOverlayView.setCutoutGeometry(mCutoutCenterOffsetX, mCutoutTopPx, mCutoutWidthPx, mCutoutHeightPx);
                    }
                }
            }
        }
        render(true);
    }

    private boolean applyDisplayCutout(DisplayCutout dc) {
        if (dc == null) {
            return false;
        }
        int screenW = mContext.getResources().getDisplayMetrics().widthPixels;
        try {
            Path path = dc.getCutoutPath();
            if (path != null && !path.isEmpty()) {
                // Sample non-degenerate contours so leading "M 0,0" in config_mainBuiltInDisplayCutout
                // does not pull bounds.top down to 0 or inflate cutout height!
                RectF measured = new RectF(Float.MAX_VALUE, Float.MAX_VALUE, -Float.MAX_VALUE, -Float.MAX_VALUE);
                boolean hasContourPoints = false;
                PathMeasure pm = new PathMeasure(path, false);
                float[] pos = new float[2];
                do {
                    float len = pm.getLength();
                    if (len > 6f) {
                        int steps = 32;
                        for (int i = 0; i <= steps; i++) {
                            if (pm.getPosTan((len * i) / steps, pos, null)) {
                                if (pos[1] < dp(68)) {
                                    measured.left = Math.min(measured.left, pos[0]);
                                    measured.top = Math.min(measured.top, pos[1]);
                                    measured.right = Math.max(measured.right, pos[0]);
                                    measured.bottom = Math.max(measured.bottom, pos[1]);
                                    hasContourPoints = true;
                                }
                            }
                        }
                    }
                } while (pm.nextContour());

                if (!hasContourPoints) {
                    path.computeBounds(measured, true);
                }
                if (measured.width() > 6f && measured.height() > 6f && measured.bottom < dp(68)) {
                    int rawW = Math.round(measured.width());
                    int rawH = Math.round(measured.height());
                    int rawTop = Math.round(measured.top);
                    if (rawTop < dp(3) && rawH > rawW * 1.25f && measured.bottom > rawW) {
                        rawH = Math.min(dp(29), rawW);
                        rawTop = Math.max(dp(8), Math.round(measured.bottom - rawH));
                    }
                    int nextCenterOffsetX = Math.round(measured.centerX() - (screenW * 0.5f));
                    int nextTop = Math.max(dp(7), rawTop);
                    int nextW = Math.max(dp(18), rawW);
                    int nextH = Math.max(dp(18), rawH);
                    boolean changed = !mCutoutKnown || nextCenterOffsetX != mCutoutCenterOffsetX
                            || nextTop != mCutoutTopPx || nextW != mCutoutWidthPx || nextH != mCutoutHeightPx;
                    mCutoutCenterOffsetX = nextCenterOffsetX;
                    mCutoutTopPx = nextTop;
                    mCutoutWidthPx = nextW;
                    mCutoutHeightPx = nextH;
                    mCutoutKnown = true;
                    return changed;
                }
            }
        } catch (Throwable ignored) {
        }
        Rect top = dc.getBoundingRectTop();
        if (top != null && top.width() > 0 && top.height() > 0) {
            int nextCenterOffsetX = top.centerX() - (screenW / 2);
            int estCamH = Math.min(dp(28), Math.max(dp(21), Math.min(top.width(), Math.round(top.height() * 0.72f))));
            int nextTop = Math.max(dp(9), top.bottom - estCamH);
            int nextW = Math.min(estCamH + dp(2), top.width());
            boolean changed = !mCutoutKnown || nextCenterOffsetX != mCutoutCenterOffsetX
                    || nextTop != mCutoutTopPx || nextW != mCutoutWidthPx || estCamH != mCutoutHeightPx;
            mCutoutCenterOffsetX = nextCenterOffsetX;
            mCutoutTopPx = nextTop;
            mCutoutWidthPx = nextW;
            mCutoutHeightPx = estCamH;
            mCutoutKnown = true;
            return changed;
        }
        return false;
    }

    @Override
    public void onOverlayCutoutChanged(DisplayCutout dc) {
        if (mOverlayView != null && dc != null && applyDisplayCutout(dc)) {
            mOverlayView.setCutoutGeometry(mCutoutCenterOffsetX, mCutoutTopPx, mCutoutWidthPx, mCutoutHeightPx);
        }
    }

    @Override
    public void onItemUpdated(IslandItem item) {
        if (item == null) {
            return;
        }
        mItems.put(item.key, item);
        if (item.transientItem) {
            mManualSelectedKey = item.key;
        }
        scheduleNextExpiration();
        render(false);
    }

    @Override
    public void onItemRemoved(String key) {
        if (key == null) {
            return;
        }
        if (mItems.remove(key) != null) {
            if (key.equals(mManualSelectedKey)) {
                mManualSelectedKey = null;
            }
            render(false);
        }
    }

    private void applyWindowLayoutUpdate() {
        if (mWindowAttached && mWindowManager != null && mOverlayView != null && mLayoutParams != null) {
            try {
                mWindowManager.updateViewLayout(mOverlayView, mLayoutParams);
            } catch (Throwable ignored) {
            }
        }
    }

    private final Runnable mSetOutsideWatchRunnable = this::applyWindowLayoutUpdate;

    @Override
    public void onExpandedStateChanged(boolean expanded) {
        if (!mWindowAttached || mLayoutParams == null || mOverlayView == null) {
            return;
        }
        mMainHandler.removeCallbacks(mSetOutsideWatchRunnable);
        if (expanded) {
            mLayoutParams.flags |= WindowManager.LayoutParams.FLAG_WATCH_OUTSIDE_TOUCH;
            // Defer WindowManager IPC until after the OxygenOS expand spring so 120fps morph never stutters
            mMainHandler.postDelayed(mSetOutsideWatchRunnable, 460L);
        } else {
            mLayoutParams.flags &= ~WindowManager.LayoutParams.FLAG_WATCH_OUTSIDE_TOUCH;
            mMainHandler.postDelayed(mSetOutsideWatchRunnable, 380L);
        }
    }

    @Override
    public void onCycleIsland(int direction) {
        List<IslandItem> ordered = getOrderedItems();
        if (ordered.size() <= 1) {
            return;
        }
        int cur = findCurrentIndex(ordered);
        int next = (cur + direction + ordered.size()) % ordered.size();
        mManualSelectedKey = ordered.get(next).key;
        render(false);
    }

    @Override
    public void onDismissTransient(String key) {
        onItemRemoved(key);
    }

    private void pruneExpiredAndRender() {
        long now = SystemClock.elapsedRealtime();
        boolean changed = false;
        Iterator<Map.Entry<String, IslandItem>> it = mItems.entrySet().iterator();
        while (it.hasNext()) {
            IslandItem item = it.next().getValue();
            if (item.transientItem && item.expiresAtElapsedMs > 0L && now >= item.expiresAtElapsedMs) {
                if (item.key.equals(mManualSelectedKey)) {
                    mManualSelectedKey = null;
                }
                it.remove();
                changed = true;
            }
        }
        scheduleNextExpiration();
        if (changed) {
            render(false);
        }
    }

    private void scheduleNextExpiration() {
        mMainHandler.removeCallbacks(mExpireRunnable);
        long now = SystemClock.elapsedRealtime();
        long soonest = Long.MAX_VALUE;
        for (IslandItem item : mItems.values()) {
            if (item.transientItem && item.expiresAtElapsedMs > 0L) {
                long rem = Math.max(50L, item.expiresAtElapsedMs - now);
                if (rem < soonest) {
                    soonest = rem;
                }
            }
        }
        if (soonest < Long.MAX_VALUE) {
            mMainHandler.postDelayed(mExpireRunnable, soonest);
        }
    }

    private void render(boolean preferInstantRestore) {
        if (!mWindowAttached || mOverlayView == null) {
            return;
        }
        List<IslandItem> ordered = getOrderedItems();
        if (ordered.isEmpty()) {
            mWasSuspended = false;
            mOverlayView.hideAll();
            return;
        }
        boolean suspended = !mInteractive || !mDisplayOn || mLandscapeOrFullscreenHidden;
        int idx = findCurrentIndex(ordered);
        IslandItem chosen = ordered.get(idx);

        if (suspended) {
            if (!mWasSuspended) {
                mOverlayView.suspendVisibleWithoutTeardown();
            }
            mWasSuspended = true;
            // Keep pre-measured bounds updated quietly while suspended so wake is <1ms
            mOverlayView.showItem(chosen, idx, ordered.size(), true, true);
            return;
        }

        boolean restore = mWasSuspended || preferInstantRestore;
        mWasSuspended = false;
        mOverlayView.showItem(chosen, idx, ordered.size(), false, restore);
    }

    private List<IslandItem> getOrderedItems() {
        if (!mPrefs.enabled) {
            return Collections.emptyList();
        }
        List<IslandItem> list = new ArrayList<>();
        for (IslandItem item : mItems.values()) {
            if (KEY_LIVE_PREVIEW.equals(item.key) || mPrefs.isCategoryAllowed(item.category)) {
                list.add(item);
            }
        }
        Collections.sort(list, new Comparator<IslandItem>() {
            @Override
            public int compare(IslandItem a, IslandItem b) {
                return Integer.compare(b.priority(), a.priority());
            }
        });
        return list;
    }

    private int findCurrentIndex(List<IslandItem> ordered) {
        if (mManualSelectedKey != null) {
            for (int i = 0; i < ordered.size(); i++) {
                if (mManualSelectedKey.equals(ordered.get(i).key)) {
                    return i;
                }
            }
            mManualSelectedKey = null;
        }
        return 0;
    }

    private static void invokeSetTrustedOverlay(WindowManager.LayoutParams lp) {
        try {
            Method m = WindowManager.LayoutParams.class.getMethod("setTrustedOverlay");
            m.invoke(lp);
        } catch (Throwable ignored) {
        }
    }

    private int dp(float v) {
        return Math.round(v * mContext.getResources().getDisplayMetrics().density);
    }
}
