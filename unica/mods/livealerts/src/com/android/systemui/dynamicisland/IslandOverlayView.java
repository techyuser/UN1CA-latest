package com.android.systemui.dynamicisland;

import android.app.ActivityOptions;
import android.app.PendingIntent;
import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.LinearGradient;
import android.graphics.Matrix;
import android.graphics.Outline;
import android.graphics.Paint;
import android.graphics.PixelFormat;
import android.graphics.RadialGradient;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.Region;
import android.graphics.Shader;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.media.session.MediaController;
import android.media.session.PlaybackState;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.text.TextUtils;
import android.util.TypedValue;
import android.view.Choreographer;
import android.view.DisplayCutout;
import android.view.Gravity;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import android.view.ViewOutlineProvider;
import android.view.ViewTreeObserver;
import android.view.WindowInsets;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ProgressBar;
import android.widget.SeekBar;
import android.widget.TextView;

import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;

/**
 * OxygenOS 16 Live Alerts Fluid Glass capsule & camera-safe expanded card.
 * Uses hardware SurfaceFlinger window blur layered beneath a translucent Fluid Glass
 * multi-layer gradient, accent ambient glow, and diagonal specular rim highlight
 * with 120fps Choreographer-driven COUISpring physics and 0ms wake continuity.
 */
public final class IslandOverlayView extends FrameLayout {

    public interface Callbacks {
        void onExpandedStateChanged(boolean expanded);
        void onCycleIsland(int direction);
        void onDismissTransient(String key);
        void onOverlayCutoutChanged(DisplayCutout dc);
    }

    private final Callbacks mCallbacks;
    private final Handler mHandler = new Handler(Looper.getMainLooper());

    private final FrameLayout mPillContainer;
    private final View mBlurBackdrop;
    private final View mGlassTintView;
    private final View mRimView;
    private final FluidGlassDrawable mFluidGlassDrawable;
    private final FluidRimDrawable mFluidRimDrawable;

    // Compact Live Alerts Pill
    private final LinearLayout mCompactRow;
    private final FrameLayout mCompactLeftSlot;
    private final ImageView mCompactArtwork;
    private final GlyphIconView mCompactGlyph;
    private final View mCutoutGap;
    private final FrameLayout mCompactRightSlot;
    private final WaveformView mCompactWaveform;
    private final TextView mCompactText;
    private final View mStackDot;

    // Expanded Live Alerts Card (content clears front camera circle cleanly)
    private final LinearLayout mExpandedCard;
    private final LinearLayout mExpHeaderRow;
    private final FrameLayout mExpIconHolder;
    private final GradientDrawable mExpIconBg;
    private final ImageView mExpArtwork;
    private final GlyphIconView mExpGlyph;
    private final TextView mExpTitle;
    private final TextView mExpSubtitle;
    private final TextView mExpStackBadge;
    private final TextView mExpRightStat;
    private final WaveformView mExpWaveform;
    private final FrameLayout mExpCollapseBtn;

    private final LinearLayout mExpProgressRow;
    private final TextView mExpElapsedText;
    private final TextView mExpDurationText;
    private final SeekBar mExpSeekBar;
    private final ProgressBar mExpProgressBar;

    private final LinearLayout mExpActionsRow;
    private final FrameLayout mMediaControlsGroup;
    private final FrameLayout mBtnPrev;
    private final FrameLayout mBtnPlayPause;
    private final GlyphIconView mGlyphPlayPause;
    private final GradientDrawable mPlayPauseBg;
    private final FrameLayout mBtnNext;
    private final LinearLayout mCustomActionsGroup;

    private IslandItem mCurrentItem;
    private int mStackCount = 1;
    private int mStackIndex = 0;

    private boolean mExpanded = false;
    private boolean mHasActiveContent = false;
    private boolean mSuspendedForSleep = false;
    private boolean mUserSeeking = false;
    private int mBaseCutoutOffsetX = 0;
    private int mBaseCutoutTopPx = 0;
    private int mBaseCutoutWidthPx = 0;
    private int mBaseCutoutHeightPx = 0;

    private int mTuneBlurRadius = 280;
    private int mTuneGlassOpacity = 55;
    private int mTuneRimAlpha = 85;
    private int mTuneAnimSpeedPct = 100;
    private int mTuneAnimBouncePct = 26;
    private int mTuneHeightOffsetDp = 0;
    private int mTuneGapOffsetDp = 0;
    private int mTuneTopOffsetDp = 0;
    private int mTuneCenterOffsetDp = 0;
    private int mTuneExpandedWidthDp = 336;

    private int mCutoutCenterOffsetX = 0;
    private int mCutoutTopPx;
    private int mCutoutGapPx;
    private int mCompactHeightPx;
    private int mCompactTopYPx;
    private int mExpandedTopYPx;
    private int mCutoutHeightPx;
    private int mExpandedWidthPx;

    // Choreographer-driven 120fps Zero-Relayout OxygenOS COUISpring Morph Engine
    private boolean mMorphRunning = false;
    private int mMorphMode = 0; // 0=idle, 1=bloom, 2=expand, 3=collapse, 4=swap, 5=hide
    private long mMorphStartNanos = -1L;
    private long mMorphDurationNs = 440_000_000L;
    private double mSpringResponseX = 0.50;
    private double mSpringBounceX = 0.16;
    private double mSpringResponseY = 0.56;
    private double mSpringBounceY = 0.24;
    private boolean mUseMoveEase = false;

    private final RectF mStartRect = new RectF();
    private final RectF mTargetRect = new RectF();
    private final RectF mCurrRect = new RectF();
    private float mStartCorner = 0f;
    private float mTargetCorner = 0f;
    private float mCurrCornerPx = 0f;

    private int mBoxLeft = 0;
    private int mBoxTop = 0;
    private int mBoxW = 1;
    private int mBoxH = 1;
    private float mFadeStartCompAlpha = 1f;
    private float mFadeStartExpAlpha = 0f;

    // Independent 120fps touch press spring
    private boolean mPressAnimRunning = false;
    private long mPressStartNanos = -1L;
    private long mPressDurationNs = 120_000_000L;
    private float mPressStartScale = 1f;
    private float mPressTargetScale = 1f;
    private float mCurrPressScale = 1f;

    private int mCurrAccentColor = 0xFF64D2FF;

    private boolean mHardwareBlurSupported = false;
    private Object mFallbackBlurDrawable = null;
    private Object mInsetsListenerProxy = null;

    private float mDownX;
    private float mDownY;
    private boolean mTrackingSwipe;
    private boolean mTouchInsidePill = false;
    private final int mTouchSlop;

    private final Choreographer.FrameCallback mFrameCallback = new Choreographer.FrameCallback() {
        @Override
        public void doFrame(long frameTimeNanos) {
            stepAnimationsFrame(frameTimeNanos);
        }
    };

    private final Runnable mTickRunnable = new Runnable() {
        @Override
        public void run() {
            if (!mHasActiveContent || mSuspendedForSleep || mCurrentItem == null) {
                return;
            }
            updateLiveTickValues();
            long delay = mExpanded ? 500L : 1000L;
            mHandler.postDelayed(this, delay);
        }
    };

    public IslandOverlayView(Context context, Callbacks callbacks) {
        super(context);
        mCallbacks = callbacks;
        mTouchSlop = ViewConfiguration.get(context).getScaledTouchSlop();
        mCutoutTopPx = dp(11);
        mCutoutGapPx = dp(33.5f);
        mCompactHeightPx = dp(31.5f);
        mCutoutHeightPx = dp(26.5f);
        mCompactTopYPx = dp(9);
        mExpandedTopYPx = dp(10);
        mExpandedWidthPx = Math.min(dp(336), context.getResources().getDisplayMetrics().widthPixels - dp(24));

        setClipChildren(false);
        setClipToPadding(false);

        mCurrCornerPx = mCompactHeightPx * 0.5f;
        mFluidGlassDrawable = new FluidGlassDrawable(context.getResources().getDisplayMetrics().density);
        mFluidRimDrawable = new FluidRimDrawable(context.getResources().getDisplayMetrics().density);

        mPillContainer = new FrameLayout(context) {
            @Override
            protected void onLayout(boolean changed, int left, int top, int right, int bottom) {
                super.onLayout(changed, left, top, right, bottom);
                layoutVisualLayersLocked();
            }
        };
        mPillContainer.setClipToPadding(true);
        mPillContainer.setClipChildren(true);
        mPillContainer.setClipToOutline(true);
        mPillContainer.setOutlineProvider(new ViewOutlineProvider() {
            @Override
            public void getOutline(View view, Outline outline) {
                if (mCurrRect.width() > 0f && mCurrRect.height() > 0f) {
                    int ox = Math.round(mCurrRect.left - mBoxLeft);
                    int oy = Math.round(mCurrRect.top - mBoxTop);
                    int ow = Math.max(1, Math.round(mCurrRect.width()));
                    int oh = Math.max(1, Math.round(mCurrRect.height()));
                    float r = Math.min(mCurrCornerPx, Math.min(ow, oh) * 0.5f);
                    outline.setRoundRect(ox, oy, ox + ow, oy + oh, r);
                } else {
                    int w = Math.max(1, view.getWidth());
                    int h = Math.max(1, view.getHeight());
                    float r = Math.min(mCurrCornerPx, Math.min(w, h) * 0.5f);
                    outline.setRoundRect(0, 0, w, h, r);
                }
            }
        });
        mPillContainer.setElevation(dp(8));
        mPillContainer.setOutlineAmbientShadowColor(0x48000000);
        mPillContainer.setOutlineSpotShadowColor(0x66000000);

        mBlurBackdrop = new View(context);
        mPillContainer.addView(mBlurBackdrop, new LayoutParams(LayoutParams.MATCH_PARENT, LayoutParams.MATCH_PARENT));

        mGlassTintView = new View(context);
        mGlassTintView.setBackground(mFluidGlassDrawable);
        mPillContainer.addView(mGlassTintView, new LayoutParams(LayoutParams.MATCH_PARENT, LayoutParams.MATCH_PARENT));

        mRimView = new View(context);
        mRimView.setBackground(mFluidRimDrawable);

        addView(mPillContainer, new LayoutParams(dp(96), mCompactHeightPx, Gravity.TOP | Gravity.LEFT));

        // --- Compact OxygenOS Live Alerts Row (cutout-anchored around camera, zero overlap!) ---
        mCompactRow = new LinearLayout(context);
        mCompactRow.setLayoutDirection(LAYOUT_DIRECTION_LTR);
        mCompactRow.setOrientation(LinearLayout.HORIZONTAL);
        mCompactRow.setGravity(Gravity.CENTER_VERTICAL);
        mCompactRow.setPadding(dp(8), 0, dp(9), 0);
        mPillContainer.addView(mCompactRow, new LayoutParams(LayoutParams.WRAP_CONTENT, mCompactHeightPx, Gravity.TOP | Gravity.LEFT));

        mCompactLeftSlot = new FrameLayout(context);
        mCompactArtwork = new ImageView(context);
        mCompactArtwork.setScaleType(ImageView.ScaleType.CENTER_CROP);
        mCompactArtwork.setClipToOutline(true);
        mCompactArtwork.setOutlineProvider(new ViewOutlineProvider() {
            @Override
            public void getOutline(View view, Outline outline) {
                int w = Math.max(1, view.getWidth());
                int h = Math.max(1, view.getHeight());
                outline.setRoundRect(0, 0, w, h, dp(6));
            }
        });
        mCompactGlyph = new GlyphIconView(context);
        mCompactLeftSlot.addView(mCompactArtwork, new LayoutParams(dp(17), dp(17), Gravity.CENTER));
        mCompactLeftSlot.addView(mCompactGlyph, new LayoutParams(dp(15), dp(15), Gravity.CENTER));
        mCompactRow.addView(mCompactLeftSlot, new LinearLayout.LayoutParams(dp(18), dp(18)));

        mCutoutGap = new View(context);
        mCompactRow.addView(mCutoutGap, new LinearLayout.LayoutParams(mCutoutGapPx, 1));

        mCompactRightSlot = new FrameLayout(context);
        mCompactRightSlot.setMinimumWidth(dp(14));
        mCompactWaveform = new WaveformView(context);
        mCompactText = new TextView(context);
        mCompactText.setTextColor(0xFFFFFFFF);
        mCompactText.setTextSize(TypedValue.COMPLEX_UNIT_DIP, 11.0f);
        mCompactText.setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL));
        mCompactText.setSingleLine(true);
        mCompactText.setEllipsize(TextUtils.TruncateAt.END);
        mCompactText.setMaxWidth(dp(48));
        mCompactText.setIncludeFontPadding(false);
        mCompactText.setFontFeatureSettings("tnum");

        mCompactRightSlot.addView(mCompactWaveform, new LayoutParams(dp(22), dp(11), Gravity.CENTER));
        mCompactRightSlot.addView(mCompactText, new LayoutParams(LayoutParams.WRAP_CONTENT, LayoutParams.WRAP_CONTENT, Gravity.CENTER));

        mStackDot = new View(context);
        GradientDrawable dotBg = new GradientDrawable();
        dotBg.setShape(GradientDrawable.OVAL);
        dotBg.setColor(0xAAFFFFFF);
        mStackDot.setBackground(dotBg);
        mStackDot.setVisibility(GONE);

        mCompactRow.addView(mCompactRightSlot, new LinearLayout.LayoutParams(LayoutParams.WRAP_CONTENT, LayoutParams.WRAP_CONTENT));
        LinearLayout.LayoutParams dotLp = new LinearLayout.LayoutParams(dp(4), dp(4));
        dotLp.setMarginStart(dp(4));
        mCompactRow.addView(mStackDot, dotLp);

        // --- Expanded Card (Top Padding Clears Centered Punch-Hole Cutout + Generous Bottom Padding) ---
        mExpandedCard = new LinearLayout(context);
        mExpandedCard.setOrientation(LinearLayout.VERTICAL);
        mExpandedCard.setPadding(dp(16), dp(34), dp(16), dp(18));
        mExpandedCard.setVisibility(GONE);
        mExpandedCard.setAlpha(0f);
        mExpandedCard.setPivotX(mExpandedWidthPx * 0.5f);
        mExpandedCard.setPivotY(0f);
        mPillContainer.addView(mExpandedCard, new LayoutParams(mExpandedWidthPx, LayoutParams.WRAP_CONTENT, Gravity.TOP | Gravity.LEFT));

        mExpHeaderRow = new LinearLayout(context);
        mExpHeaderRow.setOrientation(LinearLayout.HORIZONTAL);
        mExpHeaderRow.setGravity(Gravity.CENTER_VERTICAL);
        mExpandedCard.addView(mExpHeaderRow, new LinearLayout.LayoutParams(LayoutParams.MATCH_PARENT, LayoutParams.WRAP_CONTENT));

        mExpIconBg = new GradientDrawable();
        mExpIconBg.setShape(GradientDrawable.RECTANGLE);
        mExpIconBg.setCornerRadius(dp(13));
        mExpIconBg.setColor(0x28FFFFFF);
        mExpIconBg.setStroke(Math.max(1, dp(0.6f)), 0x26FFFFFF);

        mExpIconHolder = new FrameLayout(context);
        mExpIconHolder.setBackground(mExpIconBg);
        mExpIconHolder.setClipToOutline(true);
        mExpIconHolder.setOutlineProvider(new ViewOutlineProvider() {
            @Override
            public void getOutline(View view, Outline outline) {
                int w = Math.max(1, view.getWidth());
                int h = Math.max(1, view.getHeight());
                outline.setRoundRect(0, 0, w, h, dp(13));
            }
        });
        mExpArtwork = new ImageView(context);
        mExpArtwork.setScaleType(ImageView.ScaleType.CENTER_CROP);
        mExpArtwork.setClipToOutline(true);
        mExpArtwork.setOutlineProvider(new ViewOutlineProvider() {
            @Override
            public void getOutline(View view, Outline outline) {
                int w = Math.max(1, view.getWidth());
                int h = Math.max(1, view.getHeight());
                outline.setRoundRect(0, 0, w, h, dp(13));
            }
        });
        mExpGlyph = new GlyphIconView(context);
        mExpIconHolder.addView(mExpArtwork, new LayoutParams(dp(46), dp(46), Gravity.CENTER));
        mExpIconHolder.addView(mExpGlyph, new LayoutParams(dp(24), dp(24), Gravity.CENTER));
        LinearLayout.LayoutParams iconLp = new LinearLayout.LayoutParams(dp(46), dp(46));
        iconLp.setMarginEnd(dp(12));
        mExpHeaderRow.addView(mExpIconHolder, iconLp);

        LinearLayout textCol = new LinearLayout(context);
        textCol.setOrientation(LinearLayout.VERTICAL);
        textCol.setGravity(Gravity.CENTER_VERTICAL);
        LinearLayout.LayoutParams textColLp = new LinearLayout.LayoutParams(0, LayoutParams.WRAP_CONTENT, 1.0f);
        textColLp.setMarginEnd(dp(8));
        mExpHeaderRow.addView(textCol, textColLp);

        mExpTitle = new TextView(context);
        mExpTitle.setTextColor(0xFFFFFFFF);
        mExpTitle.setTextSize(TypedValue.COMPLEX_UNIT_DIP, 14.5f);
        mExpTitle.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
        mExpTitle.setSingleLine(true);
        mExpTitle.setEllipsize(TextUtils.TruncateAt.MARQUEE);
        mExpTitle.setMarqueeRepeatLimit(-1);
        mExpTitle.setSelected(true);
        mExpTitle.setIncludeFontPadding(false);
        textCol.addView(mExpTitle);

        mExpSubtitle = new TextView(context);
        mExpSubtitle.setTextColor(0xD2FFFFFF);
        mExpSubtitle.setTextSize(TypedValue.COMPLEX_UNIT_DIP, 12.0f);
        mExpSubtitle.setSingleLine(true);
        mExpSubtitle.setEllipsize(TextUtils.TruncateAt.END);
        mExpSubtitle.setIncludeFontPadding(false);
        LinearLayout.LayoutParams subLp = new LinearLayout.LayoutParams(LayoutParams.MATCH_PARENT, LayoutParams.WRAP_CONTENT);
        subLp.topMargin = dp(2);
        textCol.addView(mExpSubtitle, subLp);

        mExpStackBadge = new TextView(context);
        mExpStackBadge.setTextColor(0xD8FFFFFF);
        mExpStackBadge.setTextSize(TypedValue.COMPLEX_UNIT_DIP, 10.0f);
        mExpStackBadge.setVisibility(GONE);
        LinearLayout.LayoutParams sbLp = new LinearLayout.LayoutParams(LayoutParams.WRAP_CONTENT, LayoutParams.WRAP_CONTENT);
        sbLp.topMargin = dp(3);
        textCol.addView(mExpStackBadge, sbLp);

        mExpRightStat = new TextView(context);
        mExpRightStat.setTextColor(0xFF30D158);
        mExpRightStat.setTextSize(TypedValue.COMPLEX_UNIT_DIP, 13.5f);
        mExpRightStat.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
        mExpRightStat.setFontFeatureSettings("tnum");
        mExpRightStat.setVisibility(GONE);
        LinearLayout.LayoutParams statLp = new LinearLayout.LayoutParams(LayoutParams.WRAP_CONTENT, LayoutParams.WRAP_CONTENT);
        statLp.setMarginEnd(dp(6));
        mExpHeaderRow.addView(mExpRightStat, statLp);

        mExpWaveform = new WaveformView(context);
        mExpWaveform.setVisibility(GONE);
        LinearLayout.LayoutParams ewLp = new LinearLayout.LayoutParams(dp(26), dp(14));
        ewLp.setMarginEnd(dp(8));
        mExpHeaderRow.addView(mExpWaveform, ewLp);

        mExpCollapseBtn = makeGlassCircleButton(context, 0x26FFFFFF, 0x33FFFFFF, dp(0.6f));
        GlyphIconView collapseGlyph = new GlyphIconView(context);
        collapseGlyph.setGlyph(GlyphIconView.GLYPH_CHEVRON_UP, 0xE6FFFFFF);
        mExpCollapseBtn.addView(collapseGlyph, new LayoutParams(dp(16), dp(16), Gravity.CENTER));
        mExpCollapseBtn.setOnClickListener(v -> collapse());
        mExpHeaderRow.addView(mExpCollapseBtn, new LinearLayout.LayoutParams(dp(28), dp(28)));

        mExpHeaderRow.setOnClickListener(v -> launchContentIntent());

        mExpProgressRow = new LinearLayout(context);
        mExpProgressRow.setOrientation(LinearLayout.VERTICAL);
        mExpProgressRow.setVisibility(GONE);
        LinearLayout.LayoutParams prLp = new LinearLayout.LayoutParams(LayoutParams.MATCH_PARENT, LayoutParams.WRAP_CONTENT);
        prLp.topMargin = dp(12);
        mExpandedCard.addView(mExpProgressRow, prLp);

        mExpSeekBar = new SeekBar(context);
        mExpSeekBar.setPadding(dp(4), dp(2), dp(4), dp(2));
        mExpSeekBar.setSplitTrack(false);
        mExpSeekBar.setProgressBackgroundTintList(ColorStateList.valueOf(0x33FFFFFF));
        mExpSeekBar.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() {
            @Override
            public void onProgressChanged(SeekBar seekBar, int progress, boolean fromUser) {
                if (fromUser && mCurrentItem != null && mCurrentItem.progressMax > 0) {
                    long target = (progress * mCurrentItem.progressMax) / 1000L;
                    mExpElapsedText.setText(formatMs(target));
                }
            }

            @Override
            public void onStartTrackingTouch(SeekBar seekBar) {
                mUserSeeking = true;
            }

            @Override
            public void onStopTrackingTouch(SeekBar seekBar) {
                mUserSeeking = false;
                if (mCurrentItem != null && mCurrentItem.mediaController != null && mCurrentItem.progressMax > 0) {
                    long target = (seekBar.getProgress() * mCurrentItem.progressMax) / 1000L;
                    try {
                        mCurrentItem.mediaController.getTransportControls().seekTo(target);
                    } catch (Throwable ignored) {
                    }
                }
            }
        });
        mExpProgressRow.addView(mExpSeekBar, new LinearLayout.LayoutParams(LayoutParams.MATCH_PARENT, dp(22)));

        mExpProgressBar = new ProgressBar(context, null, android.R.attr.progressBarStyleHorizontal);
        mExpProgressBar.setVisibility(GONE);
        mExpProgressBar.setProgressBackgroundTintList(ColorStateList.valueOf(0x33FFFFFF));
        LinearLayout.LayoutParams pbLp = new LinearLayout.LayoutParams(LayoutParams.MATCH_PARENT, dp(6));
        pbLp.topMargin = dp(4);
        mExpProgressRow.addView(mExpProgressBar, pbLp);

        LinearLayout timeRow = new LinearLayout(context);
        timeRow.setOrientation(LinearLayout.HORIZONTAL);
        mExpElapsedText = new TextView(context);
        mExpElapsedText.setTextColor(0xB3FFFFFF);
        mExpElapsedText.setTextSize(TypedValue.COMPLEX_UNIT_DIP, 10.5f);
        mExpElapsedText.setFontFeatureSettings("tnum");
        mExpDurationText = new TextView(context);
        mExpDurationText.setTextColor(0xB3FFFFFF);
        mExpDurationText.setTextSize(TypedValue.COMPLEX_UNIT_DIP, 10.5f);
        mExpDurationText.setFontFeatureSettings("tnum");
        mExpDurationText.setGravity(Gravity.END);
        timeRow.addView(mExpElapsedText, new LinearLayout.LayoutParams(0, LayoutParams.WRAP_CONTENT, 1f));
        timeRow.addView(mExpDurationText, new LinearLayout.LayoutParams(0, LayoutParams.WRAP_CONTENT, 1f));
        mExpProgressRow.addView(timeRow, new LinearLayout.LayoutParams(LayoutParams.MATCH_PARENT, LayoutParams.WRAP_CONTENT));

        mExpActionsRow = new LinearLayout(context);
        mExpActionsRow.setOrientation(LinearLayout.HORIZONTAL);
        mExpActionsRow.setGravity(Gravity.CENTER);
        mExpActionsRow.setVisibility(GONE);
        LinearLayout.LayoutParams actLp = new LinearLayout.LayoutParams(LayoutParams.MATCH_PARENT, LayoutParams.WRAP_CONTENT);
        actLp.topMargin = dp(12);
        mExpandedCard.addView(mExpActionsRow, actLp);

        mMediaControlsGroup = new FrameLayout(context);
        LinearLayout mediaBtns = new LinearLayout(context);
        mediaBtns.setOrientation(LinearLayout.HORIZONTAL);
        mediaBtns.setGravity(Gravity.CENTER);

        mBtnPrev = makeGlassCircleButton(context, 0x26FFFFFF, 0x36FFFFFF, dp(0.75f));
        GlyphIconView gPrev = new GlyphIconView(context);
        gPrev.setGlyph(GlyphIconView.GLYPH_PREV, 0xFFFFFFFF);
        mBtnPrev.addView(gPrev, new LayoutParams(dp(18), dp(18), Gravity.CENTER));
        mBtnPrev.setOnClickListener(v -> sendMediaAction(-1));

        mBtnPlayPause = new FrameLayout(context);
        mPlayPauseBg = new GradientDrawable();
        mPlayPauseBg.setShape(GradientDrawable.OVAL);
        mPlayPauseBg.setColor(0xE6FFFFFF);
        mBtnPlayPause.setBackground(mPlayPauseBg);
        mGlyphPlayPause = new GlyphIconView(context);
        mGlyphPlayPause.setGlyph(GlyphIconView.GLYPH_PAUSE, 0xE6000000);
        mBtnPlayPause.addView(mGlyphPlayPause, new LayoutParams(dp(20), dp(20), Gravity.CENTER));
        mBtnPlayPause.setOnClickListener(v -> sendMediaAction(0));

        mBtnNext = makeGlassCircleButton(context, 0x26FFFFFF, 0x36FFFFFF, dp(0.75f));
        GlyphIconView gNext = new GlyphIconView(context);
        gNext.setGlyph(GlyphIconView.GLYPH_NEXT, 0xFFFFFFFF);
        mBtnNext.addView(gNext, new LayoutParams(dp(18), dp(18), Gravity.CENTER));
        mBtnNext.setOnClickListener(v -> sendMediaAction(1));

        LinearLayout.LayoutParams prevLp = new LinearLayout.LayoutParams(dp(40), dp(40));
        prevLp.setMarginEnd(dp(18));
        LinearLayout.LayoutParams ppLp = new LinearLayout.LayoutParams(dp(44), dp(44));
        ppLp.setMarginEnd(dp(18));
        mediaBtns.addView(mBtnPrev, prevLp);
        mediaBtns.addView(mBtnPlayPause, ppLp);
        mediaBtns.addView(mBtnNext, new LinearLayout.LayoutParams(dp(40), dp(40)));
        mMediaControlsGroup.addView(mediaBtns, new LayoutParams(LayoutParams.WRAP_CONTENT, LayoutParams.WRAP_CONTENT, Gravity.CENTER));
        mExpActionsRow.addView(mMediaControlsGroup, new LinearLayout.LayoutParams(LayoutParams.MATCH_PARENT, LayoutParams.WRAP_CONTENT));

        mCustomActionsGroup = new LinearLayout(context);
        mCustomActionsGroup.setOrientation(LinearLayout.HORIZONTAL);
        mCustomActionsGroup.setGravity(Gravity.CENTER_VERTICAL | Gravity.END);
        mCustomActionsGroup.setVisibility(GONE);
        mExpActionsRow.addView(mCustomActionsGroup, new LinearLayout.LayoutParams(LayoutParams.MATCH_PARENT, LayoutParams.WRAP_CONTENT));

        mPillContainer.addView(mRimView, new LayoutParams(LayoutParams.MATCH_PARENT, LayoutParams.MATCH_PARENT));
    }

    public void setCutoutGeometry(int centerOffsetX, int cutoutTopPx, int cutoutWidthPx, int cutoutHeightPx) {
        mBaseCutoutOffsetX = centerOffsetX;
        mBaseCutoutTopPx = cutoutTopPx > 0 ? cutoutTopPx : dp(11);
        mBaseCutoutWidthPx = cutoutWidthPx > 0 ? cutoutWidthPx : dp(26.5f);
        mBaseCutoutHeightPx = cutoutHeightPx > 0 ? cutoutHeightPx : dp(26.5f);
        recomputeCutoutLayout(false);
    }

    public void applyTuningConfig(LiveAlertsPrefs prefs) {
        if (prefs == null) {
            return;
        }
        boolean blurChanged = (mTuneBlurRadius != prefs.blurRadius);
        mTuneBlurRadius = prefs.blurRadius;
        mTuneGlassOpacity = prefs.glassOpacityPct;
        mTuneRimAlpha = prefs.rimAlphaPct;
        mTuneAnimSpeedPct = prefs.animSpeedPct;
        mTuneAnimBouncePct = prefs.animBouncePct;
        mTuneHeightOffsetDp = prefs.heightOffsetDp;
        mTuneGapOffsetDp = prefs.gapOffsetDp;
        mTuneTopOffsetDp = prefs.topOffsetDp;
        mTuneCenterOffsetDp = prefs.centerOffsetDp;
        mTuneExpandedWidthDp = prefs.expandedWidthDp;

        recomputeCutoutLayout(true);
        updateGlassSurface();
        if (mHasActiveContent && !mSuspendedForSleep) {
            if (mTuneBlurRadius <= 0) {
                BlurEngine.clearBlur(mBlurBackdrop);
                mBlurBackdrop.setBackground(null);
                mFallbackBlurDrawable = null;
                if (mHardwareBlurSupported) {
                    mHardwareBlurSupported = false;
                    updateGlassSurface();
                }
            } else if (blurChanged || !mHardwareBlurSupported) {
                applyHardwareBlur(true);
            }
        }
    }

    private void recomputeCutoutLayout(boolean instantTuningSnap) {
        int topBase = mBaseCutoutTopPx > 0 ? mBaseCutoutTopPx : dp(11);
        int camW = mBaseCutoutWidthPx > 0 ? mBaseCutoutWidthPx : dp(26.5f);
        int camH = mBaseCutoutHeightPx > 0 ? mBaseCutoutHeightPx : dp(26.5f);
        int newOffsetX = mBaseCutoutOffsetX + dp(mTuneCenterOffsetDp);

        int desiredGap = Math.max(dp(24), camW + dp(7 + mTuneGapOffsetDp));
        int desiredH = Math.max(dp(24), Math.min(dp(44), camH + dp(5 + mTuneHeightOffsetDp)));
        int camCenterY = topBase + (camH / 2);
        int desiredCompactTop = Math.max(dp(2), camCenterY - (desiredH / 2) + dp(mTuneTopOffsetDp));
        int desiredExpandedTop = Math.max(dp(4), topBase - dp(1) + dp(mTuneTopOffsetDp));
        int desiredExpandedWidth = Math.min(dp(mTuneExpandedWidthDp), getResources().getDisplayMetrics().widthPixels - dp(16));

        boolean changed = newOffsetX != mCutoutCenterOffsetX
                || topBase != mCutoutTopPx
                || camH != mCutoutHeightPx
                || desiredGap != mCutoutGapPx
                || desiredH != mCompactHeightPx
                || desiredCompactTop != mCompactTopYPx
                || desiredExpandedTop != mExpandedTopYPx
                || desiredExpandedWidth != mExpandedWidthPx;

        mCutoutCenterOffsetX = newOffsetX;
        mCutoutTopPx = topBase;
        mCutoutHeightPx = camH;
        mCutoutGapPx = desiredGap;
        mCompactHeightPx = desiredH;
        mCompactTopYPx = desiredCompactTop;
        mExpandedTopYPx = desiredExpandedTop;
        mExpandedWidthPx = desiredExpandedWidth;

        int camBottom = mCutoutTopPx + mCutoutHeightPx;
        int expTopPad = Math.max(dp(28), (camBottom - mExpandedTopYPx) + dp(10));
        mExpandedCard.setPadding(dp(16), expTopPad, dp(16), dp(18));
        mExpandedCard.setPivotX(mExpandedWidthPx * 0.5f);
        mExpandedCard.setPivotY(0f);
        ViewGroup.LayoutParams expLp = mExpandedCard.getLayoutParams();
        if (expLp.width != mExpandedWidthPx) {
            expLp.width = mExpandedWidthPx;
            mExpandedCard.setLayoutParams(expLp);
        }

        if (changed) {
            ViewGroup.LayoutParams gapLp = mCutoutGap.getLayoutParams();
            gapLp.width = mCutoutGapPx;
            mCutoutGap.setLayoutParams(gapLp);

            ViewGroup.LayoutParams rowLp = mCompactRow.getLayoutParams();
            rowLp.height = mCompactHeightPx;
            mCompactRow.setLayoutParams(rowLp);

            if (mHasActiveContent) {
                if (mExpanded) {
                    int[] target = measureExpandedTarget();
                    if (mSuspendedForSleep || instantTuningSnap) {
                        applyStaticGeometry(target[2], mExpandedTopYPx, target[0], target[1], dp(28));
                    } else {
                        startMorph(target[2], mExpandedTopYPx, target[0], target[1], dp(28), 4);
                    }
                } else {
                    int[] target = measureCompactTarget();
                    if (mSuspendedForSleep || instantTuningSnap) {
                        applyStaticGeometry(target[2], mCompactTopYPx, target[0], target[1], target[1] * 0.5f);
                    } else {
                        startMorph(target[2], mCompactTopYPx, target[0], target[1], target[1] * 0.5f, 4);
                    }
                }
            }
        }
    }

    public boolean isExpanded() {
        return mExpanded;
    }

    @Override
    public WindowInsets onApplyWindowInsets(WindowInsets insets) {
        if (insets != null && insets.getDisplayCutout() != null) {
            mCallbacks.onOverlayCutoutChanged(insets.getDisplayCutout());
        }
        return super.onApplyWindowInsets(insets);
    }

    @Override
    protected void onAttachedToWindow() {
        super.onAttachedToWindow();
        BlurEngine.init();
        registerTouchableInsetsListener();
        if (mHasActiveContent && !mSuspendedForSleep) {
            applyHardwareBlur(true);
        }
    }

    @Override
    protected void onDetachedFromWindow() {
        cancelAllAnimations();
        unregisterTouchableInsetsListener();
        super.onDetachedFromWindow();
    }

    /**
     * Sleep/fullscreen blanking that preserves measured layout to make wakeup instantaneous (0ms).
     */
    public void suspendVisibleWithoutTeardown() {
        mSuspendedForSleep = true;
        cancelMorph();
        mHandler.removeCallbacks(mTickRunnable);
        mCompactWaveform.setAnimating(false);
        mExpWaveform.setAnimating(false);
        if (mHasActiveContent) {
            setVisibility(INVISIBLE);
            setAlpha(1f);
            setScaleX(1f);
            setScaleY(1f);
        } else {
            setVisibility(GONE);
        }
        invalidate();
    }

    /**
     * Synchronous instant appearance on Display ON / unlock — no delayed fade or re-pop.
     */
    public void showItem(IslandItem item, int stackIndex, int stackCount, boolean suspended, boolean instantRestore) {
        boolean wasInactive = !mHasActiveContent;
        boolean sameKey = mCurrentItem != null && item.key.equals(mCurrentItem.key);

        mHasActiveContent = true;
        mSuspendedForSleep = suspended;
        mCurrentItem = item;
        mStackIndex = stackIndex;
        mStackCount = Math.max(1, stackCount);

        bindCompact(item);
        bindExpanded(item);

        if (suspended) {
            cancelMorph();
            mExpanded = false;
            mCompactRow.setVisibility(VISIBLE);
            mCompactRow.setAlpha(1f);
            mCompactRow.setScaleX(1f);
            mCompactRow.setScaleY(1f);
            mExpandedCard.setVisibility(GONE);
            mExpandedCard.setAlpha(0f);
            int[] target = measureCompactTarget();
            applyStaticGeometry(target[2], mCompactTopYPx, target[0], target[1], target[1] * 0.5f);
            setVisibility(INVISIBLE);
            mCompactWaveform.setAnimating(false);
            mExpWaveform.setAnimating(false);
            return;
        }

        setVisibility(VISIBLE);
        setAlpha(1f);
        setScaleX(1f);
        setScaleY(1f);

        if (instantRestore || (sameKey && item.quietUpdate && !wasInactive)) {
            if (!mMorphRunning) {
                if (mExpanded) {
                    int[] target = measureExpandedTarget();
                    applyStaticGeometry(target[2], mExpandedTopYPx, target[0], target[1], dp(28));
                } else {
                    mCompactRow.setVisibility(VISIBLE);
                    mCompactRow.setAlpha(1f);
                    mCompactRow.setScaleX(1f);
                    mCompactRow.setScaleY(1f);
                    mExpandedCard.setVisibility(GONE);
                    int[] target = measureCompactTarget();
                    applyStaticGeometry(target[2], mCompactTopYPx, target[0], target[1], target[1] * 0.5f);
                }
            }
            applyHardwareBlur(true, mExpanded ? dp(28) : (mCompactHeightPx * 0.5f));
        } else if (wasInactive) {
            mExpanded = false;
            mCompactRow.setVisibility(VISIBLE);
            mCompactRow.setAlpha(0f);
            mCompactRow.setScaleX(0.92f);
            mCompactRow.setScaleY(0.92f);
            mExpandedCard.setVisibility(GONE);
            mExpandedCard.setAlpha(0f);

            int[] target = measureCompactTarget();
            RectF dotRect = new RectF();
            getCutoutDotRect(dotRect);
            mCurrRect.set(dotRect);
            mCurrCornerPx = dotRect.height() * 0.5f;
            mCompactLeftSlot.setTranslationX(dp(10));
            mCompactLeftSlot.setAlpha(0f);
            mCompactRightSlot.setTranslationX(-dp(10));
            mCompactRightSlot.setAlpha(0f);
            mPillContainer.setAlpha(0f);
            startMorph(target[2], mCompactTopYPx, target[0], target[1], target[1] * 0.5f, 1);
            applyHardwareBlur(true, target[1] * 0.5f);
        } else if (mExpanded) {
            int[] target = measureExpandedTarget();
            startMorph(target[2], mExpandedTopYPx, target[0], target[1], dp(28), 4);
            applyHardwareBlur(true, dp(28));
        } else {
            int[] target = measureCompactTarget();
            if (!sameKey) {
                mCompactLeftSlot.setAlpha(0.18f);
                mCompactRightSlot.setAlpha(0.18f);
                mCompactRightSlot.setTranslationX(dp(8));
            }
            startMorph(target[2], mCompactTopYPx, target[0], target[1], target[1] * 0.5f, 4);
            applyHardwareBlur(true, target[1] * 0.5f);
        }

        updateTicker();
    }

    public void hideAll() {
        mHandler.removeCallbacks(mTickRunnable);
        mCurrentItem = null;
        if (!mHasActiveContent) {
            BlurEngine.clearBlur(mBlurBackdrop);
            setVisibility(GONE);
            return;
        }
        boolean wasExpanded = mExpanded;
        mExpanded = false;
        if (wasExpanded) {
            mCallbacks.onExpandedStateChanged(false);
        }
        mHasActiveContent = false;
        mCompactWaveform.setAnimating(false);
        mExpWaveform.setAnimating(false);
        if (mSuspendedForSleep) {
            cancelMorph();
            BlurEngine.clearBlur(mBlurBackdrop);
            setVisibility(GONE);
            return;
        }
        mExpandedCard.setVisibility(GONE);
        mCompactRow.setVisibility(VISIBLE);
        RectF dotRect = new RectF();
        getCutoutDotRect(dotRect);
        startMorph(dotRect.left, dotRect.top, Math.round(dotRect.width()), Math.round(dotRect.height()),
                dotRect.height() * 0.5f, 5);
    }

    public void expand() {
        if (!mHasActiveContent || mSuspendedForSleep || mCurrentItem == null || mExpanded) {
            return;
        }
        mExpanded = true;
        mCallbacks.onExpandedStateChanged(true);
        bindExpanded(mCurrentItem);
        updateLiveTickValues();

        mFadeStartCompAlpha = mCompactRow.getAlpha();
        mFadeStartExpAlpha = mExpandedCard.getVisibility() == VISIBLE ? mExpandedCard.getAlpha() : 0f;

        mCompactRow.setVisibility(VISIBLE);
        mExpandedCard.setVisibility(VISIBLE);
        mExpandedCard.setAlpha(mFadeStartExpAlpha);

        int[] target = measureExpandedTarget();
        updateGlassSurface();
        startMorph(target[2], mExpandedTopYPx, target[0], target[1], dp(28), 2);
        applyHardwareBlur(true, dp(28));
        updateTicker();
    }

    public void collapse() {
        if (!mExpanded) {
            return;
        }
        mExpanded = false;
        mCallbacks.onExpandedStateChanged(false);

        if (mCurrentItem != null && mHasActiveContent) {
            mFadeStartExpAlpha = mExpandedCard.getAlpha();
            mFadeStartCompAlpha = mCompactRow.getVisibility() == VISIBLE ? mCompactRow.getAlpha() : 0f;

            mExpandedCard.setVisibility(VISIBLE);
            mCompactRow.setVisibility(VISIBLE);
            mCompactRow.setAlpha(mFadeStartCompAlpha);

            int[] target = measureCompactTarget();
            updateGlassSurface();
            startMorph(target[2], mCompactTopYPx, target[0], target[1], target[1] * 0.5f, 3);
            applyHardwareBlur(true, target[1] * 0.5f);
            updateTicker();
        }
    }

    @Override
    public boolean onInterceptTouchEvent(MotionEvent ev) {
        if (ev.getActionMasked() == MotionEvent.ACTION_OUTSIDE && mExpanded) {
            collapse();
            return false;
        }
        return super.onInterceptTouchEvent(ev);
    }

    @Override
    public boolean dispatchTouchEvent(MotionEvent ev) {
        if (ev.getActionMasked() == MotionEvent.ACTION_OUTSIDE && mExpanded) {
            collapse();
            return true;
        }
        int action = ev.getActionMasked();
        if (action == MotionEvent.ACTION_DOWN) {
            mTouchInsidePill = isPointInsidePill(ev.getX(), ev.getY());
            if (!mTouchInsidePill) {
                return false;
            }
            mDownX = ev.getRawX();
            mDownY = ev.getRawY();
            mTrackingSwipe = false;
            animatePressScale(0.945f, 110L);
        } else if (action == MotionEvent.ACTION_UP || action == MotionEvent.ACTION_CANCEL) {
            animatePressScale(1.0f, 230L);
            if (!mTouchInsidePill) {
                return false;
            }
        } else if (action == MotionEvent.ACTION_MOVE) {
            if (!mTouchInsidePill) {
                return false;
            }
            float dx = ev.getRawX() - mDownX;
            float dy = ev.getRawY() - mDownY;
            if (!mTrackingSwipe && (Math.abs(dx) > mTouchSlop * 1.4f || Math.abs(dy) > mTouchSlop * 1.4f)) {
                if (mExpanded && dy < -mTouchSlop * 2.0f && Math.abs(dy) > Math.abs(dx)) {
                    mTrackingSwipe = true;
                    animatePressScale(1.0f, 200L);
                    collapse();
                    return true;
                }
                if (mStackCount > 1 && Math.abs(dx) > mTouchSlop * 2.0f && Math.abs(dx) > Math.abs(dy) * 1.3f) {
                    mTrackingSwipe = true;
                    animatePressScale(1.0f, 200L);
                    mCallbacks.onCycleIsland(dx < 0 ? 1 : -1);
                    return true;
                }
            }
        }
        return super.dispatchTouchEvent(ev);
    }

    @Override
    public boolean onTouchEvent(MotionEvent event) {
        if (event.getActionMasked() == MotionEvent.ACTION_OUTSIDE && mExpanded) {
            collapse();
            return true;
        }
        if (event.getActionMasked() == MotionEvent.ACTION_DOWN) {
            return mTouchInsidePill;
        }
        if (event.getActionMasked() == MotionEvent.ACTION_UP && !mTrackingSwipe && mTouchInsidePill) {
            if (!mExpanded && mCurrentItem != null) {
                if (mCurrentItem.transientItem && mCurrentItem.contentIntent != null) {
                    launchContentIntent();
                } else {
                    expand();
                }
                return true;
            }
        }
        return super.onTouchEvent(event);
    }

    private boolean isPointInsidePill(float x, float y) {
        if (mCurrRect.width() > 0f && mCurrRect.height() > 0f) {
            return x >= (mCurrRect.left - dp(6)) && x <= (mCurrRect.right + dp(6))
                    && y >= (mCurrRect.top - dp(6)) && y <= (mCurrRect.bottom + dp(6));
        }
        float l = mPillContainer.getLeft() - dp(4);
        float t = mPillContainer.getTop() - dp(4);
        float r = l + mPillContainer.getWidth() + dp(8);
        float b = t + mPillContainer.getHeight() + dp(8);
        return x >= l && x <= r && y >= t && y <= b;
    }

    private int getOverlayWidth() {
        int w = getWidth();
        return w > 0 ? w : getResources().getDisplayMetrics().widthPixels;
    }

    private void getCutoutDotRect(RectF out) {
        int dotW = Math.max(dp(26), mCutoutGapPx);
        int dotH = Math.max(dp(22), mCutoutHeightPx);
        float camCenterX = (getOverlayWidth() * 0.5f) + mCutoutCenterOffsetX;
        float dotLeft = camCenterX - (dotW * 0.5f);
        float dotTop = mCompactTopYPx + (mCompactHeightPx - dotH) * 0.5f;
        out.set(dotLeft, dotTop, dotLeft + dotW, dotTop + dotH);
    }

    private int mLastRowLeftInPill = 0;

    private int[] measureCompactTarget() {
        mCompactRow.measure(
                MeasureSpec.makeMeasureSpec(dp(250), MeasureSpec.AT_MOST),
                MeasureSpec.makeMeasureSpec(mCompactHeightPx, MeasureSpec.EXACTLY)
        );
        int measuredRowW = mCompactRow.getMeasuredWidth();
        int w = Math.max(mCutoutGapPx + dp(36), measuredRowW);
        int rowLeftInPill = (w - measuredRowW) / 2;
        mLastRowLeftInPill = rowLeftInPill;
        mCompactRow.setPivotX(measuredRowW * 0.5f);
        mCompactRow.setPivotY(mCompactHeightPx * 0.5f);

        int leftSlotW = mCompactLeftSlot.getVisibility() == VISIBLE ? mCompactLeftSlot.getMeasuredWidth() : 0;
        // Anchor mCutoutGap dead-center over the physical camera punch-hole regardless of Left vs Right width
        float gapCenterInPill = rowLeftInPill + mCompactRow.getPaddingLeft() + leftSlotW + (mCutoutGapPx * 0.5f);
        float camCenterX = (getOverlayWidth() * 0.5f) + mCutoutCenterOffsetX;
        int leftPx = Math.round(camCenterX - gapCenterInPill);
        leftPx = Math.max(dp(4), Math.min(Math.max(dp(4), getOverlayWidth() - w - dp(4)), leftPx));
        return new int[]{w, mCompactHeightPx, leftPx};
    }

    private int[] measureExpandedTarget() {
        mExpandedCard.measure(
                MeasureSpec.makeMeasureSpec(mExpandedWidthPx, MeasureSpec.EXACTLY),
                MeasureSpec.makeMeasureSpec(dp(320), MeasureSpec.AT_MOST)
        );
        int h = Math.max(dp(106), mExpandedCard.getMeasuredHeight());
        int leftPx = Math.round((getOverlayWidth() - mExpandedWidthPx) * 0.5f);
        return new int[]{mExpandedWidthPx, h, Math.max(dp(4), leftPx)};
    }

    private void animatePressScale(float targetScale, long durationMs) {
        if (Math.abs(targetScale - mPressTargetScale) < 0.002f && !mPressAnimRunning) {
            return;
        }
        mPressStartScale = mCurrPressScale;
        mPressTargetScale = targetScale;
        mPressDurationNs = Math.max(1L, durationMs) * 1_000_000L;
        mPressStartNanos = -1L;
        mPressAnimRunning = true;
        scheduleNextAnimFrame();
    }

    private void cancelMorph() {
        mMorphRunning = false;
        mMorphMode = 0;
        if (!mPressAnimRunning) {
            Choreographer.getInstance().removeFrameCallback(mFrameCallback);
        }
    }

    private void cancelAllAnimations() {
        mMorphRunning = false;
        mMorphMode = 0;
        mPressAnimRunning = false;
        Choreographer.getInstance().removeFrameCallback(mFrameCallback);
    }

    private void scheduleNextAnimFrame() {
        Choreographer.getInstance().removeFrameCallback(mFrameCallback);
        Choreographer.getInstance().postFrameCallback(mFrameCallback);
    }

    private void applyStaticGeometry(float leftPx, float topPx, int w, int h, float cornerPx) {
        int clampedW = Math.max(1, w);
        int clampedH = Math.max(1, h);
        mCurrRect.set(leftPx, topPx, leftPx + clampedW, topPx + clampedH);
        mCurrCornerPx = Math.max(0f, cornerPx);

        mBoxLeft = Math.round(leftPx);
        mBoxTop = Math.round(topPx);
        mBoxW = clampedW;
        mBoxH = clampedH;

        LayoutParams lp = (LayoutParams) mPillContainer.getLayoutParams();
        lp.gravity = Gravity.TOP | Gravity.LEFT;
        if (lp.width != mBoxW || lp.height != mBoxH || lp.leftMargin != mBoxLeft || lp.topMargin != mBoxTop) {
            lp.width = mBoxW;
            lp.height = mBoxH;
            lp.leftMargin = mBoxLeft;
            lp.topMargin = mBoxTop;
            mPillContainer.setLayoutParams(lp);
        }

        if (!mExpanded) {
            LayoutParams compLp = (LayoutParams) mCompactRow.getLayoutParams();
            compLp.gravity = Gravity.TOP | Gravity.LEFT;
            if (compLp.leftMargin != mLastRowLeftInPill || compLp.topMargin != 0) {
                compLp.leftMargin = mLastRowLeftInPill;
                compLp.topMargin = 0;
                mCompactRow.setLayoutParams(compLp);
            }
        } else {
            LayoutParams expLp = (LayoutParams) mExpandedCard.getLayoutParams();
            expLp.gravity = Gravity.TOP | Gravity.LEFT;
            if (expLp.leftMargin != 0 || expLp.topMargin != 0) {
                expLp.leftMargin = 0;
                expLp.topMargin = 0;
                mExpandedCard.setLayoutParams(expLp);
            }
        }

        mPillContainer.setPivotX(mBoxW * 0.5f);
        mPillContainer.setPivotY(mBoxH * 0.5f);
        layoutVisualLayersLocked();
        mPillContainer.invalidateOutline();
        updateGlassSurface();
    }

    private void startMorph(float targetLeft, float targetTop, int targetW, int targetH, float targetCorner, int mode) {
        int clampedW = Math.max(1, targetW);
        int clampedH = Math.max(1, targetH);

        if (mCurrRect.width() <= 0f || mCurrRect.height() <= 0f) {
            mStartRect.set(targetLeft, targetTop, targetLeft + clampedW, targetTop + clampedH);
        } else {
            mStartRect.set(mCurrRect);
        }
        mTargetRect.set(targetLeft, targetTop, targetLeft + clampedW, targetTop + clampedH);
        mStartCorner = mCurrCornerPx > 0f ? mCurrCornerPx : targetCorner;
        mTargetCorner = Math.max(0f, targetCorner);

        // Allocate bounding union box with spring overshoot headroom ONCE — 0 relayouts per morph frame!
        int screenW = getOverlayWidth();
        int padX = dp(24);
        int padY = dp(18);
        int boxL = Math.max(0, Math.round(Math.min(mStartRect.left, mTargetRect.left) - padX));
        int boxT = Math.max(0, Math.round(Math.min(mStartRect.top, mTargetRect.top) - padY));
        int boxR = Math.min(screenW, Math.round(Math.max(mStartRect.right, mTargetRect.right) + padX));
        int boxB = Math.round(Math.max(mStartRect.bottom, mTargetRect.bottom) + padY);

        mBoxLeft = boxL;
        mBoxTop = boxT;
        mBoxW = Math.max(1, boxR - boxL);
        mBoxH = Math.max(1, boxB - boxT);

        LayoutParams lp = (LayoutParams) mPillContainer.getLayoutParams();
        lp.gravity = Gravity.TOP | Gravity.LEFT;
        lp.width = mBoxW;
        lp.height = mBoxH;
        lp.leftMargin = mBoxLeft;
        lp.topMargin = mBoxTop;
        mPillContainer.setLayoutParams(lp);

        // Position inner content views cleanly ONCE inside mBox
        if (mCompactRow.getVisibility() == VISIBLE) {
            RectF compactAnchor = (mode == 2 || mode == 5) ? mStartRect : mTargetRect;
            LayoutParams compLp = (LayoutParams) mCompactRow.getLayoutParams();
            compLp.gravity = Gravity.TOP | Gravity.LEFT;
            compLp.leftMargin = Math.round(compactAnchor.left - mBoxLeft) + mLastRowLeftInPill;
            compLp.topMargin = Math.round(compactAnchor.top - mBoxTop);
            mCompactRow.setLayoutParams(compLp);
        }
        if (mExpandedCard.getVisibility() == VISIBLE) {
            RectF expAnchor = (mode == 3) ? mStartRect : mTargetRect;
            LayoutParams expLp = (LayoutParams) mExpandedCard.getLayoutParams();
            expLp.gravity = Gravity.TOP | Gravity.LEFT;
            expLp.leftMargin = Math.round(expAnchor.left - mBoxLeft);
            expLp.topMargin = Math.round(expAnchor.top - mBoxTop);
            mExpandedCard.setLayoutParams(expLp);
        }

        // Exact OxygenOS 16 COUISpringInterpolator & COUIMoveEase curves tuned by user preferences
        float speedFactor = 100f / Math.max(40, Math.min(200, mTuneAnimSpeedPct));
        double bounceFactor = Math.max(0.0, Math.min(2.0, mTuneAnimBouncePct / 26.0));
        mMorphMode = mode;
        mMorphStartNanos = -1L;
        if (mode == 1) { // Bloom emerge from camera dot (KeyguardNotificationCapsuleViewControllerImpl)
            mMorphDurationNs = Math.round(460_000_000L * speedFactor);
            mUseMoveEase = false;
            mSpringResponseX = 0.66;
            mSpringBounceX = Math.min(0.46, 0.36 * bounceFactor);
            mSpringResponseY = 0.58;
            mSpringBounceY = Math.min(0.42, 0.24 * bounceFactor);
        } else if (mode == 2) { // Expand pill -> Fluid Glass card
            mMorphDurationNs = Math.round(440_000_000L * speedFactor);
            mUseMoveEase = false;
            mSpringResponseX = 0.48;
            mSpringBounceX = Math.min(0.38, 0.16 * bounceFactor);
            mSpringResponseY = 0.56;
            mSpringBounceY = Math.min(0.44, 0.26 * bounceFactor);
        } else if (mode == 3) { // Collapse card -> pill
            mMorphDurationNs = Math.round(360_000_000L * speedFactor);
            mUseMoveEase = false;
            mSpringResponseX = 0.42;
            mSpringBounceX = Math.min(0.28, 0.08 * bounceFactor);
            mSpringResponseY = 0.46;
            mSpringBounceY = Math.min(0.32, 0.10 * bounceFactor);
        } else if (mode == 5) { // Hide back into camera cutout (FlashViewsWindowManager COUIMoveEase)
            mMorphDurationNs = Math.round(260_000_000L * speedFactor);
            mUseMoveEase = true;
        } else { // Swap / width adjust
            mMorphDurationNs = Math.round(320_000_000L * speedFactor);
            mUseMoveEase = false;
            mSpringResponseX = 0.50;
            mSpringBounceX = Math.min(0.38, 0.18 * bounceFactor);
            mSpringResponseY = 0.46;
            mSpringBounceY = Math.min(0.32, 0.12 * bounceFactor);
        }

        mCurrRect.set(mStartRect);
        mCurrCornerPx = mStartCorner;
        layoutVisualLayersLocked();
        mPillContainer.invalidateOutline();

        mMorphRunning = true;
        scheduleNextAnimFrame();
    }

    private void layoutVisualLayersLocked() {
        if (mCurrRect.width() <= 0f || mCurrRect.height() <= 0f) {
            return;
        }
        int l = Math.max(0, Math.round(mCurrRect.left - mBoxLeft));
        int t = Math.max(0, Math.round(mCurrRect.top - mBoxTop));
        int r = Math.min(mBoxW, Math.max(l + 1, Math.round(mCurrRect.right - mBoxLeft)));
        int b = Math.min(mBoxH, Math.max(t + 1, Math.round(mCurrRect.bottom - mBoxTop)));
        mBlurBackdrop.layout(l, t, r, b);
        mGlassTintView.layout(l, t, r, b);
        mRimView.layout(l, t, r, b);
    }

    private void stepAnimationsFrame(long frameTimeNanos) {
        if (mPressAnimRunning) {
            if (mPressStartNanos < 0L) {
                mPressStartNanos = frameTimeNanos - 8_000_000L;
            }
            float pu = Math.min(1f, Math.max(0f, (frameTimeNanos - mPressStartNanos) / (float) mPressDurationNs));
            float ps = (mPressTargetScale > mPressStartScale)
                    ? evalCouiSpring(pu, 0.40, 0.22)
                    : evalCubicBezier(pu, 0.30f, 0f, 0.10f, 1f);
            mCurrPressScale = mPressStartScale + (mPressTargetScale - mPressStartScale) * ps;
            mPillContainer.setPivotX(mCurrRect.centerX() - mBoxLeft);
            mPillContainer.setPivotY(mCurrRect.centerY() - mBoxTop);
            mPillContainer.setScaleX(mCurrPressScale);
            mPillContainer.setScaleY(mCurrPressScale);
            if (pu >= 1f) {
                mPressAnimRunning = false;
                mCurrPressScale = mPressTargetScale;
                mPillContainer.setScaleX(mCurrPressScale);
                mPillContainer.setScaleY(mCurrPressScale);
            }
        }

        if (mMorphRunning) {
            if (mMorphStartNanos < 0L) {
                mMorphStartNanos = frameTimeNanos - 8_000_000L;
            }
            float u = Math.min(1f, Math.max(0f, (frameTimeNanos - mMorphStartNanos) / (float) mMorphDurationNs));
            float sx;
            float sy;
            if (mUseMoveEase) {
                sx = evalCubicBezier(u, 0.30f, 0f, 0.10f, 1f);
                sy = sx;
            } else {
                sx = evalCouiSpring(u, mSpringResponseX, mSpringBounceX);
                sy = evalCouiSpring(u, mSpringResponseY, mSpringBounceY);
            }

            float curL = mStartRect.left + (mTargetRect.left - mStartRect.left) * sx;
            float curR = mStartRect.right + (mTargetRect.right - mStartRect.right) * sx;
            float curT = mStartRect.top + (mTargetRect.top - mStartRect.top) * sy;
            float curB = mStartRect.bottom + (mTargetRect.bottom - mStartRect.bottom) * sy;

            if (curR - curL < 2f) {
                float cx = (curL + curR) * 0.5f;
                curL = cx - 1f;
                curR = cx + 1f;
            }
            if (curB - curT < 2f) {
                float cy = (curT + curB) * 0.5f;
                curT = cy - 1f;
                curB = cy + 1f;
            }
            mCurrRect.set(curL, curT, curR, curB);
            mCurrCornerPx = Math.max(0f, mStartCorner + (mTargetCorner - mStartCorner) * sy);

            mPillContainer.setPivotX(mCurrRect.centerX() - mBoxLeft);
            mPillContainer.setPivotY(mCurrRect.centerY() - mBoxTop);
            layoutVisualLayersLocked();
            mPillContainer.invalidateOutline();
            updateGlassSurface();

            if (mMorphMode == 1) { // Bloom emerge from punch-hole
                float shellAlpha = evalCubicBezier(Math.min(1f, u / 0.28f), 0.17f, 0f, 0.83f, 1f);
                mPillContainer.setAlpha(shellAlpha);
                float slotT = Math.min(1f, Math.max(0f, (u - 0.08f) / 0.64f));
                float slotEase = evalCubicBezier(slotT, 0.33f, 0f, 0.67f, 1f);
                mCompactRow.setAlpha(slotEase);
                mCompactRow.setScaleX(0.92f + 0.08f * slotEase);
                mCompactRow.setScaleY(0.92f + 0.08f * slotEase);
                mCompactLeftSlot.setAlpha(slotEase);
                mCompactLeftSlot.setTranslationX(dp(10) * (1f - slotEase));
                mCompactRightSlot.setAlpha(slotEase);
                mCompactRightSlot.setTranslationX(-dp(10) * (1f - slotEase));
            } else if (mMorphMode == 2) { // Expand compact -> expanded Fluid Glass card
                float outT = Math.min(1f, u / 0.28f);
                float outEase = evalCubicBezier(outT, 0.30f, 0f, 0.10f, 1f);
                mCompactRow.setAlpha(Math.max(0f, mFadeStartCompAlpha * (1f - outEase)));
                mCompactRow.setScaleX(1f - 0.10f * outEase);
                mCompactRow.setScaleY(1f - 0.10f * outEase);
                mCompactRow.setTranslationY(dp(4) * outEase);

                float inT = Math.min(1f, Math.max(0f, (u - 0.10f) / 0.72f));
                float inAlpha = evalCubicBezier(inT, 0.33f, 0f, 0.67f, 1f);
                float inSpring = evalCouiSpring(inT, 0.56, 0.20);
                mExpandedCard.setAlpha(mFadeStartExpAlpha + (1f - mFadeStartExpAlpha) * inAlpha);
                mExpandedCard.setScaleX(0.88f + 0.12f * inSpring);
                mExpandedCard.setScaleY(0.88f + 0.12f * inSpring);
                mExpandedCard.setTranslationY(-dp(10) * (1f - inSpring));
            } else if (mMorphMode == 3) { // Collapse expanded card -> compact pill
                float outT = Math.min(1f, u / 0.34f);
                float outEase = evalCubicBezier(outT, 0.30f, 0f, 0.10f, 1f);
                mExpandedCard.setAlpha(Math.max(0f, mFadeStartExpAlpha * (1f - outEase)));
                mExpandedCard.setScaleX(1f - 0.12f * outEase);
                mExpandedCard.setScaleY(1f - 0.12f * outEase);
                mExpandedCard.setTranslationY(-dp(8) * outEase);

                float inT = Math.min(1f, Math.max(0f, (u - 0.24f) / 0.66f));
                float inEase = evalCubicBezier(inT, 0.33f, 0f, 0.67f, 1f);
                mCompactRow.setAlpha(mFadeStartCompAlpha + (1f - mFadeStartCompAlpha) * inEase);
                mCompactRow.setScaleX(0.88f + 0.12f * inEase);
                mCompactRow.setScaleY(0.88f + 0.12f * inEase);
                mCompactRow.setTranslationY(0f);
            } else if (mMorphMode == 4) { // Swap / live update
                float t = Math.min(1f, u / 0.62f);
                float ease = evalCubicBezier(t, 0.33f, 0f, 0.67f, 1f);
                mCompactLeftSlot.setAlpha(0.18f + 0.82f * ease);
                mCompactRightSlot.setAlpha(0.18f + 0.82f * ease);
                mCompactRightSlot.setTranslationX(dp(8) * (1f - ease));
            } else if (mMorphMode == 5) { // Hide back into camera cutout
                float fadeT = Math.min(1f, u / 0.78f);
                float fade = Math.max(0f, 1f - evalCubicBezier(fadeT, 0.17f, 0f, 0.83f, 1f));
                mPillContainer.setAlpha(fade);
                mCompactRow.setAlpha(fade);
            }

            if (u >= 1f) {
                finishMorph();
            }
        }

        if (mMorphRunning || mPressAnimRunning) {
            scheduleNextAnimFrame();
        }
    }

    private void finishMorph() {
        int finishedMode = mMorphMode;
        mMorphRunning = false;
        mMorphMode = 0;

        mPillContainer.setAlpha(1f);
        mCompactLeftSlot.setAlpha(1f);
        mCompactLeftSlot.setTranslationX(0f);
        mCompactRightSlot.setAlpha(1f);
        mCompactRightSlot.setTranslationX(0f);
        mCompactRow.setScaleX(1f);
        mCompactRow.setScaleY(1f);
        mCompactRow.setTranslationY(0f);
        mExpandedCard.setScaleX(1f);
        mExpandedCard.setScaleY(1f);
        mExpandedCard.setTranslationY(0f);

        if (finishedMode == 2) {
            mCompactRow.setVisibility(GONE);
            mCompactRow.setAlpha(1f);
            mExpandedCard.setVisibility(VISIBLE);
            mExpandedCard.setAlpha(1f);
        } else if (finishedMode == 3) {
            mExpandedCard.setVisibility(GONE);
            mExpandedCard.setAlpha(0f);
            mCompactRow.setVisibility(VISIBLE);
            mCompactRow.setAlpha(1f);
        } else if (finishedMode == 5 && !mHasActiveContent) {
            BlurEngine.clearBlur(mBlurBackdrop);
            setVisibility(GONE);
            return;
        }

        applyStaticGeometry(
                mTargetRect.left,
                mTargetRect.top,
                Math.round(mTargetRect.width()),
                Math.round(mTargetRect.height()),
                mTargetCorner
        );
        applyHardwareBlur(true, mTargetCorner);
    }

    /**
     * Exact OxygenOS COUISpringInterpolator physics from op_sysui (response, bounce).
     */
    private static float evalCouiSpring(float u, double response, double bounce) {
        if (u <= 0f) {
            return 0f;
        }
        if (u >= 1f) {
            return 1f;
        }
        double omega0 = (2.0 * Math.PI) / Math.max(0.05, response);
        double zeta = 1.0 - bounce;
        double finalVal = rawCouiSpring(1.0, omega0, zeta);
        if (Math.abs(finalVal) < 1e-6) {
            return 1f;
        }
        return (float) (rawCouiSpring(u, omega0, zeta) / finalVal);
    }

    private static double rawCouiSpring(double t, double omega0, double zeta) {
        if (zeta < 1.0) {
            double wd = omega0 * Math.sqrt(1.0 - zeta * zeta);
            double impulse = (zeta * omega0) / wd;
            return 1.0 - Math.exp(-zeta * omega0 * t)
                    * (Math.cos(wd * t) + impulse * Math.sin(wd * t));
        } else {
            return 1.0 - Math.exp(-omega0 * t) * (1.0 + omega0 * t);
        }
    }

    /**
     * Exact cubic-bezier evaluator matching COUIMoveEase / COUIEase / GOTO_CAPSULE_ALPHA PathInterpolators.
     */
    private static float evalCubicBezier(float x, float x1, float y1, float x2, float y2) {
        if (x <= 0f) {
            return 0f;
        }
        if (x >= 1f) {
            return 1f;
        }
        float t = x;
        for (int i = 0; i < 6; i++) {
            float u = 1f - t;
            float bx = 3f * u * u * t * x1 + 3f * u * t * t * x2 + t * t * t;
            float dbx = 3f * u * u * x1 + 6f * u * t * (x2 - x1) + 3f * t * t * (1f - x2);
            if (Math.abs(dbx) < 1e-5f) {
                break;
            }
            t -= (bx - x) / dbx;
            if (t < 0f) {
                t = 0f;
            } else if (t > 1f) {
                t = 1f;
            }
        }
        float u = 1f - t;
        return 3f * u * u * t * y1 + 3f * u * t * t * y2 + t * t * t;
    }

    private void updateGlassSurface() {
        mFluidGlassDrawable.configure(mCurrAccentColor, mExpanded, mHardwareBlurSupported, mCurrCornerPx, mTuneGlassOpacity);
        mFluidRimDrawable.configure(mCurrAccentColor, mExpanded, mCurrCornerPx, mTuneRimAlpha);
        mGlassTintView.invalidate();
        mRimView.invalidate();
    }

    private void applyHardwareBlur(boolean force) {
        float fallbackCorner = mCurrCornerPx > 0f ? mCurrCornerPx : (mExpanded ? dp(28) : (mCompactHeightPx * 0.5f));
        applyHardwareBlur(force, fallbackCorner);
    }

    private void applyHardwareBlur(boolean force, float cornerPx) {
        if (!isAttachedToWindow() || mSuspendedForSleep || !mHasActiveContent || !force) {
            return;
        }
        if (mTuneBlurRadius <= 0) {
            BlurEngine.clearBlur(mBlurBackdrop);
            mBlurBackdrop.setBackground(null);
            mFallbackBlurDrawable = null;
            if (mHardwareBlurSupported) {
                mHardwareBlurSupported = false;
                updateGlassSurface();
            }
            return;
        }
        boolean applied = BlurEngine.applySemWindowBlur(mBlurBackdrop, mExpanded, cornerPx, mTuneBlurRadius);
        if (!applied) {
            mFallbackBlurDrawable = BlurEngine.applyFallbackBlur(
                    mBlurBackdrop, mFallbackBlurDrawable, mExpanded, cornerPx, mTuneBlurRadius);
            applied = (mFallbackBlurDrawable != null);
        }
        if (applied != mHardwareBlurSupported) {
            mHardwareBlurSupported = applied;
            updateGlassSurface();
        }
    }

    private void registerTouchableInsetsListener() {
        if (mInsetsListenerProxy != null) {
            return;
        }
        try {
            Class<?> listenerCls = Class.forName("android.view.ViewTreeObserver$OnComputeInternalInsetsListener");
            Class<?> infoCls = Class.forName("android.view.ViewTreeObserver$InternalInsetsInfo");
            final Method setTouchableInsets = infoCls.getMethod("setTouchableInsets", int.class);
            final Field touchableRegionField = infoCls.getField("touchableRegion");
            Method addMethod = ViewTreeObserver.class.getMethod("addOnComputeInternalInsetsListener", listenerCls);

            InvocationHandler handler = (proxy, method, args) -> {
                if ("onComputeInternalInsets".equals(method.getName()) && args != null && args.length > 0 && args[0] != null) {
                    Object info = args[0];
                    setTouchableInsets.invoke(info, 3); // TOUCHABLE_INSETS_REGION
                    Region reg = (Region) touchableRegionField.get(info);
                    if (reg != null) {
                        if (!mHasActiveContent || mSuspendedForSleep || getVisibility() != VISIBLE || mCurrRect.width() <= 0f) {
                            reg.setEmpty();
                        } else {
                            int l = Math.round(mCurrRect.left) - dp(6);
                            int t = Math.round(mCurrRect.top) - dp(6);
                            int r = Math.round(mCurrRect.right) + dp(6);
                            int b = Math.round(mCurrRect.bottom) + dp(6);
                            reg.set(l, t, r, b);
                        }
                    }
                }
                return null;
            };
            Object proxy = Proxy.newProxyInstance(listenerCls.getClassLoader(), new Class<?>[]{listenerCls}, handler);
            addMethod.invoke(getViewTreeObserver(), proxy);
            mInsetsListenerProxy = proxy;
        } catch (Throwable ignored) {
            mInsetsListenerProxy = null;
        }
    }

    private void unregisterTouchableInsetsListener() {
        if (mInsetsListenerProxy == null) {
            return;
        }
        try {
            Class<?> listenerCls = Class.forName("android.view.ViewTreeObserver$OnComputeInternalInsetsListener");
            Method removeMethod = ViewTreeObserver.class.getMethod("removeOnComputeInternalInsetsListener", listenerCls);
            removeMethod.invoke(getViewTreeObserver(), mInsetsListenerProxy);
        } catch (Throwable ignored) {
        }
        mInsetsListenerProxy = null;
    }

    private void bindCompact(IslandItem item) {
        mCurrAccentColor = item.accentColor != 0 ? (0xFF000000 | item.accentColor) : 0xFF64D2FF;
        updateGlassSurface();
        if (item.artwork != null && !item.artwork.isRecycled()) {
            mCompactArtwork.setVisibility(VISIBLE);
            mCompactArtwork.setImageBitmap(item.artwork);
            mCompactGlyph.setVisibility(GONE);
        } else if (item.vectorKind != 0) {
            mCompactArtwork.setVisibility(GONE);
            mCompactGlyph.setVisibility(VISIBLE);
            mCompactGlyph.setGlyph(item.vectorKind, item.accentColor);
        } else if (item.iconDrawable != null) {
            mCompactArtwork.setVisibility(VISIBLE);
            mCompactArtwork.setImageDrawable(item.iconDrawable);
            mCompactGlyph.setVisibility(GONE);
        } else {
            mCompactArtwork.setVisibility(GONE);
            mCompactGlyph.setVisibility(VISIBLE);
            mCompactGlyph.setGlyph(GlyphIconView.GLYPH_SOUND, item.accentColor);
        }

        if (item.showWaveform) {
            mCompactWaveform.setVisibility(VISIBLE);
            mCompactWaveform.setAccentColor(item.accentColor);
            mCompactWaveform.setAnimating(item.waveformPlaying && !mSuspendedForSleep);
            mCompactText.setVisibility(GONE);
        } else {
            mCompactWaveform.setVisibility(GONE);
            mCompactWaveform.setAnimating(false);
            mCompactText.setVisibility(VISIBLE);
            boolean tintedRight = item.category == IslandItem.Category.CALL
                    || item.category == IslandItem.Category.RECORDING
                    || item.category == IslandItem.Category.TIMER
                    || item.category == IslandItem.Category.LIVE_DELIVERY
                    || item.category == IslandItem.Category.LIVE_RIDE;
            mCompactText.setTextColor(tintedRight ? item.accentColor : 0xFFFFFFFF);
            if (!item.hasChronometer) {
                mCompactText.setText(item.compactRightText);
            }
        }

        mStackDot.setVisibility(mStackCount > 1 ? VISIBLE : GONE);
        updateLiveTickValues();
    }

    private void bindExpanded(IslandItem item) {
        mCurrAccentColor = item.accentColor != 0 ? (0xFF000000 | item.accentColor) : 0xFF64D2FF;
        updateGlassSurface();
        if (item.artwork != null && !item.artwork.isRecycled()) {
            mExpIconBg.setColor(0x00000000);
            mExpIconBg.setStroke(0, 0);
            mExpArtwork.setVisibility(VISIBLE);
            mExpArtwork.setImageBitmap(item.artwork);
            mExpGlyph.setVisibility(GONE);
        } else if (item.vectorKind != 0) {
            mExpIconBg.setColor((item.accentColor & 0x00FFFFFF) | 0x33000000);
            mExpIconBg.setStroke(Math.max(1, dp(0.75f)), (item.accentColor & 0x00FFFFFF) | 0x4D000000);
            mExpArtwork.setVisibility(GONE);
            mExpGlyph.setVisibility(VISIBLE);
            mExpGlyph.setGlyph(item.vectorKind, item.accentColor);
        } else if (item.iconDrawable != null) {
            mExpIconBg.setColor(0x24FFFFFF);
            mExpIconBg.setStroke(Math.max(1, dp(0.6f)), 0x26FFFFFF);
            mExpArtwork.setVisibility(VISIBLE);
            mExpArtwork.setImageDrawable(item.iconDrawable);
            mExpGlyph.setVisibility(GONE);
        }

        mExpTitle.setText(item.title);
        mExpSubtitle.setText(item.subtitle);

        if (mStackCount > 1) {
            mExpStackBadge.setVisibility(VISIBLE);
            mExpStackBadge.setText((mStackIndex + 1) + " / " + mStackCount + " • swipe");
        } else {
            mExpStackBadge.setVisibility(GONE);
        }

        if (item.showWaveform) {
            mExpWaveform.setVisibility(VISIBLE);
            mExpWaveform.setAccentColor(item.accentColor);
            mExpWaveform.setAnimating(item.waveformPlaying && mExpanded && !mSuspendedForSleep);
            mExpRightStat.setVisibility(GONE);
        } else if (item.hasChronometer) {
            mExpWaveform.setVisibility(GONE);
            mExpWaveform.setAnimating(false);
            mExpRightStat.setVisibility(VISIBLE);
            mExpRightStat.setTextColor(item.accentColor);
        } else if (!TextUtils.isEmpty(item.compactRightText)
                && item.category == IslandItem.Category.HOTSPOT) {
            mExpWaveform.setVisibility(GONE);
            mExpWaveform.setAnimating(false);
            mExpRightStat.setVisibility(VISIBLE);
            mExpRightStat.setTextColor(item.accentColor);
            String cStr = item.compactRightText.trim();
            mExpRightStat.setText("1".equals(cStr) ? "1 device" : (cStr + " devices"));
        } else if (!TextUtils.isEmpty(item.compactRightText)
                && (item.category == IslandItem.Category.FLASH_EVENT
                || item.category == IslandItem.Category.LIVE_DELIVERY
                || item.category == IslandItem.Category.LIVE_RIDE)) {
            mExpWaveform.setVisibility(GONE);
            mExpWaveform.setAnimating(false);
            mExpRightStat.setVisibility(VISIBLE);
            mExpRightStat.setTextColor(item.accentColor);
            mExpRightStat.setText(item.compactRightText);
        } else {
            mExpWaveform.setVisibility(GONE);
            mExpWaveform.setAnimating(false);
            mExpRightStat.setVisibility(GONE);
        }

        if (item.hasProgress && item.progressMax > 0L) {
            mExpProgressRow.setVisibility(VISIBLE);
            ColorStateList tint = ColorStateList.valueOf(item.accentColor);
            if (item.mediaController != null) {
                mExpSeekBar.setVisibility(VISIBLE);
                mExpProgressBar.setVisibility(GONE);
                mExpSeekBar.setProgressTintList(tint);
                mExpSeekBar.setThumbTintList(tint);
                mExpElapsedText.setVisibility(VISIBLE);
                mExpDurationText.setVisibility(VISIBLE);
                mExpDurationText.setText(formatMs(item.progressMax));
                mExpSeekBar.setMax(1000);
                mExpSeekBar.setEnabled(item.canSeekMedia);
            } else {
                mExpSeekBar.setVisibility(GONE);
                mExpProgressBar.setVisibility(VISIBLE);
                mExpProgressBar.setProgressTintList(tint);
                mExpProgressBar.setMax((int) Math.min(Integer.MAX_VALUE, item.progressMax));
                mExpProgressBar.setProgress((int) Math.min(item.progressMax, item.progressValue));
                mExpElapsedText.setVisibility(GONE);
                mExpDurationText.setVisibility(GONE);
            }
        } else {
            mExpProgressRow.setVisibility(GONE);
        }

        if (item.mediaController != null) {
            mExpActionsRow.setVisibility(VISIBLE);
            mMediaControlsGroup.setVisibility(VISIBLE);
            mCustomActionsGroup.setVisibility(GONE);
            mPlayPauseBg.setColor(0xE6FFFFFF);
            mGlyphPlayPause.setGlyph(
                    item.waveformPlaying ? GlyphIconView.GLYPH_PAUSE : GlyphIconView.GLYPH_PLAY,
                    0xE6000000
            );
        } else if (!item.actions.isEmpty()) {
            mExpActionsRow.setVisibility(VISIBLE);
            mMediaControlsGroup.setVisibility(GONE);
            mCustomActionsGroup.setVisibility(VISIBLE);
            mCustomActionsGroup.removeAllViews();
            for (final IslandItem.ActionItem act : item.actions) {
                TextView btn = new TextView(getContext());
                btn.setText(act.label);
                btn.setTextColor(0xFFFFFFFF);
                btn.setTextSize(TypedValue.COMPLEX_UNIT_DIP, 12.0f);
                btn.setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL));
                btn.setPadding(dp(12), dp(6), dp(12), dp(6));
                GradientDrawable bg = new GradientDrawable();
                bg.setColor(0x26FFFFFF);
                bg.setCornerRadius(dp(14));
                btn.setBackground(bg);
                btn.setOnClickListener(v -> {
                    sendPendingIntent(act.intent);
                    collapse();
                });
                LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                        LayoutParams.WRAP_CONTENT, LayoutParams.WRAP_CONTENT
                );
                lp.setMarginStart(dp(8));
                mCustomActionsGroup.addView(btn, lp);
            }
        } else {
            mExpActionsRow.setVisibility(GONE);
        }
    }

    private void updateTicker() {
        mHandler.removeCallbacks(mTickRunnable);
        if (!mHasActiveContent || mSuspendedForSleep || mCurrentItem == null) {
            return;
        }
        if (mCurrentItem.hasChronometer || (mExpanded && mCurrentItem.mediaController != null && mCurrentItem.hasProgress)) {
            updateLiveTickValues();
            mHandler.postDelayed(mTickRunnable, mExpanded ? 500L : 1000L);
        }
    }

    private void updateLiveTickValues() {
        IslandItem item = mCurrentItem;
        if (item == null) {
            return;
        }
        if (item.hasChronometer) {
            long now = SystemClock.elapsedRealtime();
            long diff = item.chronometerCountDown
                    ? Math.max(0L, item.chronometerBaseElapsedMs - now)
                    : Math.max(0L, now - item.chronometerBaseElapsedMs);
            String txt = formatMs(diff);
            mCompactText.setText(txt);
            mExpRightStat.setText(txt);
            if (!mExpanded && !mMorphRunning && mHasActiveContent) {
                int[] target = measureCompactTarget();
                int curW = Math.round(mCurrRect.width());
                if (target[0] != curW || Math.abs(target[2] - mCurrRect.left) > 1f) {
                    applyStaticGeometry(target[2], mCompactTopYPx, target[0], target[1], target[1] * 0.5f);
                }
            }
        } else if (mExpanded && item.mediaController != null && item.hasProgress && item.progressMax > 0 && !mUserSeeking) {
            long pos = item.progressValue;
            if (item.waveformPlaying && item.mediaPositionUpdateElapsedMs > 0L) {
                long delta = SystemClock.elapsedRealtime() - item.mediaPositionUpdateElapsedMs;
                pos += Math.round(delta * Math.max(0.5f, item.mediaSpeed));
            }
            pos = Math.max(0L, Math.min(item.progressMax, pos));
            mExpElapsedText.setText(formatMs(pos));
            mExpSeekBar.setProgress((int) ((pos * 1000L) / item.progressMax));
        }
    }

    private void sendMediaAction(int op) {
        if (mCurrentItem == null || mCurrentItem.mediaController == null) {
            return;
        }
        MediaController.TransportControls tc = mCurrentItem.mediaController.getTransportControls();
        try {
            if (op < 0) {
                tc.skipToPrevious();
            } else if (op > 0) {
                tc.skipToNext();
            } else {
                PlaybackState ps = mCurrentItem.mediaController.getPlaybackState();
                int st = ps != null ? ps.getState() : PlaybackState.STATE_NONE;
                if (st == PlaybackState.STATE_PLAYING || st == PlaybackState.STATE_BUFFERING) {
                    tc.pause();
                } else {
                    tc.play();
                }
            }
        } catch (Throwable ignored) {
        }
    }

    private void launchContentIntent() {
        if (mCurrentItem == null) {
            return;
        }
        if (mCurrentItem.contentIntent != null) {
            sendPendingIntent(mCurrentItem.contentIntent);
        }
        if (mCurrentItem.transientItem) {
            mCallbacks.onDismissTransient(mCurrentItem.key);
        }
        collapse();
    }

    private void sendPendingIntent(PendingIntent pi) {
        if (pi == null) {
            return;
        }
        try {
            ActivityOptions opts = ActivityOptions.makeBasic();
            opts.setPendingIntentBackgroundActivityStartMode(
                    ActivityOptions.MODE_BACKGROUND_ACTIVITY_START_ALLOWED
            );
            pi.send(getContext(), 0, null, null, null, null, opts.toBundle());
        } catch (Throwable ignored) {
            try {
                pi.send();
            } catch (Throwable ignored2) {
            }
        }
    }

    private static FrameLayout makeGlassCircleButton(Context context, int fillColor, int strokeColor, int strokePx) {
        FrameLayout f = new FrameLayout(context);
        GradientDrawable bg = new GradientDrawable();
        bg.setShape(GradientDrawable.OVAL);
        bg.setColor(fillColor);
        bg.setStroke(Math.max(1, strokePx), strokeColor);
        f.setBackground(bg);
        return f;
    }

    private static String formatMs(long ms) {
        long totalSec = Math.max(0L, ms / 1000L);
        long h = totalSec / 3600L;
        long m = (totalSec % 3600L) / 60L;
        long s = totalSec % 60L;
        if (h > 0L) {
            return String.format("%d:%02d:%02d", h, m, s);
        }
        return String.format("%02d:%02d", m, s);
    }

    private int dp(float v) {
        return Math.round(TypedValue.applyDimension(
                TypedValue.COMPLEX_UNIT_DIP, v, getResources().getDisplayMetrics()
        ));
    }

    /**
     * Multi-layer OxygenOS 16 Fluid Glass tint, accent aura, and top sheen drawn above the blur backdrop.
     * Uses Shader.setLocalMatrix for zero per-frame heap allocations during 120fps spring morphs.
     */
    private static final class FluidGlassDrawable extends Drawable {
        private final Paint mBasePaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint mAuraPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint mSheenPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final RectF mRect = new RectF();
        private final Matrix mMatrix = new Matrix();

        private Shader mBaseShader;
        private Shader mAuraShader;
        private Shader mSheenShader;

        private int mAccentColor = 0xFF64D2FF;
        private boolean mExpanded = false;
        private boolean mHasBlur = false;
        private float mCornerPx = 24f;
        private int mOpacityPct = 55;
        private boolean mShadersDirty = true;

        FluidGlassDrawable(float density) {
            mCornerPx = 14f * density;
        }

        void configure(int accentColor, boolean expanded, boolean hasBlur, float cornerPx, int opacityPct) {
            if (mAccentColor != accentColor || mExpanded != expanded || mHasBlur != hasBlur || mOpacityPct != opacityPct) {
                mAccentColor = accentColor;
                mExpanded = expanded;
                mHasBlur = hasBlur;
                mOpacityPct = opacityPct;
                mShadersDirty = true;
            }
            if (Math.abs(mCornerPx - cornerPx) > 0.25f) {
                mCornerPx = cornerPx;
            }
        }

        private static int scaleColorAlpha(int argb, float factor, int minA, int maxA) {
            int baseA = (argb >>> 24) & 0xFF;
            int scaledA = Math.max(minA, Math.min(maxA, Math.round(baseA * factor)));
            return (scaledA << 24) | (argb & 0x00FFFFFF);
        }

        private void rebuildShaders() {
            mShadersDirty = false;
            float glassFactor = Math.max(0.35f, Math.min(2.1f, mOpacityPct / 55f));

            int topColor;
            int midColor;
            int botColor;
            if (mExpanded) {
                if (mHasBlur) {
                    // OxygenOS 16 Fluid Glass luminous charcoal smoke over live wallpaper bokeh
                    topColor = scaleColorAlpha(0x52363B48, glassFactor, 0x1E, 0xEC);
                    midColor = scaleColorAlpha(0x62262A34, glassFactor, 0x24, 0xF0);
                    botColor = scaleColorAlpha(0x721B1E26, glassFactor, 0x2A, 0xF5);
                } else {
                    topColor = scaleColorAlpha(0xCA282C36, glassFactor, 0x70, 0xFA);
                    midColor = scaleColorAlpha(0xD41D2028, glassFactor, 0x78, 0xFA);
                    botColor = scaleColorAlpha(0xDE14171D, glassFactor, 0x80, 0xFA);
                }
            } else {
                if (mHasBlur) {
                    topColor = scaleColorAlpha(0x7A292E38, glassFactor, 0x30, 0xEC);
                    midColor = scaleColorAlpha(0x861F232B, glassFactor, 0x36, 0xF0);
                    botColor = scaleColorAlpha(0x94161920, glassFactor, 0x40, 0xF5);
                } else {
                    topColor = scaleColorAlpha(0xD0242832, glassFactor, 0x78, 0xFA);
                    midColor = scaleColorAlpha(0xDA1A1D24, glassFactor, 0x80, 0xFA);
                    botColor = scaleColorAlpha(0xE212141A, glassFactor, 0x88, 0xFA);
                }
            }
            mBaseShader = new LinearGradient(
                    0f, 0f, 0f, 100f,
                    new int[]{topColor, midColor, botColor},
                    new float[]{0f, 0.48f, 1f},
                    Shader.TileMode.CLAMP
            );
            mBasePaint.setShader(mBaseShader);

            int rgb = mAccentColor & 0x00FFFFFF;
            int auraAlpha = mExpanded ? 0x38000000 : 0x2E000000;
            mAuraShader = new RadialGradient(
                    0f, 0f, 100f,
                    new int[]{rgb | auraAlpha, rgb | (auraAlpha / 3), rgb},
                    new float[]{0f, 0.55f, 1f},
                    Shader.TileMode.CLAMP
            );
            mAuraPaint.setShader(mAuraShader);

            int sheenTop = mExpanded ? 0x2EFFFFFF : 0x22FFFFFF;
            mSheenShader = new LinearGradient(
                    0f, 0f, 0f, 100f,
                    new int[]{sheenTop, 0x09FFFFFF, 0x00FFFFFF},
                    new float[]{0f, 0.52f, 1f},
                    Shader.TileMode.CLAMP
            );
            mSheenPaint.setShader(mSheenShader);
        }

        @Override
        public void draw(Canvas canvas) {
            Rect b = getBounds();
            int w = b.width();
            int h = b.height();
            if (w <= 0 || h <= 0) {
                return;
            }
            if (mShadersDirty || mBaseShader == null) {
                rebuildShaders();
            }

            mMatrix.setScale(1f, Math.max(0.01f, h / 100f));
            mMatrix.postTranslate(b.left, b.top);
            mBaseShader.setLocalMatrix(mMatrix);

            float cx = b.left + w * (mExpanded ? 0.16f : 0.18f);
            float cy = b.top + (mExpanded ? h * 0.28f : h * 0.5f);
            float rad = Math.max(24f, mExpanded ? w * 0.56f : Math.max(h * 2.2f, w * 0.38f));
            mMatrix.setScale(rad / 100f, rad / 100f);
            mMatrix.postTranslate(cx, cy);
            mAuraShader.setLocalMatrix(mMatrix);

            mMatrix.setScale(1f, Math.max(0.01f, (h * 0.44f) / 100f));
            mMatrix.postTranslate(b.left, b.top);
            mSheenShader.setLocalMatrix(mMatrix);

            mRect.set(b.left, b.top, b.right, b.bottom);
            float r = Math.min(mCornerPx, Math.min(w, h) * 0.5f);
            canvas.drawRoundRect(mRect, r, r, mBasePaint);
            canvas.drawRoundRect(mRect, r, r, mAuraPaint);
            canvas.drawRoundRect(mRect, r, r, mSheenPaint);
        }

        @Override
        public void setAlpha(int alpha) {
        }

        @Override
        public void setColorFilter(ColorFilter colorFilter) {
        }

        @Override
        public int getOpacity() {
            return PixelFormat.TRANSLUCENT;
        }
    }

    /**
     * OxygenOS 16 diagonal specular glass rim stroke (from op_sysui fluid_glass_bg diagonal rim).
     */
    private static final class FluidRimDrawable extends Drawable {
        private final Paint mStrokePaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final RectF mRect = new RectF();
        private final Matrix mMatrix = new Matrix();
        private final float mDensity;

        private Shader mRimShader;
        private int mAccentColor = 0xFF64D2FF;
        private boolean mExpanded = false;
        private float mCornerPx = 24f;
        private int mRimAlphaPct = 85;
        private boolean mShaderDirty = true;

        FluidRimDrawable(float density) {
            mDensity = density;
            mStrokePaint.setStyle(Paint.Style.STROKE);
        }

        void configure(int accentColor, boolean expanded, float cornerPx, int rimAlphaPct) {
            if (mAccentColor != accentColor || mExpanded != expanded || mRimAlphaPct != rimAlphaPct) {
                mAccentColor = accentColor;
                mExpanded = expanded;
                mRimAlphaPct = rimAlphaPct;
                mShaderDirty = true;
            }
            if (Math.abs(mCornerPx - cornerPx) > 0.25f) {
                mCornerPx = cornerPx;
            }
        }

        private static int scaleRimAlpha(int argb, float factor) {
            int baseA = (argb >>> 24) & 0xFF;
            int scaledA = Math.max(0, Math.min(0xFF, Math.round(baseA * factor)));
            return (scaledA << 24) | (argb & 0x00FFFFFF);
        }

        private void rebuildShader() {
            mShaderDirty = false;
            float strokeW = (mExpanded ? 1.10f : 0.90f) * mDensity;
            mStrokePaint.setStrokeWidth(Math.max(1f, strokeW));
            float rimFactor = Math.max(0f, Math.min(1.35f, mRimAlphaPct / 85f));
            int rgb = mAccentColor & 0x00FFFFFF;
            mRimShader = new LinearGradient(
                    0f, 0f, 100f, 100f,
                    new int[]{
                            scaleRimAlpha(mExpanded ? 0xBDFFFFFF : 0x99FFFFFF, rimFactor),
                            scaleRimAlpha(0x26FFFFFF, rimFactor),
                            scaleRimAlpha(rgb | 0x42000000, rimFactor),
                            scaleRimAlpha(mExpanded ? 0x8AFFFFFF : 0x6AFFFFFF, rimFactor)
                    },
                    new float[]{0f, 0.43f, 0.60f, 1f},
                    Shader.TileMode.CLAMP
            );
            mStrokePaint.setShader(mRimShader);
        }

        @Override
        public void draw(Canvas canvas) {
            Rect b = getBounds();
            int w = b.width();
            int h = b.height();
            if (w <= 0 || h <= 0) {
                return;
            }
            if (mShaderDirty || mRimShader == null) {
                rebuildShader();
            }
            mMatrix.setScale(Math.max(0.01f, w / 100f), Math.max(0.01f, h / 100f));
            mMatrix.postTranslate(b.left, b.top);
            mRimShader.setLocalMatrix(mMatrix);

            float half = mStrokePaint.getStrokeWidth() * 0.5f;
            mRect.set(b.left + half, b.top + half, b.right - half, b.bottom - half);
            float r = Math.max(0f, Math.min(mCornerPx - half, Math.min(mRect.width(), mRect.height()) * 0.5f));
            canvas.drawRoundRect(mRect, r, r, mStrokePaint);
        }

        @Override
        public void setAlpha(int alpha) {
        }

        @Override
        public void setColorFilter(ColorFilter colorFilter) {
        }

        @Override
        public int getOpacity() {
            return PixelFormat.TRANSLUCENT;
        }
    }

    /**
     * Hardware SurfaceFlinger GPU window blur helper for translucent OxygenOS 16 Fluid Glass.
     */
    private static final class BlurEngine {
        private static boolean sProbed = false;
        private static Constructor<?> sBuilderCtor;
        private static Method sSetRadius;
        private static Method sSetBgCornerRadius;
        private static Method sSetBgColor;
        private static Method sSetColorCurve;
        private static Method sSetColorCurvePreset;
        private static Method sBuild;
        private static Method sSemSetBlurInfo;

        private static Method sGetViewRootImpl;
        private static Method sCreateBgBlurDrawable;
        private static Method sBbdSetBlurRadius;
        private static Method sBbdSetCornerRadius;
        private static Method sBbdSetColor;

        static void init() {
            if (sProbed) {
                return;
            }
            sProbed = true;
            try {
                Class<?> builderCls = Class.forName("android.view.SemBlurInfo$Builder");
                Class<?> blurInfoCls = Class.forName("android.view.SemBlurInfo");
                sBuilderCtor = builderCls.getConstructor(int.class);
                sSetRadius = builderCls.getMethod("setRadius", int.class);
                sSetBgCornerRadius = builderCls.getMethod("setBackgroundCornerRadius", float.class);
                sSetBgColor = builderCls.getMethod("setBackgroundColor", int.class);
                try {
                    sSetColorCurve = builderCls.getMethod("setColorCurve",
                            float.class, float.class, float.class, float.class, float.class, float.class);
                } catch (Throwable ignored) {
                }
                try {
                    sSetColorCurvePreset = builderCls.getMethod("setColorCurvePreset", int.class);
                } catch (Throwable ignored) {
                }
                sBuild = builderCls.getMethod("build");
                sSemSetBlurInfo = View.class.getMethod("semSetBlurInfo", blurInfoCls);
            } catch (Throwable ignored) {
                sBuilderCtor = null;
                sSemSetBlurInfo = null;
            }
            try {
                sGetViewRootImpl = View.class.getMethod("getViewRootImpl");
                Class<?> vriCls = Class.forName("android.view.ViewRootImpl");
                sCreateBgBlurDrawable = vriCls.getMethod("createBackgroundBlurDrawable");
                Class<?> bbdCls = Class.forName("com.android.internal.graphics.drawable.BackgroundBlurDrawable");
                sBbdSetBlurRadius = bbdCls.getMethod("setBlurRadius", int.class);
                sBbdSetCornerRadius = bbdCls.getMethod("setCornerRadius", float.class);
                sBbdSetColor = bbdCls.getMethod("setColor", int.class);
            } catch (Throwable ignored) {
                sCreateBgBlurDrawable = null;
            }
        }

        static boolean applySemWindowBlur(View view, boolean expanded, float cornerPx, int baseRadius) {
            init();
            if (view == null || sBuilderCtor == null || sSemSetBlurInfo == null || sBuild == null) {
                return false;
            }
            if (baseRadius <= 0) {
                clearBlur(view);
                return false;
            }
            try {
                Object builder = sBuilderCtor.newInstance(0); // BLUR_MODE_WINDOW = 0
                if (sSetRadius != null) {
                    int r = expanded ? baseRadius : Math.max(20, Math.round(baseRadius * 0.61f));
                    sSetRadius.invoke(builder, Math.max(10, Math.min(400, r)));
                }
                if (sSetBgCornerRadius != null) {
                    sSetBgCornerRadius.invoke(builder, Math.max(0f, cornerPx));
                }
                if (sSetColorCurve != null) {
                    if (expanded) {
                        sSetColorCurve.invoke(builder, 0.35f, 8.0f, 0.0f, 255.0f, 18.0f, 212.0f);
                    } else {
                        sSetColorCurve.invoke(builder, 0.28f, 6.0f, 0.0f, 255.0f, 14.0f, 198.0f);
                    }
                } else if (sSetColorCurvePreset != null) {
                    sSetColorCurvePreset.invoke(builder, 107);
                }
                if (sSetBgColor != null) {
                    sSetBgColor.invoke(builder, 0x00000000);
                }
                Object blurInfo = sBuild.invoke(builder);
                sSemSetBlurInfo.invoke(view, blurInfo);
                return true;
            } catch (Throwable ignored) {
                return false;
            }
        }

        static Object applyFallbackBlur(View view, Object existingDrawable, boolean expanded, float cornerPx, int baseRadius) {
            init();
            if (view == null || sGetViewRootImpl == null || sCreateBgBlurDrawable == null || baseRadius <= 0) {
                return null;
            }
            try {
                Object bbd = existingDrawable;
                if (bbd == null) {
                    Object vri = sGetViewRootImpl.invoke(view);
                    if (vri == null) {
                        return null;
                    }
                    bbd = sCreateBgBlurDrawable.invoke(vri);
                    if (bbd instanceof Drawable) {
                        view.setBackground((Drawable) bbd);
                    }
                }
                if (bbd == null) {
                    return null;
                }
                if (sBbdSetBlurRadius != null) {
                    int r = expanded ? Math.round(baseRadius * 0.43f) : Math.round(baseRadius * 0.26f);
                    sBbdSetBlurRadius.invoke(bbd, Math.max(8, Math.min(200, r)));
                }
                if (sBbdSetCornerRadius != null) {
                    sBbdSetCornerRadius.invoke(bbd, Math.max(0f, cornerPx));
                }
                if (sBbdSetColor != null) {
                    sBbdSetColor.invoke(bbd, expanded ? 0x4E282C38 : 0x6A1E222C);
                }
                return bbd;
            } catch (Throwable ignored) {
                return null;
            }
        }

        static void clearBlur(View view) {
            if (view == null) {
                return;
            }
            if (sSemSetBlurInfo != null) {
                try {
                    sSemSetBlurInfo.invoke(view, new Object[]{null});
                } catch (Throwable ignored) {
                }
            }
        }
    }
}
