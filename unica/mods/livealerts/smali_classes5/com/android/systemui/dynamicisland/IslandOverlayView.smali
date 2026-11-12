.class public final Lcom/android/systemui/dynamicisland/IslandOverlayView;
.super Landroid/widget/FrameLayout;
.source "IslandOverlayView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/systemui/dynamicisland/IslandOverlayView$Callbacks;,
        Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidGlassDrawable;,
        Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidRimDrawable;,
        Lcom/android/systemui/dynamicisland/IslandOverlayView$BlurEngine;
    }
.end annotation


# instance fields
.field private mBaseCutoutHeightPx:I

.field private mBaseCutoutOffsetX:I

.field private mBaseCutoutTopPx:I

.field private mBaseCutoutWidthPx:I

.field private final mBlurBackdrop:Landroid/view/View;

.field private mBoxH:I

.field private mBoxLeft:I

.field private mBoxTop:I

.field private mBoxW:I

.field private final mBtnNext:Landroid/widget/FrameLayout;

.field private final mBtnPlayPause:Landroid/widget/FrameLayout;

.field private final mBtnPrev:Landroid/widget/FrameLayout;

.field private final mCallbacks:Lcom/android/systemui/dynamicisland/IslandOverlayView$Callbacks;

.field private final mCompactArtwork:Landroid/widget/ImageView;

.field private final mCompactGlyph:Lcom/android/systemui/dynamicisland/GlyphIconView;

.field private mCompactHeightPx:I

.field private final mCompactLeftSlot:Landroid/widget/FrameLayout;

.field private final mCompactRightSlot:Landroid/widget/FrameLayout;

.field private final mCompactRow:Landroid/widget/LinearLayout;

.field private final mCompactText:Landroid/widget/TextView;

.field private mCompactTopYPx:I

.field private final mCompactWaveform:Lcom/android/systemui/dynamicisland/WaveformView;

.field private mCurrAccentColor:I

.field private mCurrCornerPx:F

.field private mCurrPressScale:F

.field private final mCurrRect:Landroid/graphics/RectF;

.field private mCurrentItem:Lcom/android/systemui/dynamicisland/IslandItem;

.field private final mCustomActionsGroup:Landroid/widget/LinearLayout;

.field private mCutoutCenterOffsetX:I

.field private final mCutoutGap:Landroid/view/View;

.field private mCutoutGapPx:I

.field private mCutoutHeightPx:I

.field private mCutoutTopPx:I

.field private mDownX:F

.field private mDownY:F

.field private final mExpActionsRow:Landroid/widget/LinearLayout;

.field private final mExpArtwork:Landroid/widget/ImageView;

.field private final mExpCollapseBtn:Landroid/widget/FrameLayout;

.field private final mExpDurationText:Landroid/widget/TextView;

.field private final mExpElapsedText:Landroid/widget/TextView;

.field private final mExpGlyph:Lcom/android/systemui/dynamicisland/GlyphIconView;

.field private final mExpHeaderRow:Landroid/widget/LinearLayout;

.field private final mExpIconBg:Landroid/graphics/drawable/GradientDrawable;

.field private final mExpIconHolder:Landroid/widget/FrameLayout;

.field private final mExpProgressBar:Landroid/widget/ProgressBar;

.field private final mExpProgressRow:Landroid/widget/LinearLayout;

.field private final mExpRightStat:Landroid/widget/TextView;

.field private final mExpSeekBar:Landroid/widget/SeekBar;

.field private final mExpStackBadge:Landroid/widget/TextView;

.field private final mExpSubtitle:Landroid/widget/TextView;

.field private final mExpTitle:Landroid/widget/TextView;

.field private final mExpWaveform:Lcom/android/systemui/dynamicisland/WaveformView;

.field private mExpanded:Z

.field private final mExpandedCard:Landroid/widget/LinearLayout;

.field private mExpandedTopYPx:I

.field private mExpandedWidthPx:I

.field private mFadeStartCompAlpha:F

.field private mFadeStartExpAlpha:F

.field private mFallbackBlurDrawable:Ljava/lang/Object;

.field private final mFluidGlassDrawable:Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidGlassDrawable;

.field private final mFluidRimDrawable:Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidRimDrawable;

.field private final mFrameCallback:Landroid/view/Choreographer$FrameCallback;

.field private final mGlassTintView:Landroid/view/View;

.field private final mGlyphPlayPause:Lcom/android/systemui/dynamicisland/GlyphIconView;

.field private final mHandler:Landroid/os/Handler;

.field private mHardwareBlurSupported:Z

.field private mHasActiveContent:Z

.field private mInsetsListenerProxy:Ljava/lang/Object;

.field private mLastRowLeftInPill:I

.field private final mMediaControlsGroup:Landroid/widget/FrameLayout;

.field private mMorphDurationNs:J

.field private mMorphMode:I

.field private mMorphRunning:Z

.field private mMorphStartNanos:J

.field private final mPillContainer:Landroid/widget/FrameLayout;

.field private final mPlayPauseBg:Landroid/graphics/drawable/GradientDrawable;

.field private mPressAnimRunning:Z

.field private mPressDurationNs:J

.field private mPressStartNanos:J

.field private mPressStartScale:F

.field private mPressTargetScale:F

.field private final mRimView:Landroid/view/View;

.field private mSpringBounceX:D

.field private mSpringBounceY:D

.field private mSpringResponseX:D

.field private mSpringResponseY:D

.field private mStackCount:I

.field private final mStackDot:Landroid/view/View;

.field private mStackIndex:I

.field private mStartCorner:F

.field private final mStartRect:Landroid/graphics/RectF;

.field private mSuspendedForSleep:Z

.field private mTargetCorner:F

.field private final mTargetRect:Landroid/graphics/RectF;

.field private final mTickRunnable:Ljava/lang/Runnable;

.field private mTouchInsidePill:Z

.field private final mTouchSlop:I

.field private mTrackingSwipe:Z

.field private mTuneAnimBouncePct:I

.field private mTuneAnimSpeedPct:I

.field private mTuneBlurRadius:I

.field private mTuneCenterOffsetDp:I

.field private mTuneExpandedWidthDp:I

.field private mTuneGapOffsetDp:I

.field private mTuneGlassOpacity:I

.field private mTuneHeightOffsetDp:I

.field private mTuneRimAlpha:I

.field private mTuneTopOffsetDp:I

.field private mUseMoveEase:Z

.field private mUserSeeking:Z


# direct methods
.method static bridge synthetic -$$Nest$fgetmBoxLeft(Lcom/android/systemui/dynamicisland/IslandOverlayView;)I
    .locals 0

    iget p0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mBoxLeft:I

    return p0
.end method

.method static bridge synthetic -$$Nest$fgetmBoxTop(Lcom/android/systemui/dynamicisland/IslandOverlayView;)I
    .locals 0

    iget p0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mBoxTop:I

    return p0
.end method

.method static bridge synthetic -$$Nest$fgetmCurrCornerPx(Lcom/android/systemui/dynamicisland/IslandOverlayView;)F
    .locals 0

    iget p0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCurrCornerPx:F

    return p0
.end method

.method static bridge synthetic -$$Nest$fgetmCurrRect(Lcom/android/systemui/dynamicisland/IslandOverlayView;)Landroid/graphics/RectF;
    .locals 0

    iget-object p0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCurrRect:Landroid/graphics/RectF;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmCurrentItem(Lcom/android/systemui/dynamicisland/IslandOverlayView;)Lcom/android/systemui/dynamicisland/IslandItem;
    .locals 0

    iget-object p0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCurrentItem:Lcom/android/systemui/dynamicisland/IslandItem;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmExpElapsedText(Lcom/android/systemui/dynamicisland/IslandOverlayView;)Landroid/widget/TextView;
    .locals 0

    iget-object p0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpElapsedText:Landroid/widget/TextView;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmExpanded(Lcom/android/systemui/dynamicisland/IslandOverlayView;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpanded:Z

    return p0
.end method

.method static bridge synthetic -$$Nest$fgetmHandler(Lcom/android/systemui/dynamicisland/IslandOverlayView;)Landroid/os/Handler;
    .locals 0

    iget-object p0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mHandler:Landroid/os/Handler;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmHasActiveContent(Lcom/android/systemui/dynamicisland/IslandOverlayView;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mHasActiveContent:Z

    return p0
.end method

.method static bridge synthetic -$$Nest$fgetmSuspendedForSleep(Lcom/android/systemui/dynamicisland/IslandOverlayView;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mSuspendedForSleep:Z

    return p0
.end method

.method static bridge synthetic -$$Nest$fputmUserSeeking(Lcom/android/systemui/dynamicisland/IslandOverlayView;Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mUserSeeking:Z

    return-void
.end method

.method static bridge synthetic -$$Nest$mdp(Lcom/android/systemui/dynamicisland/IslandOverlayView;F)I
    .locals 0

    invoke-direct {p0, p1}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result p0

    return p0
.end method

.method static bridge synthetic -$$Nest$mlayoutVisualLayersLocked(Lcom/android/systemui/dynamicisland/IslandOverlayView;)V
    .locals 0

    invoke-direct {p0}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->layoutVisualLayersLocked()V

    return-void
.end method

.method static bridge synthetic -$$Nest$mstepAnimationsFrame(Lcom/android/systemui/dynamicisland/IslandOverlayView;J)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->stepAnimationsFrame(J)V

    return-void
.end method

.method static bridge synthetic -$$Nest$mupdateLiveTickValues(Lcom/android/systemui/dynamicisland/IslandOverlayView;)V
    .locals 0

    invoke-direct {p0}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->updateLiveTickValues()V

    return-void
.end method

.method static bridge synthetic -$$Nest$smformatMs(J)Ljava/lang/String;
    .locals 0

    invoke-static {p0, p1}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->formatMs(J)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/android/systemui/dynamicisland/IslandOverlayView$Callbacks;)V
    .locals 16

    .line 215
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct/range {p0 .. p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 68
    new-instance v2, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v2, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mHandler:Landroid/os/Handler;

    .line 118
    const/4 v2, 0x1

    iput v2, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mStackCount:I

    .line 119
    const/4 v3, 0x0

    iput v3, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mStackIndex:I

    .line 121
    iput-boolean v3, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpanded:Z

    .line 122
    iput-boolean v3, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mHasActiveContent:Z

    .line 123
    iput-boolean v3, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mSuspendedForSleep:Z

    .line 124
    iput-boolean v3, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mUserSeeking:Z

    .line 125
    iput v3, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mBaseCutoutOffsetX:I

    .line 126
    iput v3, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mBaseCutoutTopPx:I

    .line 127
    iput v3, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mBaseCutoutWidthPx:I

    .line 128
    iput v3, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mBaseCutoutHeightPx:I

    .line 130
    const/16 v4, 0x118

    iput v4, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mTuneBlurRadius:I

    .line 131
    const/16 v4, 0x37

    iput v4, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mTuneGlassOpacity:I

    .line 132
    const/16 v4, 0x55

    iput v4, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mTuneRimAlpha:I

    .line 133
    const/16 v4, 0x64

    iput v4, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mTuneAnimSpeedPct:I

    .line 134
    const/16 v4, 0x1a

    iput v4, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mTuneAnimBouncePct:I

    .line 135
    iput v3, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mTuneHeightOffsetDp:I

    .line 136
    iput v3, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mTuneGapOffsetDp:I

    .line 137
    iput v3, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mTuneTopOffsetDp:I

    .line 138
    iput v3, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mTuneCenterOffsetDp:I

    .line 139
    const/16 v4, 0x150

    iput v4, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mTuneExpandedWidthDp:I

    .line 141
    iput v3, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCutoutCenterOffsetX:I

    .line 151
    iput-boolean v3, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mMorphRunning:Z

    .line 152
    iput v3, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mMorphMode:I

    .line 153
    const-wide/16 v4, -0x1

    iput-wide v4, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mMorphStartNanos:J

    .line 154
    const-wide/32 v4, 0x1a39de00

    iput-wide v4, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mMorphDurationNs:J

    .line 155
    const-wide/high16 v4, 0x3fe0000000000000L    # 0.5

    iput-wide v4, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mSpringResponseX:D

    .line 156
    const-wide v4, 0x3fc47ae147ae147bL    # 0.16

    iput-wide v4, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mSpringBounceX:D

    .line 157
    const-wide v4, 0x3fe1eb851eb851ecL    # 0.56

    iput-wide v4, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mSpringResponseY:D

    .line 158
    const-wide v4, 0x3fceb851eb851eb8L    # 0.24

    iput-wide v4, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mSpringBounceY:D

    .line 159
    iput-boolean v3, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mUseMoveEase:Z

    .line 161
    new-instance v4, Landroid/graphics/RectF;

    invoke-direct {v4}, Landroid/graphics/RectF;-><init>()V

    iput-object v4, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mStartRect:Landroid/graphics/RectF;

    .line 162
    new-instance v4, Landroid/graphics/RectF;

    invoke-direct {v4}, Landroid/graphics/RectF;-><init>()V

    iput-object v4, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mTargetRect:Landroid/graphics/RectF;

    .line 163
    new-instance v4, Landroid/graphics/RectF;

    invoke-direct {v4}, Landroid/graphics/RectF;-><init>()V

    iput-object v4, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCurrRect:Landroid/graphics/RectF;

    .line 164
    const/4 v4, 0x0

    iput v4, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mStartCorner:F

    .line 165
    iput v4, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mTargetCorner:F

    .line 166
    iput v4, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCurrCornerPx:F

    .line 168
    iput v3, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mBoxLeft:I

    .line 169
    iput v3, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mBoxTop:I

    .line 170
    iput v2, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mBoxW:I

    .line 171
    iput v2, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mBoxH:I

    .line 172
    const/high16 v5, 0x3f800000    # 1.0f

    iput v5, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mFadeStartCompAlpha:F

    .line 173
    iput v4, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mFadeStartExpAlpha:F

    .line 176
    iput-boolean v3, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mPressAnimRunning:Z

    .line 177
    const-wide/16 v6, -0x1

    iput-wide v6, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mPressStartNanos:J

    .line 178
    const-wide/32 v6, 0x7270e00

    iput-wide v6, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mPressDurationNs:J

    .line 179
    iput v5, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mPressStartScale:F

    .line 180
    iput v5, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mPressTargetScale:F

    .line 181
    iput v5, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCurrPressScale:F

    .line 183
    const v6, -0x9b2d01

    iput v6, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCurrAccentColor:I

    .line 185
    iput-boolean v3, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mHardwareBlurSupported:Z

    .line 186
    const/4 v6, 0x0

    iput-object v6, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mFallbackBlurDrawable:Ljava/lang/Object;

    .line 187
    iput-object v6, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mInsetsListenerProxy:Ljava/lang/Object;

    .line 192
    iput-boolean v3, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mTouchInsidePill:Z

    .line 195
    new-instance v7, Lcom/android/systemui/dynamicisland/IslandOverlayView$1;

    invoke-direct {v7, v0}, Lcom/android/systemui/dynamicisland/IslandOverlayView$1;-><init>(Lcom/android/systemui/dynamicisland/IslandOverlayView;)V

    iput-object v7, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mFrameCallback:Landroid/view/Choreographer$FrameCallback;

    .line 202
    new-instance v7, Lcom/android/systemui/dynamicisland/IslandOverlayView$2;

    invoke-direct {v7, v0}, Lcom/android/systemui/dynamicisland/IslandOverlayView$2;-><init>(Lcom/android/systemui/dynamicisland/IslandOverlayView;)V

    iput-object v7, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mTickRunnable:Ljava/lang/Runnable;

    .line 991
    iput v3, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mLastRowLeftInPill:I

    .line 216
    move-object/from16 v7, p2

    iput-object v7, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCallbacks:Lcom/android/systemui/dynamicisland/IslandOverlayView$Callbacks;

    .line 217
    invoke-static {v1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v7

    invoke-virtual {v7}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    move-result v7

    iput v7, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mTouchSlop:I

    .line 218
    const/high16 v7, 0x41300000    # 11.0f

    invoke-direct {v0, v7}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v8

    iput v8, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCutoutTopPx:I

    .line 219
    const/high16 v8, 0x42060000    # 33.5f

    invoke-direct {v0, v8}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v8

    iput v8, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCutoutGapPx:I

    .line 220
    const/high16 v8, 0x41fc0000    # 31.5f

    invoke-direct {v0, v8}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v8

    iput v8, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactHeightPx:I

    .line 221
    const/high16 v8, 0x41d40000    # 26.5f

    invoke-direct {v0, v8}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v8

    iput v8, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCutoutHeightPx:I

    .line 222
    const/high16 v8, 0x41100000    # 9.0f

    invoke-direct {v0, v8}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v8

    iput v8, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactTopYPx:I

    .line 223
    const/high16 v8, 0x41200000    # 10.0f

    invoke-direct {v0, v8}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v8

    iput v8, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpandedTopYPx:I

    .line 224
    const/high16 v8, 0x43a80000    # 336.0f

    invoke-direct {v0, v8}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v8

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    invoke-virtual {v9}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v9

    iget v9, v9, Landroid/util/DisplayMetrics;->widthPixels:I

    const/high16 v10, 0x41c00000    # 24.0f

    invoke-direct {v0, v10}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v11

    sub-int/2addr v9, v11

    invoke-static {v8, v9}, Ljava/lang/Math;->min(II)I

    move-result v8

    iput v8, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpandedWidthPx:I

    .line 226
    invoke-virtual {v0, v3}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->setClipChildren(Z)V

    .line 227
    invoke-virtual {v0, v3}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->setClipToPadding(Z)V

    .line 229
    iget v8, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactHeightPx:I

    int-to-float v8, v8

    const/high16 v9, 0x3f000000    # 0.5f

    mul-float/2addr v8, v9

    iput v8, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCurrCornerPx:F

    .line 230
    new-instance v8, Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidGlassDrawable;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    invoke-virtual {v9}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v9

    iget v9, v9, Landroid/util/DisplayMetrics;->density:F

    invoke-direct {v8, v9}, Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidGlassDrawable;-><init>(F)V

    iput-object v8, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mFluidGlassDrawable:Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidGlassDrawable;

    .line 231
    new-instance v8, Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidRimDrawable;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    invoke-virtual {v9}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v9

    iget v9, v9, Landroid/util/DisplayMetrics;->density:F

    invoke-direct {v8, v9}, Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidRimDrawable;-><init>(F)V

    iput-object v8, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mFluidRimDrawable:Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidRimDrawable;

    .line 233
    new-instance v8, Lcom/android/systemui/dynamicisland/IslandOverlayView$3;

    invoke-direct {v8, v0, v1}, Lcom/android/systemui/dynamicisland/IslandOverlayView$3;-><init>(Lcom/android/systemui/dynamicisland/IslandOverlayView;Landroid/content/Context;)V

    iput-object v8, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mPillContainer:Landroid/widget/FrameLayout;

    .line 240
    iget-object v8, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mPillContainer:Landroid/widget/FrameLayout;

    invoke-virtual {v8, v2}, Landroid/widget/FrameLayout;->setClipToPadding(Z)V

    .line 241
    iget-object v8, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mPillContainer:Landroid/widget/FrameLayout;

    invoke-virtual {v8, v2}, Landroid/widget/FrameLayout;->setClipChildren(Z)V

    .line 242
    iget-object v8, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mPillContainer:Landroid/widget/FrameLayout;

    invoke-virtual {v8, v2}, Landroid/widget/FrameLayout;->setClipToOutline(Z)V

    .line 243
    iget-object v8, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mPillContainer:Landroid/widget/FrameLayout;

    new-instance v9, Lcom/android/systemui/dynamicisland/IslandOverlayView$4;

    invoke-direct {v9, v0}, Lcom/android/systemui/dynamicisland/IslandOverlayView$4;-><init>(Lcom/android/systemui/dynamicisland/IslandOverlayView;)V

    invoke-virtual {v8, v9}, Landroid/widget/FrameLayout;->setOutlineProvider(Landroid/view/ViewOutlineProvider;)V

    .line 261
    iget-object v8, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mPillContainer:Landroid/widget/FrameLayout;

    const/high16 v9, 0x41000000    # 8.0f

    invoke-direct {v0, v9}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v11

    int-to-float v11, v11

    invoke-virtual {v8, v11}, Landroid/widget/FrameLayout;->setElevation(F)V

    .line 262
    iget-object v8, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mPillContainer:Landroid/widget/FrameLayout;

    const/high16 v11, 0x48000000    # 131072.0f

    invoke-virtual {v8, v11}, Landroid/widget/FrameLayout;->setOutlineAmbientShadowColor(I)V

    .line 263
    iget-object v8, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mPillContainer:Landroid/widget/FrameLayout;

    const/high16 v11, 0x66000000

    invoke-virtual {v8, v11}, Landroid/widget/FrameLayout;->setOutlineSpotShadowColor(I)V

    .line 265
    new-instance v8, Landroid/view/View;

    invoke-direct {v8, v1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    iput-object v8, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mBlurBackdrop:Landroid/view/View;

    .line 266
    iget-object v8, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mPillContainer:Landroid/widget/FrameLayout;

    iget-object v11, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mBlurBackdrop:Landroid/view/View;

    new-instance v12, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v13, -0x1

    invoke-direct {v12, v13, v13}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v8, v11, v12}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 268
    new-instance v8, Landroid/view/View;

    invoke-direct {v8, v1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    iput-object v8, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mGlassTintView:Landroid/view/View;

    .line 269
    iget-object v8, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mGlassTintView:Landroid/view/View;

    iget-object v11, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mFluidGlassDrawable:Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidGlassDrawable;

    invoke-virtual {v8, v11}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 270
    iget-object v8, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mPillContainer:Landroid/widget/FrameLayout;

    iget-object v11, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mGlassTintView:Landroid/view/View;

    new-instance v12, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v12, v13, v13}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v8, v11, v12}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 272
    new-instance v8, Landroid/view/View;

    invoke-direct {v8, v1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    iput-object v8, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mRimView:Landroid/view/View;

    .line 273
    iget-object v8, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mRimView:Landroid/view/View;

    iget-object v11, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mFluidRimDrawable:Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidRimDrawable;

    invoke-virtual {v8, v11}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 275
    iget-object v8, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mPillContainer:Landroid/widget/FrameLayout;

    new-instance v11, Landroid/widget/FrameLayout$LayoutParams;

    const/high16 v12, 0x42c00000    # 96.0f

    invoke-direct {v0, v12}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v12

    iget v14, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactHeightPx:I

    const/16 v15, 0x33

    invoke-direct {v11, v12, v14, v15}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    invoke-virtual {v0, v8, v11}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 278
    new-instance v8, Landroid/widget/LinearLayout;

    invoke-direct {v8, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v8, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactRow:Landroid/widget/LinearLayout;

    .line 279
    iget-object v8, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactRow:Landroid/widget/LinearLayout;

    invoke-virtual {v8, v3}, Landroid/widget/LinearLayout;->setLayoutDirection(I)V

    .line 280
    iget-object v8, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactRow:Landroid/widget/LinearLayout;

    invoke-virtual {v8, v3}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 281
    iget-object v8, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactRow:Landroid/widget/LinearLayout;

    const/16 v11, 0x10

    invoke-virtual {v8, v11}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 282
    iget-object v8, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactRow:Landroid/widget/LinearLayout;

    invoke-direct {v0, v9}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v12

    const/high16 v14, 0x41100000    # 9.0f

    invoke-direct {v0, v14}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v14

    invoke-virtual {v8, v12, v3, v14, v3}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 283
    iget-object v8, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mPillContainer:Landroid/widget/FrameLayout;

    iget-object v12, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactRow:Landroid/widget/LinearLayout;

    new-instance v14, Landroid/widget/FrameLayout$LayoutParams;

    iget v6, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactHeightPx:I

    const/4 v9, -0x2

    invoke-direct {v14, v9, v6, v15}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    invoke-virtual {v8, v12, v14}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 285
    new-instance v6, Landroid/widget/FrameLayout;

    invoke-direct {v6, v1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    iput-object v6, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactLeftSlot:Landroid/widget/FrameLayout;

    .line 286
    new-instance v6, Landroid/widget/ImageView;

    invoke-direct {v6, v1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    iput-object v6, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactArtwork:Landroid/widget/ImageView;

    .line 287
    iget-object v6, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactArtwork:Landroid/widget/ImageView;

    sget-object v8, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v6, v8}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 288
    iget-object v6, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactArtwork:Landroid/widget/ImageView;

    invoke-virtual {v6, v2}, Landroid/widget/ImageView;->setClipToOutline(Z)V

    .line 289
    iget-object v6, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactArtwork:Landroid/widget/ImageView;

    new-instance v8, Lcom/android/systemui/dynamicisland/IslandOverlayView$5;

    invoke-direct {v8, v0}, Lcom/android/systemui/dynamicisland/IslandOverlayView$5;-><init>(Lcom/android/systemui/dynamicisland/IslandOverlayView;)V

    invoke-virtual {v6, v8}, Landroid/widget/ImageView;->setOutlineProvider(Landroid/view/ViewOutlineProvider;)V

    .line 297
    new-instance v6, Lcom/android/systemui/dynamicisland/GlyphIconView;

    invoke-direct {v6, v1}, Lcom/android/systemui/dynamicisland/GlyphIconView;-><init>(Landroid/content/Context;)V

    iput-object v6, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactGlyph:Lcom/android/systemui/dynamicisland/GlyphIconView;

    .line 298
    iget-object v6, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactLeftSlot:Landroid/widget/FrameLayout;

    iget-object v8, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactArtwork:Landroid/widget/ImageView;

    new-instance v12, Landroid/widget/FrameLayout$LayoutParams;

    const/high16 v14, 0x41880000    # 17.0f

    invoke-direct {v0, v14}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v14

    const/high16 v5, 0x41880000    # 17.0f

    invoke-direct {v0, v5}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v5

    const/16 v10, 0x11

    invoke-direct {v12, v14, v5, v10}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    invoke-virtual {v6, v8, v12}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 299
    iget-object v5, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactLeftSlot:Landroid/widget/FrameLayout;

    iget-object v6, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactGlyph:Lcom/android/systemui/dynamicisland/GlyphIconView;

    new-instance v8, Landroid/widget/FrameLayout$LayoutParams;

    const/high16 v12, 0x41700000    # 15.0f

    invoke-direct {v0, v12}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v12

    const/high16 v14, 0x41700000    # 15.0f

    invoke-direct {v0, v14}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v14

    invoke-direct {v8, v12, v14, v10}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    invoke-virtual {v5, v6, v8}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 300
    iget-object v5, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactRow:Landroid/widget/LinearLayout;

    iget-object v6, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactLeftSlot:Landroid/widget/FrameLayout;

    new-instance v8, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v12, 0x41900000    # 18.0f

    invoke-direct {v0, v12}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v14

    invoke-direct {v0, v12}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v11

    invoke-direct {v8, v14, v11}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v5, v6, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 302
    new-instance v5, Landroid/view/View;

    invoke-direct {v5, v1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    iput-object v5, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCutoutGap:Landroid/view/View;

    .line 303
    iget-object v5, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactRow:Landroid/widget/LinearLayout;

    iget-object v6, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCutoutGap:Landroid/view/View;

    new-instance v8, Landroid/widget/LinearLayout$LayoutParams;

    iget v11, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCutoutGapPx:I

    invoke-direct {v8, v11, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v5, v6, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 305
    new-instance v5, Landroid/widget/FrameLayout;

    invoke-direct {v5, v1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    iput-object v5, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactRightSlot:Landroid/widget/FrameLayout;

    .line 306
    iget-object v5, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactRightSlot:Landroid/widget/FrameLayout;

    const/high16 v6, 0x41600000    # 14.0f

    invoke-direct {v0, v6}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v6

    invoke-virtual {v5, v6}, Landroid/widget/FrameLayout;->setMinimumWidth(I)V

    .line 307
    new-instance v5, Lcom/android/systemui/dynamicisland/WaveformView;

    invoke-direct {v5, v1}, Lcom/android/systemui/dynamicisland/WaveformView;-><init>(Landroid/content/Context;)V

    iput-object v5, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactWaveform:Lcom/android/systemui/dynamicisland/WaveformView;

    .line 308
    new-instance v5, Landroid/widget/TextView;

    invoke-direct {v5, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v5, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactText:Landroid/widget/TextView;

    .line 309
    iget-object v5, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactText:Landroid/widget/TextView;

    invoke-virtual {v5, v13}, Landroid/widget/TextView;->setTextColor(I)V

    .line 310
    iget-object v5, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactText:Landroid/widget/TextView;

    invoke-virtual {v5, v2, v7}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 311
    iget-object v5, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactText:Landroid/widget/TextView;

    const-string v6, "sans-serif-medium"

    invoke-static {v6, v3}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 312
    iget-object v5, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactText:Landroid/widget/TextView;

    invoke-virtual {v5, v2}, Landroid/widget/TextView;->setSingleLine(Z)V

    .line 313
    iget-object v5, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactText:Landroid/widget/TextView;

    sget-object v6, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 314
    iget-object v5, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactText:Landroid/widget/TextView;

    const/high16 v6, 0x42400000    # 48.0f

    invoke-direct {v0, v6}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v6

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setMaxWidth(I)V

    .line 315
    iget-object v5, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactText:Landroid/widget/TextView;

    invoke-virtual {v5, v3}, Landroid/widget/TextView;->setIncludeFontPadding(Z)V

    .line 316
    iget-object v5, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactText:Landroid/widget/TextView;

    const-string v6, "tnum"

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setFontFeatureSettings(Ljava/lang/String;)V

    .line 318
    iget-object v5, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactRightSlot:Landroid/widget/FrameLayout;

    iget-object v8, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactWaveform:Lcom/android/systemui/dynamicisland/WaveformView;

    new-instance v11, Landroid/widget/FrameLayout$LayoutParams;

    const/high16 v14, 0x41b00000    # 22.0f

    invoke-direct {v0, v14}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v14

    invoke-direct {v0, v7}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v7

    invoke-direct {v11, v14, v7, v10}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    invoke-virtual {v5, v8, v11}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 319
    iget-object v5, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactRightSlot:Landroid/widget/FrameLayout;

    iget-object v7, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactText:Landroid/widget/TextView;

    new-instance v8, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v8, v9, v9, v10}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    invoke-virtual {v5, v7, v8}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 321
    new-instance v5, Landroid/view/View;

    invoke-direct {v5, v1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    iput-object v5, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mStackDot:Landroid/view/View;

    .line 322
    new-instance v5, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v5}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 323
    invoke-virtual {v5, v2}, Landroid/graphics/drawable/GradientDrawable;->setShape(I)V

    .line 324
    const v7, -0x55000001

    invoke-virtual {v5, v7}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 325
    iget-object v7, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mStackDot:Landroid/view/View;

    invoke-virtual {v7, v5}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 326
    iget-object v5, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mStackDot:Landroid/view/View;

    const/16 v7, 0x8

    invoke-virtual {v5, v7}, Landroid/view/View;->setVisibility(I)V

    .line 328
    iget-object v5, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactRow:Landroid/widget/LinearLayout;

    iget-object v8, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactRightSlot:Landroid/widget/FrameLayout;

    new-instance v11, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v11, v9, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v5, v8, v11}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 329
    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v8, 0x40800000    # 4.0f

    invoke-direct {v0, v8}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v11

    invoke-direct {v0, v8}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v14

    invoke-direct {v5, v11, v14}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 330
    invoke-direct {v0, v8}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v11

    invoke-virtual {v5, v11}, Landroid/widget/LinearLayout$LayoutParams;->setMarginStart(I)V

    .line 331
    iget-object v11, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactRow:Landroid/widget/LinearLayout;

    iget-object v14, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mStackDot:Landroid/view/View;

    invoke-virtual {v11, v14, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 334
    new-instance v5, Landroid/widget/LinearLayout;

    invoke-direct {v5, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v5, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpandedCard:Landroid/widget/LinearLayout;

    .line 335
    iget-object v5, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpandedCard:Landroid/widget/LinearLayout;

    invoke-virtual {v5, v2}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 336
    iget-object v5, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpandedCard:Landroid/widget/LinearLayout;

    const/high16 v11, 0x41800000    # 16.0f

    invoke-direct {v0, v11}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v14

    const/high16 v8, 0x42080000    # 34.0f

    invoke-direct {v0, v8}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v8

    invoke-direct {v0, v11}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v10

    invoke-direct {v0, v12}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v11

    invoke-virtual {v5, v14, v8, v10, v11}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 337
    iget-object v5, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpandedCard:Landroid/widget/LinearLayout;

    invoke-virtual {v5, v7}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 338
    iget-object v5, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpandedCard:Landroid/widget/LinearLayout;

    invoke-virtual {v5, v4}, Landroid/widget/LinearLayout;->setAlpha(F)V

    .line 339
    iget-object v5, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpandedCard:Landroid/widget/LinearLayout;

    iget v8, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpandedWidthPx:I

    int-to-float v8, v8

    const/high16 v10, 0x3f000000    # 0.5f

    mul-float/2addr v8, v10

    invoke-virtual {v5, v8}, Landroid/widget/LinearLayout;->setPivotX(F)V

    .line 340
    iget-object v5, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpandedCard:Landroid/widget/LinearLayout;

    invoke-virtual {v5, v4}, Landroid/widget/LinearLayout;->setPivotY(F)V

    .line 341
    iget-object v4, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mPillContainer:Landroid/widget/FrameLayout;

    iget-object v5, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpandedCard:Landroid/widget/LinearLayout;

    new-instance v8, Landroid/widget/FrameLayout$LayoutParams;

    iget v10, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpandedWidthPx:I

    invoke-direct {v8, v10, v9, v15}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    invoke-virtual {v4, v5, v8}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 343
    new-instance v4, Landroid/widget/LinearLayout;

    invoke-direct {v4, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v4, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpHeaderRow:Landroid/widget/LinearLayout;

    .line 344
    iget-object v4, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpHeaderRow:Landroid/widget/LinearLayout;

    invoke-virtual {v4, v3}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 345
    iget-object v4, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpHeaderRow:Landroid/widget/LinearLayout;

    const/16 v5, 0x10

    invoke-virtual {v4, v5}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 346
    iget-object v4, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpandedCard:Landroid/widget/LinearLayout;

    iget-object v5, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpHeaderRow:Landroid/widget/LinearLayout;

    new-instance v8, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v8, v13, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v4, v5, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 348
    new-instance v4, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v4}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    iput-object v4, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpIconBg:Landroid/graphics/drawable/GradientDrawable;

    .line 349
    iget-object v4, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpIconBg:Landroid/graphics/drawable/GradientDrawable;

    invoke-virtual {v4, v3}, Landroid/graphics/drawable/GradientDrawable;->setShape(I)V

    .line 350
    iget-object v4, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpIconBg:Landroid/graphics/drawable/GradientDrawable;

    const/high16 v5, 0x41500000    # 13.0f

    invoke-direct {v0, v5}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v5

    int-to-float v5, v5

    invoke-virtual {v4, v5}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 351
    iget-object v4, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpIconBg:Landroid/graphics/drawable/GradientDrawable;

    const v5, 0x28ffffff

    invoke-virtual {v4, v5}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 352
    iget-object v4, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpIconBg:Landroid/graphics/drawable/GradientDrawable;

    const v5, 0x3f19999a    # 0.6f

    invoke-direct {v0, v5}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v5

    invoke-static {v2, v5}, Ljava/lang/Math;->max(II)I

    move-result v5

    const v8, 0x26ffffff

    invoke-virtual {v4, v5, v8}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    .line 354
    new-instance v4, Landroid/widget/FrameLayout;

    invoke-direct {v4, v1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    iput-object v4, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpIconHolder:Landroid/widget/FrameLayout;

    .line 355
    iget-object v4, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpIconHolder:Landroid/widget/FrameLayout;

    iget-object v5, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpIconBg:Landroid/graphics/drawable/GradientDrawable;

    invoke-virtual {v4, v5}, Landroid/widget/FrameLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 356
    iget-object v4, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpIconHolder:Landroid/widget/FrameLayout;

    invoke-virtual {v4, v2}, Landroid/widget/FrameLayout;->setClipToOutline(Z)V

    .line 357
    iget-object v4, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpIconHolder:Landroid/widget/FrameLayout;

    new-instance v5, Lcom/android/systemui/dynamicisland/IslandOverlayView$6;

    invoke-direct {v5, v0}, Lcom/android/systemui/dynamicisland/IslandOverlayView$6;-><init>(Lcom/android/systemui/dynamicisland/IslandOverlayView;)V

    invoke-virtual {v4, v5}, Landroid/widget/FrameLayout;->setOutlineProvider(Landroid/view/ViewOutlineProvider;)V

    .line 365
    new-instance v4, Landroid/widget/ImageView;

    invoke-direct {v4, v1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    iput-object v4, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpArtwork:Landroid/widget/ImageView;

    .line 366
    iget-object v4, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpArtwork:Landroid/widget/ImageView;

    sget-object v5, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v4, v5}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 367
    iget-object v4, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpArtwork:Landroid/widget/ImageView;

    invoke-virtual {v4, v2}, Landroid/widget/ImageView;->setClipToOutline(Z)V

    .line 368
    iget-object v4, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpArtwork:Landroid/widget/ImageView;

    new-instance v5, Lcom/android/systemui/dynamicisland/IslandOverlayView$7;

    invoke-direct {v5, v0}, Lcom/android/systemui/dynamicisland/IslandOverlayView$7;-><init>(Lcom/android/systemui/dynamicisland/IslandOverlayView;)V

    invoke-virtual {v4, v5}, Landroid/widget/ImageView;->setOutlineProvider(Landroid/view/ViewOutlineProvider;)V

    .line 376
    new-instance v4, Lcom/android/systemui/dynamicisland/GlyphIconView;

    invoke-direct {v4, v1}, Lcom/android/systemui/dynamicisland/GlyphIconView;-><init>(Landroid/content/Context;)V

    iput-object v4, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpGlyph:Lcom/android/systemui/dynamicisland/GlyphIconView;

    .line 377
    iget-object v4, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpIconHolder:Landroid/widget/FrameLayout;

    iget-object v5, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpArtwork:Landroid/widget/ImageView;

    new-instance v10, Landroid/widget/FrameLayout$LayoutParams;

    const/high16 v11, 0x42380000    # 46.0f

    invoke-direct {v0, v11}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v14

    invoke-direct {v0, v11}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v15

    const/16 v12, 0x11

    invoke-direct {v10, v14, v15, v12}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    invoke-virtual {v4, v5, v10}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 378
    iget-object v4, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpIconHolder:Landroid/widget/FrameLayout;

    iget-object v5, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpGlyph:Lcom/android/systemui/dynamicisland/GlyphIconView;

    new-instance v10, Landroid/widget/FrameLayout$LayoutParams;

    const/high16 v14, 0x41c00000    # 24.0f

    invoke-direct {v0, v14}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v15

    invoke-direct {v0, v14}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v14

    invoke-direct {v10, v15, v14, v12}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    invoke-virtual {v4, v5, v10}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 379
    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v0, v11}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v5

    invoke-direct {v0, v11}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v10

    invoke-direct {v4, v5, v10}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 380
    const/high16 v5, 0x41400000    # 12.0f

    invoke-direct {v0, v5}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v10

    invoke-virtual {v4, v10}, Landroid/widget/LinearLayout$LayoutParams;->setMarginEnd(I)V

    .line 381
    iget-object v10, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpHeaderRow:Landroid/widget/LinearLayout;

    iget-object v11, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpIconHolder:Landroid/widget/FrameLayout;

    invoke-virtual {v10, v11, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 383
    new-instance v4, Landroid/widget/LinearLayout;

    invoke-direct {v4, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 384
    invoke-virtual {v4, v2}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 385
    const/16 v10, 0x10

    invoke-virtual {v4, v10}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 386
    new-instance v10, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v11, 0x3f800000    # 1.0f

    invoke-direct {v10, v3, v9, v11}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    .line 387
    const/high16 v11, 0x41000000    # 8.0f

    invoke-direct {v0, v11}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v12

    invoke-virtual {v10, v12}, Landroid/widget/LinearLayout$LayoutParams;->setMarginEnd(I)V

    .line 388
    iget-object v11, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpHeaderRow:Landroid/widget/LinearLayout;

    invoke-virtual {v11, v4, v10}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 390
    new-instance v10, Landroid/widget/TextView;

    invoke-direct {v10, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v10, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpTitle:Landroid/widget/TextView;

    .line 391
    iget-object v10, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpTitle:Landroid/widget/TextView;

    invoke-virtual {v10, v13}, Landroid/widget/TextView;->setTextColor(I)V

    .line 392
    iget-object v10, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpTitle:Landroid/widget/TextView;

    const/high16 v11, 0x41680000    # 14.5f

    invoke-virtual {v10, v2, v11}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 393
    iget-object v10, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpTitle:Landroid/widget/TextView;

    const-string v11, "sans-serif-medium"

    invoke-static {v11, v2}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object v11

    invoke-virtual {v10, v11}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 394
    iget-object v10, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpTitle:Landroid/widget/TextView;

    invoke-virtual {v10, v2}, Landroid/widget/TextView;->setSingleLine(Z)V

    .line 395
    iget-object v10, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpTitle:Landroid/widget/TextView;

    sget-object v11, Landroid/text/TextUtils$TruncateAt;->MARQUEE:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v10, v11}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 396
    iget-object v10, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpTitle:Landroid/widget/TextView;

    invoke-virtual {v10, v13}, Landroid/widget/TextView;->setMarqueeRepeatLimit(I)V

    .line 397
    iget-object v10, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpTitle:Landroid/widget/TextView;

    invoke-virtual {v10, v2}, Landroid/widget/TextView;->setSelected(Z)V

    .line 398
    iget-object v10, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpTitle:Landroid/widget/TextView;

    invoke-virtual {v10, v3}, Landroid/widget/TextView;->setIncludeFontPadding(Z)V

    .line 399
    iget-object v10, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpTitle:Landroid/widget/TextView;

    invoke-virtual {v4, v10}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 401
    new-instance v10, Landroid/widget/TextView;

    invoke-direct {v10, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v10, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpSubtitle:Landroid/widget/TextView;

    .line 402
    iget-object v10, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpSubtitle:Landroid/widget/TextView;

    const v11, -0x2d000001

    invoke-virtual {v10, v11}, Landroid/widget/TextView;->setTextColor(I)V

    .line 403
    iget-object v10, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpSubtitle:Landroid/widget/TextView;

    invoke-virtual {v10, v2, v5}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 404
    iget-object v10, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpSubtitle:Landroid/widget/TextView;

    invoke-virtual {v10, v2}, Landroid/widget/TextView;->setSingleLine(Z)V

    .line 405
    iget-object v10, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpSubtitle:Landroid/widget/TextView;

    sget-object v11, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v10, v11}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 406
    iget-object v10, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpSubtitle:Landroid/widget/TextView;

    invoke-virtual {v10, v3}, Landroid/widget/TextView;->setIncludeFontPadding(Z)V

    .line 407
    new-instance v10, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v10, v13, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 408
    const/high16 v11, 0x40000000    # 2.0f

    invoke-direct {v0, v11}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v11

    iput v11, v10, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 409
    iget-object v11, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpSubtitle:Landroid/widget/TextView;

    invoke-virtual {v4, v11, v10}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 411
    new-instance v10, Landroid/widget/TextView;

    invoke-direct {v10, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v10, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpStackBadge:Landroid/widget/TextView;

    .line 412
    iget-object v10, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpStackBadge:Landroid/widget/TextView;

    const v11, -0x27000001

    invoke-virtual {v10, v11}, Landroid/widget/TextView;->setTextColor(I)V

    .line 413
    iget-object v10, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpStackBadge:Landroid/widget/TextView;

    const/high16 v11, 0x41200000    # 10.0f

    invoke-virtual {v10, v2, v11}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 414
    iget-object v10, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpStackBadge:Landroid/widget/TextView;

    invoke-virtual {v10, v7}, Landroid/widget/TextView;->setVisibility(I)V

    .line 415
    new-instance v10, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v10, v9, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 416
    const/high16 v11, 0x40400000    # 3.0f

    invoke-direct {v0, v11}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v11

    iput v11, v10, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 417
    iget-object v11, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpStackBadge:Landroid/widget/TextView;

    invoke-virtual {v4, v11, v10}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 419
    new-instance v4, Landroid/widget/TextView;

    invoke-direct {v4, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v4, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpRightStat:Landroid/widget/TextView;

    .line 420
    iget-object v4, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpRightStat:Landroid/widget/TextView;

    const v10, -0xcf2ea8

    invoke-virtual {v4, v10}, Landroid/widget/TextView;->setTextColor(I)V

    .line 421
    iget-object v4, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpRightStat:Landroid/widget/TextView;

    const/high16 v10, 0x41580000    # 13.5f

    invoke-virtual {v4, v2, v10}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 422
    iget-object v4, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpRightStat:Landroid/widget/TextView;

    const-string v10, "sans-serif-medium"

    invoke-static {v10, v2}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object v10

    invoke-virtual {v4, v10}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 423
    iget-object v4, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpRightStat:Landroid/widget/TextView;

    invoke-virtual {v4, v6}, Landroid/widget/TextView;->setFontFeatureSettings(Ljava/lang/String;)V

    .line 424
    iget-object v4, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpRightStat:Landroid/widget/TextView;

    invoke-virtual {v4, v7}, Landroid/widget/TextView;->setVisibility(I)V

    .line 425
    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v4, v9, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 426
    const/high16 v10, 0x40c00000    # 6.0f

    invoke-direct {v0, v10}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v10

    invoke-virtual {v4, v10}, Landroid/widget/LinearLayout$LayoutParams;->setMarginEnd(I)V

    .line 427
    iget-object v10, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpHeaderRow:Landroid/widget/LinearLayout;

    iget-object v11, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpRightStat:Landroid/widget/TextView;

    invoke-virtual {v10, v11, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 429
    new-instance v4, Lcom/android/systemui/dynamicisland/WaveformView;

    invoke-direct {v4, v1}, Lcom/android/systemui/dynamicisland/WaveformView;-><init>(Landroid/content/Context;)V

    iput-object v4, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpWaveform:Lcom/android/systemui/dynamicisland/WaveformView;

    .line 430
    iget-object v4, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpWaveform:Lcom/android/systemui/dynamicisland/WaveformView;

    invoke-virtual {v4, v7}, Lcom/android/systemui/dynamicisland/WaveformView;->setVisibility(I)V

    .line 431
    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v10, 0x41d00000    # 26.0f

    invoke-direct {v0, v10}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v10

    const/high16 v11, 0x41600000    # 14.0f

    invoke-direct {v0, v11}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v11

    invoke-direct {v4, v10, v11}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 432
    const/high16 v11, 0x41000000    # 8.0f

    invoke-direct {v0, v11}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v10

    invoke-virtual {v4, v10}, Landroid/widget/LinearLayout$LayoutParams;->setMarginEnd(I)V

    .line 433
    iget-object v10, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpHeaderRow:Landroid/widget/LinearLayout;

    iget-object v11, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpWaveform:Lcom/android/systemui/dynamicisland/WaveformView;

    invoke-virtual {v10, v11, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 435
    const v4, 0x3f19999a    # 0.6f

    invoke-direct {v0, v4}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v4

    const v10, 0x33ffffff

    invoke-static {v1, v8, v10, v4}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->makeGlassCircleButton(Landroid/content/Context;III)Landroid/widget/FrameLayout;

    move-result-object v4

    iput-object v4, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpCollapseBtn:Landroid/widget/FrameLayout;

    .line 436
    new-instance v4, Lcom/android/systemui/dynamicisland/GlyphIconView;

    invoke-direct {v4, v1}, Lcom/android/systemui/dynamicisland/GlyphIconView;-><init>(Landroid/content/Context;)V

    .line 437
    const/16 v10, 0xd

    const v11, -0x19000001

    invoke-virtual {v4, v10, v11}, Lcom/android/systemui/dynamicisland/GlyphIconView;->setGlyph(II)V

    .line 438
    iget-object v10, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpCollapseBtn:Landroid/widget/FrameLayout;

    new-instance v11, Landroid/widget/FrameLayout$LayoutParams;

    const/high16 v12, 0x41800000    # 16.0f

    invoke-direct {v0, v12}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v14

    invoke-direct {v0, v12}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v12

    const/16 v15, 0x11

    invoke-direct {v11, v14, v12, v15}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    invoke-virtual {v10, v4, v11}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 439
    iget-object v4, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpCollapseBtn:Landroid/widget/FrameLayout;

    new-instance v10, Lcom/android/systemui/dynamicisland/IslandOverlayView$$ExternalSyntheticLambda0;

    invoke-direct {v10, v0}, Lcom/android/systemui/dynamicisland/IslandOverlayView$$ExternalSyntheticLambda0;-><init>(Lcom/android/systemui/dynamicisland/IslandOverlayView;)V

    invoke-virtual {v4, v10}, Landroid/widget/FrameLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 440
    iget-object v4, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpHeaderRow:Landroid/widget/LinearLayout;

    iget-object v10, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpCollapseBtn:Landroid/widget/FrameLayout;

    new-instance v11, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v12, 0x41e00000    # 28.0f

    invoke-direct {v0, v12}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v12

    const/high16 v14, 0x41e00000    # 28.0f

    invoke-direct {v0, v14}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v14

    invoke-direct {v11, v12, v14}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v4, v10, v11}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 442
    iget-object v4, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpHeaderRow:Landroid/widget/LinearLayout;

    new-instance v10, Lcom/android/systemui/dynamicisland/IslandOverlayView$$ExternalSyntheticLambda1;

    invoke-direct {v10, v0}, Lcom/android/systemui/dynamicisland/IslandOverlayView$$ExternalSyntheticLambda1;-><init>(Lcom/android/systemui/dynamicisland/IslandOverlayView;)V

    invoke-virtual {v4, v10}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 444
    new-instance v4, Landroid/widget/LinearLayout;

    invoke-direct {v4, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v4, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpProgressRow:Landroid/widget/LinearLayout;

    .line 445
    iget-object v4, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpProgressRow:Landroid/widget/LinearLayout;

    invoke-virtual {v4, v2}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 446
    iget-object v4, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpProgressRow:Landroid/widget/LinearLayout;

    invoke-virtual {v4, v7}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 447
    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v4, v13, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 448
    invoke-direct {v0, v5}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v10

    iput v10, v4, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 449
    iget-object v10, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpandedCard:Landroid/widget/LinearLayout;

    iget-object v11, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpProgressRow:Landroid/widget/LinearLayout;

    invoke-virtual {v10, v11, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 451
    new-instance v4, Landroid/widget/SeekBar;

    invoke-direct {v4, v1}, Landroid/widget/SeekBar;-><init>(Landroid/content/Context;)V

    iput-object v4, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpSeekBar:Landroid/widget/SeekBar;

    .line 452
    iget-object v4, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpSeekBar:Landroid/widget/SeekBar;

    const/high16 v10, 0x40800000    # 4.0f

    invoke-direct {v0, v10}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v11

    const/high16 v12, 0x40000000    # 2.0f

    invoke-direct {v0, v12}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v12

    invoke-direct {v0, v10}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v14

    const/high16 v10, 0x40000000    # 2.0f

    invoke-direct {v0, v10}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v10

    invoke-virtual {v4, v11, v12, v14, v10}, Landroid/widget/SeekBar;->setPadding(IIII)V

    .line 453
    iget-object v4, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpSeekBar:Landroid/widget/SeekBar;

    invoke-virtual {v4, v3}, Landroid/widget/SeekBar;->setSplitTrack(Z)V

    .line 454
    iget-object v4, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpSeekBar:Landroid/widget/SeekBar;

    const v10, 0x33ffffff

    invoke-static {v10}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v10

    invoke-virtual {v4, v10}, Landroid/widget/SeekBar;->setProgressBackgroundTintList(Landroid/content/res/ColorStateList;)V

    .line 455
    iget-object v4, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpSeekBar:Landroid/widget/SeekBar;

    new-instance v10, Lcom/android/systemui/dynamicisland/IslandOverlayView$8;

    invoke-direct {v10, v0}, Lcom/android/systemui/dynamicisland/IslandOverlayView$8;-><init>(Lcom/android/systemui/dynamicisland/IslandOverlayView;)V

    invoke-virtual {v4, v10}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 481
    iget-object v4, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpProgressRow:Landroid/widget/LinearLayout;

    iget-object v10, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpSeekBar:Landroid/widget/SeekBar;

    new-instance v11, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v12, 0x41b00000    # 22.0f

    invoke-direct {v0, v12}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v12

    invoke-direct {v11, v13, v12}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v4, v10, v11}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 483
    new-instance v4, Landroid/widget/ProgressBar;

    const v10, 0x1010078

    const/4 v11, 0x0

    invoke-direct {v4, v1, v11, v10}, Landroid/widget/ProgressBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    iput-object v4, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpProgressBar:Landroid/widget/ProgressBar;

    .line 484
    iget-object v4, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpProgressBar:Landroid/widget/ProgressBar;

    invoke-virtual {v4, v7}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 485
    iget-object v4, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpProgressBar:Landroid/widget/ProgressBar;

    const v10, 0x33ffffff

    invoke-static {v10}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v10

    invoke-virtual {v4, v10}, Landroid/widget/ProgressBar;->setProgressBackgroundTintList(Landroid/content/res/ColorStateList;)V

    .line 486
    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v10, 0x40c00000    # 6.0f

    invoke-direct {v0, v10}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v10

    invoke-direct {v4, v13, v10}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 487
    const/high16 v10, 0x40800000    # 4.0f

    invoke-direct {v0, v10}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v10

    iput v10, v4, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 488
    iget-object v10, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpProgressRow:Landroid/widget/LinearLayout;

    iget-object v11, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpProgressBar:Landroid/widget/ProgressBar;

    invoke-virtual {v10, v11, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 490
    new-instance v4, Landroid/widget/LinearLayout;

    invoke-direct {v4, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 491
    invoke-virtual {v4, v3}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 492
    new-instance v10, Landroid/widget/TextView;

    invoke-direct {v10, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v10, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpElapsedText:Landroid/widget/TextView;

    .line 493
    iget-object v10, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpElapsedText:Landroid/widget/TextView;

    const v11, -0x4c000001

    invoke-virtual {v10, v11}, Landroid/widget/TextView;->setTextColor(I)V

    .line 494
    iget-object v10, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpElapsedText:Landroid/widget/TextView;

    const/high16 v11, 0x41280000    # 10.5f

    invoke-virtual {v10, v2, v11}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 495
    iget-object v10, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpElapsedText:Landroid/widget/TextView;

    invoke-virtual {v10, v6}, Landroid/widget/TextView;->setFontFeatureSettings(Ljava/lang/String;)V

    .line 496
    new-instance v10, Landroid/widget/TextView;

    invoke-direct {v10, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v10, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpDurationText:Landroid/widget/TextView;

    .line 497
    iget-object v10, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpDurationText:Landroid/widget/TextView;

    const v11, -0x4c000001

    invoke-virtual {v10, v11}, Landroid/widget/TextView;->setTextColor(I)V

    .line 498
    iget-object v10, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpDurationText:Landroid/widget/TextView;

    const/high16 v11, 0x41280000    # 10.5f

    invoke-virtual {v10, v2, v11}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 499
    iget-object v10, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpDurationText:Landroid/widget/TextView;

    invoke-virtual {v10, v6}, Landroid/widget/TextView;->setFontFeatureSettings(Ljava/lang/String;)V

    .line 500
    iget-object v6, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpDurationText:Landroid/widget/TextView;

    const v10, 0x800005

    invoke-virtual {v6, v10}, Landroid/widget/TextView;->setGravity(I)V

    .line 501
    iget-object v6, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpElapsedText:Landroid/widget/TextView;

    new-instance v10, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v11, 0x3f800000    # 1.0f

    invoke-direct {v10, v3, v9, v11}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v4, v6, v10}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 502
    iget-object v6, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpDurationText:Landroid/widget/TextView;

    new-instance v10, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v10, v3, v9, v11}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v4, v6, v10}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 503
    iget-object v6, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpProgressRow:Landroid/widget/LinearLayout;

    new-instance v10, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v10, v13, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v6, v4, v10}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 505
    new-instance v4, Landroid/widget/LinearLayout;

    invoke-direct {v4, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v4, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpActionsRow:Landroid/widget/LinearLayout;

    .line 506
    iget-object v4, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpActionsRow:Landroid/widget/LinearLayout;

    invoke-virtual {v4, v3}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 507
    iget-object v4, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpActionsRow:Landroid/widget/LinearLayout;

    const/16 v15, 0x11

    invoke-virtual {v4, v15}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 508
    iget-object v4, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpActionsRow:Landroid/widget/LinearLayout;

    invoke-virtual {v4, v7}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 509
    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v4, v13, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 510
    invoke-direct {v0, v5}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v5

    iput v5, v4, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 511
    iget-object v5, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpandedCard:Landroid/widget/LinearLayout;

    iget-object v6, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpActionsRow:Landroid/widget/LinearLayout;

    invoke-virtual {v5, v6, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 513
    new-instance v4, Landroid/widget/FrameLayout;

    invoke-direct {v4, v1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    iput-object v4, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mMediaControlsGroup:Landroid/widget/FrameLayout;

    .line 514
    new-instance v4, Landroid/widget/LinearLayout;

    invoke-direct {v4, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 515
    invoke-virtual {v4, v3}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 516
    const/16 v15, 0x11

    invoke-virtual {v4, v15}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 518
    const/high16 v5, 0x3f400000    # 0.75f

    invoke-direct {v0, v5}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v5

    const v6, 0x36ffffff

    invoke-static {v1, v8, v6, v5}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->makeGlassCircleButton(Landroid/content/Context;III)Landroid/widget/FrameLayout;

    move-result-object v5

    iput-object v5, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mBtnPrev:Landroid/widget/FrameLayout;

    .line 519
    new-instance v5, Lcom/android/systemui/dynamicisland/GlyphIconView;

    invoke-direct {v5, v1}, Lcom/android/systemui/dynamicisland/GlyphIconView;-><init>(Landroid/content/Context;)V

    .line 520
    const/16 v6, 0x9

    invoke-virtual {v5, v6, v13}, Lcom/android/systemui/dynamicisland/GlyphIconView;->setGlyph(II)V

    .line 521
    iget-object v6, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mBtnPrev:Landroid/widget/FrameLayout;

    new-instance v10, Landroid/widget/FrameLayout$LayoutParams;

    const/high16 v11, 0x41900000    # 18.0f

    invoke-direct {v0, v11}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v12

    invoke-direct {v0, v11}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v14

    const/16 v15, 0x11

    invoke-direct {v10, v12, v14, v15}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    invoke-virtual {v6, v5, v10}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 522
    iget-object v5, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mBtnPrev:Landroid/widget/FrameLayout;

    new-instance v6, Lcom/android/systemui/dynamicisland/IslandOverlayView$$ExternalSyntheticLambda2;

    invoke-direct {v6, v0}, Lcom/android/systemui/dynamicisland/IslandOverlayView$$ExternalSyntheticLambda2;-><init>(Lcom/android/systemui/dynamicisland/IslandOverlayView;)V

    invoke-virtual {v5, v6}, Landroid/widget/FrameLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 524
    new-instance v5, Landroid/widget/FrameLayout;

    invoke-direct {v5, v1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    iput-object v5, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mBtnPlayPause:Landroid/widget/FrameLayout;

    .line 525
    new-instance v5, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v5}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    iput-object v5, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mPlayPauseBg:Landroid/graphics/drawable/GradientDrawable;

    .line 526
    iget-object v5, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mPlayPauseBg:Landroid/graphics/drawable/GradientDrawable;

    invoke-virtual {v5, v2}, Landroid/graphics/drawable/GradientDrawable;->setShape(I)V

    .line 527
    iget-object v2, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mPlayPauseBg:Landroid/graphics/drawable/GradientDrawable;

    const v5, -0x19000001

    invoke-virtual {v2, v5}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 528
    iget-object v2, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mBtnPlayPause:Landroid/widget/FrameLayout;

    iget-object v5, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mPlayPauseBg:Landroid/graphics/drawable/GradientDrawable;

    invoke-virtual {v2, v5}, Landroid/widget/FrameLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 529
    new-instance v2, Lcom/android/systemui/dynamicisland/GlyphIconView;

    invoke-direct {v2, v1}, Lcom/android/systemui/dynamicisland/GlyphIconView;-><init>(Landroid/content/Context;)V

    iput-object v2, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mGlyphPlayPause:Lcom/android/systemui/dynamicisland/GlyphIconView;

    .line 530
    iget-object v2, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mGlyphPlayPause:Lcom/android/systemui/dynamicisland/GlyphIconView;

    const/16 v5, 0xb

    const/high16 v6, -0x1a000000

    invoke-virtual {v2, v5, v6}, Lcom/android/systemui/dynamicisland/GlyphIconView;->setGlyph(II)V

    .line 531
    iget-object v2, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mBtnPlayPause:Landroid/widget/FrameLayout;

    iget-object v5, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mGlyphPlayPause:Lcom/android/systemui/dynamicisland/GlyphIconView;

    new-instance v6, Landroid/widget/FrameLayout$LayoutParams;

    const/high16 v10, 0x41a00000    # 20.0f

    invoke-direct {v0, v10}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v10

    const/high16 v11, 0x41a00000    # 20.0f

    invoke-direct {v0, v11}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v11

    const/16 v15, 0x11

    invoke-direct {v6, v10, v11, v15}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    invoke-virtual {v2, v5, v6}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 532
    iget-object v2, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mBtnPlayPause:Landroid/widget/FrameLayout;

    new-instance v5, Lcom/android/systemui/dynamicisland/IslandOverlayView$$ExternalSyntheticLambda3;

    invoke-direct {v5, v0}, Lcom/android/systemui/dynamicisland/IslandOverlayView$$ExternalSyntheticLambda3;-><init>(Lcom/android/systemui/dynamicisland/IslandOverlayView;)V

    invoke-virtual {v2, v5}, Landroid/widget/FrameLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 534
    const/high16 v2, 0x3f400000    # 0.75f

    invoke-direct {v0, v2}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v2

    const v5, 0x36ffffff

    invoke-static {v1, v8, v5, v2}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->makeGlassCircleButton(Landroid/content/Context;III)Landroid/widget/FrameLayout;

    move-result-object v2

    iput-object v2, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mBtnNext:Landroid/widget/FrameLayout;

    .line 535
    new-instance v2, Lcom/android/systemui/dynamicisland/GlyphIconView;

    invoke-direct {v2, v1}, Lcom/android/systemui/dynamicisland/GlyphIconView;-><init>(Landroid/content/Context;)V

    .line 536
    const/16 v5, 0xc

    invoke-virtual {v2, v5, v13}, Lcom/android/systemui/dynamicisland/GlyphIconView;->setGlyph(II)V

    .line 537
    iget-object v5, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mBtnNext:Landroid/widget/FrameLayout;

    new-instance v6, Landroid/widget/FrameLayout$LayoutParams;

    const/high16 v11, 0x41900000    # 18.0f

    invoke-direct {v0, v11}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v8

    invoke-direct {v0, v11}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v10

    const/16 v15, 0x11

    invoke-direct {v6, v8, v10, v15}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    invoke-virtual {v5, v2, v6}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 538
    iget-object v2, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mBtnNext:Landroid/widget/FrameLayout;

    new-instance v5, Lcom/android/systemui/dynamicisland/IslandOverlayView$$ExternalSyntheticLambda4;

    invoke-direct {v5, v0}, Lcom/android/systemui/dynamicisland/IslandOverlayView$$ExternalSyntheticLambda4;-><init>(Lcom/android/systemui/dynamicisland/IslandOverlayView;)V

    invoke-virtual {v2, v5}, Landroid/widget/FrameLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 540
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v5, 0x42200000    # 40.0f

    invoke-direct {v0, v5}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v6

    invoke-direct {v0, v5}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v8

    invoke-direct {v2, v6, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 541
    const/high16 v11, 0x41900000    # 18.0f

    invoke-direct {v0, v11}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v6

    invoke-virtual {v2, v6}, Landroid/widget/LinearLayout$LayoutParams;->setMarginEnd(I)V

    .line 542
    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v8, 0x42300000    # 44.0f

    invoke-direct {v0, v8}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v8

    const/high16 v10, 0x42300000    # 44.0f

    invoke-direct {v0, v10}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v10

    invoke-direct {v6, v8, v10}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 543
    invoke-direct {v0, v11}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v8

    invoke-virtual {v6, v8}, Landroid/widget/LinearLayout$LayoutParams;->setMarginEnd(I)V

    .line 544
    iget-object v8, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mBtnPrev:Landroid/widget/FrameLayout;

    invoke-virtual {v4, v8, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 545
    iget-object v2, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mBtnPlayPause:Landroid/widget/FrameLayout;

    invoke-virtual {v4, v2, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 546
    iget-object v2, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mBtnNext:Landroid/widget/FrameLayout;

    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v0, v5}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v8

    invoke-direct {v0, v5}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v5

    invoke-direct {v6, v8, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v4, v2, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 547
    iget-object v2, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mMediaControlsGroup:Landroid/widget/FrameLayout;

    new-instance v5, Landroid/widget/FrameLayout$LayoutParams;

    const/16 v15, 0x11

    invoke-direct {v5, v9, v9, v15}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    invoke-virtual {v2, v4, v5}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 548
    iget-object v2, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpActionsRow:Landroid/widget/LinearLayout;

    iget-object v4, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mMediaControlsGroup:Landroid/widget/FrameLayout;

    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v5, v13, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v2, v4, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 550
    new-instance v2, Landroid/widget/LinearLayout;

    invoke-direct {v2, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v2, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCustomActionsGroup:Landroid/widget/LinearLayout;

    .line 551
    iget-object v1, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCustomActionsGroup:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v3}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 552
    iget-object v1, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCustomActionsGroup:Landroid/widget/LinearLayout;

    const v2, 0x800015

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 553
    iget-object v1, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCustomActionsGroup:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v7}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 554
    iget-object v1, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpActionsRow:Landroid/widget/LinearLayout;

    iget-object v2, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCustomActionsGroup:Landroid/widget/LinearLayout;

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v3, v13, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 556
    iget-object v1, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mPillContainer:Landroid/widget/FrameLayout;

    iget-object v0, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mRimView:Landroid/view/View;

    new-instance v2, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v2, v13, v13}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v0, v2}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 557
    return-void
.end method

.method private animatePressScale(FJ)V
    .locals 2

    .line 1025
    iget v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mPressTargetScale:F

    sub-float v0, p1, v0

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    const v1, 0x3b03126f    # 0.002f

    cmpg-float v0, v0, v1

    if-gez v0, :cond_0

    iget-boolean v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mPressAnimRunning:Z

    if-nez v0, :cond_0

    .line 1026
    return-void

    .line 1028
    :cond_0
    iget v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCurrPressScale:F

    iput v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mPressStartScale:F

    .line 1029
    iput p1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mPressTargetScale:F

    .line 1030
    const-wide/16 v0, 0x1

    invoke-static {v0, v1, p2, p3}, Ljava/lang/Math;->max(JJ)J

    move-result-wide p1

    const-wide/32 v0, 0xf4240

    mul-long/2addr p1, v0

    iput-wide p1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mPressDurationNs:J

    .line 1031
    const-wide/16 p1, -0x1

    iput-wide p1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mPressStartNanos:J

    .line 1032
    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mPressAnimRunning:Z

    .line 1033
    invoke-direct {p0}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->scheduleNextAnimFrame()V

    .line 1034
    return-void
.end method

.method private applyHardwareBlur(Z)V
    .locals 2

    .line 1450
    iget v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCurrCornerPx:F

    const/4 v1, 0x0

    cmpl-float v0, v0, v1

    if-lez v0, :cond_0

    iget v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCurrCornerPx:F

    goto :goto_0

    :cond_0
    iget-boolean v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpanded:Z

    if-eqz v0, :cond_1

    const/high16 v0, 0x41e00000    # 28.0f

    invoke-direct {p0, v0}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v0

    int-to-float v0, v0

    goto :goto_0

    :cond_1
    iget v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactHeightPx:I

    int-to-float v0, v0

    const/high16 v1, 0x3f000000    # 0.5f

    mul-float/2addr v0, v1

    .line 1451
    :goto_0
    invoke-direct {p0, p1, v0}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->applyHardwareBlur(ZF)V

    .line 1452
    return-void
.end method

.method private applyHardwareBlur(ZF)V
    .locals 4

    .line 1455
    invoke-virtual {p0}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->isAttachedToWindow()Z

    move-result v0

    if-eqz v0, :cond_6

    iget-boolean v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mSuspendedForSleep:Z

    if-nez v0, :cond_6

    iget-boolean v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mHasActiveContent:Z

    if-eqz v0, :cond_6

    if-nez p1, :cond_0

    goto :goto_0

    .line 1458
    :cond_0
    iget p1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mTuneBlurRadius:I

    const/4 v0, 0x0

    if-gtz p1, :cond_2

    .line 1459
    iget-object p1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mBlurBackdrop:Landroid/view/View;

    invoke-static {p1}, Lcom/android/systemui/dynamicisland/IslandOverlayView$BlurEngine;->clearBlur(Landroid/view/View;)V

    .line 1460
    iget-object p1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mBlurBackdrop:Landroid/view/View;

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 1461
    iput-object p2, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mFallbackBlurDrawable:Ljava/lang/Object;

    .line 1462
    iget-boolean p1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mHardwareBlurSupported:Z

    if-eqz p1, :cond_1

    .line 1463
    iput-boolean v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mHardwareBlurSupported:Z

    .line 1464
    invoke-direct {p0}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->updateGlassSurface()V

    .line 1466
    :cond_1
    return-void

    .line 1468
    :cond_2
    iget-object p1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mBlurBackdrop:Landroid/view/View;

    iget-boolean v1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpanded:Z

    iget v2, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mTuneBlurRadius:I

    invoke-static {p1, v1, p2, v2}, Lcom/android/systemui/dynamicisland/IslandOverlayView$BlurEngine;->applySemWindowBlur(Landroid/view/View;ZFI)Z

    move-result p1

    .line 1469
    if-nez p1, :cond_4

    .line 1470
    iget-object p1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mBlurBackdrop:Landroid/view/View;

    iget-object v1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mFallbackBlurDrawable:Ljava/lang/Object;

    iget-boolean v2, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpanded:Z

    iget v3, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mTuneBlurRadius:I

    invoke-static {p1, v1, v2, p2, v3}, Lcom/android/systemui/dynamicisland/IslandOverlayView$BlurEngine;->applyFallbackBlur(Landroid/view/View;Ljava/lang/Object;ZFI)Ljava/lang/Object;

    move-result-object p1

    iput-object p1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mFallbackBlurDrawable:Ljava/lang/Object;

    .line 1472
    iget-object p1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mFallbackBlurDrawable:Ljava/lang/Object;

    if-eqz p1, :cond_3

    const/4 v0, 0x1

    :cond_3
    move p1, v0

    .line 1474
    :cond_4
    iget-boolean p2, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mHardwareBlurSupported:Z

    if-eq p1, p2, :cond_5

    .line 1475
    iput-boolean p1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mHardwareBlurSupported:Z

    .line 1476
    invoke-direct {p0}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->updateGlassSurface()V

    .line 1478
    :cond_5
    return-void

    .line 1456
    :cond_6
    :goto_0
    return-void
.end method

.method private applyStaticGeometry(FFIIF)V
    .locals 3

    .line 1057
    const/4 v0, 0x1

    invoke-static {v0, p3}, Ljava/lang/Math;->max(II)I

    move-result p3

    .line 1058
    invoke-static {v0, p4}, Ljava/lang/Math;->max(II)I

    move-result p4

    .line 1059
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCurrRect:Landroid/graphics/RectF;

    int-to-float v1, p3

    add-float/2addr v1, p1

    int-to-float v2, p4

    add-float/2addr v2, p2

    invoke-virtual {v0, p1, p2, v1, v2}, Landroid/graphics/RectF;->set(FFFF)V

    .line 1060
    const/4 v0, 0x0

    invoke-static {v0, p5}, Ljava/lang/Math;->max(FF)F

    move-result p5

    iput p5, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCurrCornerPx:F

    .line 1062
    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    move-result p1

    iput p1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mBoxLeft:I

    .line 1063
    invoke-static {p2}, Ljava/lang/Math;->round(F)I

    move-result p1

    iput p1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mBoxTop:I

    .line 1064
    iput p3, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mBoxW:I

    .line 1065
    iput p4, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mBoxH:I

    .line 1067
    iget-object p1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mPillContainer:Landroid/widget/FrameLayout;

    invoke-virtual {p1}, Landroid/widget/FrameLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    check-cast p1, Landroid/widget/FrameLayout$LayoutParams;

    .line 1068
    const/16 p2, 0x33

    iput p2, p1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 1069
    iget p3, p1, Landroid/widget/FrameLayout$LayoutParams;->width:I

    iget p4, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mBoxW:I

    if-ne p3, p4, :cond_0

    iget p3, p1, Landroid/widget/FrameLayout$LayoutParams;->height:I

    iget p4, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mBoxH:I

    if-ne p3, p4, :cond_0

    iget p3, p1, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    iget p4, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mBoxLeft:I

    if-ne p3, p4, :cond_0

    iget p3, p1, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    iget p4, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mBoxTop:I

    if-eq p3, p4, :cond_1

    .line 1070
    :cond_0
    iget p3, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mBoxW:I

    iput p3, p1, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 1071
    iget p3, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mBoxH:I

    iput p3, p1, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 1072
    iget p3, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mBoxLeft:I

    iput p3, p1, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 1073
    iget p3, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mBoxTop:I

    iput p3, p1, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 1074
    iget-object p3, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mPillContainer:Landroid/widget/FrameLayout;

    invoke-virtual {p3, p1}, Landroid/widget/FrameLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 1077
    :cond_1
    iget-boolean p1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpanded:Z

    const/4 p3, 0x0

    if-nez p1, :cond_4

    .line 1078
    iget-object p1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactRow:Landroid/widget/LinearLayout;

    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    check-cast p1, Landroid/widget/FrameLayout$LayoutParams;

    .line 1079
    iput p2, p1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 1080
    iget p2, p1, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    iget p4, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mLastRowLeftInPill:I

    if-ne p2, p4, :cond_2

    iget p2, p1, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    if-eqz p2, :cond_3

    .line 1081
    :cond_2
    iget p2, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mLastRowLeftInPill:I

    iput p2, p1, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 1082
    iput p3, p1, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 1083
    iget-object p2, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactRow:Landroid/widget/LinearLayout;

    invoke-virtual {p2, p1}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 1085
    :cond_3
    goto :goto_0

    .line 1086
    :cond_4
    iget-object p1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpandedCard:Landroid/widget/LinearLayout;

    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    check-cast p1, Landroid/widget/FrameLayout$LayoutParams;

    .line 1087
    iput p2, p1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 1088
    iget p2, p1, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    if-nez p2, :cond_5

    iget p2, p1, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    if-eqz p2, :cond_6

    .line 1089
    :cond_5
    iput p3, p1, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 1090
    iput p3, p1, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 1091
    iget-object p2, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpandedCard:Landroid/widget/LinearLayout;

    invoke-virtual {p2, p1}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 1095
    :cond_6
    :goto_0
    iget-object p1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mPillContainer:Landroid/widget/FrameLayout;

    iget p2, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mBoxW:I

    int-to-float p2, p2

    const/high16 p3, 0x3f000000    # 0.5f

    mul-float/2addr p2, p3

    invoke-virtual {p1, p2}, Landroid/widget/FrameLayout;->setPivotX(F)V

    .line 1096
    iget-object p1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mPillContainer:Landroid/widget/FrameLayout;

    iget p2, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mBoxH:I

    int-to-float p2, p2

    mul-float/2addr p2, p3

    invoke-virtual {p1, p2}, Landroid/widget/FrameLayout;->setPivotY(F)V

    .line 1097
    invoke-direct {p0}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->layoutVisualLayersLocked()V

    .line 1098
    iget-object p1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mPillContainer:Landroid/widget/FrameLayout;

    invoke-virtual {p1}, Landroid/widget/FrameLayout;->invalidateOutline()V

    .line 1099
    invoke-direct {p0}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->updateGlassSurface()V

    .line 1100
    return-void
.end method

.method private bindCompact(Lcom/android/systemui/dynamicisland/IslandItem;)V
    .locals 5

    .line 1532
    iget v0, p1, Lcom/android/systemui/dynamicisland/IslandItem;->accentColor:I

    if-eqz v0, :cond_0

    const/high16 v0, -0x1000000

    iget v1, p1, Lcom/android/systemui/dynamicisland/IslandItem;->accentColor:I

    or-int/2addr v0, v1

    goto :goto_0

    :cond_0
    const v0, -0x9b2d01

    :goto_0
    iput v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCurrAccentColor:I

    .line 1533
    invoke-direct {p0}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->updateGlassSurface()V

    .line 1534
    iget-object v0, p1, Lcom/android/systemui/dynamicisland/IslandItem;->artwork:Landroid/graphics/Bitmap;

    const/16 v1, 0x8

    const/4 v2, 0x0

    if-eqz v0, :cond_1

    iget-object v0, p1, Lcom/android/systemui/dynamicisland/IslandItem;->artwork:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v0

    if-nez v0, :cond_1

    .line 1535
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactArtwork:Landroid/widget/ImageView;

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1536
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactArtwork:Landroid/widget/ImageView;

    iget-object v3, p1, Lcom/android/systemui/dynamicisland/IslandItem;->artwork:Landroid/graphics/Bitmap;

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 1537
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactGlyph:Lcom/android/systemui/dynamicisland/GlyphIconView;

    invoke-virtual {v0, v1}, Lcom/android/systemui/dynamicisland/GlyphIconView;->setVisibility(I)V

    goto :goto_1

    .line 1538
    :cond_1
    iget v0, p1, Lcom/android/systemui/dynamicisland/IslandItem;->vectorKind:I

    if-eqz v0, :cond_2

    .line 1539
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactArtwork:Landroid/widget/ImageView;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1540
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactGlyph:Lcom/android/systemui/dynamicisland/GlyphIconView;

    invoke-virtual {v0, v2}, Lcom/android/systemui/dynamicisland/GlyphIconView;->setVisibility(I)V

    .line 1541
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactGlyph:Lcom/android/systemui/dynamicisland/GlyphIconView;

    iget v3, p1, Lcom/android/systemui/dynamicisland/IslandItem;->vectorKind:I

    iget v4, p1, Lcom/android/systemui/dynamicisland/IslandItem;->accentColor:I

    invoke-virtual {v0, v3, v4}, Lcom/android/systemui/dynamicisland/GlyphIconView;->setGlyph(II)V

    goto :goto_1

    .line 1542
    :cond_2
    iget-object v0, p1, Lcom/android/systemui/dynamicisland/IslandItem;->iconDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_3

    .line 1543
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactArtwork:Landroid/widget/ImageView;

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1544
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactArtwork:Landroid/widget/ImageView;

    iget-object v3, p1, Lcom/android/systemui/dynamicisland/IslandItem;->iconDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 1545
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactGlyph:Lcom/android/systemui/dynamicisland/GlyphIconView;

    invoke-virtual {v0, v1}, Lcom/android/systemui/dynamicisland/GlyphIconView;->setVisibility(I)V

    goto :goto_1

    .line 1547
    :cond_3
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactArtwork:Landroid/widget/ImageView;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1548
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactGlyph:Lcom/android/systemui/dynamicisland/GlyphIconView;

    invoke-virtual {v0, v2}, Lcom/android/systemui/dynamicisland/GlyphIconView;->setVisibility(I)V

    .line 1549
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactGlyph:Lcom/android/systemui/dynamicisland/GlyphIconView;

    const/4 v3, 0x3

    iget v4, p1, Lcom/android/systemui/dynamicisland/IslandItem;->accentColor:I

    invoke-virtual {v0, v3, v4}, Lcom/android/systemui/dynamicisland/GlyphIconView;->setGlyph(II)V

    .line 1552
    :goto_1
    iget-boolean v0, p1, Lcom/android/systemui/dynamicisland/IslandItem;->showWaveform:Z

    const/4 v3, 0x1

    if-eqz v0, :cond_5

    .line 1553
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactWaveform:Lcom/android/systemui/dynamicisland/WaveformView;

    invoke-virtual {v0, v2}, Lcom/android/systemui/dynamicisland/WaveformView;->setVisibility(I)V

    .line 1554
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactWaveform:Lcom/android/systemui/dynamicisland/WaveformView;

    iget v4, p1, Lcom/android/systemui/dynamicisland/IslandItem;->accentColor:I

    invoke-virtual {v0, v4}, Lcom/android/systemui/dynamicisland/WaveformView;->setAccentColor(I)V

    .line 1555
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactWaveform:Lcom/android/systemui/dynamicisland/WaveformView;

    iget-boolean p1, p1, Lcom/android/systemui/dynamicisland/IslandItem;->waveformPlaying:Z

    if-eqz p1, :cond_4

    iget-boolean p1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mSuspendedForSleep:Z

    if-nez p1, :cond_4

    move p1, v3

    goto :goto_2

    :cond_4
    move p1, v2

    :goto_2
    invoke-virtual {v0, p1}, Lcom/android/systemui/dynamicisland/WaveformView;->setAnimating(Z)V

    .line 1556
    iget-object p1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactText:Landroid/widget/TextView;

    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_6

    .line 1558
    :cond_5
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactWaveform:Lcom/android/systemui/dynamicisland/WaveformView;

    invoke-virtual {v0, v1}, Lcom/android/systemui/dynamicisland/WaveformView;->setVisibility(I)V

    .line 1559
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactWaveform:Lcom/android/systemui/dynamicisland/WaveformView;

    invoke-virtual {v0, v2}, Lcom/android/systemui/dynamicisland/WaveformView;->setAnimating(Z)V

    .line 1560
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactText:Landroid/widget/TextView;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 1561
    iget-object v0, p1, Lcom/android/systemui/dynamicisland/IslandItem;->category:Lcom/android/systemui/dynamicisland/IslandItem$Category;

    sget-object v4, Lcom/android/systemui/dynamicisland/IslandItem$Category;->CALL:Lcom/android/systemui/dynamicisland/IslandItem$Category;

    if-eq v0, v4, :cond_7

    iget-object v0, p1, Lcom/android/systemui/dynamicisland/IslandItem;->category:Lcom/android/systemui/dynamicisland/IslandItem$Category;

    sget-object v4, Lcom/android/systemui/dynamicisland/IslandItem$Category;->RECORDING:Lcom/android/systemui/dynamicisland/IslandItem$Category;

    if-eq v0, v4, :cond_7

    iget-object v0, p1, Lcom/android/systemui/dynamicisland/IslandItem;->category:Lcom/android/systemui/dynamicisland/IslandItem$Category;

    sget-object v4, Lcom/android/systemui/dynamicisland/IslandItem$Category;->TIMER:Lcom/android/systemui/dynamicisland/IslandItem$Category;

    if-eq v0, v4, :cond_7

    iget-object v0, p1, Lcom/android/systemui/dynamicisland/IslandItem;->category:Lcom/android/systemui/dynamicisland/IslandItem$Category;

    sget-object v4, Lcom/android/systemui/dynamicisland/IslandItem$Category;->LIVE_DELIVERY:Lcom/android/systemui/dynamicisland/IslandItem$Category;

    if-eq v0, v4, :cond_7

    iget-object v0, p1, Lcom/android/systemui/dynamicisland/IslandItem;->category:Lcom/android/systemui/dynamicisland/IslandItem$Category;

    sget-object v4, Lcom/android/systemui/dynamicisland/IslandItem$Category;->LIVE_RIDE:Lcom/android/systemui/dynamicisland/IslandItem$Category;

    if-ne v0, v4, :cond_6

    goto :goto_3

    :cond_6
    move v0, v2

    goto :goto_4

    :cond_7
    :goto_3
    move v0, v3

    .line 1566
    :goto_4
    iget-object v4, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactText:Landroid/widget/TextView;

    if-eqz v0, :cond_8

    iget v0, p1, Lcom/android/systemui/dynamicisland/IslandItem;->accentColor:I

    goto :goto_5

    :cond_8
    const/4 v0, -0x1

    :goto_5
    invoke-virtual {v4, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 1567
    iget-boolean v0, p1, Lcom/android/systemui/dynamicisland/IslandItem;->hasChronometer:Z

    if-nez v0, :cond_9

    .line 1568
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactText:Landroid/widget/TextView;

    iget-object p1, p1, Lcom/android/systemui/dynamicisland/IslandItem;->compactRightText:Ljava/lang/String;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1572
    :cond_9
    :goto_6
    iget-object p1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mStackDot:Landroid/view/View;

    iget v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mStackCount:I

    if-le v0, v3, :cond_a

    move v1, v2

    :cond_a
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 1573
    invoke-direct {p0}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->updateLiveTickValues()V

    .line 1574
    return-void
.end method

.method private bindExpanded(Lcom/android/systemui/dynamicisland/IslandItem;)V
    .locals 9

    .line 1577
    iget v0, p1, Lcom/android/systemui/dynamicisland/IslandItem;->accentColor:I

    if-eqz v0, :cond_0

    const/high16 v0, -0x1000000

    iget v1, p1, Lcom/android/systemui/dynamicisland/IslandItem;->accentColor:I

    or-int/2addr v0, v1

    goto :goto_0

    :cond_0
    const v0, -0x9b2d01

    :goto_0
    iput v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCurrAccentColor:I

    .line 1578
    invoke-direct {p0}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->updateGlassSurface()V

    .line 1579
    iget-object v0, p1, Lcom/android/systemui/dynamicisland/IslandItem;->artwork:Landroid/graphics/Bitmap;

    const v1, 0x26ffffff

    const/4 v2, 0x1

    const/16 v3, 0x8

    const/4 v4, 0x0

    if-eqz v0, :cond_1

    iget-object v0, p1, Lcom/android/systemui/dynamicisland/IslandItem;->artwork:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v0

    if-nez v0, :cond_1

    .line 1580
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpIconBg:Landroid/graphics/drawable/GradientDrawable;

    invoke-virtual {v0, v4}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 1581
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpIconBg:Landroid/graphics/drawable/GradientDrawable;

    invoke-virtual {v0, v4, v4}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    .line 1582
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpArtwork:Landroid/widget/ImageView;

    invoke-virtual {v0, v4}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1583
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpArtwork:Landroid/widget/ImageView;

    iget-object v5, p1, Lcom/android/systemui/dynamicisland/IslandItem;->artwork:Landroid/graphics/Bitmap;

    invoke-virtual {v0, v5}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 1584
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpGlyph:Lcom/android/systemui/dynamicisland/GlyphIconView;

    invoke-virtual {v0, v3}, Lcom/android/systemui/dynamicisland/GlyphIconView;->setVisibility(I)V

    goto :goto_1

    .line 1585
    :cond_1
    iget v0, p1, Lcom/android/systemui/dynamicisland/IslandItem;->vectorKind:I

    if-eqz v0, :cond_2

    .line 1586
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpIconBg:Landroid/graphics/drawable/GradientDrawable;

    iget v5, p1, Lcom/android/systemui/dynamicisland/IslandItem;->accentColor:I

    const v6, 0xffffff

    and-int/2addr v5, v6

    const/high16 v7, 0x33000000

    or-int/2addr v5, v7

    invoke-virtual {v0, v5}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 1587
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpIconBg:Landroid/graphics/drawable/GradientDrawable;

    const/high16 v5, 0x3f400000    # 0.75f

    invoke-direct {p0, v5}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v5

    invoke-static {v2, v5}, Ljava/lang/Math;->max(II)I

    move-result v5

    iget v7, p1, Lcom/android/systemui/dynamicisland/IslandItem;->accentColor:I

    and-int/2addr v6, v7

    const/high16 v7, 0x4d000000    # 1.3421773E8f

    or-int/2addr v6, v7

    invoke-virtual {v0, v5, v6}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    .line 1588
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpArtwork:Landroid/widget/ImageView;

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1589
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpGlyph:Lcom/android/systemui/dynamicisland/GlyphIconView;

    invoke-virtual {v0, v4}, Lcom/android/systemui/dynamicisland/GlyphIconView;->setVisibility(I)V

    .line 1590
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpGlyph:Lcom/android/systemui/dynamicisland/GlyphIconView;

    iget v5, p1, Lcom/android/systemui/dynamicisland/IslandItem;->vectorKind:I

    iget v6, p1, Lcom/android/systemui/dynamicisland/IslandItem;->accentColor:I

    invoke-virtual {v0, v5, v6}, Lcom/android/systemui/dynamicisland/GlyphIconView;->setGlyph(II)V

    goto :goto_1

    .line 1591
    :cond_2
    iget-object v0, p1, Lcom/android/systemui/dynamicisland/IslandItem;->iconDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_3

    .line 1592
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpIconBg:Landroid/graphics/drawable/GradientDrawable;

    const v5, 0x24ffffff

    invoke-virtual {v0, v5}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 1593
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpIconBg:Landroid/graphics/drawable/GradientDrawable;

    const v5, 0x3f19999a    # 0.6f

    invoke-direct {p0, v5}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v5

    invoke-static {v2, v5}, Ljava/lang/Math;->max(II)I

    move-result v5

    invoke-virtual {v0, v5, v1}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    .line 1594
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpArtwork:Landroid/widget/ImageView;

    invoke-virtual {v0, v4}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1595
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpArtwork:Landroid/widget/ImageView;

    iget-object v5, p1, Lcom/android/systemui/dynamicisland/IslandItem;->iconDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, v5}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 1596
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpGlyph:Lcom/android/systemui/dynamicisland/GlyphIconView;

    invoke-virtual {v0, v3}, Lcom/android/systemui/dynamicisland/GlyphIconView;->setVisibility(I)V

    .line 1599
    :cond_3
    :goto_1
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpTitle:Landroid/widget/TextView;

    iget-object v5, p1, Lcom/android/systemui/dynamicisland/IslandItem;->title:Ljava/lang/String;

    invoke-virtual {v0, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1600
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpSubtitle:Landroid/widget/TextView;

    iget-object v5, p1, Lcom/android/systemui/dynamicisland/IslandItem;->subtitle:Ljava/lang/String;

    invoke-virtual {v0, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1602
    iget v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mStackCount:I

    if-le v0, v2, :cond_4

    .line 1603
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpStackBadge:Landroid/widget/TextView;

    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setVisibility(I)V

    .line 1604
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpStackBadge:Landroid/widget/TextView;

    iget v5, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mStackIndex:I

    add-int/2addr v5, v2

    iget v6, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mStackCount:I

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v7, " / "

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " \u2022 swipe"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_2

    .line 1606
    :cond_4
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpStackBadge:Landroid/widget/TextView;

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setVisibility(I)V

    .line 1609
    :goto_2
    iget-boolean v0, p1, Lcom/android/systemui/dynamicisland/IslandItem;->showWaveform:Z

    if-eqz v0, :cond_6

    .line 1610
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpWaveform:Lcom/android/systemui/dynamicisland/WaveformView;

    invoke-virtual {v0, v4}, Lcom/android/systemui/dynamicisland/WaveformView;->setVisibility(I)V

    .line 1611
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpWaveform:Lcom/android/systemui/dynamicisland/WaveformView;

    iget v5, p1, Lcom/android/systemui/dynamicisland/IslandItem;->accentColor:I

    invoke-virtual {v0, v5}, Lcom/android/systemui/dynamicisland/WaveformView;->setAccentColor(I)V

    .line 1612
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpWaveform:Lcom/android/systemui/dynamicisland/WaveformView;

    iget-boolean v5, p1, Lcom/android/systemui/dynamicisland/IslandItem;->waveformPlaying:Z

    if-eqz v5, :cond_5

    iget-boolean v5, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpanded:Z

    if-eqz v5, :cond_5

    iget-boolean v5, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mSuspendedForSleep:Z

    if-nez v5, :cond_5

    move v5, v2

    goto :goto_3

    :cond_5
    move v5, v4

    :goto_3
    invoke-virtual {v0, v5}, Lcom/android/systemui/dynamicisland/WaveformView;->setAnimating(Z)V

    .line 1613
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpRightStat:Landroid/widget/TextView;

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setVisibility(I)V

    goto/16 :goto_5

    .line 1614
    :cond_6
    iget-boolean v0, p1, Lcom/android/systemui/dynamicisland/IslandItem;->hasChronometer:Z

    if-eqz v0, :cond_7

    .line 1615
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpWaveform:Lcom/android/systemui/dynamicisland/WaveformView;

    invoke-virtual {v0, v3}, Lcom/android/systemui/dynamicisland/WaveformView;->setVisibility(I)V

    .line 1616
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpWaveform:Lcom/android/systemui/dynamicisland/WaveformView;

    invoke-virtual {v0, v4}, Lcom/android/systemui/dynamicisland/WaveformView;->setAnimating(Z)V

    .line 1617
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpRightStat:Landroid/widget/TextView;

    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setVisibility(I)V

    .line 1618
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpRightStat:Landroid/widget/TextView;

    iget v5, p1, Lcom/android/systemui/dynamicisland/IslandItem;->accentColor:I

    invoke-virtual {v0, v5}, Landroid/widget/TextView;->setTextColor(I)V

    goto/16 :goto_5

    .line 1619
    :cond_7
    iget-object v0, p1, Lcom/android/systemui/dynamicisland/IslandItem;->compactRightText:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_9

    iget-object v0, p1, Lcom/android/systemui/dynamicisland/IslandItem;->category:Lcom/android/systemui/dynamicisland/IslandItem$Category;

    sget-object v5, Lcom/android/systemui/dynamicisland/IslandItem$Category;->HOTSPOT:Lcom/android/systemui/dynamicisland/IslandItem$Category;

    if-ne v0, v5, :cond_9

    .line 1621
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpWaveform:Lcom/android/systemui/dynamicisland/WaveformView;

    invoke-virtual {v0, v3}, Lcom/android/systemui/dynamicisland/WaveformView;->setVisibility(I)V

    .line 1622
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpWaveform:Lcom/android/systemui/dynamicisland/WaveformView;

    invoke-virtual {v0, v4}, Lcom/android/systemui/dynamicisland/WaveformView;->setAnimating(Z)V

    .line 1623
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpRightStat:Landroid/widget/TextView;

    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setVisibility(I)V

    .line 1624
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpRightStat:Landroid/widget/TextView;

    iget v5, p1, Lcom/android/systemui/dynamicisland/IslandItem;->accentColor:I

    invoke-virtual {v0, v5}, Landroid/widget/TextView;->setTextColor(I)V

    .line 1625
    iget-object v0, p1, Lcom/android/systemui/dynamicisland/IslandItem;->compactRightText:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 1626
    iget-object v5, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpRightStat:Landroid/widget/TextView;

    const-string v6, "1"

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_8

    const-string v0, "1 device"

    goto :goto_4

    :cond_8
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v6, " devices"

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_4
    invoke-virtual {v5, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1627
    goto :goto_5

    :cond_9
    iget-object v0, p1, Lcom/android/systemui/dynamicisland/IslandItem;->compactRightText:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_b

    iget-object v0, p1, Lcom/android/systemui/dynamicisland/IslandItem;->category:Lcom/android/systemui/dynamicisland/IslandItem$Category;

    sget-object v5, Lcom/android/systemui/dynamicisland/IslandItem$Category;->FLASH_EVENT:Lcom/android/systemui/dynamicisland/IslandItem$Category;

    if-eq v0, v5, :cond_a

    iget-object v0, p1, Lcom/android/systemui/dynamicisland/IslandItem;->category:Lcom/android/systemui/dynamicisland/IslandItem$Category;

    sget-object v5, Lcom/android/systemui/dynamicisland/IslandItem$Category;->LIVE_DELIVERY:Lcom/android/systemui/dynamicisland/IslandItem$Category;

    if-eq v0, v5, :cond_a

    iget-object v0, p1, Lcom/android/systemui/dynamicisland/IslandItem;->category:Lcom/android/systemui/dynamicisland/IslandItem$Category;

    sget-object v5, Lcom/android/systemui/dynamicisland/IslandItem$Category;->LIVE_RIDE:Lcom/android/systemui/dynamicisland/IslandItem$Category;

    if-ne v0, v5, :cond_b

    .line 1631
    :cond_a
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpWaveform:Lcom/android/systemui/dynamicisland/WaveformView;

    invoke-virtual {v0, v3}, Lcom/android/systemui/dynamicisland/WaveformView;->setVisibility(I)V

    .line 1632
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpWaveform:Lcom/android/systemui/dynamicisland/WaveformView;

    invoke-virtual {v0, v4}, Lcom/android/systemui/dynamicisland/WaveformView;->setAnimating(Z)V

    .line 1633
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpRightStat:Landroid/widget/TextView;

    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setVisibility(I)V

    .line 1634
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpRightStat:Landroid/widget/TextView;

    iget v5, p1, Lcom/android/systemui/dynamicisland/IslandItem;->accentColor:I

    invoke-virtual {v0, v5}, Landroid/widget/TextView;->setTextColor(I)V

    .line 1635
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpRightStat:Landroid/widget/TextView;

    iget-object v5, p1, Lcom/android/systemui/dynamicisland/IslandItem;->compactRightText:Ljava/lang/String;

    invoke-virtual {v0, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_5

    .line 1637
    :cond_b
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpWaveform:Lcom/android/systemui/dynamicisland/WaveformView;

    invoke-virtual {v0, v3}, Lcom/android/systemui/dynamicisland/WaveformView;->setVisibility(I)V

    .line 1638
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpWaveform:Lcom/android/systemui/dynamicisland/WaveformView;

    invoke-virtual {v0, v4}, Lcom/android/systemui/dynamicisland/WaveformView;->setAnimating(Z)V

    .line 1639
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpRightStat:Landroid/widget/TextView;

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setVisibility(I)V

    .line 1642
    :goto_5
    iget-boolean v0, p1, Lcom/android/systemui/dynamicisland/IslandItem;->hasProgress:Z

    if-eqz v0, :cond_d

    iget-wide v5, p1, Lcom/android/systemui/dynamicisland/IslandItem;->progressMax:J

    const-wide/16 v7, 0x0

    cmp-long v0, v5, v7

    if-lez v0, :cond_d

    .line 1643
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpProgressRow:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v4}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 1644
    iget v0, p1, Lcom/android/systemui/dynamicisland/IslandItem;->accentColor:I

    invoke-static {v0}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v0

    .line 1645
    iget-object v5, p1, Lcom/android/systemui/dynamicisland/IslandItem;->mediaController:Landroid/media/session/MediaController;

    if-eqz v5, :cond_c

    .line 1646
    iget-object v5, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpSeekBar:Landroid/widget/SeekBar;

    invoke-virtual {v5, v4}, Landroid/widget/SeekBar;->setVisibility(I)V

    .line 1647
    iget-object v5, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpProgressBar:Landroid/widget/ProgressBar;

    invoke-virtual {v5, v3}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 1648
    iget-object v5, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpSeekBar:Landroid/widget/SeekBar;

    invoke-virtual {v5, v0}, Landroid/widget/SeekBar;->setProgressTintList(Landroid/content/res/ColorStateList;)V

    .line 1649
    iget-object v5, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpSeekBar:Landroid/widget/SeekBar;

    invoke-virtual {v5, v0}, Landroid/widget/SeekBar;->setThumbTintList(Landroid/content/res/ColorStateList;)V

    .line 1650
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpElapsedText:Landroid/widget/TextView;

    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setVisibility(I)V

    .line 1651
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpDurationText:Landroid/widget/TextView;

    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setVisibility(I)V

    .line 1652
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpDurationText:Landroid/widget/TextView;

    iget-wide v5, p1, Lcom/android/systemui/dynamicisland/IslandItem;->progressMax:J

    invoke-static {v5, v6}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->formatMs(J)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1653
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpSeekBar:Landroid/widget/SeekBar;

    const/16 v5, 0x3e8

    invoke-virtual {v0, v5}, Landroid/widget/SeekBar;->setMax(I)V

    .line 1654
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpSeekBar:Landroid/widget/SeekBar;

    iget-boolean v5, p1, Lcom/android/systemui/dynamicisland/IslandItem;->canSeekMedia:Z

    invoke-virtual {v0, v5}, Landroid/widget/SeekBar;->setEnabled(Z)V

    goto :goto_6

    .line 1656
    :cond_c
    iget-object v5, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpSeekBar:Landroid/widget/SeekBar;

    invoke-virtual {v5, v3}, Landroid/widget/SeekBar;->setVisibility(I)V

    .line 1657
    iget-object v5, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpProgressBar:Landroid/widget/ProgressBar;

    invoke-virtual {v5, v4}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 1658
    iget-object v5, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpProgressBar:Landroid/widget/ProgressBar;

    invoke-virtual {v5, v0}, Landroid/widget/ProgressBar;->setProgressTintList(Landroid/content/res/ColorStateList;)V

    .line 1659
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpProgressBar:Landroid/widget/ProgressBar;

    const-wide/32 v5, 0x7fffffff

    iget-wide v7, p1, Lcom/android/systemui/dynamicisland/IslandItem;->progressMax:J

    invoke-static {v5, v6, v7, v8}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v5

    long-to-int v5, v5

    invoke-virtual {v0, v5}, Landroid/widget/ProgressBar;->setMax(I)V

    .line 1660
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpProgressBar:Landroid/widget/ProgressBar;

    iget-wide v5, p1, Lcom/android/systemui/dynamicisland/IslandItem;->progressMax:J

    iget-wide v7, p1, Lcom/android/systemui/dynamicisland/IslandItem;->progressValue:J

    invoke-static {v5, v6, v7, v8}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v5

    long-to-int v5, v5

    invoke-virtual {v0, v5}, Landroid/widget/ProgressBar;->setProgress(I)V

    .line 1661
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpElapsedText:Landroid/widget/TextView;

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setVisibility(I)V

    .line 1662
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpDurationText:Landroid/widget/TextView;

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setVisibility(I)V

    .line 1664
    :goto_6
    goto :goto_7

    .line 1665
    :cond_d
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpProgressRow:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 1668
    :goto_7
    iget-object v0, p1, Lcom/android/systemui/dynamicisland/IslandItem;->mediaController:Landroid/media/session/MediaController;

    if-eqz v0, :cond_f

    .line 1669
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpActionsRow:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v4}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 1670
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mMediaControlsGroup:Landroid/widget/FrameLayout;

    invoke-virtual {v0, v4}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 1671
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCustomActionsGroup:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 1672
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mPlayPauseBg:Landroid/graphics/drawable/GradientDrawable;

    const v1, -0x19000001

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 1673
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mGlyphPlayPause:Lcom/android/systemui/dynamicisland/GlyphIconView;

    .line 1674
    iget-boolean p1, p1, Lcom/android/systemui/dynamicisland/IslandItem;->waveformPlaying:Z

    if-eqz p1, :cond_e

    const/16 p1, 0xb

    goto :goto_8

    :cond_e
    const/16 p1, 0xa

    .line 1673
    :goto_8
    const/high16 v1, -0x1a000000

    invoke-virtual {v0, p1, v1}, Lcom/android/systemui/dynamicisland/GlyphIconView;->setGlyph(II)V

    goto/16 :goto_a

    .line 1677
    :cond_f
    iget-object v0, p1, Lcom/android/systemui/dynamicisland/IslandItem;->actions:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_11

    .line 1678
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpActionsRow:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v4}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 1679
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mMediaControlsGroup:Landroid/widget/FrameLayout;

    invoke-virtual {v0, v3}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 1680
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCustomActionsGroup:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v4}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 1681
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCustomActionsGroup:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->removeAllViews()V

    .line 1682
    iget-object p1, p1, Lcom/android/systemui/dynamicisland/IslandItem;->actions:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_9
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_10

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/systemui/dynamicisland/IslandItem$ActionItem;

    .line 1683
    new-instance v3, Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-direct {v3, v5}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 1684
    iget-object v5, v0, Lcom/android/systemui/dynamicisland/IslandItem$ActionItem;->label:Ljava/lang/String;

    invoke-virtual {v3, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1685
    const/4 v5, -0x1

    invoke-virtual {v3, v5}, Landroid/widget/TextView;->setTextColor(I)V

    .line 1686
    const/high16 v5, 0x41400000    # 12.0f

    invoke-virtual {v3, v2, v5}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 1687
    const-string v6, "sans-serif-medium"

    invoke-static {v6, v4}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object v6

    invoke-virtual {v3, v6}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 1688
    invoke-direct {p0, v5}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v6

    const/high16 v7, 0x40c00000    # 6.0f

    invoke-direct {p0, v7}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v8

    invoke-direct {p0, v5}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v5

    invoke-direct {p0, v7}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v7

    invoke-virtual {v3, v6, v8, v5, v7}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 1689
    new-instance v5, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v5}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 1690
    invoke-virtual {v5, v1}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 1691
    const/high16 v6, 0x41600000    # 14.0f

    invoke-direct {p0, v6}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v6

    int-to-float v6, v6

    invoke-virtual {v5, v6}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 1692
    invoke-virtual {v3, v5}, Landroid/widget/TextView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 1693
    new-instance v5, Lcom/android/systemui/dynamicisland/IslandOverlayView$$ExternalSyntheticLambda6;

    invoke-direct {v5, p0, v0}, Lcom/android/systemui/dynamicisland/IslandOverlayView$$ExternalSyntheticLambda6;-><init>(Lcom/android/systemui/dynamicisland/IslandOverlayView;Lcom/android/systemui/dynamicisland/IslandItem$ActionItem;)V

    invoke-virtual {v3, v5}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1697
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v5, -0x2

    invoke-direct {v0, v5, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 1700
    const/high16 v5, 0x41000000    # 8.0f

    invoke-direct {p0, v5}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v5

    invoke-virtual {v0, v5}, Landroid/widget/LinearLayout$LayoutParams;->setMarginStart(I)V

    .line 1701
    iget-object v5, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCustomActionsGroup:Landroid/widget/LinearLayout;

    invoke-virtual {v5, v3, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 1702
    goto :goto_9

    :cond_10
    goto :goto_a

    .line 1704
    :cond_11
    iget-object p1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpActionsRow:Landroid/widget/LinearLayout;

    invoke-virtual {p1, v3}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 1706
    :goto_a
    return-void
.end method

.method private cancelAllAnimations()V
    .locals 2

    .line 1045
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mMorphRunning:Z

    .line 1046
    iput v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mMorphMode:I

    .line 1047
    iput-boolean v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mPressAnimRunning:Z

    .line 1048
    invoke-static {}, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;

    move-result-object v0

    iget-object v1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mFrameCallback:Landroid/view/Choreographer$FrameCallback;

    invoke-virtual {v0, v1}, Landroid/view/Choreographer;->removeFrameCallback(Landroid/view/Choreographer$FrameCallback;)V

    .line 1049
    return-void
.end method

.method private cancelMorph()V
    .locals 2

    .line 1037
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mMorphRunning:Z

    .line 1038
    iput v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mMorphMode:I

    .line 1039
    iget-boolean v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mPressAnimRunning:Z

    if-nez v0, :cond_0

    .line 1040
    invoke-static {}, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;

    move-result-object v0

    iget-object v1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mFrameCallback:Landroid/view/Choreographer$FrameCallback;

    invoke-virtual {v0, v1}, Landroid/view/Choreographer;->removeFrameCallback(Landroid/view/Choreographer$FrameCallback;)V

    .line 1042
    :cond_0
    return-void
.end method

.method private dp(F)I
    .locals 2

    .line 1827
    nop

    .line 1828
    invoke-virtual {p0}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    .line 1827
    const/4 v1, 0x1

    invoke-static {v1, p1, v0}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result p1

    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    move-result p1

    return p1
.end method

.method private static evalCouiSpring(FDD)F
    .locals 9

    .line 1387
    const/4 v0, 0x0

    cmpg-float v1, p0, v0

    if-gtz v1, :cond_0

    .line 1388
    return v0

    .line 1390
    :cond_0
    const/high16 v0, 0x3f800000    # 1.0f

    cmpl-float v1, p0, v0

    if-ltz v1, :cond_1

    .line 1391
    return v0

    .line 1393
    :cond_1
    const-wide v1, 0x3fa999999999999aL    # 0.05

    invoke-static {v1, v2, p1, p2}, Ljava/lang/Math;->max(DD)D

    move-result-wide p1

    const-wide v1, 0x401921fb54442d18L    # 6.283185307179586

    div-double v5, v1, p1

    .line 1394
    const-wide/high16 p1, 0x3ff0000000000000L    # 1.0

    sub-double v7, p1, p3

    .line 1395
    const-wide/high16 v3, 0x3ff0000000000000L    # 1.0

    invoke-static/range {v3 .. v8}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->rawCouiSpring(DDD)D

    move-result-wide p1

    .line 1396
    invoke-static {p1, p2}, Ljava/lang/Math;->abs(D)D

    move-result-wide p3

    const-wide v1, 0x3eb0c6f7a0b5ed8dL    # 1.0E-6

    cmpg-double p3, p3, v1

    if-gez p3, :cond_2

    .line 1397
    return v0

    .line 1399
    :cond_2
    float-to-double v3, p0

    invoke-static/range {v3 .. v8}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->rawCouiSpring(DDD)D

    move-result-wide p3

    div-double/2addr p3, p1

    double-to-float p0, p3

    return p0
.end method

.method private static evalCubicBezier(FFFFF)F
    .locals 9

    .line 1417
    const/4 v0, 0x0

    cmpg-float v1, p0, v0

    if-gtz v1, :cond_0

    .line 1418
    return v0

    .line 1420
    :cond_0
    const/high16 v1, 0x3f800000    # 1.0f

    cmpl-float v2, p0, v1

    if-ltz v2, :cond_1

    .line 1421
    return v1

    .line 1423
    :cond_1
    nop

    .line 1424
    const/4 v2, 0x0

    move v3, p0

    :goto_0
    const/4 v4, 0x6

    const/high16 v5, 0x40400000    # 3.0f

    if-ge v2, v4, :cond_5

    .line 1425
    sub-float v4, v1, v3

    .line 1426
    mul-float v6, v4, v5

    mul-float v7, v6, v4

    mul-float v8, v7, v3

    mul-float/2addr v8, p1

    mul-float/2addr v6, v3

    mul-float/2addr v6, v3

    mul-float/2addr v6, p3

    add-float/2addr v8, v6

    mul-float v6, v3, v3

    mul-float/2addr v6, v3

    add-float/2addr v8, v6

    .line 1427
    mul-float/2addr v7, p1

    const/high16 v6, 0x40c00000    # 6.0f

    mul-float/2addr v4, v6

    mul-float/2addr v4, v3

    sub-float v6, p3, p1

    mul-float/2addr v4, v6

    add-float/2addr v7, v4

    mul-float v4, v3, v5

    mul-float/2addr v4, v3

    sub-float v6, v1, p3

    mul-float/2addr v4, v6

    add-float/2addr v7, v4

    .line 1428
    invoke-static {v7}, Ljava/lang/Math;->abs(F)F

    move-result v4

    const v6, 0x3727c5ac    # 1.0E-5f

    cmpg-float v4, v4, v6

    if-gez v4, :cond_2

    .line 1429
    goto :goto_2

    .line 1431
    :cond_2
    sub-float/2addr v8, p0

    div-float/2addr v8, v7

    sub-float/2addr v3, v8

    .line 1432
    cmpg-float v4, v3, v0

    if-gez v4, :cond_3

    .line 1433
    move v3, v0

    goto :goto_1

    .line 1434
    :cond_3
    cmpl-float v4, v3, v1

    if-lez v4, :cond_4

    .line 1435
    move v3, v1

    .line 1424
    :cond_4
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 1438
    :cond_5
    :goto_2
    sub-float/2addr v1, v3

    .line 1439
    mul-float/2addr v5, v1

    mul-float/2addr v1, v5

    mul-float/2addr v1, v3

    mul-float/2addr v1, p2

    mul-float/2addr v5, v3

    mul-float/2addr v5, v3

    mul-float/2addr v5, p4

    add-float/2addr v1, v5

    mul-float p0, v3, v3

    mul-float/2addr p0, v3

    add-float/2addr v1, p0

    return v1
.end method

.method private finishMorph()V
    .locals 7

    .line 1341
    iget v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mMorphMode:I

    .line 1342
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mMorphRunning:Z

    .line 1343
    iput v1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mMorphMode:I

    .line 1345
    iget-object v2, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mPillContainer:Landroid/widget/FrameLayout;

    const/high16 v3, 0x3f800000    # 1.0f

    invoke-virtual {v2, v3}, Landroid/widget/FrameLayout;->setAlpha(F)V

    .line 1346
    iget-object v2, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactLeftSlot:Landroid/widget/FrameLayout;

    invoke-virtual {v2, v3}, Landroid/widget/FrameLayout;->setAlpha(F)V

    .line 1347
    iget-object v2, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactLeftSlot:Landroid/widget/FrameLayout;

    const/4 v4, 0x0

    invoke-virtual {v2, v4}, Landroid/widget/FrameLayout;->setTranslationX(F)V

    .line 1348
    iget-object v2, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactRightSlot:Landroid/widget/FrameLayout;

    invoke-virtual {v2, v3}, Landroid/widget/FrameLayout;->setAlpha(F)V

    .line 1349
    iget-object v2, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactRightSlot:Landroid/widget/FrameLayout;

    invoke-virtual {v2, v4}, Landroid/widget/FrameLayout;->setTranslationX(F)V

    .line 1350
    iget-object v2, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactRow:Landroid/widget/LinearLayout;

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->setScaleX(F)V

    .line 1351
    iget-object v2, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactRow:Landroid/widget/LinearLayout;

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->setScaleY(F)V

    .line 1352
    iget-object v2, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactRow:Landroid/widget/LinearLayout;

    invoke-virtual {v2, v4}, Landroid/widget/LinearLayout;->setTranslationY(F)V

    .line 1353
    iget-object v2, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpandedCard:Landroid/widget/LinearLayout;

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->setScaleX(F)V

    .line 1354
    iget-object v2, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpandedCard:Landroid/widget/LinearLayout;

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->setScaleY(F)V

    .line 1355
    iget-object v2, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpandedCard:Landroid/widget/LinearLayout;

    invoke-virtual {v2, v4}, Landroid/widget/LinearLayout;->setTranslationY(F)V

    .line 1357
    const/4 v2, 0x2

    const/16 v5, 0x8

    if-ne v0, v2, :cond_0

    .line 1358
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactRow:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v5}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 1359
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactRow:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->setAlpha(F)V

    .line 1360
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpandedCard:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 1361
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpandedCard:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->setAlpha(F)V

    goto :goto_0

    .line 1362
    :cond_0
    const/4 v2, 0x3

    if-ne v0, v2, :cond_1

    .line 1363
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpandedCard:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v5}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 1364
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpandedCard:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v4}, Landroid/widget/LinearLayout;->setAlpha(F)V

    .line 1365
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactRow:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 1366
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactRow:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->setAlpha(F)V

    goto :goto_0

    .line 1367
    :cond_1
    const/4 v1, 0x5

    if-ne v0, v1, :cond_2

    iget-boolean v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mHasActiveContent:Z

    if-nez v0, :cond_2

    .line 1368
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mBlurBackdrop:Landroid/view/View;

    invoke-static {v0}, Lcom/android/systemui/dynamicisland/IslandOverlayView$BlurEngine;->clearBlur(Landroid/view/View;)V

    .line 1369
    invoke-virtual {p0, v5}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->setVisibility(I)V

    .line 1370
    return-void

    .line 1373
    :cond_2
    :goto_0
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mTargetRect:Landroid/graphics/RectF;

    iget v2, v0, Landroid/graphics/RectF;->left:F

    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mTargetRect:Landroid/graphics/RectF;

    iget v3, v0, Landroid/graphics/RectF;->top:F

    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mTargetRect:Landroid/graphics/RectF;

    .line 1376
    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    move-result v0

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v4

    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mTargetRect:Landroid/graphics/RectF;

    .line 1377
    invoke-virtual {v0}, Landroid/graphics/RectF;->height()F

    move-result v0

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v5

    iget v6, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mTargetCorner:F

    .line 1373
    move-object v1, p0

    invoke-direct/range {v1 .. v6}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->applyStaticGeometry(FFIIF)V

    .line 1380
    const/4 v0, 0x1

    iget v2, v1, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mTargetCorner:F

    invoke-direct {p0, v0, v2}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->applyHardwareBlur(ZF)V

    .line 1381
    return-void
.end method

.method private static formatMs(J)Ljava/lang/String;
    .locals 8

    .line 1816
    const-wide/16 v0, 0x3e8

    div-long/2addr p0, v0

    const-wide/16 v0, 0x0

    invoke-static {v0, v1, p0, p1}, Ljava/lang/Math;->max(JJ)J

    move-result-wide p0

    .line 1817
    const-wide/16 v2, 0xe10

    div-long v4, p0, v2

    .line 1818
    rem-long v2, p0, v2

    const-wide/16 v6, 0x3c

    div-long/2addr v2, v6

    .line 1819
    rem-long/2addr p0, v6

    .line 1820
    cmp-long v0, v4, v0

    if-lez v0, :cond_0

    .line 1821
    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p0

    filled-new-array {v0, v1, p0}, [Ljava/lang/Object;

    move-result-object p0

    const-string p1, "%d:%02d:%02d"

    invoke-static {p1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 1823
    :cond_0
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p0

    filled-new-array {v0, p0}, [Ljava/lang/Object;

    move-result-object p0

    const-string p1, "%02d:%02d"

    invoke-static {p1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private getCutoutDotRect(Landroid/graphics/RectF;)V
    .locals 6

    .line 983
    const/high16 v0, 0x41d00000    # 26.0f

    invoke-direct {p0, v0}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v0

    iget v1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCutoutGapPx:I

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 984
    const/high16 v1, 0x41b00000    # 22.0f

    invoke-direct {p0, v1}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v1

    iget v2, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCutoutHeightPx:I

    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    move-result v1

    .line 985
    invoke-direct {p0}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->getOverlayWidth()I

    move-result v2

    int-to-float v2, v2

    const/high16 v3, 0x3f000000    # 0.5f

    mul-float/2addr v2, v3

    iget v4, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCutoutCenterOffsetX:I

    int-to-float v4, v4

    add-float/2addr v2, v4

    .line 986
    int-to-float v0, v0

    mul-float v4, v0, v3

    sub-float/2addr v2, v4

    .line 987
    iget v4, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactTopYPx:I

    int-to-float v4, v4

    iget v5, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactHeightPx:I

    sub-int/2addr v5, v1

    int-to-float v5, v5

    mul-float/2addr v5, v3

    add-float/2addr v4, v5

    .line 988
    add-float/2addr v0, v2

    int-to-float v1, v1

    add-float/2addr v1, v4

    invoke-virtual {p1, v2, v4, v0, v1}, Landroid/graphics/RectF;->set(FFFF)V

    .line 989
    return-void
.end method

.method private getOverlayWidth()I
    .locals 1

    .line 978
    invoke-virtual {p0}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->getWidth()I

    move-result v0

    .line 979
    if-lez v0, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    :goto_0
    return v0
.end method

.method private isPointInsidePill(FF)Z
    .locals 7

    .line 966
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCurrRect:Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    move-result v0

    const/4 v1, 0x0

    cmpl-float v0, v0, v1

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-lez v0, :cond_1

    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCurrRect:Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/RectF;->height()F

    move-result v0

    cmpl-float v0, v0, v1

    if-lez v0, :cond_1

    .line 967
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCurrRect:Landroid/graphics/RectF;

    iget v0, v0, Landroid/graphics/RectF;->left:F

    const/high16 v1, 0x40c00000    # 6.0f

    invoke-direct {p0, v1}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v4

    int-to-float v4, v4

    sub-float/2addr v0, v4

    cmpl-float v0, p1, v0

    if-ltz v0, :cond_0

    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCurrRect:Landroid/graphics/RectF;

    iget v0, v0, Landroid/graphics/RectF;->right:F

    invoke-direct {p0, v1}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v4

    int-to-float v4, v4

    add-float/2addr v0, v4

    cmpg-float p1, p1, v0

    if-gtz p1, :cond_0

    iget-object p1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCurrRect:Landroid/graphics/RectF;

    iget p1, p1, Landroid/graphics/RectF;->top:F

    .line 968
    invoke-direct {p0, v1}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v0

    int-to-float v0, v0

    sub-float/2addr p1, v0

    cmpl-float p1, p2, p1

    if-ltz p1, :cond_0

    iget-object p1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCurrRect:Landroid/graphics/RectF;

    iget p1, p1, Landroid/graphics/RectF;->bottom:F

    invoke-direct {p0, v1}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v0

    int-to-float v0, v0

    add-float/2addr p1, v0

    cmpg-float p1, p2, p1

    if-gtz p1, :cond_0

    goto :goto_0

    :cond_0
    move v2, v3

    .line 967
    :goto_0
    return v2

    .line 970
    :cond_1
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mPillContainer:Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getLeft()I

    move-result v0

    const/high16 v1, 0x40800000    # 4.0f

    invoke-direct {p0, v1}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v4

    sub-int/2addr v0, v4

    int-to-float v0, v0

    .line 971
    iget-object v4, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mPillContainer:Landroid/widget/FrameLayout;

    invoke-virtual {v4}, Landroid/widget/FrameLayout;->getTop()I

    move-result v4

    invoke-direct {p0, v1}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v1

    sub-int/2addr v4, v1

    int-to-float v1, v4

    .line 972
    iget-object v4, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mPillContainer:Landroid/widget/FrameLayout;

    invoke-virtual {v4}, Landroid/widget/FrameLayout;->getWidth()I

    move-result v4

    int-to-float v4, v4

    add-float/2addr v4, v0

    const/high16 v5, 0x41000000    # 8.0f

    invoke-direct {p0, v5}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v6

    int-to-float v6, v6

    add-float/2addr v4, v6

    .line 973
    iget-object v6, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mPillContainer:Landroid/widget/FrameLayout;

    invoke-virtual {v6}, Landroid/widget/FrameLayout;->getHeight()I

    move-result v6

    int-to-float v6, v6

    add-float/2addr v6, v1

    invoke-direct {p0, v5}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v5

    int-to-float v5, v5

    add-float/2addr v6, v5

    .line 974
    cmpl-float v0, p1, v0

    if-ltz v0, :cond_2

    cmpg-float p1, p1, v4

    if-gtz p1, :cond_2

    cmpl-float p1, p2, v1

    if-ltz p1, :cond_2

    cmpg-float p1, p2, v6

    if-gtz p1, :cond_2

    goto :goto_1

    :cond_2
    move v2, v3

    :goto_1
    return v2
.end method

.method private launchContentIntent()V
    .locals 2

    .line 1775
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCurrentItem:Lcom/android/systemui/dynamicisland/IslandItem;

    if-nez v0, :cond_0

    .line 1776
    return-void

    .line 1778
    :cond_0
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCurrentItem:Lcom/android/systemui/dynamicisland/IslandItem;

    iget-object v0, v0, Lcom/android/systemui/dynamicisland/IslandItem;->contentIntent:Landroid/app/PendingIntent;

    if-eqz v0, :cond_1

    .line 1779
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCurrentItem:Lcom/android/systemui/dynamicisland/IslandItem;

    iget-object v0, v0, Lcom/android/systemui/dynamicisland/IslandItem;->contentIntent:Landroid/app/PendingIntent;

    invoke-direct {p0, v0}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->sendPendingIntent(Landroid/app/PendingIntent;)V

    .line 1781
    :cond_1
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCurrentItem:Lcom/android/systemui/dynamicisland/IslandItem;

    iget-boolean v0, v0, Lcom/android/systemui/dynamicisland/IslandItem;->transientItem:Z

    if-eqz v0, :cond_2

    .line 1782
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCallbacks:Lcom/android/systemui/dynamicisland/IslandOverlayView$Callbacks;

    iget-object v1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCurrentItem:Lcom/android/systemui/dynamicisland/IslandItem;

    iget-object v1, v1, Lcom/android/systemui/dynamicisland/IslandItem;->key:Ljava/lang/String;

    invoke-interface {v0, v1}, Lcom/android/systemui/dynamicisland/IslandOverlayView$Callbacks;->onDismissTransient(Ljava/lang/String;)V

    .line 1784
    :cond_2
    invoke-virtual {p0}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->collapse()V

    .line 1785
    return-void
.end method

.method private layoutVisualLayersLocked()V
    .locals 7

    .line 1203
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCurrRect:Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    move-result v0

    const/4 v1, 0x0

    cmpg-float v0, v0, v1

    if-lez v0, :cond_1

    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCurrRect:Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/RectF;->height()F

    move-result v0

    cmpg-float v0, v0, v1

    if-gtz v0, :cond_0

    goto :goto_0

    .line 1206
    :cond_0
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCurrRect:Landroid/graphics/RectF;

    iget v0, v0, Landroid/graphics/RectF;->left:F

    iget v1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mBoxLeft:I

    int-to-float v1, v1

    sub-float/2addr v0, v1

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    const/4 v1, 0x0

    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 1207
    iget-object v2, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCurrRect:Landroid/graphics/RectF;

    iget v2, v2, Landroid/graphics/RectF;->top:F

    iget v3, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mBoxTop:I

    int-to-float v3, v3

    sub-float/2addr v2, v3

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v2

    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    move-result v1

    .line 1208
    iget v2, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mBoxW:I

    add-int/lit8 v3, v0, 0x1

    iget-object v4, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCurrRect:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->right:F

    iget v5, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mBoxLeft:I

    int-to-float v5, v5

    sub-float/2addr v4, v5

    invoke-static {v4}, Ljava/lang/Math;->round(F)I

    move-result v4

    invoke-static {v3, v4}, Ljava/lang/Math;->max(II)I

    move-result v3

    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    move-result v2

    .line 1209
    iget v3, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mBoxH:I

    add-int/lit8 v4, v1, 0x1

    iget-object v5, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCurrRect:Landroid/graphics/RectF;

    iget v5, v5, Landroid/graphics/RectF;->bottom:F

    iget v6, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mBoxTop:I

    int-to-float v6, v6

    sub-float/2addr v5, v6

    invoke-static {v5}, Ljava/lang/Math;->round(F)I

    move-result v5

    invoke-static {v4, v5}, Ljava/lang/Math;->max(II)I

    move-result v4

    invoke-static {v3, v4}, Ljava/lang/Math;->min(II)I

    move-result v3

    .line 1210
    iget-object v4, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mBlurBackdrop:Landroid/view/View;

    invoke-virtual {v4, v0, v1, v2, v3}, Landroid/view/View;->layout(IIII)V

    .line 1211
    iget-object v4, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mGlassTintView:Landroid/view/View;

    invoke-virtual {v4, v0, v1, v2, v3}, Landroid/view/View;->layout(IIII)V

    .line 1212
    iget-object v4, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mRimView:Landroid/view/View;

    invoke-virtual {v4, v0, v1, v2, v3}, Landroid/view/View;->layout(IIII)V

    .line 1213
    return-void

    .line 1204
    :cond_1
    :goto_0
    return-void
.end method

.method private static makeGlassCircleButton(Landroid/content/Context;III)Landroid/widget/FrameLayout;
    .locals 2

    .line 1806
    new-instance v0, Landroid/widget/FrameLayout;

    invoke-direct {v0, p0}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 1807
    new-instance p0, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {p0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 1808
    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Landroid/graphics/drawable/GradientDrawable;->setShape(I)V

    .line 1809
    invoke-virtual {p0, p1}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 1810
    invoke-static {v1, p3}, Ljava/lang/Math;->max(II)I

    move-result p1

    invoke-virtual {p0, p1, p2}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    .line 1811
    invoke-virtual {v0, p0}, Landroid/widget/FrameLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 1812
    return-object v0
.end method

.method private measureCompactTarget()[I
    .locals 6

    .line 994
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactRow:Landroid/widget/LinearLayout;

    .line 995
    const/high16 v1, 0x437a0000    # 250.0f

    invoke-direct {p0, v1}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v1

    const/high16 v2, -0x80000000

    invoke-static {v1, v2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v1

    iget v2, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactHeightPx:I

    .line 996
    const/high16 v3, 0x40000000    # 2.0f

    invoke-static {v2, v3}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v2

    .line 994
    invoke-virtual {v0, v1, v2}, Landroid/widget/LinearLayout;->measure(II)V

    .line 998
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactRow:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getMeasuredWidth()I

    move-result v0

    .line 999
    iget v1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCutoutGapPx:I

    const/high16 v2, 0x42100000    # 36.0f

    invoke-direct {p0, v2}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v2

    add-int/2addr v1, v2

    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    move-result v1

    .line 1000
    sub-int v2, v1, v0

    div-int/lit8 v2, v2, 0x2

    .line 1001
    iput v2, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mLastRowLeftInPill:I

    .line 1002
    iget-object v3, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactRow:Landroid/widget/LinearLayout;

    int-to-float v0, v0

    const/high16 v4, 0x3f000000    # 0.5f

    mul-float/2addr v0, v4

    invoke-virtual {v3, v0}, Landroid/widget/LinearLayout;->setPivotX(F)V

    .line 1003
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactRow:Landroid/widget/LinearLayout;

    iget v3, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactHeightPx:I

    int-to-float v3, v3

    mul-float/2addr v3, v4

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->setPivotY(F)V

    .line 1005
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactLeftSlot:Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getVisibility()I

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactLeftSlot:Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getMeasuredWidth()I

    move-result v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 1007
    :goto_0
    iget-object v3, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactRow:Landroid/widget/LinearLayout;

    invoke-virtual {v3}, Landroid/widget/LinearLayout;->getPaddingLeft()I

    move-result v3

    add-int/2addr v2, v3

    add-int/2addr v2, v0

    int-to-float v0, v2

    iget v2, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCutoutGapPx:I

    int-to-float v2, v2

    mul-float/2addr v2, v4

    add-float/2addr v0, v2

    .line 1008
    invoke-direct {p0}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->getOverlayWidth()I

    move-result v2

    int-to-float v2, v2

    mul-float/2addr v2, v4

    iget v3, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCutoutCenterOffsetX:I

    int-to-float v3, v3

    add-float/2addr v2, v3

    .line 1009
    sub-float/2addr v2, v0

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v0

    .line 1010
    const/high16 v2, 0x40800000    # 4.0f

    invoke-direct {p0, v2}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v3

    invoke-direct {p0, v2}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v4

    invoke-direct {p0}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->getOverlayWidth()I

    move-result v5

    sub-int/2addr v5, v1

    invoke-direct {p0, v2}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v2

    sub-int/2addr v5, v2

    invoke-static {v4, v5}, Ljava/lang/Math;->max(II)I

    move-result v2

    invoke-static {v2, v0}, Ljava/lang/Math;->min(II)I

    move-result v0

    invoke-static {v3, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 1011
    iget v2, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactHeightPx:I

    filled-new-array {v1, v2, v0}, [I

    move-result-object v0

    return-object v0
.end method

.method private measureExpandedTarget()[I
    .locals 4

    .line 1015
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpandedCard:Landroid/widget/LinearLayout;

    iget v1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpandedWidthPx:I

    .line 1016
    const/high16 v2, 0x40000000    # 2.0f

    invoke-static {v1, v2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v1

    .line 1017
    const/high16 v2, 0x43a00000    # 320.0f

    invoke-direct {p0, v2}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v2

    const/high16 v3, -0x80000000

    invoke-static {v2, v3}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v2

    .line 1015
    invoke-virtual {v0, v1, v2}, Landroid/widget/LinearLayout;->measure(II)V

    .line 1019
    const/high16 v0, 0x42d40000    # 106.0f

    invoke-direct {p0, v0}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v0

    iget-object v1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpandedCard:Landroid/widget/LinearLayout;

    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getMeasuredHeight()I

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 1020
    invoke-direct {p0}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->getOverlayWidth()I

    move-result v1

    iget v2, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpandedWidthPx:I

    sub-int/2addr v1, v2

    int-to-float v1, v1

    const/high16 v2, 0x3f000000    # 0.5f

    mul-float/2addr v1, v2

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v1

    .line 1021
    iget v2, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpandedWidthPx:I

    const/high16 v3, 0x40800000    # 4.0f

    invoke-direct {p0, v3}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v3

    invoke-static {v3, v1}, Ljava/lang/Math;->max(II)I

    move-result v1

    filled-new-array {v2, v0, v1}, [I

    move-result-object v0

    return-object v0
.end method

.method private static rawCouiSpring(DDD)D
    .locals 6

    .line 1403
    const-wide/high16 v0, 0x3ff0000000000000L    # 1.0

    cmpg-double v2, p4, v0

    if-gez v2, :cond_0

    .line 1404
    mul-double v2, p4, p4

    sub-double v2, v0, v2

    invoke-static {v2, v3}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v2

    mul-double/2addr v2, p2

    .line 1405
    mul-double v4, p4, p2

    div-double/2addr v4, v2

    .line 1406
    neg-double p4, p4

    mul-double/2addr p4, p2

    mul-double/2addr p4, p0

    invoke-static {p4, p5}, Ljava/lang/Math;->exp(D)D

    move-result-wide p2

    mul-double/2addr v2, p0

    .line 1407
    invoke-static {v2, v3}, Ljava/lang/Math;->cos(D)D

    move-result-wide p0

    invoke-static {v2, v3}, Ljava/lang/Math;->sin(D)D

    move-result-wide p4

    mul-double/2addr v4, p4

    add-double/2addr p0, v4

    mul-double/2addr p2, p0

    sub-double/2addr v0, p2

    .line 1406
    return-wide v0

    .line 1409
    :cond_0
    neg-double p4, p2

    mul-double/2addr p4, p0

    invoke-static {p4, p5}, Ljava/lang/Math;->exp(D)D

    move-result-wide p4

    mul-double/2addr p2, p0

    add-double/2addr p2, v0

    mul-double/2addr p4, p2

    sub-double/2addr v0, p4

    return-wide v0
.end method

.method private recomputeCutoutLayout(Z)V
    .locals 13

    .line 601
    iget v1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mBaseCutoutTopPx:I

    if-lez v1, :cond_0

    iget v1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mBaseCutoutTopPx:I

    goto :goto_0

    :cond_0
    const/high16 v1, 0x41300000    # 11.0f

    invoke-direct {p0, v1}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v1

    .line 602
    :goto_0
    iget v2, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mBaseCutoutWidthPx:I

    const/high16 v3, 0x41d40000    # 26.5f

    if-lez v2, :cond_1

    iget v2, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mBaseCutoutWidthPx:I

    goto :goto_1

    :cond_1
    invoke-direct {p0, v3}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v2

    .line 603
    :goto_1
    iget v4, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mBaseCutoutHeightPx:I

    if-lez v4, :cond_2

    iget v3, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mBaseCutoutHeightPx:I

    goto :goto_2

    :cond_2
    invoke-direct {p0, v3}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v3

    .line 604
    :goto_2
    iget v4, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mBaseCutoutOffsetX:I

    iget v5, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mTuneCenterOffsetDp:I

    int-to-float v5, v5

    invoke-direct {p0, v5}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v5

    add-int/2addr v4, v5

    .line 606
    const/high16 v5, 0x41c00000    # 24.0f

    invoke-direct {p0, v5}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v6

    iget v7, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mTuneGapOffsetDp:I

    add-int/lit8 v7, v7, 0x7

    int-to-float v7, v7

    invoke-direct {p0, v7}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v7

    add-int/2addr v2, v7

    invoke-static {v6, v2}, Ljava/lang/Math;->max(II)I

    move-result v2

    .line 607
    invoke-direct {p0, v5}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v5

    const/high16 v6, 0x42300000    # 44.0f

    invoke-direct {p0, v6}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v6

    iget v7, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mTuneHeightOffsetDp:I

    add-int/lit8 v7, v7, 0x5

    int-to-float v7, v7

    invoke-direct {p0, v7}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v7

    add-int/2addr v7, v3

    invoke-static {v6, v7}, Ljava/lang/Math;->min(II)I

    move-result v6

    invoke-static {v5, v6}, Ljava/lang/Math;->max(II)I

    move-result v5

    .line 608
    div-int/lit8 v6, v3, 0x2

    add-int/2addr v6, v1

    .line 609
    const/high16 v7, 0x40000000    # 2.0f

    invoke-direct {p0, v7}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v7

    div-int/lit8 v8, v5, 0x2

    sub-int/2addr v6, v8

    iget v8, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mTuneTopOffsetDp:I

    int-to-float v8, v8

    invoke-direct {p0, v8}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v8

    add-int/2addr v6, v8

    invoke-static {v7, v6}, Ljava/lang/Math;->max(II)I

    move-result v6

    .line 610
    const/high16 v7, 0x40800000    # 4.0f

    invoke-direct {p0, v7}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v7

    const/high16 v8, 0x3f800000    # 1.0f

    invoke-direct {p0, v8}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v8

    sub-int v8, v1, v8

    iget v9, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mTuneTopOffsetDp:I

    int-to-float v9, v9

    invoke-direct {p0, v9}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v9

    add-int/2addr v8, v9

    invoke-static {v7, v8}, Ljava/lang/Math;->max(II)I

    move-result v7

    .line 611
    iget v8, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mTuneExpandedWidthDp:I

    int-to-float v8, v8

    invoke-direct {p0, v8}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v8

    invoke-virtual {p0}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    invoke-virtual {v9}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v9

    iget v9, v9, Landroid/util/DisplayMetrics;->widthPixels:I

    const/high16 v10, 0x41800000    # 16.0f

    invoke-direct {p0, v10}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v11

    sub-int/2addr v9, v11

    invoke-static {v8, v9}, Ljava/lang/Math;->min(II)I

    move-result v8

    .line 613
    iget v9, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCutoutCenterOffsetX:I

    const/4 v11, 0x0

    const/4 v12, 0x1

    if-ne v4, v9, :cond_4

    iget v9, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCutoutTopPx:I

    if-ne v1, v9, :cond_4

    iget v9, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCutoutHeightPx:I

    if-ne v3, v9, :cond_4

    iget v9, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCutoutGapPx:I

    if-ne v2, v9, :cond_4

    iget v9, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactHeightPx:I

    if-ne v5, v9, :cond_4

    iget v9, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactTopYPx:I

    if-ne v6, v9, :cond_4

    iget v9, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpandedTopYPx:I

    if-ne v7, v9, :cond_4

    iget v9, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpandedWidthPx:I

    if-eq v8, v9, :cond_3

    goto :goto_3

    :cond_3
    move v9, v11

    goto :goto_4

    :cond_4
    :goto_3
    move v9, v12

    .line 622
    :goto_4
    iput v4, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCutoutCenterOffsetX:I

    .line 623
    iput v1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCutoutTopPx:I

    .line 624
    iput v3, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCutoutHeightPx:I

    .line 625
    iput v2, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCutoutGapPx:I

    .line 626
    iput v5, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactHeightPx:I

    .line 627
    iput v6, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactTopYPx:I

    .line 628
    iput v7, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpandedTopYPx:I

    .line 629
    iput v8, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpandedWidthPx:I

    .line 631
    iget v1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCutoutTopPx:I

    iget v2, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCutoutHeightPx:I

    add-int/2addr v1, v2

    .line 632
    const/high16 v2, 0x41e00000    # 28.0f

    invoke-direct {p0, v2}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v3

    iget v4, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpandedTopYPx:I

    sub-int/2addr v1, v4

    const/high16 v4, 0x41200000    # 10.0f

    invoke-direct {p0, v4}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v4

    add-int/2addr v1, v4

    invoke-static {v3, v1}, Ljava/lang/Math;->max(II)I

    move-result v1

    .line 633
    iget-object v3, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpandedCard:Landroid/widget/LinearLayout;

    invoke-direct {p0, v10}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v4

    invoke-direct {p0, v10}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v5

    const/high16 v6, 0x41900000    # 18.0f

    invoke-direct {p0, v6}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v6

    invoke-virtual {v3, v4, v1, v5, v6}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 634
    iget-object v1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpandedCard:Landroid/widget/LinearLayout;

    iget v3, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpandedWidthPx:I

    int-to-float v3, v3

    const/high16 v4, 0x3f000000    # 0.5f

    mul-float/2addr v3, v4

    invoke-virtual {v1, v3}, Landroid/widget/LinearLayout;->setPivotX(F)V

    .line 635
    iget-object v1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpandedCard:Landroid/widget/LinearLayout;

    const/4 v3, 0x0

    invoke-virtual {v1, v3}, Landroid/widget/LinearLayout;->setPivotY(F)V

    .line 636
    iget-object v1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpandedCard:Landroid/widget/LinearLayout;

    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    .line 637
    iget v3, v1, Landroid/view/ViewGroup$LayoutParams;->width:I

    iget v5, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpandedWidthPx:I

    if-eq v3, v5, :cond_5

    .line 638
    iget v3, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpandedWidthPx:I

    iput v3, v1, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 639
    iget-object v3, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpandedCard:Landroid/widget/LinearLayout;

    invoke-virtual {v3, v1}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 642
    :cond_5
    if-eqz v9, :cond_b

    .line 643
    iget-object v1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCutoutGap:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    .line 644
    iget v3, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCutoutGapPx:I

    iput v3, v1, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 645
    iget-object v3, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCutoutGap:Landroid/view/View;

    invoke-virtual {v3, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 647
    iget-object v1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactRow:Landroid/widget/LinearLayout;

    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    .line 648
    iget v3, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactHeightPx:I

    iput v3, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 649
    iget-object v3, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactRow:Landroid/widget/LinearLayout;

    invoke-virtual {v3, v1}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 651
    iget-boolean v1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mHasActiveContent:Z

    if-eqz v1, :cond_b

    .line 652
    iget-boolean v1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpanded:Z

    const/4 v3, 0x2

    if-eqz v1, :cond_8

    .line 653
    invoke-direct {p0}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->measureExpandedTarget()[I

    move-result-object v1

    .line 654
    iget-boolean v4, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mSuspendedForSleep:Z

    if-nez v4, :cond_7

    if-eqz p1, :cond_6

    move-object v5, v1

    goto :goto_5

    .line 657
    :cond_6
    aget v3, v1, v3

    int-to-float v3, v3

    iget v4, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpandedTopYPx:I

    int-to-float v4, v4

    move-object v5, v1

    move v1, v3

    aget v3, v5, v11

    move v6, v4

    aget v4, v5, v12

    invoke-direct {p0, v2}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v2

    int-to-float v5, v2

    move v2, v6

    const/4 v6, 0x4

    move-object v0, p0

    invoke-direct/range {v0 .. v6}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->startMorph(FFIIFI)V

    goto :goto_6

    .line 654
    :cond_7
    move-object v5, v1

    .line 655
    :goto_5
    aget v1, v5, v3

    int-to-float v1, v1

    iget v3, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpandedTopYPx:I

    int-to-float v3, v3

    move v4, v3

    aget v3, v5, v11

    aget v5, v5, v12

    invoke-direct {p0, v2}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v2

    int-to-float v2, v2

    move v0, v5

    move v5, v2

    move v2, v4

    move v4, v0

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->applyStaticGeometry(FFIIF)V

    .line 659
    :goto_6
    goto :goto_8

    .line 660
    :cond_8
    invoke-direct {p0}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->measureCompactTarget()[I

    move-result-object v1

    .line 661
    iget-boolean v2, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mSuspendedForSleep:Z

    if-nez v2, :cond_a

    if-eqz p1, :cond_9

    move-object v5, v1

    move v6, v4

    goto :goto_7

    .line 664
    :cond_9
    aget v2, v1, v3

    int-to-float v2, v2

    iget v3, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactTopYPx:I

    int-to-float v3, v3

    move-object v5, v1

    move v1, v2

    move v2, v3

    aget v3, v5, v11

    move v6, v4

    aget v4, v5, v12

    aget v5, v5, v12

    int-to-float v5, v5

    mul-float/2addr v5, v6

    const/4 v6, 0x4

    move-object v0, p0

    invoke-direct/range {v0 .. v6}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->startMorph(FFIIFI)V

    goto :goto_8

    .line 661
    :cond_a
    move-object v5, v1

    move v6, v4

    .line 662
    :goto_7
    aget v1, v5, v3

    int-to-float v1, v1

    iget v2, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactTopYPx:I

    int-to-float v2, v2

    aget v3, v5, v11

    aget v4, v5, v12

    aget v5, v5, v12

    int-to-float v5, v5

    mul-float/2addr v5, v6

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->applyStaticGeometry(FFIIF)V

    .line 669
    :cond_b
    :goto_8
    return-void
.end method

.method private registerTouchableInsetsListener()V
    .locals 6

    .line 1481
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mInsetsListenerProxy:Ljava/lang/Object;

    if-eqz v0, :cond_0

    .line 1482
    return-void

    .line 1485
    :cond_0
    :try_start_0
    const-string v0, "android.view.ViewTreeObserver$OnComputeInternalInsetsListener"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 1486
    const-string v1, "android.view.ViewTreeObserver$InternalInsetsInfo"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    .line 1487
    const-string v2, "setTouchableInsets"

    sget-object v3, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    filled-new-array {v3}, [Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    .line 1488
    const-string v3, "touchableRegion"

    invoke-virtual {v1, v3}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    .line 1489
    const-class v3, Landroid/view/ViewTreeObserver;

    const-string v4, "addOnComputeInternalInsetsListener"

    filled-new-array {v0}, [Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v3

    .line 1491
    new-instance v4, Lcom/android/systemui/dynamicisland/IslandOverlayView$$ExternalSyntheticLambda5;

    invoke-direct {v4, p0, v2, v1}, Lcom/android/systemui/dynamicisland/IslandOverlayView$$ExternalSyntheticLambda5;-><init>(Lcom/android/systemui/dynamicisland/IslandOverlayView;Ljava/lang/reflect/Method;Ljava/lang/reflect/Field;)V

    .line 1510
    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    filled-new-array {v0}, [Ljava/lang/Class;

    move-result-object v0

    invoke-static {v1, v0, v4}, Ljava/lang/reflect/Proxy;->newProxyInstance(Ljava/lang/ClassLoader;[Ljava/lang/Class;Ljava/lang/reflect/InvocationHandler;)Ljava/lang/Object;

    move-result-object v0

    .line 1511
    invoke-virtual {p0}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v1

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v3, v1, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 1512
    iput-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mInsetsListenerProxy:Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1515
    goto :goto_0

    .line 1513
    :catchall_0
    move-exception v0

    .line 1514
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mInsetsListenerProxy:Ljava/lang/Object;

    .line 1516
    :goto_0
    return-void
.end method

.method private scheduleNextAnimFrame()V
    .locals 2

    .line 1052
    invoke-static {}, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;

    move-result-object v0

    iget-object v1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mFrameCallback:Landroid/view/Choreographer$FrameCallback;

    invoke-virtual {v0, v1}, Landroid/view/Choreographer;->removeFrameCallback(Landroid/view/Choreographer$FrameCallback;)V

    .line 1053
    invoke-static {}, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;

    move-result-object v0

    iget-object v1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mFrameCallback:Landroid/view/Choreographer$FrameCallback;

    invoke-virtual {v0, v1}, Landroid/view/Choreographer;->postFrameCallback(Landroid/view/Choreographer$FrameCallback;)V

    .line 1054
    return-void
.end method

.method private sendMediaAction(I)V
    .locals 2

    .line 1752
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCurrentItem:Lcom/android/systemui/dynamicisland/IslandItem;

    if-eqz v0, :cond_6

    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCurrentItem:Lcom/android/systemui/dynamicisland/IslandItem;

    iget-object v0, v0, Lcom/android/systemui/dynamicisland/IslandItem;->mediaController:Landroid/media/session/MediaController;

    if-nez v0, :cond_0

    goto :goto_4

    .line 1755
    :cond_0
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCurrentItem:Lcom/android/systemui/dynamicisland/IslandItem;

    iget-object v0, v0, Lcom/android/systemui/dynamicisland/IslandItem;->mediaController:Landroid/media/session/MediaController;

    invoke-virtual {v0}, Landroid/media/session/MediaController;->getTransportControls()Landroid/media/session/MediaController$TransportControls;

    move-result-object v0

    .line 1757
    if-gez p1, :cond_1

    .line 1758
    :try_start_0
    invoke-virtual {v0}, Landroid/media/session/MediaController$TransportControls;->skipToPrevious()V

    goto :goto_2

    .line 1759
    :cond_1
    if-lez p1, :cond_2

    .line 1760
    invoke-virtual {v0}, Landroid/media/session/MediaController$TransportControls;->skipToNext()V

    goto :goto_2

    .line 1762
    :cond_2
    iget-object p1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCurrentItem:Lcom/android/systemui/dynamicisland/IslandItem;

    iget-object p1, p1, Lcom/android/systemui/dynamicisland/IslandItem;->mediaController:Landroid/media/session/MediaController;

    invoke-virtual {p1}, Landroid/media/session/MediaController;->getPlaybackState()Landroid/media/session/PlaybackState;

    move-result-object p1

    .line 1763
    if-eqz p1, :cond_3

    invoke-virtual {p1}, Landroid/media/session/PlaybackState;->getState()I

    move-result p1

    goto :goto_0

    :cond_3
    const/4 p1, 0x0

    .line 1764
    :goto_0
    const/4 v1, 0x3

    if-eq p1, v1, :cond_5

    const/4 v1, 0x6

    if-ne p1, v1, :cond_4

    goto :goto_1

    .line 1767
    :cond_4
    invoke-virtual {v0}, Landroid/media/session/MediaController$TransportControls;->play()V

    goto :goto_2

    .line 1765
    :cond_5
    :goto_1
    invoke-virtual {v0}, Landroid/media/session/MediaController$TransportControls;->pause()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1771
    :goto_2
    goto :goto_3

    .line 1770
    :catchall_0
    move-exception p1

    .line 1772
    :goto_3
    return-void

    .line 1753
    :cond_6
    :goto_4
    return-void
.end method

.method private sendPendingIntent(Landroid/app/PendingIntent;)V
    .locals 10

    .line 1788
    if-nez p1, :cond_0

    .line 1789
    return-void

    .line 1792
    :cond_0
    :try_start_0
    invoke-static {}, Landroid/app/ActivityOptions;->makeBasic()Landroid/app/ActivityOptions;

    move-result-object v0

    .line 1793
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/app/ActivityOptions;->setPendingIntentBackgroundActivityStartMode(I)Landroid/app/ActivityOptions;

    .line 1796
    invoke-virtual {p0}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v0}, Landroid/app/ActivityOptions;->toBundle()Landroid/os/Bundle;

    move-result-object v9
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    move-object v2, p1

    :try_start_1
    invoke-virtual/range {v2 .. v9}, Landroid/app/PendingIntent;->send(Landroid/content/Context;ILandroid/content/Intent;Landroid/app/PendingIntent$OnFinished;Landroid/os/Handler;Ljava/lang/String;Landroid/os/Bundle;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1802
    goto :goto_1

    .line 1797
    :catchall_0
    move-exception v0

    goto :goto_0

    :catchall_1
    move-exception v0

    move-object v2, p1

    .line 1799
    :goto_0
    :try_start_2
    invoke-virtual {v2}, Landroid/app/PendingIntent;->send()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 1801
    goto :goto_1

    .line 1800
    :catchall_2
    move-exception v0

    .line 1803
    :goto_1
    return-void
.end method

.method private startMorph(FFIIFI)V
    .locals 14

    .line 1103
    move v0, p1

    move/from16 v1, p2

    move/from16 v2, p6

    const/4 v3, 0x1

    move/from16 v4, p3

    invoke-static {v3, v4}, Ljava/lang/Math;->max(II)I

    move-result v4

    .line 1104
    move/from16 v5, p4

    invoke-static {v3, v5}, Ljava/lang/Math;->max(II)I

    move-result v5

    .line 1106
    iget-object v6, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCurrRect:Landroid/graphics/RectF;

    invoke-virtual {v6}, Landroid/graphics/RectF;->width()F

    move-result v6

    const/4 v7, 0x0

    cmpg-float v6, v6, v7

    if-lez v6, :cond_1

    iget-object v6, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCurrRect:Landroid/graphics/RectF;

    invoke-virtual {v6}, Landroid/graphics/RectF;->height()F

    move-result v6

    cmpg-float v6, v6, v7

    if-gtz v6, :cond_0

    goto :goto_0

    .line 1109
    :cond_0
    iget-object v6, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mStartRect:Landroid/graphics/RectF;

    iget-object v8, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCurrRect:Landroid/graphics/RectF;

    invoke-virtual {v6, v8}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    goto :goto_1

    .line 1107
    :cond_1
    :goto_0
    iget-object v6, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mStartRect:Landroid/graphics/RectF;

    int-to-float v8, v4

    add-float/2addr v8, v0

    int-to-float v9, v5

    add-float/2addr v9, v1

    invoke-virtual {v6, p1, v1, v8, v9}, Landroid/graphics/RectF;->set(FFFF)V

    .line 1111
    :goto_1
    iget-object v6, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mTargetRect:Landroid/graphics/RectF;

    int-to-float v4, v4

    add-float/2addr v4, v0

    int-to-float v5, v5

    add-float/2addr v5, v1

    invoke-virtual {v6, p1, v1, v4, v5}, Landroid/graphics/RectF;->set(FFFF)V

    .line 1112
    iget v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCurrCornerPx:F

    cmpl-float v0, v0, v7

    if-lez v0, :cond_2

    iget v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCurrCornerPx:F

    goto :goto_2

    :cond_2
    move/from16 v0, p5

    :goto_2
    iput v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mStartCorner:F

    .line 1113
    move/from16 v0, p5

    invoke-static {v7, v0}, Ljava/lang/Math;->max(FF)F

    move-result v0

    iput v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mTargetCorner:F

    .line 1116
    invoke-direct {p0}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->getOverlayWidth()I

    move-result v0

    .line 1117
    const/high16 v1, 0x41c00000    # 24.0f

    invoke-direct {p0, v1}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v1

    .line 1118
    const/high16 v4, 0x41900000    # 18.0f

    invoke-direct {p0, v4}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v4

    .line 1119
    iget-object v5, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mStartRect:Landroid/graphics/RectF;

    iget v5, v5, Landroid/graphics/RectF;->left:F

    iget-object v6, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mTargetRect:Landroid/graphics/RectF;

    iget v6, v6, Landroid/graphics/RectF;->left:F

    invoke-static {v5, v6}, Ljava/lang/Math;->min(FF)F

    move-result v5

    int-to-float v1, v1

    sub-float/2addr v5, v1

    invoke-static {v5}, Ljava/lang/Math;->round(F)I

    move-result v5

    const/4 v6, 0x0

    invoke-static {v6, v5}, Ljava/lang/Math;->max(II)I

    move-result v5

    .line 1120
    iget-object v7, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mStartRect:Landroid/graphics/RectF;

    iget v7, v7, Landroid/graphics/RectF;->top:F

    iget-object v8, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mTargetRect:Landroid/graphics/RectF;

    iget v8, v8, Landroid/graphics/RectF;->top:F

    invoke-static {v7, v8}, Ljava/lang/Math;->min(FF)F

    move-result v7

    int-to-float v4, v4

    sub-float/2addr v7, v4

    invoke-static {v7}, Ljava/lang/Math;->round(F)I

    move-result v7

    invoke-static {v6, v7}, Ljava/lang/Math;->max(II)I

    move-result v7

    .line 1121
    iget-object v8, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mStartRect:Landroid/graphics/RectF;

    iget v8, v8, Landroid/graphics/RectF;->right:F

    iget-object v9, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mTargetRect:Landroid/graphics/RectF;

    iget v9, v9, Landroid/graphics/RectF;->right:F

    invoke-static {v8, v9}, Ljava/lang/Math;->max(FF)F

    move-result v8

    add-float/2addr v8, v1

    invoke-static {v8}, Ljava/lang/Math;->round(F)I

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 1122
    iget-object v1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mStartRect:Landroid/graphics/RectF;

    iget v1, v1, Landroid/graphics/RectF;->bottom:F

    iget-object v8, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mTargetRect:Landroid/graphics/RectF;

    iget v8, v8, Landroid/graphics/RectF;->bottom:F

    invoke-static {v1, v8}, Ljava/lang/Math;->max(FF)F

    move-result v1

    add-float/2addr v1, v4

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v1

    .line 1124
    iput v5, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mBoxLeft:I

    .line 1125
    iput v7, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mBoxTop:I

    .line 1126
    sub-int/2addr v0, v5

    invoke-static {v3, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    iput v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mBoxW:I

    .line 1127
    sub-int/2addr v1, v7

    invoke-static {v3, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    iput v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mBoxH:I

    .line 1129
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mPillContainer:Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 1130
    const/16 v1, 0x33

    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 1131
    iget v4, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mBoxW:I

    iput v4, v0, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 1132
    iget v4, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mBoxH:I

    iput v4, v0, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 1133
    iget v4, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mBoxLeft:I

    iput v4, v0, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 1134
    iget v4, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mBoxTop:I

    iput v4, v0, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 1135
    iget-object v4, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mPillContainer:Landroid/widget/FrameLayout;

    invoke-virtual {v4, v0}, Landroid/widget/FrameLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 1138
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactRow:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getVisibility()I

    move-result v0

    const/4 v4, 0x5

    const/4 v5, 0x2

    if-nez v0, :cond_5

    .line 1139
    if-eq v2, v5, :cond_4

    if-ne v2, v4, :cond_3

    goto :goto_3

    :cond_3
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mTargetRect:Landroid/graphics/RectF;

    goto :goto_4

    :cond_4
    :goto_3
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mStartRect:Landroid/graphics/RectF;

    .line 1140
    :goto_4
    iget-object v7, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactRow:Landroid/widget/LinearLayout;

    invoke-virtual {v7}, Landroid/widget/LinearLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v7

    check-cast v7, Landroid/widget/FrameLayout$LayoutParams;

    .line 1141
    iput v1, v7, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 1142
    iget v8, v0, Landroid/graphics/RectF;->left:F

    iget v9, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mBoxLeft:I

    int-to-float v9, v9

    sub-float/2addr v8, v9

    invoke-static {v8}, Ljava/lang/Math;->round(F)I

    move-result v8

    iget v9, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mLastRowLeftInPill:I

    add-int/2addr v8, v9

    iput v8, v7, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 1143
    iget v0, v0, Landroid/graphics/RectF;->top:F

    iget v8, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mBoxTop:I

    int-to-float v8, v8

    sub-float/2addr v0, v8

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    iput v0, v7, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 1144
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactRow:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v7}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 1146
    :cond_5
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpandedCard:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getVisibility()I

    move-result v0

    const/4 v7, 0x3

    if-nez v0, :cond_7

    .line 1147
    if-ne v2, v7, :cond_6

    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mStartRect:Landroid/graphics/RectF;

    goto :goto_5

    :cond_6
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mTargetRect:Landroid/graphics/RectF;

    .line 1148
    :goto_5
    iget-object v8, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpandedCard:Landroid/widget/LinearLayout;

    invoke-virtual {v8}, Landroid/widget/LinearLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v8

    check-cast v8, Landroid/widget/FrameLayout$LayoutParams;

    .line 1149
    iput v1, v8, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 1150
    iget v1, v0, Landroid/graphics/RectF;->left:F

    iget v9, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mBoxLeft:I

    int-to-float v9, v9

    sub-float/2addr v1, v9

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v1

    iput v1, v8, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 1151
    iget v0, v0, Landroid/graphics/RectF;->top:F

    iget v1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mBoxTop:I

    int-to-float v1, v1

    sub-float/2addr v0, v1

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    iput v0, v8, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 1152
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpandedCard:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v8}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 1156
    :cond_7
    const/16 v0, 0xc8

    iget v1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mTuneAnimSpeedPct:I

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    const/16 v1, 0x28

    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    int-to-float v0, v0

    const/high16 v1, 0x42c80000    # 100.0f

    div-float/2addr v1, v0

    .line 1157
    iget v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mTuneAnimBouncePct:I

    int-to-double v8, v0

    const-wide/high16 v10, 0x403a000000000000L    # 26.0

    div-double/2addr v8, v10

    const-wide/high16 v10, 0x4000000000000000L    # 2.0

    invoke-static {v10, v11, v8, v9}, Ljava/lang/Math;->min(DD)D

    move-result-wide v8

    const-wide/16 v10, 0x0

    invoke-static {v10, v11, v8, v9}, Ljava/lang/Math;->max(DD)D

    move-result-wide v8

    .line 1158
    iput v2, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mMorphMode:I

    .line 1159
    const-wide/16 v10, -0x1

    iput-wide v10, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mMorphStartNanos:J

    .line 1160
    const-wide v10, 0x3fdae147ae147ae1L    # 0.42

    const-wide v12, 0x3fdd70a3d70a3d71L    # 0.46

    if-ne v2, v3, :cond_8

    .line 1161
    const v0, 0x4ddb5858    # 4.6E8f

    mul-float/2addr v1, v0

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v0

    int-to-long v0, v0

    iput-wide v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mMorphDurationNs:J

    .line 1162
    iput-boolean v6, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mUseMoveEase:Z

    .line 1163
    const-wide v0, 0x3fe51eb851eb851fL    # 0.66

    iput-wide v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mSpringResponseX:D

    .line 1164
    const-wide v0, 0x3fd70a3d70a3d70aL    # 0.36

    mul-double/2addr v0, v8

    invoke-static {v12, v13, v0, v1}, Ljava/lang/Math;->min(DD)D

    move-result-wide v0

    iput-wide v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mSpringBounceX:D

    .line 1165
    const-wide v0, 0x3fe28f5c28f5c28fL    # 0.58

    iput-wide v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mSpringResponseY:D

    .line 1166
    const-wide v0, 0x3fceb851eb851eb8L    # 0.24

    mul-double/2addr v8, v0

    invoke-static {v10, v11, v8, v9}, Ljava/lang/Math;->min(DD)D

    move-result-wide v0

    iput-wide v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mSpringBounceY:D

    goto/16 :goto_6

    .line 1167
    :cond_8
    const-wide v3, 0x3fd851eb851eb852L    # 0.38

    if-ne v2, v5, :cond_9

    .line 1168
    const v2, 0x4dd1cef0    # 4.4E8f

    mul-float/2addr v1, v2

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v1

    int-to-long v1, v1

    iput-wide v1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mMorphDurationNs:J

    .line 1169
    iput-boolean v6, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mUseMoveEase:Z

    .line 1170
    const-wide v1, 0x3fdeb851eb851eb8L    # 0.48

    iput-wide v1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mSpringResponseX:D

    .line 1171
    const-wide v1, 0x3fc47ae147ae147bL    # 0.16

    mul-double/2addr v1, v8

    invoke-static {v3, v4, v1, v2}, Ljava/lang/Math;->min(DD)D

    move-result-wide v1

    iput-wide v1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mSpringBounceX:D

    .line 1172
    const-wide v1, 0x3fe1eb851eb851ecL    # 0.56

    iput-wide v1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mSpringResponseY:D

    .line 1173
    const-wide v1, 0x3fd0a3d70a3d70a4L    # 0.26

    mul-double/2addr v8, v1

    const-wide v1, 0x3fdc28f5c28f5c29L    # 0.44

    invoke-static {v1, v2, v8, v9}, Ljava/lang/Math;->min(DD)D

    move-result-wide v1

    iput-wide v1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mSpringBounceY:D

    goto/16 :goto_6

    .line 1174
    :cond_9
    move/from16 p3, v1

    const-wide v0, 0x3fd47ae147ae147bL    # 0.32

    if-ne v2, v7, :cond_a

    .line 1175
    const v2, 0x4daba950    # 3.6E8f

    mul-float v2, v2, p3

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v2

    int-to-long v2, v2

    iput-wide v2, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mMorphDurationNs:J

    .line 1176
    iput-boolean v6, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mUseMoveEase:Z

    .line 1177
    iput-wide v10, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mSpringResponseX:D

    .line 1178
    const-wide v2, 0x3fb47ae147ae147bL    # 0.08

    mul-double/2addr v2, v8

    const-wide v4, 0x3fd1eb851eb851ecL    # 0.28

    invoke-static {v4, v5, v2, v3}, Ljava/lang/Math;->min(DD)D

    move-result-wide v2

    iput-wide v2, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mSpringBounceX:D

    .line 1179
    iput-wide v12, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mSpringResponseY:D

    .line 1180
    const-wide v2, 0x3fb999999999999aL    # 0.1

    mul-double/2addr v8, v2

    invoke-static {v0, v1, v8, v9}, Ljava/lang/Math;->min(DD)D

    move-result-wide v0

    iput-wide v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mSpringBounceY:D

    goto :goto_6

    .line 1181
    :cond_a
    const/4 v5, 0x5

    if-ne v2, v5, :cond_b

    .line 1182
    const v0, 0x4d77f490    # 2.6E8f

    mul-float v1, p3, v0

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v0

    int-to-long v0, v0

    iput-wide v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mMorphDurationNs:J

    .line 1183
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mUseMoveEase:Z

    goto :goto_6

    .line 1185
    :cond_b
    const v5, 0x4d989680    # 3.2E8f

    mul-float v5, v5, p3

    invoke-static {v5}, Ljava/lang/Math;->round(F)I

    move-result v5

    int-to-long v10, v5

    iput-wide v10, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mMorphDurationNs:J

    .line 1186
    iput-boolean v6, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mUseMoveEase:Z

    .line 1187
    const-wide/high16 v5, 0x3fe0000000000000L    # 0.5

    iput-wide v5, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mSpringResponseX:D

    .line 1188
    const-wide v5, 0x3fc70a3d70a3d70aL    # 0.18

    mul-double/2addr v5, v8

    invoke-static {v3, v4, v5, v6}, Ljava/lang/Math;->min(DD)D

    move-result-wide v3

    iput-wide v3, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mSpringBounceX:D

    .line 1189
    iput-wide v12, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mSpringResponseY:D

    .line 1190
    const-wide v3, 0x3fbeb851eb851eb8L    # 0.12

    mul-double/2addr v8, v3

    invoke-static {v0, v1, v8, v9}, Ljava/lang/Math;->min(DD)D

    move-result-wide v0

    iput-wide v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mSpringBounceY:D

    .line 1193
    :goto_6
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCurrRect:Landroid/graphics/RectF;

    iget-object v1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mStartRect:Landroid/graphics/RectF;

    invoke-virtual {v0, v1}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 1194
    iget v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mStartCorner:F

    iput v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCurrCornerPx:F

    .line 1195
    invoke-direct {p0}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->layoutVisualLayersLocked()V

    .line 1196
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mPillContainer:Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->invalidateOutline()V

    .line 1198
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mMorphRunning:Z

    .line 1199
    invoke-direct {p0}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->scheduleNextAnimFrame()V

    .line 1200
    return-void
.end method

.method private stepAnimationsFrame(J)V
    .locals 17

    .line 1216
    move-object/from16 v0, p0

    iget-boolean v1, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mPressAnimRunning:Z

    const-wide/32 v2, 0x7a1200

    const-wide/16 v4, 0x0

    const v6, 0x3e99999a    # 0.3f

    const v7, 0x3dcccccd    # 0.1f

    const/4 v8, 0x0

    const/high16 v9, 0x3f800000    # 1.0f

    if-eqz v1, :cond_2

    .line 1217
    iget-wide v10, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mPressStartNanos:J

    cmp-long v1, v10, v4

    if-gez v1, :cond_0

    .line 1218
    sub-long v10, p1, v2

    iput-wide v10, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mPressStartNanos:J

    .line 1220
    :cond_0
    iget-wide v10, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mPressStartNanos:J

    sub-long v10, p1, v10

    long-to-float v1, v10

    iget-wide v10, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mPressDurationNs:J

    long-to-float v10, v10

    div-float/2addr v1, v10

    invoke-static {v8, v1}, Ljava/lang/Math;->max(FF)F

    move-result v1

    invoke-static {v9, v1}, Ljava/lang/Math;->min(FF)F

    move-result v1

    .line 1221
    iget v10, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mPressTargetScale:F

    iget v11, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mPressStartScale:F

    cmpl-float v10, v10, v11

    if-lez v10, :cond_1

    .line 1222
    const-wide v10, 0x3fd999999999999aL    # 0.4

    const-wide v12, 0x3fcc28f5c28f5c29L    # 0.22

    invoke-static {v1, v10, v11, v12, v13}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->evalCouiSpring(FDD)F

    move-result v10

    goto :goto_0

    .line 1223
    :cond_1
    invoke-static {v1, v6, v8, v7, v9}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->evalCubicBezier(FFFFF)F

    move-result v10

    .line 1224
    :goto_0
    iget v11, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mPressStartScale:F

    iget v12, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mPressTargetScale:F

    iget v13, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mPressStartScale:F

    sub-float/2addr v12, v13

    mul-float/2addr v12, v10

    add-float/2addr v11, v12

    iput v11, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCurrPressScale:F

    .line 1225
    iget-object v10, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mPillContainer:Landroid/widget/FrameLayout;

    iget-object v11, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCurrRect:Landroid/graphics/RectF;

    invoke-virtual {v11}, Landroid/graphics/RectF;->centerX()F

    move-result v11

    iget v12, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mBoxLeft:I

    int-to-float v12, v12

    sub-float/2addr v11, v12

    invoke-virtual {v10, v11}, Landroid/widget/FrameLayout;->setPivotX(F)V

    .line 1226
    iget-object v10, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mPillContainer:Landroid/widget/FrameLayout;

    iget-object v11, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCurrRect:Landroid/graphics/RectF;

    invoke-virtual {v11}, Landroid/graphics/RectF;->centerY()F

    move-result v11

    iget v12, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mBoxTop:I

    int-to-float v12, v12

    sub-float/2addr v11, v12

    invoke-virtual {v10, v11}, Landroid/widget/FrameLayout;->setPivotY(F)V

    .line 1227
    iget-object v10, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mPillContainer:Landroid/widget/FrameLayout;

    iget v11, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCurrPressScale:F

    invoke-virtual {v10, v11}, Landroid/widget/FrameLayout;->setScaleX(F)V

    .line 1228
    iget-object v10, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mPillContainer:Landroid/widget/FrameLayout;

    iget v11, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCurrPressScale:F

    invoke-virtual {v10, v11}, Landroid/widget/FrameLayout;->setScaleY(F)V

    .line 1229
    cmpl-float v1, v1, v9

    if-ltz v1, :cond_2

    .line 1230
    const/4 v1, 0x0

    iput-boolean v1, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mPressAnimRunning:Z

    .line 1231
    iget v1, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mPressTargetScale:F

    iput v1, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCurrPressScale:F

    .line 1232
    iget-object v1, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mPillContainer:Landroid/widget/FrameLayout;

    iget v10, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCurrPressScale:F

    invoke-virtual {v1, v10}, Landroid/widget/FrameLayout;->setScaleX(F)V

    .line 1233
    iget-object v1, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mPillContainer:Landroid/widget/FrameLayout;

    iget v10, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCurrPressScale:F

    invoke-virtual {v1, v10}, Landroid/widget/FrameLayout;->setScaleY(F)V

    .line 1237
    :cond_2
    iget-boolean v1, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mMorphRunning:Z

    if-eqz v1, :cond_c

    .line 1238
    iget-wide v10, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mMorphStartNanos:J

    cmp-long v1, v10, v4

    if-gez v1, :cond_3

    .line 1239
    sub-long v1, p1, v2

    iput-wide v1, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mMorphStartNanos:J

    .line 1241
    :cond_3
    iget-wide v1, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mMorphStartNanos:J

    sub-long v1, p1, v1

    long-to-float v1, v1

    iget-wide v2, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mMorphDurationNs:J

    long-to-float v2, v2

    div-float/2addr v1, v2

    invoke-static {v8, v1}, Ljava/lang/Math;->max(FF)F

    move-result v1

    invoke-static {v9, v1}, Ljava/lang/Math;->min(FF)F

    move-result v1

    .line 1244
    iget-boolean v2, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mUseMoveEase:Z

    if-eqz v2, :cond_4

    .line 1245
    invoke-static {v1, v6, v8, v7, v9}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->evalCubicBezier(FFFFF)F

    move-result v2

    .line 1246
    move v3, v2

    goto :goto_1

    .line 1248
    :cond_4
    iget-wide v2, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mSpringResponseX:D

    iget-wide v4, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mSpringBounceX:D

    invoke-static {v1, v2, v3, v4, v5}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->evalCouiSpring(FDD)F

    move-result v2

    .line 1249
    iget-wide v3, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mSpringResponseY:D

    iget-wide v10, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mSpringBounceY:D

    invoke-static {v1, v3, v4, v10, v11}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->evalCouiSpring(FDD)F

    move-result v3

    .line 1252
    :goto_1
    iget-object v4, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mStartRect:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->left:F

    iget-object v5, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mTargetRect:Landroid/graphics/RectF;

    iget v5, v5, Landroid/graphics/RectF;->left:F

    iget-object v10, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mStartRect:Landroid/graphics/RectF;

    iget v10, v10, Landroid/graphics/RectF;->left:F

    sub-float/2addr v5, v10

    mul-float/2addr v5, v2

    add-float/2addr v4, v5

    .line 1253
    iget-object v5, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mStartRect:Landroid/graphics/RectF;

    iget v5, v5, Landroid/graphics/RectF;->right:F

    iget-object v10, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mTargetRect:Landroid/graphics/RectF;

    iget v10, v10, Landroid/graphics/RectF;->right:F

    iget-object v11, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mStartRect:Landroid/graphics/RectF;

    iget v11, v11, Landroid/graphics/RectF;->right:F

    sub-float/2addr v10, v11

    mul-float/2addr v10, v2

    add-float/2addr v5, v10

    .line 1254
    iget-object v2, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mStartRect:Landroid/graphics/RectF;

    iget v2, v2, Landroid/graphics/RectF;->top:F

    iget-object v10, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mTargetRect:Landroid/graphics/RectF;

    iget v10, v10, Landroid/graphics/RectF;->top:F

    iget-object v11, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mStartRect:Landroid/graphics/RectF;

    iget v11, v11, Landroid/graphics/RectF;->top:F

    sub-float/2addr v10, v11

    mul-float/2addr v10, v3

    add-float/2addr v2, v10

    .line 1255
    iget-object v10, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mStartRect:Landroid/graphics/RectF;

    iget v10, v10, Landroid/graphics/RectF;->bottom:F

    iget-object v11, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mTargetRect:Landroid/graphics/RectF;

    iget v11, v11, Landroid/graphics/RectF;->bottom:F

    iget-object v12, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mStartRect:Landroid/graphics/RectF;

    iget v12, v12, Landroid/graphics/RectF;->bottom:F

    sub-float/2addr v11, v12

    mul-float/2addr v11, v3

    add-float/2addr v10, v11

    .line 1257
    sub-float v11, v5, v4

    const/high16 v12, 0x40000000    # 2.0f

    cmpg-float v11, v11, v12

    const/high16 v13, 0x3f000000    # 0.5f

    if-gez v11, :cond_5

    .line 1258
    add-float/2addr v4, v5

    mul-float/2addr v4, v13

    .line 1259
    sub-float v5, v4, v9

    .line 1260
    add-float/2addr v4, v9

    move/from16 v16, v5

    move v5, v4

    move/from16 v4, v16

    .line 1262
    :cond_5
    sub-float v11, v10, v2

    cmpg-float v11, v11, v12

    if-gez v11, :cond_6

    .line 1263
    add-float/2addr v2, v10

    mul-float/2addr v2, v13

    .line 1264
    sub-float v10, v2, v9

    .line 1265
    add-float/2addr v2, v9

    move/from16 v16, v10

    move v10, v2

    move/from16 v2, v16

    .line 1267
    :cond_6
    iget-object v11, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCurrRect:Landroid/graphics/RectF;

    invoke-virtual {v11, v4, v2, v5, v10}, Landroid/graphics/RectF;->set(FFFF)V

    .line 1268
    iget v2, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mStartCorner:F

    iget v4, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mTargetCorner:F

    iget v5, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mStartCorner:F

    sub-float/2addr v4, v5

    mul-float/2addr v4, v3

    add-float/2addr v2, v4

    invoke-static {v8, v2}, Ljava/lang/Math;->max(FF)F

    move-result v2

    iput v2, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCurrCornerPx:F

    .line 1270
    iget-object v2, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mPillContainer:Landroid/widget/FrameLayout;

    iget-object v3, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCurrRect:Landroid/graphics/RectF;

    invoke-virtual {v3}, Landroid/graphics/RectF;->centerX()F

    move-result v3

    iget v4, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mBoxLeft:I

    int-to-float v4, v4

    sub-float/2addr v3, v4

    invoke-virtual {v2, v3}, Landroid/widget/FrameLayout;->setPivotX(F)V

    .line 1271
    iget-object v2, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mPillContainer:Landroid/widget/FrameLayout;

    iget-object v3, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCurrRect:Landroid/graphics/RectF;

    invoke-virtual {v3}, Landroid/graphics/RectF;->centerY()F

    move-result v3

    iget v4, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mBoxTop:I

    int-to-float v4, v4

    sub-float/2addr v3, v4

    invoke-virtual {v2, v3}, Landroid/widget/FrameLayout;->setPivotY(F)V

    .line 1272
    invoke-direct {v0}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->layoutVisualLayersLocked()V

    .line 1273
    iget-object v2, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mPillContainer:Landroid/widget/FrameLayout;

    invoke-virtual {v2}, Landroid/widget/FrameLayout;->invalidateOutline()V

    .line 1274
    invoke-direct {v0}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->updateGlassSurface()V

    .line 1276
    iget v2, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mMorphMode:I

    const/4 v3, 0x1

    const v4, 0x3f547ae1    # 0.83f

    const v5, 0x3e2e147b    # 0.17f

    const v10, 0x3e8f5c29    # 0.28f

    const/high16 v11, 0x41200000    # 10.0f

    const v12, 0x3f2b851f    # 0.67f

    const v13, 0x3ea8f5c3    # 0.33f

    if-ne v2, v3, :cond_7

    .line 1277
    div-float v2, v1, v10

    invoke-static {v9, v2}, Ljava/lang/Math;->min(FF)F

    move-result v2

    invoke-static {v2, v5, v8, v4, v9}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->evalCubicBezier(FFFFF)F

    move-result v2

    .line 1278
    iget-object v3, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mPillContainer:Landroid/widget/FrameLayout;

    invoke-virtual {v3, v2}, Landroid/widget/FrameLayout;->setAlpha(F)V

    .line 1279
    const v2, 0x3da3d70a    # 0.08f

    sub-float v3, v1, v2

    const v4, 0x3f23d70a    # 0.64f

    div-float/2addr v3, v4

    invoke-static {v8, v3}, Ljava/lang/Math;->max(FF)F

    move-result v3

    invoke-static {v9, v3}, Ljava/lang/Math;->min(FF)F

    move-result v3

    .line 1280
    invoke-static {v3, v13, v8, v12, v9}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->evalCubicBezier(FFFFF)F

    move-result v3

    .line 1281
    iget-object v4, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactRow:Landroid/widget/LinearLayout;

    invoke-virtual {v4, v3}, Landroid/widget/LinearLayout;->setAlpha(F)V

    .line 1282
    iget-object v4, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactRow:Landroid/widget/LinearLayout;

    const v5, 0x3f6b851f    # 0.92f

    mul-float/2addr v2, v3

    add-float/2addr v2, v5

    invoke-virtual {v4, v2}, Landroid/widget/LinearLayout;->setScaleX(F)V

    .line 1283
    iget-object v4, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactRow:Landroid/widget/LinearLayout;

    invoke-virtual {v4, v2}, Landroid/widget/LinearLayout;->setScaleY(F)V

    .line 1284
    iget-object v2, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactLeftSlot:Landroid/widget/FrameLayout;

    invoke-virtual {v2, v3}, Landroid/widget/FrameLayout;->setAlpha(F)V

    .line 1285
    iget-object v2, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactLeftSlot:Landroid/widget/FrameLayout;

    invoke-direct {v0, v11}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v4

    int-to-float v4, v4

    sub-float v5, v9, v3

    mul-float/2addr v4, v5

    invoke-virtual {v2, v4}, Landroid/widget/FrameLayout;->setTranslationX(F)V

    .line 1286
    iget-object v2, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactRightSlot:Landroid/widget/FrameLayout;

    invoke-virtual {v2, v3}, Landroid/widget/FrameLayout;->setAlpha(F)V

    .line 1287
    iget-object v2, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactRightSlot:Landroid/widget/FrameLayout;

    invoke-direct {v0, v11}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v3

    neg-int v3, v3

    int-to-float v3, v3

    mul-float/2addr v3, v5

    invoke-virtual {v2, v3}, Landroid/widget/FrameLayout;->setTranslationX(F)V

    .line 1288
    goto/16 :goto_3

    :cond_7
    iget v2, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mMorphMode:I

    const/4 v3, 0x2

    const v14, 0x3f6147ae    # 0.88f

    const v15, 0x3df5c28f    # 0.12f

    if-ne v2, v3, :cond_8

    .line 1289
    div-float v2, v1, v10

    invoke-static {v9, v2}, Ljava/lang/Math;->min(FF)F

    move-result v2

    .line 1290
    invoke-static {v2, v6, v8, v7, v9}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->evalCubicBezier(FFFFF)F

    move-result v2

    .line 1291
    iget-object v3, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactRow:Landroid/widget/LinearLayout;

    iget v4, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mFadeStartCompAlpha:F

    sub-float v5, v9, v2

    mul-float/2addr v4, v5

    invoke-static {v8, v4}, Ljava/lang/Math;->max(FF)F

    move-result v4

    invoke-virtual {v3, v4}, Landroid/widget/LinearLayout;->setAlpha(F)V

    .line 1292
    iget-object v3, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactRow:Landroid/widget/LinearLayout;

    mul-float v4, v2, v7

    sub-float v4, v9, v4

    invoke-virtual {v3, v4}, Landroid/widget/LinearLayout;->setScaleX(F)V

    .line 1293
    iget-object v3, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactRow:Landroid/widget/LinearLayout;

    invoke-virtual {v3, v4}, Landroid/widget/LinearLayout;->setScaleY(F)V

    .line 1294
    iget-object v3, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactRow:Landroid/widget/LinearLayout;

    const/high16 v4, 0x40800000    # 4.0f

    invoke-direct {v0, v4}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v4

    int-to-float v4, v4

    mul-float/2addr v4, v2

    invoke-virtual {v3, v4}, Landroid/widget/LinearLayout;->setTranslationY(F)V

    .line 1296
    sub-float v2, v1, v7

    const v3, 0x3f3851ec    # 0.72f

    div-float/2addr v2, v3

    invoke-static {v8, v2}, Ljava/lang/Math;->max(FF)F

    move-result v2

    invoke-static {v9, v2}, Ljava/lang/Math;->min(FF)F

    move-result v2

    .line 1297
    invoke-static {v2, v13, v8, v12, v9}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->evalCubicBezier(FFFFF)F

    move-result v3

    .line 1298
    const-wide v4, 0x3fe1eb851eb851ecL    # 0.56

    const-wide v6, 0x3fc999999999999aL    # 0.2

    invoke-static {v2, v4, v5, v6, v7}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->evalCouiSpring(FDD)F

    move-result v2

    .line 1299
    iget-object v4, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpandedCard:Landroid/widget/LinearLayout;

    iget v5, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mFadeStartExpAlpha:F

    iget v6, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mFadeStartExpAlpha:F

    sub-float v6, v9, v6

    mul-float/2addr v6, v3

    add-float/2addr v5, v6

    invoke-virtual {v4, v5}, Landroid/widget/LinearLayout;->setAlpha(F)V

    .line 1300
    iget-object v3, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpandedCard:Landroid/widget/LinearLayout;

    mul-float/2addr v15, v2

    add-float/2addr v15, v14

    invoke-virtual {v3, v15}, Landroid/widget/LinearLayout;->setScaleX(F)V

    .line 1301
    iget-object v3, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpandedCard:Landroid/widget/LinearLayout;

    invoke-virtual {v3, v15}, Landroid/widget/LinearLayout;->setScaleY(F)V

    .line 1302
    iget-object v3, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpandedCard:Landroid/widget/LinearLayout;

    invoke-direct {v0, v11}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v4

    neg-int v4, v4

    int-to-float v4, v4

    sub-float v2, v9, v2

    mul-float/2addr v4, v2

    invoke-virtual {v3, v4}, Landroid/widget/LinearLayout;->setTranslationY(F)V

    .line 1303
    goto/16 :goto_3

    :cond_8
    iget v2, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mMorphMode:I

    const/4 v3, 0x3

    const/high16 v10, 0x41000000    # 8.0f

    if-ne v2, v3, :cond_9

    .line 1304
    const v2, 0x3eae147b    # 0.34f

    div-float v2, v1, v2

    invoke-static {v9, v2}, Ljava/lang/Math;->min(FF)F

    move-result v2

    .line 1305
    invoke-static {v2, v6, v8, v7, v9}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->evalCubicBezier(FFFFF)F

    move-result v2

    .line 1306
    iget-object v3, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpandedCard:Landroid/widget/LinearLayout;

    iget v4, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mFadeStartExpAlpha:F

    sub-float v5, v9, v2

    mul-float/2addr v4, v5

    invoke-static {v8, v4}, Ljava/lang/Math;->max(FF)F

    move-result v4

    invoke-virtual {v3, v4}, Landroid/widget/LinearLayout;->setAlpha(F)V

    .line 1307
    iget-object v3, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpandedCard:Landroid/widget/LinearLayout;

    mul-float v4, v2, v15

    sub-float v4, v9, v4

    invoke-virtual {v3, v4}, Landroid/widget/LinearLayout;->setScaleX(F)V

    .line 1308
    iget-object v3, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpandedCard:Landroid/widget/LinearLayout;

    invoke-virtual {v3, v4}, Landroid/widget/LinearLayout;->setScaleY(F)V

    .line 1309
    iget-object v3, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpandedCard:Landroid/widget/LinearLayout;

    invoke-direct {v0, v10}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v4

    neg-int v4, v4

    int-to-float v4, v4

    mul-float/2addr v4, v2

    invoke-virtual {v3, v4}, Landroid/widget/LinearLayout;->setTranslationY(F)V

    .line 1311
    const v2, 0x3e75c28f    # 0.24f

    sub-float v2, v1, v2

    const v3, 0x3f28f5c3    # 0.66f

    div-float/2addr v2, v3

    invoke-static {v8, v2}, Ljava/lang/Math;->max(FF)F

    move-result v2

    invoke-static {v9, v2}, Ljava/lang/Math;->min(FF)F

    move-result v2

    .line 1312
    invoke-static {v2, v13, v8, v12, v9}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->evalCubicBezier(FFFFF)F

    move-result v2

    .line 1313
    iget-object v3, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactRow:Landroid/widget/LinearLayout;

    iget v4, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mFadeStartCompAlpha:F

    iget v5, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mFadeStartCompAlpha:F

    sub-float v5, v9, v5

    mul-float/2addr v5, v2

    add-float/2addr v4, v5

    invoke-virtual {v3, v4}, Landroid/widget/LinearLayout;->setAlpha(F)V

    .line 1314
    iget-object v3, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactRow:Landroid/widget/LinearLayout;

    mul-float/2addr v2, v15

    add-float/2addr v2, v14

    invoke-virtual {v3, v2}, Landroid/widget/LinearLayout;->setScaleX(F)V

    .line 1315
    iget-object v3, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactRow:Landroid/widget/LinearLayout;

    invoke-virtual {v3, v2}, Landroid/widget/LinearLayout;->setScaleY(F)V

    .line 1316
    iget-object v2, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactRow:Landroid/widget/LinearLayout;

    invoke-virtual {v2, v8}, Landroid/widget/LinearLayout;->setTranslationY(F)V

    .line 1317
    goto :goto_3

    :cond_9
    iget v2, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mMorphMode:I

    const/4 v3, 0x4

    if-ne v2, v3, :cond_a

    .line 1318
    const v2, 0x3f1eb852    # 0.62f

    div-float v2, v1, v2

    invoke-static {v9, v2}, Ljava/lang/Math;->min(FF)F

    move-result v2

    .line 1319
    invoke-static {v2, v13, v8, v12, v9}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->evalCubicBezier(FFFFF)F

    move-result v2

    .line 1320
    iget-object v3, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactLeftSlot:Landroid/widget/FrameLayout;

    const v4, 0x3f51eb85    # 0.82f

    mul-float/2addr v4, v2

    const v5, 0x3e3851ec    # 0.18f

    add-float/2addr v4, v5

    invoke-virtual {v3, v4}, Landroid/widget/FrameLayout;->setAlpha(F)V

    .line 1321
    iget-object v3, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactRightSlot:Landroid/widget/FrameLayout;

    invoke-virtual {v3, v4}, Landroid/widget/FrameLayout;->setAlpha(F)V

    .line 1322
    iget-object v3, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactRightSlot:Landroid/widget/FrameLayout;

    invoke-direct {v0, v10}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v4

    int-to-float v4, v4

    sub-float v2, v9, v2

    mul-float/2addr v4, v2

    invoke-virtual {v3, v4}, Landroid/widget/FrameLayout;->setTranslationX(F)V

    goto :goto_2

    .line 1323
    :cond_a
    iget v2, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mMorphMode:I

    const/4 v3, 0x5

    if-ne v2, v3, :cond_b

    .line 1324
    const v2, 0x3f47ae14    # 0.78f

    div-float v2, v1, v2

    invoke-static {v9, v2}, Ljava/lang/Math;->min(FF)F

    move-result v2

    .line 1325
    invoke-static {v2, v5, v8, v4, v9}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->evalCubicBezier(FFFFF)F

    move-result v2

    sub-float v2, v9, v2

    invoke-static {v8, v2}, Ljava/lang/Math;->max(FF)F

    move-result v2

    .line 1326
    iget-object v3, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mPillContainer:Landroid/widget/FrameLayout;

    invoke-virtual {v3, v2}, Landroid/widget/FrameLayout;->setAlpha(F)V

    .line 1327
    iget-object v3, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactRow:Landroid/widget/LinearLayout;

    invoke-virtual {v3, v2}, Landroid/widget/LinearLayout;->setAlpha(F)V

    goto :goto_3

    .line 1323
    :cond_b
    :goto_2
    nop

    .line 1330
    :goto_3
    cmpl-float v1, v1, v9

    if-ltz v1, :cond_c

    .line 1331
    invoke-direct {v0}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->finishMorph()V

    .line 1335
    :cond_c
    iget-boolean v1, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mMorphRunning:Z

    if-nez v1, :cond_d

    iget-boolean v1, v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mPressAnimRunning:Z

    if-eqz v1, :cond_e

    .line 1336
    :cond_d
    invoke-direct {v0}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->scheduleNextAnimFrame()V

    .line 1338
    :cond_e
    return-void
.end method

.method private unregisterTouchableInsetsListener()V
    .locals 3

    .line 1519
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mInsetsListenerProxy:Ljava/lang/Object;

    if-nez v0, :cond_0

    .line 1520
    return-void

    .line 1523
    :cond_0
    :try_start_0
    const-string v0, "android.view.ViewTreeObserver$OnComputeInternalInsetsListener"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 1524
    const-class v1, Landroid/view/ViewTreeObserver;

    const-string v2, "removeOnComputeInternalInsetsListener"

    filled-new-array {v0}, [Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v1, v2, v0}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 1525
    invoke-virtual {p0}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v1

    iget-object v2, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mInsetsListenerProxy:Ljava/lang/Object;

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1527
    goto :goto_0

    .line 1526
    :catchall_0
    move-exception v0

    .line 1528
    :goto_0
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mInsetsListenerProxy:Ljava/lang/Object;

    .line 1529
    return-void
.end method

.method private updateGlassSurface()V
    .locals 6

    .line 1443
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mFluidGlassDrawable:Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidGlassDrawable;

    iget v1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCurrAccentColor:I

    iget-boolean v2, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpanded:Z

    iget-boolean v3, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mHardwareBlurSupported:Z

    iget v4, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCurrCornerPx:F

    iget v5, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mTuneGlassOpacity:I

    invoke-virtual/range {v0 .. v5}, Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidGlassDrawable;->configure(IZZFI)V

    .line 1444
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mFluidRimDrawable:Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidRimDrawable;

    iget v1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCurrAccentColor:I

    iget-boolean v2, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpanded:Z

    iget v3, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCurrCornerPx:F

    iget v4, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mTuneRimAlpha:I

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidRimDrawable;->configure(IZFI)V

    .line 1445
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mGlassTintView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->invalidate()V

    .line 1446
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mRimView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->invalidate()V

    .line 1447
    return-void
.end method

.method private updateLiveTickValues()V
    .locals 11

    .line 1720
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCurrentItem:Lcom/android/systemui/dynamicisland/IslandItem;

    .line 1721
    if-nez v0, :cond_0

    .line 1722
    return-void

    .line 1724
    :cond_0
    iget-boolean v1, v0, Lcom/android/systemui/dynamicisland/IslandItem;->hasChronometer:Z

    const/high16 v2, 0x3f000000    # 0.5f

    const-wide/16 v3, 0x0

    if-eqz v1, :cond_3

    .line 1725
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v5

    .line 1726
    iget-boolean v1, v0, Lcom/android/systemui/dynamicisland/IslandItem;->chronometerCountDown:Z

    if-eqz v1, :cond_1

    .line 1727
    iget-wide v0, v0, Lcom/android/systemui/dynamicisland/IslandItem;->chronometerBaseElapsedMs:J

    sub-long/2addr v0, v5

    invoke-static {v3, v4, v0, v1}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v0

    goto :goto_0

    .line 1728
    :cond_1
    iget-wide v0, v0, Lcom/android/systemui/dynamicisland/IslandItem;->chronometerBaseElapsedMs:J

    sub-long/2addr v5, v0

    invoke-static {v3, v4, v5, v6}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v0

    .line 1729
    :goto_0
    invoke-static {v0, v1}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->formatMs(J)Ljava/lang/String;

    move-result-object v0

    .line 1730
    iget-object v1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactText:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1731
    iget-object v1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpRightStat:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1732
    iget-boolean v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpanded:Z

    if-nez v0, :cond_5

    iget-boolean v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mMorphRunning:Z

    if-nez v0, :cond_5

    iget-boolean v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mHasActiveContent:Z

    if-eqz v0, :cond_5

    .line 1733
    invoke-direct {p0}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->measureCompactTarget()[I

    move-result-object v0

    .line 1734
    iget-object v1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCurrRect:Landroid/graphics/RectF;

    invoke-virtual {v1}, Landroid/graphics/RectF;->width()F

    move-result v1

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v1

    .line 1735
    const/4 v3, 0x0

    aget v4, v0, v3

    const/4 v5, 0x2

    if-ne v4, v1, :cond_2

    aget v1, v0, v5

    int-to-float v1, v1

    iget-object v4, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCurrRect:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->left:F

    sub-float/2addr v1, v4

    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v1

    const/high16 v4, 0x3f800000    # 1.0f

    cmpl-float v1, v1, v4

    if-lez v1, :cond_5

    .line 1736
    :cond_2
    aget v1, v0, v5

    int-to-float v5, v1

    iget v1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactTopYPx:I

    int-to-float v6, v1

    aget v7, v0, v3

    const/4 v1, 0x1

    aget v8, v0, v1

    aget v0, v0, v1

    int-to-float v0, v0

    mul-float v9, v0, v2

    move-object v4, p0

    invoke-direct/range {v4 .. v9}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->applyStaticGeometry(FFIIF)V

    goto :goto_1

    .line 1739
    :cond_3
    move-object v1, p0

    iget-boolean v5, v1, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpanded:Z

    if-eqz v5, :cond_5

    iget-object v5, v0, Lcom/android/systemui/dynamicisland/IslandItem;->mediaController:Landroid/media/session/MediaController;

    if-eqz v5, :cond_5

    iget-boolean v5, v0, Lcom/android/systemui/dynamicisland/IslandItem;->hasProgress:Z

    if-eqz v5, :cond_5

    iget-wide v5, v0, Lcom/android/systemui/dynamicisland/IslandItem;->progressMax:J

    cmp-long v5, v5, v3

    if-lez v5, :cond_5

    iget-boolean v5, v1, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mUserSeeking:Z

    if-nez v5, :cond_5

    .line 1740
    iget-wide v5, v0, Lcom/android/systemui/dynamicisland/IslandItem;->progressValue:J

    .line 1741
    iget-boolean v7, v0, Lcom/android/systemui/dynamicisland/IslandItem;->waveformPlaying:Z

    if-eqz v7, :cond_4

    iget-wide v7, v0, Lcom/android/systemui/dynamicisland/IslandItem;->mediaPositionUpdateElapsedMs:J

    cmp-long v7, v7, v3

    if-lez v7, :cond_4

    .line 1742
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v7

    iget-wide v9, v0, Lcom/android/systemui/dynamicisland/IslandItem;->mediaPositionUpdateElapsedMs:J

    sub-long/2addr v7, v9

    .line 1743
    long-to-float v7, v7

    iget v8, v0, Lcom/android/systemui/dynamicisland/IslandItem;->mediaSpeed:F

    invoke-static {v2, v8}, Ljava/lang/Math;->max(FF)F

    move-result v2

    mul-float/2addr v7, v2

    invoke-static {v7}, Ljava/lang/Math;->round(F)I

    move-result v2

    int-to-long v7, v2

    add-long/2addr v5, v7

    .line 1745
    :cond_4
    iget-wide v7, v0, Lcom/android/systemui/dynamicisland/IslandItem;->progressMax:J

    invoke-static {v7, v8, v5, v6}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v5

    invoke-static {v3, v4, v5, v6}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v2

    .line 1746
    iget-object v4, v1, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpElapsedText:Landroid/widget/TextView;

    invoke-static {v2, v3}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->formatMs(J)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1747
    iget-object v1, v1, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpSeekBar:Landroid/widget/SeekBar;

    const-wide/16 v4, 0x3e8

    mul-long/2addr v2, v4

    iget-wide v4, v0, Lcom/android/systemui/dynamicisland/IslandItem;->progressMax:J

    div-long/2addr v2, v4

    long-to-int v0, v2

    invoke-virtual {v1, v0}, Landroid/widget/SeekBar;->setProgress(I)V

    goto :goto_2

    .line 1739
    :cond_5
    :goto_1
    nop

    .line 1749
    :goto_2
    return-void
.end method

.method private updateTicker()V
    .locals 4

    .line 1709
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mTickRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 1710
    iget-boolean v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mHasActiveContent:Z

    if-eqz v0, :cond_4

    iget-boolean v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mSuspendedForSleep:Z

    if-nez v0, :cond_4

    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCurrentItem:Lcom/android/systemui/dynamicisland/IslandItem;

    if-nez v0, :cond_0

    goto :goto_1

    .line 1713
    :cond_0
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCurrentItem:Lcom/android/systemui/dynamicisland/IslandItem;

    iget-boolean v0, v0, Lcom/android/systemui/dynamicisland/IslandItem;->hasChronometer:Z

    if-nez v0, :cond_1

    iget-boolean v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpanded:Z

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCurrentItem:Lcom/android/systemui/dynamicisland/IslandItem;

    iget-object v0, v0, Lcom/android/systemui/dynamicisland/IslandItem;->mediaController:Landroid/media/session/MediaController;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCurrentItem:Lcom/android/systemui/dynamicisland/IslandItem;

    iget-boolean v0, v0, Lcom/android/systemui/dynamicisland/IslandItem;->hasProgress:Z

    if-eqz v0, :cond_3

    .line 1714
    :cond_1
    invoke-direct {p0}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->updateLiveTickValues()V

    .line 1715
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mTickRunnable:Ljava/lang/Runnable;

    iget-boolean v2, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpanded:Z

    if-eqz v2, :cond_2

    const-wide/16 v2, 0x1f4

    goto :goto_0

    :cond_2
    const-wide/16 v2, 0x3e8

    :goto_0
    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 1717
    :cond_3
    return-void

    .line 1711
    :cond_4
    :goto_1
    return-void
.end method


# virtual methods
.method public applyTuningConfig(Lcom/android/systemui/dynamicisland/LiveAlertsPrefs;)V
    .locals 4

    .line 568
    if-nez p1, :cond_0

    .line 569
    return-void

    .line 571
    :cond_0
    iget v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mTuneBlurRadius:I

    iget v1, p1, Lcom/android/systemui/dynamicisland/LiveAlertsPrefs;->blurRadius:I

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-eq v0, v1, :cond_1

    move v0, v3

    goto :goto_0

    :cond_1
    move v0, v2

    .line 572
    :goto_0
    iget v1, p1, Lcom/android/systemui/dynamicisland/LiveAlertsPrefs;->blurRadius:I

    iput v1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mTuneBlurRadius:I

    .line 573
    iget v1, p1, Lcom/android/systemui/dynamicisland/LiveAlertsPrefs;->glassOpacityPct:I

    iput v1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mTuneGlassOpacity:I

    .line 574
    iget v1, p1, Lcom/android/systemui/dynamicisland/LiveAlertsPrefs;->rimAlphaPct:I

    iput v1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mTuneRimAlpha:I

    .line 575
    iget v1, p1, Lcom/android/systemui/dynamicisland/LiveAlertsPrefs;->animSpeedPct:I

    iput v1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mTuneAnimSpeedPct:I

    .line 576
    iget v1, p1, Lcom/android/systemui/dynamicisland/LiveAlertsPrefs;->animBouncePct:I

    iput v1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mTuneAnimBouncePct:I

    .line 577
    iget v1, p1, Lcom/android/systemui/dynamicisland/LiveAlertsPrefs;->heightOffsetDp:I

    iput v1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mTuneHeightOffsetDp:I

    .line 578
    iget v1, p1, Lcom/android/systemui/dynamicisland/LiveAlertsPrefs;->gapOffsetDp:I

    iput v1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mTuneGapOffsetDp:I

    .line 579
    iget v1, p1, Lcom/android/systemui/dynamicisland/LiveAlertsPrefs;->topOffsetDp:I

    iput v1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mTuneTopOffsetDp:I

    .line 580
    iget v1, p1, Lcom/android/systemui/dynamicisland/LiveAlertsPrefs;->centerOffsetDp:I

    iput v1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mTuneCenterOffsetDp:I

    .line 581
    iget p1, p1, Lcom/android/systemui/dynamicisland/LiveAlertsPrefs;->expandedWidthDp:I

    iput p1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mTuneExpandedWidthDp:I

    .line 583
    invoke-direct {p0, v3}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->recomputeCutoutLayout(Z)V

    .line 584
    invoke-direct {p0}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->updateGlassSurface()V

    .line 585
    iget-boolean p1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mHasActiveContent:Z

    if-eqz p1, :cond_4

    iget-boolean p1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mSuspendedForSleep:Z

    if-nez p1, :cond_4

    .line 586
    iget p1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mTuneBlurRadius:I

    if-gtz p1, :cond_2

    .line 587
    iget-object p1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mBlurBackdrop:Landroid/view/View;

    invoke-static {p1}, Lcom/android/systemui/dynamicisland/IslandOverlayView$BlurEngine;->clearBlur(Landroid/view/View;)V

    .line 588
    iget-object p1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mBlurBackdrop:Landroid/view/View;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 589
    iput-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mFallbackBlurDrawable:Ljava/lang/Object;

    .line 590
    iget-boolean p1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mHardwareBlurSupported:Z

    if-eqz p1, :cond_4

    .line 591
    iput-boolean v2, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mHardwareBlurSupported:Z

    .line 592
    invoke-direct {p0}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->updateGlassSurface()V

    goto :goto_1

    .line 594
    :cond_2
    if-nez v0, :cond_3

    iget-boolean p1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mHardwareBlurSupported:Z

    if-nez p1, :cond_4

    .line 595
    :cond_3
    invoke-direct {p0, v3}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->applyHardwareBlur(Z)V

    .line 598
    :cond_4
    :goto_1
    return-void
.end method

.method public collapse()V
    .locals 11

    .line 867
    iget-boolean v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpanded:Z

    if-nez v0, :cond_0

    .line 868
    return-void

    .line 870
    :cond_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpanded:Z

    .line 871
    iget-object v1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCallbacks:Lcom/android/systemui/dynamicisland/IslandOverlayView$Callbacks;

    invoke-interface {v1, v0}, Lcom/android/systemui/dynamicisland/IslandOverlayView$Callbacks;->onExpandedStateChanged(Z)V

    .line 873
    iget-object v1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCurrentItem:Lcom/android/systemui/dynamicisland/IslandItem;

    if-eqz v1, :cond_2

    iget-boolean v1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mHasActiveContent:Z

    if-eqz v1, :cond_2

    .line 874
    iget-object v1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpandedCard:Landroid/widget/LinearLayout;

    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getAlpha()F

    move-result v1

    iput v1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mFadeStartExpAlpha:F

    .line 875
    iget-object v1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactRow:Landroid/widget/LinearLayout;

    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getVisibility()I

    move-result v1

    if-nez v1, :cond_1

    iget-object v1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactRow:Landroid/widget/LinearLayout;

    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getAlpha()F

    move-result v1

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    :goto_0
    iput v1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mFadeStartCompAlpha:F

    .line 877
    iget-object v1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpandedCard:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 878
    iget-object v1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactRow:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 879
    iget-object v1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactRow:Landroid/widget/LinearLayout;

    iget v2, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mFadeStartCompAlpha:F

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setAlpha(F)V

    .line 881
    invoke-direct {p0}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->measureCompactTarget()[I

    move-result-object v1

    .line 882
    invoke-direct {p0}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->updateGlassSurface()V

    .line 883
    const/4 v2, 0x2

    aget v2, v1, v2

    int-to-float v4, v2

    iget v2, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactTopYPx:I

    int-to-float v5, v2

    aget v6, v1, v0

    const/4 v0, 0x1

    aget v7, v1, v0

    aget v2, v1, v0

    int-to-float v2, v2

    const/high16 v10, 0x3f000000    # 0.5f

    mul-float v8, v2, v10

    const/4 v9, 0x3

    move-object v3, p0

    invoke-direct/range {v3 .. v9}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->startMorph(FFIIFI)V

    .line 884
    aget v1, v1, v0

    int-to-float v1, v1

    mul-float/2addr v1, v10

    invoke-direct {p0, v0, v1}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->applyHardwareBlur(ZF)V

    .line 885
    invoke-direct {p0}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->updateTicker()V

    .line 887
    :cond_2
    return-void
.end method

.method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 9

    .line 900
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    const/4 v1, 0x4

    const/4 v2, 0x1

    if-ne v0, v1, :cond_0

    iget-boolean v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpanded:Z

    if-eqz v0, :cond_0

    .line 901
    invoke-virtual {p0}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->collapse()V

    .line 902
    return v2

    .line 904
    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    .line 905
    const/4 v1, 0x0

    if-nez v0, :cond_2

    .line 906
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v2

    invoke-direct {p0, v0, v2}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->isPointInsidePill(FF)Z

    move-result v0

    iput-boolean v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mTouchInsidePill:Z

    .line 907
    iget-boolean v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mTouchInsidePill:Z

    if-nez v0, :cond_1

    .line 908
    return v1

    .line 910
    :cond_1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    move-result v0

    iput v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mDownX:F

    .line 911
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    move-result v0

    iput v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mDownY:F

    .line 912
    iput-boolean v1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mTrackingSwipe:Z

    .line 913
    const v0, 0x3f71eb85    # 0.945f

    const-wide/16 v1, 0x6e

    invoke-direct {p0, v0, v1, v2}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->animatePressScale(FJ)V

    goto/16 :goto_2

    .line 914
    :cond_2
    const/high16 v3, 0x3f800000    # 1.0f

    if-eq v0, v2, :cond_8

    const/4 v4, 0x3

    if-ne v0, v4, :cond_3

    goto/16 :goto_1

    .line 919
    :cond_3
    const/4 v4, 0x2

    if-ne v0, v4, :cond_9

    .line 920
    iget-boolean v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mTouchInsidePill:Z

    if-nez v0, :cond_4

    .line 921
    return v1

    .line 923
    :cond_4
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    move-result v0

    iget v1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mDownX:F

    sub-float/2addr v0, v1

    .line 924
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    move-result v1

    iget v4, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mDownY:F

    sub-float/2addr v1, v4

    .line 925
    iget-boolean v4, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mTrackingSwipe:Z

    if-nez v4, :cond_9

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v4

    iget v5, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mTouchSlop:I

    int-to-float v5, v5

    const v6, 0x3fb33333    # 1.4f

    mul-float/2addr v5, v6

    cmpl-float v4, v4, v5

    if-gtz v4, :cond_5

    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v4

    iget v5, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mTouchSlop:I

    int-to-float v5, v5

    mul-float/2addr v5, v6

    cmpl-float v4, v4, v5

    if-lez v4, :cond_9

    .line 926
    :cond_5
    iget-boolean v4, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpanded:Z

    const-wide/16 v5, 0xc8

    const/high16 v7, 0x40000000    # 2.0f

    if-eqz v4, :cond_6

    iget v4, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mTouchSlop:I

    neg-int v4, v4

    int-to-float v4, v4

    mul-float/2addr v4, v7

    cmpg-float v4, v1, v4

    if-gez v4, :cond_6

    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v4

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v8

    cmpl-float v4, v4, v8

    if-lez v4, :cond_6

    .line 927
    iput-boolean v2, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mTrackingSwipe:Z

    .line 928
    invoke-direct {p0, v3, v5, v6}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->animatePressScale(FJ)V

    .line 929
    invoke-virtual {p0}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->collapse()V

    .line 930
    return v2

    .line 932
    :cond_6
    iget v4, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mStackCount:I

    if-le v4, v2, :cond_9

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v4

    iget v8, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mTouchSlop:I

    int-to-float v8, v8

    mul-float/2addr v8, v7

    cmpl-float v4, v4, v8

    if-lez v4, :cond_9

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v4

    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v1

    const v7, 0x3fa66666    # 1.3f

    mul-float/2addr v1, v7

    cmpl-float v1, v4, v1

    if-lez v1, :cond_9

    .line 933
    iput-boolean v2, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mTrackingSwipe:Z

    .line 934
    invoke-direct {p0, v3, v5, v6}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->animatePressScale(FJ)V

    .line 935
    iget-object p1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCallbacks:Lcom/android/systemui/dynamicisland/IslandOverlayView$Callbacks;

    const/4 v1, 0x0

    cmpg-float v0, v0, v1

    if-gez v0, :cond_7

    move v0, v2

    goto :goto_0

    :cond_7
    const/4 v0, -0x1

    :goto_0
    invoke-interface {p1, v0}, Lcom/android/systemui/dynamicisland/IslandOverlayView$Callbacks;->onCycleIsland(I)V

    .line 936
    return v2

    .line 915
    :cond_8
    :goto_1
    const-wide/16 v4, 0xe6

    invoke-direct {p0, v3, v4, v5}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->animatePressScale(FJ)V

    .line 916
    iget-boolean v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mTouchInsidePill:Z

    if-nez v0, :cond_9

    .line 917
    return v1

    .line 940
    :cond_9
    :goto_2
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    return p1
.end method

.method public expand()V
    .locals 11

    .line 844
    iget-boolean v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mHasActiveContent:Z

    if-eqz v0, :cond_2

    iget-boolean v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mSuspendedForSleep:Z

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCurrentItem:Lcom/android/systemui/dynamicisland/IslandItem;

    if-eqz v0, :cond_2

    iget-boolean v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpanded:Z

    if-eqz v0, :cond_0

    goto :goto_1

    .line 847
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpanded:Z

    .line 848
    iget-object v1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCallbacks:Lcom/android/systemui/dynamicisland/IslandOverlayView$Callbacks;

    invoke-interface {v1, v0}, Lcom/android/systemui/dynamicisland/IslandOverlayView$Callbacks;->onExpandedStateChanged(Z)V

    .line 849
    iget-object v1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCurrentItem:Lcom/android/systemui/dynamicisland/IslandItem;

    invoke-direct {p0, v1}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->bindExpanded(Lcom/android/systemui/dynamicisland/IslandItem;)V

    .line 850
    invoke-direct {p0}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->updateLiveTickValues()V

    .line 852
    iget-object v1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactRow:Landroid/widget/LinearLayout;

    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getAlpha()F

    move-result v1

    iput v1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mFadeStartCompAlpha:F

    .line 853
    iget-object v1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpandedCard:Landroid/widget/LinearLayout;

    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getVisibility()I

    move-result v1

    if-nez v1, :cond_1

    iget-object v1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpandedCard:Landroid/widget/LinearLayout;

    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getAlpha()F

    move-result v1

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    :goto_0
    iput v1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mFadeStartExpAlpha:F

    .line 855
    iget-object v1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactRow:Landroid/widget/LinearLayout;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 856
    iget-object v1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpandedCard:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 857
    iget-object v1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpandedCard:Landroid/widget/LinearLayout;

    iget v3, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mFadeStartExpAlpha:F

    invoke-virtual {v1, v3}, Landroid/widget/LinearLayout;->setAlpha(F)V

    .line 859
    invoke-direct {p0}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->measureExpandedTarget()[I

    move-result-object v1

    .line 860
    invoke-direct {p0}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->updateGlassSurface()V

    .line 861
    const/4 v3, 0x2

    aget v3, v1, v3

    int-to-float v5, v3

    iget v3, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpandedTopYPx:I

    int-to-float v6, v3

    aget v7, v1, v2

    aget v8, v1, v0

    const/high16 v1, 0x41e00000    # 28.0f

    invoke-direct {p0, v1}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v2

    int-to-float v9, v2

    const/4 v10, 0x2

    move-object v4, p0

    invoke-direct/range {v4 .. v10}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->startMorph(FFIIFI)V

    .line 862
    invoke-direct {p0, v1}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v1

    int-to-float v1, v1

    invoke-direct {p0, v0, v1}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->applyHardwareBlur(ZF)V

    .line 863
    invoke-direct {p0}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->updateTicker()V

    .line 864
    return-void

    .line 845
    :cond_2
    :goto_1
    return-void
.end method

.method public hideAll()V
    .locals 8

    .line 814
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mTickRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 815
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCurrentItem:Lcom/android/systemui/dynamicisland/IslandItem;

    .line 816
    iget-boolean v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mHasActiveContent:Z

    const/16 v1, 0x8

    if-nez v0, :cond_0

    .line 817
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mBlurBackdrop:Landroid/view/View;

    invoke-static {v0}, Lcom/android/systemui/dynamicisland/IslandOverlayView$BlurEngine;->clearBlur(Landroid/view/View;)V

    .line 818
    invoke-virtual {p0, v1}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->setVisibility(I)V

    .line 819
    return-void

    .line 821
    :cond_0
    iget-boolean v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpanded:Z

    .line 822
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpanded:Z

    .line 823
    if-eqz v0, :cond_1

    .line 824
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCallbacks:Lcom/android/systemui/dynamicisland/IslandOverlayView$Callbacks;

    invoke-interface {v0, v2}, Lcom/android/systemui/dynamicisland/IslandOverlayView$Callbacks;->onExpandedStateChanged(Z)V

    .line 826
    :cond_1
    iput-boolean v2, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mHasActiveContent:Z

    .line 827
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactWaveform:Lcom/android/systemui/dynamicisland/WaveformView;

    invoke-virtual {v0, v2}, Lcom/android/systemui/dynamicisland/WaveformView;->setAnimating(Z)V

    .line 828
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpWaveform:Lcom/android/systemui/dynamicisland/WaveformView;

    invoke-virtual {v0, v2}, Lcom/android/systemui/dynamicisland/WaveformView;->setAnimating(Z)V

    .line 829
    iget-boolean v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mSuspendedForSleep:Z

    if-eqz v0, :cond_2

    .line 830
    invoke-direct {p0}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->cancelMorph()V

    .line 831
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mBlurBackdrop:Landroid/view/View;

    invoke-static {v0}, Lcom/android/systemui/dynamicisland/IslandOverlayView$BlurEngine;->clearBlur(Landroid/view/View;)V

    .line 832
    invoke-virtual {p0, v1}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->setVisibility(I)V

    .line 833
    return-void

    .line 835
    :cond_2
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpandedCard:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 836
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactRow:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 837
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    .line 838
    invoke-direct {p0, v0}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->getCutoutDotRect(Landroid/graphics/RectF;)V

    .line 839
    iget v2, v0, Landroid/graphics/RectF;->left:F

    iget v3, v0, Landroid/graphics/RectF;->top:F

    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    move-result v1

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v4

    invoke-virtual {v0}, Landroid/graphics/RectF;->height()F

    move-result v1

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v5

    .line 840
    invoke-virtual {v0}, Landroid/graphics/RectF;->height()F

    move-result v0

    const/high16 v1, 0x3f000000    # 0.5f

    mul-float v6, v0, v1

    .line 839
    const/4 v7, 0x5

    move-object v1, p0

    invoke-direct/range {v1 .. v7}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->startMorph(FFIIFI)V

    .line 841
    return-void
.end method

.method public isExpanded()Z
    .locals 1

    .line 672
    iget-boolean v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpanded:Z

    return v0
.end method

.method synthetic lambda$bindExpanded$0$com-android-systemui-dynamicisland-IslandOverlayView(Lcom/android/systemui/dynamicisland/IslandItem$ActionItem;Landroid/view/View;)V
    .locals 0

    .line 1694
    iget-object p1, p1, Lcom/android/systemui/dynamicisland/IslandItem$ActionItem;->intent:Landroid/app/PendingIntent;

    invoke-direct {p0, p1}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->sendPendingIntent(Landroid/app/PendingIntent;)V

    .line 1695
    invoke-virtual {p0}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->collapse()V

    .line 1696
    return-void
.end method

.method synthetic lambda$new$0$com-android-systemui-dynamicisland-IslandOverlayView(Landroid/view/View;)V
    .locals 0

    .line 439
    invoke-virtual {p0}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->collapse()V

    return-void
.end method

.method synthetic lambda$new$1$com-android-systemui-dynamicisland-IslandOverlayView(Landroid/view/View;)V
    .locals 0

    .line 442
    invoke-direct {p0}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->launchContentIntent()V

    return-void
.end method

.method synthetic lambda$new$2$com-android-systemui-dynamicisland-IslandOverlayView(Landroid/view/View;)V
    .locals 0

    .line 522
    const/4 p1, -0x1

    invoke-direct {p0, p1}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->sendMediaAction(I)V

    return-void
.end method

.method synthetic lambda$new$3$com-android-systemui-dynamicisland-IslandOverlayView(Landroid/view/View;)V
    .locals 0

    .line 532
    const/4 p1, 0x0

    invoke-direct {p0, p1}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->sendMediaAction(I)V

    return-void
.end method

.method synthetic lambda$new$4$com-android-systemui-dynamicisland-IslandOverlayView(Landroid/view/View;)V
    .locals 0

    .line 538
    const/4 p1, 0x1

    invoke-direct {p0, p1}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->sendMediaAction(I)V

    return-void
.end method

.method synthetic lambda$registerTouchableInsetsListener$0$com-android-systemui-dynamicisland-IslandOverlayView(Ljava/lang/reflect/Method;Ljava/lang/reflect/Field;Ljava/lang/Object;Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 1492
    const-string p3, "onComputeInternalInsets"

    invoke-virtual {p4}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object p4

    invoke-virtual {p3, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p3

    if-eqz p3, :cond_2

    if-eqz p5, :cond_2

    array-length p3, p5

    if-lez p3, :cond_2

    const/4 p3, 0x0

    aget-object p4, p5, p3

    if-eqz p4, :cond_2

    .line 1493
    aget-object p3, p5, p3

    .line 1494
    const/4 p4, 0x3

    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p4

    filled-new-array {p4}, [Ljava/lang/Object;

    move-result-object p4

    invoke-virtual {p1, p3, p4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 1495
    invoke-virtual {p2, p3}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/graphics/Region;

    .line 1496
    if-eqz p1, :cond_2

    .line 1497
    iget-boolean p2, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mHasActiveContent:Z

    if-eqz p2, :cond_1

    iget-boolean p2, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mSuspendedForSleep:Z

    if-nez p2, :cond_1

    invoke-virtual {p0}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->getVisibility()I

    move-result p2

    if-nez p2, :cond_1

    iget-object p2, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCurrRect:Landroid/graphics/RectF;

    invoke-virtual {p2}, Landroid/graphics/RectF;->width()F

    move-result p2

    const/4 p3, 0x0

    cmpg-float p2, p2, p3

    if-gtz p2, :cond_0

    goto :goto_0

    .line 1500
    :cond_0
    iget-object p2, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCurrRect:Landroid/graphics/RectF;

    iget p2, p2, Landroid/graphics/RectF;->left:F

    invoke-static {p2}, Ljava/lang/Math;->round(F)I

    move-result p2

    const/high16 p3, 0x40c00000    # 6.0f

    invoke-direct {p0, p3}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result p4

    sub-int/2addr p2, p4

    .line 1501
    iget-object p4, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCurrRect:Landroid/graphics/RectF;

    iget p4, p4, Landroid/graphics/RectF;->top:F

    invoke-static {p4}, Ljava/lang/Math;->round(F)I

    move-result p4

    invoke-direct {p0, p3}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result p5

    sub-int/2addr p4, p5

    .line 1502
    iget-object p5, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCurrRect:Landroid/graphics/RectF;

    iget p5, p5, Landroid/graphics/RectF;->right:F

    invoke-static {p5}, Ljava/lang/Math;->round(F)I

    move-result p5

    invoke-direct {p0, p3}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v0

    add-int/2addr p5, v0

    .line 1503
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCurrRect:Landroid/graphics/RectF;

    iget v0, v0, Landroid/graphics/RectF;->bottom:F

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    invoke-direct {p0, p3}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result p3

    add-int/2addr v0, p3

    .line 1504
    invoke-virtual {p1, p2, p4, p5, v0}, Landroid/graphics/Region;->set(IIII)Z

    goto :goto_1

    .line 1498
    :cond_1
    :goto_0
    invoke-virtual {p1}, Landroid/graphics/Region;->setEmpty()V

    .line 1508
    :cond_2
    :goto_1
    const/4 p1, 0x0

    return-object p1
.end method

.method public onApplyWindowInsets(Landroid/view/WindowInsets;)Landroid/view/WindowInsets;
    .locals 2

    .line 677
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Landroid/view/WindowInsets;->getDisplayCutout()Landroid/view/DisplayCutout;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 678
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCallbacks:Lcom/android/systemui/dynamicisland/IslandOverlayView$Callbacks;

    invoke-virtual {p1}, Landroid/view/WindowInsets;->getDisplayCutout()Landroid/view/DisplayCutout;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/android/systemui/dynamicisland/IslandOverlayView$Callbacks;->onOverlayCutoutChanged(Landroid/view/DisplayCutout;)V

    .line 680
    :cond_0
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->onApplyWindowInsets(Landroid/view/WindowInsets;)Landroid/view/WindowInsets;

    move-result-object p1

    return-object p1
.end method

.method protected onAttachedToWindow()V
    .locals 1

    .line 685
    invoke-super {p0}, Landroid/widget/FrameLayout;->onAttachedToWindow()V

    .line 686
    invoke-static {}, Lcom/android/systemui/dynamicisland/IslandOverlayView$BlurEngine;->init()V

    .line 687
    invoke-direct {p0}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->registerTouchableInsetsListener()V

    .line 688
    iget-boolean v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mHasActiveContent:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mSuspendedForSleep:Z

    if-nez v0, :cond_0

    .line 689
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->applyHardwareBlur(Z)V

    .line 691
    :cond_0
    return-void
.end method

.method protected onDetachedFromWindow()V
    .locals 0

    .line 695
    invoke-direct {p0}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->cancelAllAnimations()V

    .line 696
    invoke-direct {p0}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->unregisterTouchableInsetsListener()V

    .line 697
    invoke-super {p0}, Landroid/widget/FrameLayout;->onDetachedFromWindow()V

    .line 698
    return-void
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 2

    .line 891
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    const/4 v1, 0x4

    if-ne v0, v1, :cond_0

    iget-boolean v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpanded:Z

    if-eqz v0, :cond_0

    .line 892
    invoke-virtual {p0}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->collapse()V

    .line 893
    const/4 p1, 0x0

    return p1

    .line 895
    :cond_0
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->onInterceptTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    return p1
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 3

    .line 945
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    const/4 v1, 0x4

    const/4 v2, 0x1

    if-ne v0, v1, :cond_0

    iget-boolean v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpanded:Z

    if-eqz v0, :cond_0

    .line 946
    invoke-virtual {p0}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->collapse()V

    .line 947
    return v2

    .line 949
    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    if-nez v0, :cond_1

    .line 950
    iget-boolean p1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mTouchInsidePill:Z

    return p1

    .line 952
    :cond_1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    if-ne v0, v2, :cond_3

    iget-boolean v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mTrackingSwipe:Z

    if-nez v0, :cond_3

    iget-boolean v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mTouchInsidePill:Z

    if-eqz v0, :cond_3

    .line 953
    iget-boolean v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpanded:Z

    if-nez v0, :cond_3

    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCurrentItem:Lcom/android/systemui/dynamicisland/IslandItem;

    if-eqz v0, :cond_3

    .line 954
    iget-object p1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCurrentItem:Lcom/android/systemui/dynamicisland/IslandItem;

    iget-boolean p1, p1, Lcom/android/systemui/dynamicisland/IslandItem;->transientItem:Z

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCurrentItem:Lcom/android/systemui/dynamicisland/IslandItem;

    iget-object p1, p1, Lcom/android/systemui/dynamicisland/IslandItem;->contentIntent:Landroid/app/PendingIntent;

    if-eqz p1, :cond_2

    .line 955
    invoke-direct {p0}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->launchContentIntent()V

    goto :goto_0

    .line 957
    :cond_2
    invoke-virtual {p0}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->expand()V

    .line 959
    :goto_0
    return v2

    .line 962
    :cond_3
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    return p1
.end method

.method public setCutoutGeometry(IIII)V
    .locals 0

    .line 560
    iput p1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mBaseCutoutOffsetX:I

    .line 561
    if-lez p2, :cond_0

    goto :goto_0

    :cond_0
    const/high16 p1, 0x41300000    # 11.0f

    invoke-direct {p0, p1}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result p2

    :goto_0
    iput p2, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mBaseCutoutTopPx:I

    .line 562
    const/high16 p1, 0x41d40000    # 26.5f

    if-lez p3, :cond_1

    goto :goto_1

    :cond_1
    invoke-direct {p0, p1}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result p3

    :goto_1
    iput p3, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mBaseCutoutWidthPx:I

    .line 563
    if-lez p4, :cond_2

    goto :goto_2

    :cond_2
    invoke-direct {p0, p1}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result p4

    :goto_2
    iput p4, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mBaseCutoutHeightPx:I

    .line 564
    const/4 p1, 0x0

    invoke-direct {p0, p1}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->recomputeCutoutLayout(Z)V

    .line 565
    return-void
.end method

.method public showItem(Lcom/android/systemui/dynamicisland/IslandItem;IIZZ)V
    .locals 13

    .line 724
    move/from16 v2, p4

    iget-boolean v3, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mHasActiveContent:Z

    .line 725
    iget-object v4, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCurrentItem:Lcom/android/systemui/dynamicisland/IslandItem;

    const/4 v6, 0x0

    const/4 v7, 0x1

    if-eqz v4, :cond_0

    iget-object v4, p1, Lcom/android/systemui/dynamicisland/IslandItem;->key:Ljava/lang/String;

    iget-object v5, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCurrentItem:Lcom/android/systemui/dynamicisland/IslandItem;

    iget-object v5, v5, Lcom/android/systemui/dynamicisland/IslandItem;->key:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    move v4, v7

    goto :goto_0

    :cond_0
    move v4, v6

    .line 727
    :goto_0
    iput-boolean v7, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mHasActiveContent:Z

    .line 728
    iput-boolean v2, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mSuspendedForSleep:Z

    .line 729
    iput-object p1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCurrentItem:Lcom/android/systemui/dynamicisland/IslandItem;

    .line 730
    iput p2, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mStackIndex:I

    .line 731
    move/from16 v5, p3

    invoke-static {v7, v5}, Ljava/lang/Math;->max(II)I

    move-result v5

    iput v5, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mStackCount:I

    .line 733
    invoke-direct/range {p0 .. p1}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->bindCompact(Lcom/android/systemui/dynamicisland/IslandItem;)V

    .line 734
    invoke-direct/range {p0 .. p1}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->bindExpanded(Lcom/android/systemui/dynamicisland/IslandItem;)V

    .line 736
    const/16 v5, 0x8

    const/4 v8, 0x2

    const/4 v9, 0x0

    const/high16 v10, 0x3f000000    # 0.5f

    const/high16 v11, 0x3f800000    # 1.0f

    if-eqz v2, :cond_1

    .line 737
    invoke-direct {p0}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->cancelMorph()V

    .line 738
    iput-boolean v6, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpanded:Z

    .line 739
    iget-object v1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactRow:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v6}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 740
    iget-object v1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactRow:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v11}, Landroid/widget/LinearLayout;->setAlpha(F)V

    .line 741
    iget-object v1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactRow:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v11}, Landroid/widget/LinearLayout;->setScaleX(F)V

    .line 742
    iget-object v1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactRow:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v11}, Landroid/widget/LinearLayout;->setScaleY(F)V

    .line 743
    iget-object v1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpandedCard:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v5}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 744
    iget-object v1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpandedCard:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v9}, Landroid/widget/LinearLayout;->setAlpha(F)V

    .line 745
    invoke-direct {p0}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->measureCompactTarget()[I

    move-result-object v1

    .line 746
    aget v2, v1, v8

    int-to-float v2, v2

    iget v3, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactTopYPx:I

    int-to-float v3, v3

    move-object v4, v1

    move v1, v2

    move v2, v3

    aget v3, v4, v6

    move-object v5, v4

    aget v4, v5, v7

    aget v5, v5, v7

    int-to-float v5, v5

    mul-float/2addr v5, v10

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->applyStaticGeometry(FFIIF)V

    .line 747
    const/4 v1, 0x4

    invoke-virtual {p0, v1}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->setVisibility(I)V

    .line 748
    iget-object v1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactWaveform:Lcom/android/systemui/dynamicisland/WaveformView;

    invoke-virtual {v1, v6}, Lcom/android/systemui/dynamicisland/WaveformView;->setAnimating(Z)V

    .line 749
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpWaveform:Lcom/android/systemui/dynamicisland/WaveformView;

    invoke-virtual {v0, v6}, Lcom/android/systemui/dynamicisland/WaveformView;->setAnimating(Z)V

    .line 750
    return-void

    .line 753
    :cond_1
    invoke-virtual {p0, v6}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->setVisibility(I)V

    .line 754
    invoke-virtual {p0, v11}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->setAlpha(F)V

    .line 755
    invoke-virtual {p0, v11}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->setScaleX(F)V

    .line 756
    invoke-virtual {p0, v11}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->setScaleY(F)V

    .line 758
    const/high16 v12, 0x41e00000    # 28.0f

    if-nez p5, :cond_6

    if-eqz v4, :cond_2

    iget-boolean v1, p1, Lcom/android/systemui/dynamicisland/IslandItem;->quietUpdate:Z

    if-eqz v1, :cond_2

    if-eqz v3, :cond_2

    goto/16 :goto_1

    .line 774
    :cond_2
    if-nez v3, :cond_3

    .line 775
    iput-boolean v6, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpanded:Z

    .line 776
    iget-object v1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactRow:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v6}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 777
    iget-object v1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactRow:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v9}, Landroid/widget/LinearLayout;->setAlpha(F)V

    .line 778
    iget-object v1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactRow:Landroid/widget/LinearLayout;

    const v2, 0x3f6b851f    # 0.92f

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setScaleX(F)V

    .line 779
    iget-object v1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactRow:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setScaleY(F)V

    .line 780
    iget-object v1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpandedCard:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v5}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 781
    iget-object v1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpandedCard:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v9}, Landroid/widget/LinearLayout;->setAlpha(F)V

    .line 783
    invoke-direct {p0}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->measureCompactTarget()[I

    move-result-object v11

    .line 784
    new-instance v1, Landroid/graphics/RectF;

    invoke-direct {v1}, Landroid/graphics/RectF;-><init>()V

    .line 785
    invoke-direct {p0, v1}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->getCutoutDotRect(Landroid/graphics/RectF;)V

    .line 786
    iget-object v2, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCurrRect:Landroid/graphics/RectF;

    invoke-virtual {v2, v1}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 787
    invoke-virtual {v1}, Landroid/graphics/RectF;->height()F

    move-result v1

    mul-float/2addr v1, v10

    iput v1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCurrCornerPx:F

    .line 788
    iget-object v1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactLeftSlot:Landroid/widget/FrameLayout;

    const/high16 v2, 0x41200000    # 10.0f

    invoke-direct {p0, v2}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v3

    int-to-float v3, v3

    invoke-virtual {v1, v3}, Landroid/widget/FrameLayout;->setTranslationX(F)V

    .line 789
    iget-object v1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactLeftSlot:Landroid/widget/FrameLayout;

    invoke-virtual {v1, v9}, Landroid/widget/FrameLayout;->setAlpha(F)V

    .line 790
    iget-object v1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactRightSlot:Landroid/widget/FrameLayout;

    invoke-direct {p0, v2}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v2

    neg-int v2, v2

    int-to-float v2, v2

    invoke-virtual {v1, v2}, Landroid/widget/FrameLayout;->setTranslationX(F)V

    .line 791
    iget-object v1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactRightSlot:Landroid/widget/FrameLayout;

    invoke-virtual {v1, v9}, Landroid/widget/FrameLayout;->setAlpha(F)V

    .line 792
    iget-object v1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mPillContainer:Landroid/widget/FrameLayout;

    invoke-virtual {v1, v9}, Landroid/widget/FrameLayout;->setAlpha(F)V

    .line 793
    aget v1, v11, v8

    int-to-float v1, v1

    iget v2, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactTopYPx:I

    int-to-float v2, v2

    aget v3, v11, v6

    aget v4, v11, v7

    aget v5, v11, v7

    int-to-float v5, v5

    mul-float/2addr v5, v10

    const/4 v6, 0x1

    move-object v0, p0

    invoke-direct/range {v0 .. v6}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->startMorph(FFIIFI)V

    .line 794
    aget v1, v11, v7

    int-to-float v1, v1

    mul-float/2addr v1, v10

    invoke-direct {p0, v7, v1}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->applyHardwareBlur(ZF)V

    .line 795
    goto/16 :goto_4

    :cond_3
    iget-boolean v1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpanded:Z

    if-eqz v1, :cond_4

    .line 796
    invoke-direct {p0}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->measureExpandedTarget()[I

    move-result-object v1

    .line 797
    aget v2, v1, v8

    int-to-float v2, v2

    iget v3, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpandedTopYPx:I

    int-to-float v3, v3

    move-object v4, v1

    move v1, v2

    move v2, v3

    aget v3, v4, v6

    aget v4, v4, v7

    invoke-direct {p0, v12}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v5

    int-to-float v5, v5

    const/4 v6, 0x4

    move-object v0, p0

    invoke-direct/range {v0 .. v6}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->startMorph(FFIIFI)V

    .line 798
    invoke-direct {p0, v12}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v1

    int-to-float v1, v1

    invoke-direct {p0, v7, v1}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->applyHardwareBlur(ZF)V

    .line 799
    goto/16 :goto_4

    .line 800
    :cond_4
    invoke-direct {p0}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->measureCompactTarget()[I

    move-result-object v9

    .line 801
    if-nez v4, :cond_5

    .line 802
    iget-object v1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactLeftSlot:Landroid/widget/FrameLayout;

    const v2, 0x3e3851ec    # 0.18f

    invoke-virtual {v1, v2}, Landroid/widget/FrameLayout;->setAlpha(F)V

    .line 803
    iget-object v1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactRightSlot:Landroid/widget/FrameLayout;

    invoke-virtual {v1, v2}, Landroid/widget/FrameLayout;->setAlpha(F)V

    .line 804
    iget-object v1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactRightSlot:Landroid/widget/FrameLayout;

    const/high16 v2, 0x41000000    # 8.0f

    invoke-direct {p0, v2}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v2

    int-to-float v2, v2

    invoke-virtual {v1, v2}, Landroid/widget/FrameLayout;->setTranslationX(F)V

    .line 806
    :cond_5
    aget v1, v9, v8

    int-to-float v1, v1

    iget v2, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactTopYPx:I

    int-to-float v2, v2

    aget v3, v9, v6

    aget v4, v9, v7

    aget v5, v9, v7

    int-to-float v5, v5

    mul-float/2addr v5, v10

    const/4 v6, 0x4

    move-object v0, p0

    invoke-direct/range {v0 .. v6}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->startMorph(FFIIFI)V

    .line 807
    aget v1, v9, v7

    int-to-float v1, v1

    mul-float/2addr v1, v10

    invoke-direct {p0, v7, v1}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->applyHardwareBlur(ZF)V

    goto/16 :goto_4

    .line 759
    :cond_6
    :goto_1
    iget-boolean v1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mMorphRunning:Z

    if-nez v1, :cond_8

    .line 760
    iget-boolean v1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpanded:Z

    if-eqz v1, :cond_7

    .line 761
    invoke-direct {p0}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->measureExpandedTarget()[I

    move-result-object v1

    .line 762
    aget v2, v1, v8

    int-to-float v2, v2

    iget v3, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpandedTopYPx:I

    int-to-float v3, v3

    move-object v4, v1

    move v1, v2

    move v2, v3

    aget v3, v4, v6

    aget v4, v4, v7

    invoke-direct {p0, v12}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v5

    int-to-float v5, v5

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->applyStaticGeometry(FFIIF)V

    .line 763
    goto :goto_2

    .line 764
    :cond_7
    iget-object v1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactRow:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v6}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 765
    iget-object v1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactRow:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v11}, Landroid/widget/LinearLayout;->setAlpha(F)V

    .line 766
    iget-object v1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactRow:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v11}, Landroid/widget/LinearLayout;->setScaleX(F)V

    .line 767
    iget-object v1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactRow:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v11}, Landroid/widget/LinearLayout;->setScaleY(F)V

    .line 768
    iget-object v1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpandedCard:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v5}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 769
    invoke-direct {p0}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->measureCompactTarget()[I

    move-result-object v1

    .line 770
    aget v2, v1, v8

    int-to-float v2, v2

    iget v3, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactTopYPx:I

    int-to-float v3, v3

    aget v4, v1, v6

    move-object v5, v1

    move v1, v2

    move v2, v3

    move v3, v4

    aget v4, v5, v7

    aget v5, v5, v7

    int-to-float v5, v5

    mul-float/2addr v5, v10

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->applyStaticGeometry(FFIIF)V

    .line 773
    :cond_8
    :goto_2
    iget-boolean v1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpanded:Z

    if-eqz v1, :cond_9

    invoke-direct {p0, v12}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->dp(F)I

    move-result v1

    int-to-float v1, v1

    goto :goto_3

    :cond_9
    iget v1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactHeightPx:I

    int-to-float v1, v1

    mul-float/2addr v1, v10

    :goto_3
    invoke-direct {p0, v7, v1}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->applyHardwareBlur(ZF)V

    .line 810
    :goto_4
    invoke-direct {p0}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->updateTicker()V

    .line 811
    return-void
.end method

.method public suspendVisibleWithoutTeardown()V
    .locals 2

    .line 704
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mSuspendedForSleep:Z

    .line 705
    invoke-direct {p0}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->cancelMorph()V

    .line 706
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mTickRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 707
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mCompactWaveform:Lcom/android/systemui/dynamicisland/WaveformView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/systemui/dynamicisland/WaveformView;->setAnimating(Z)V

    .line 708
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mExpWaveform:Lcom/android/systemui/dynamicisland/WaveformView;

    invoke-virtual {v0, v1}, Lcom/android/systemui/dynamicisland/WaveformView;->setAnimating(Z)V

    .line 709
    iget-boolean v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView;->mHasActiveContent:Z

    if-eqz v0, :cond_0

    .line 710
    const/4 v0, 0x4

    invoke-virtual {p0, v0}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->setVisibility(I)V

    .line 711
    const/high16 v0, 0x3f800000    # 1.0f

    invoke-virtual {p0, v0}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->setAlpha(F)V

    .line 712
    invoke-virtual {p0, v0}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->setScaleX(F)V

    .line 713
    invoke-virtual {p0, v0}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->setScaleY(F)V

    goto :goto_0

    .line 715
    :cond_0
    const/16 v0, 0x8

    invoke-virtual {p0, v0}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->setVisibility(I)V

    .line 717
    :goto_0
    invoke-virtual {p0}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->invalidate()V

    .line 718
    return-void
.end method
