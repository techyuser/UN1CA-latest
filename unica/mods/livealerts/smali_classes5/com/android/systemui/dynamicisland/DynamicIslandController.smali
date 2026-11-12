.class public final Lcom/android/systemui/dynamicisland/DynamicIslandController;
.super Ljava/lang/Object;
.source "DynamicIslandController.java"

# interfaces
.implements Lcom/android/systemui/dynamicisland/MediaIslandSource$Listener;
.implements Lcom/android/systemui/dynamicisland/SystemEventSource$Listener;
.implements Lcom/android/systemui/dynamicisland/NotificationIslandSource$Listener;
.implements Lcom/android/systemui/dynamicisland/IslandOverlayView$Callbacks;


# static fields
.field private static final KEY_LIVE_PREVIEW:Ljava/lang/String; = "sys:live_preview"

.field private static final sInitialized:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private static volatile sInstance:Lcom/android/systemui/dynamicisland/DynamicIslandController;


# instance fields
.field private final mContext:Landroid/content/Context;

.field private mCutoutCenterOffsetX:I

.field private mCutoutHeightPx:I

.field private mCutoutKnown:Z

.field private mCutoutTopPx:I

.field private mCutoutWidthPx:I

.field private final mDisplayListener:Landroid/hardware/display/DisplayManager$DisplayListener;

.field private final mDisplayManager:Landroid/hardware/display/DisplayManager;

.field private mDisplayOn:Z

.field private final mExpireRunnable:Ljava/lang/Runnable;

.field private mInteractive:Z

.field private final mItems:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/android/systemui/dynamicisland/IslandItem;",
            ">;"
        }
    .end annotation
.end field

.field private mLandscapeOrFullscreenHidden:Z

.field private mLastPreviewNonce:J

.field private mLayoutParams:Landroid/view/WindowManager$LayoutParams;

.field private final mMainHandler:Landroid/os/Handler;

.field private mManualSelectedKey:Ljava/lang/String;

.field private final mMediaSource:Lcom/android/systemui/dynamicisland/MediaIslandSource;

.field private final mNotifSource:Lcom/android/systemui/dynamicisland/NotificationIslandSource;

.field private mOverlayView:Lcom/android/systemui/dynamicisland/IslandOverlayView;

.field private final mPowerManager:Landroid/os/PowerManager;

.field private final mPowerReceiver:Landroid/content/BroadcastReceiver;

.field private final mPrefs:Lcom/android/systemui/dynamicisland/LiveAlertsPrefs;

.field private final mPrefsObserver:Landroid/database/ContentObserver;

.field private final mSetOutsideWatchRunnable:Ljava/lang/Runnable;

.field private final mSystemSource:Lcom/android/systemui/dynamicisland/SystemEventSource;

.field private mWasSuspended:Z

.field private mWindowAttached:Z

.field private final mWindowManager:Landroid/view/WindowManager;


# direct methods
.method public static synthetic $r8$lambda$S8KK3JBdkXks5xWLZfKhxykQkEw(Lcom/android/systemui/dynamicisland/DynamicIslandController;)V
    .locals 0

    invoke-direct {p0}, Lcom/android/systemui/dynamicisland/DynamicIslandController;->startInternal()V

    return-void
.end method

.method public static synthetic $r8$lambda$_pGLpAK1Kq36gFEUrb8LOaJqCis(Lcom/android/systemui/dynamicisland/DynamicIslandController;)V
    .locals 0

    invoke-direct {p0}, Lcom/android/systemui/dynamicisland/DynamicIslandController;->pruneExpiredAndRender()V

    return-void
.end method

.method public static synthetic $r8$lambda$v5HSuco2ymnxFOIClvIpFDuJ0b8(Lcom/android/systemui/dynamicisland/DynamicIslandController;)V
    .locals 0

    invoke-direct {p0}, Lcom/android/systemui/dynamicisland/DynamicIslandController;->applyWindowLayoutUpdate()V

    return-void
.end method

.method static bridge synthetic -$$Nest$fgetmOverlayView(Lcom/android/systemui/dynamicisland/DynamicIslandController;)Lcom/android/systemui/dynamicisland/IslandOverlayView;
    .locals 0

    iget-object p0, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mOverlayView:Lcom/android/systemui/dynamicisland/IslandOverlayView;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fputmDisplayOn(Lcom/android/systemui/dynamicisland/DynamicIslandController;Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mDisplayOn:Z

    return-void
.end method

.method static bridge synthetic -$$Nest$fputmInteractive(Lcom/android/systemui/dynamicisland/DynamicIslandController;Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mInteractive:Z

    return-void
.end method

.method static bridge synthetic -$$Nest$monLivePrefsChanged(Lcom/android/systemui/dynamicisland/DynamicIslandController;)V
    .locals 0

    invoke-direct {p0}, Lcom/android/systemui/dynamicisland/DynamicIslandController;->onLivePrefsChanged()V

    return-void
.end method

.method static bridge synthetic -$$Nest$mrender(Lcom/android/systemui/dynamicisland/DynamicIslandController;Z)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/android/systemui/dynamicisland/DynamicIslandController;->render(Z)V

    return-void
.end method

.method static bridge synthetic -$$Nest$mupdateDisplayVisibilityAndRotation(Lcom/android/systemui/dynamicisland/DynamicIslandController;)V
    .locals 0

    invoke-direct {p0}, Lcom/android/systemui/dynamicisland/DynamicIslandController;->updateDisplayVisibilityAndRotation()V

    return-void
.end method

.method static constructor <clinit>()V
    .locals 2

    .line 50
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    sput-object v0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->sInitialized:Ljava/util/concurrent/atomic/AtomicBoolean;

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 136
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 54
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mMainHandler:Landroid/os/Handler;

    .line 62
    new-instance v0, Lcom/android/systemui/dynamicisland/LiveAlertsPrefs;

    invoke-direct {v0}, Lcom/android/systemui/dynamicisland/LiveAlertsPrefs;-><init>()V

    iput-object v0, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mPrefs:Lcom/android/systemui/dynamicisland/LiveAlertsPrefs;

    .line 63
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mLastPreviewNonce:J

    .line 69
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mWindowAttached:Z

    .line 71
    new-instance v1, Ljava/util/LinkedHashMap;

    invoke-direct {v1}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v1, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mItems:Ljava/util/Map;

    .line 72
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mManualSelectedKey:Ljava/lang/String;

    .line 74
    iput v0, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mCutoutCenterOffsetX:I

    .line 75
    const/16 v1, 0x1d

    iput v1, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mCutoutTopPx:I

    .line 76
    const/16 v1, 0x46

    iput v1, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mCutoutWidthPx:I

    .line 77
    iput v1, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mCutoutHeightPx:I

    .line 78
    iput-boolean v0, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mCutoutKnown:Z

    .line 80
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mInteractive:Z

    .line 81
    iput-boolean v1, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mDisplayOn:Z

    .line 82
    iput-boolean v0, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mLandscapeOrFullscreenHidden:Z

    .line 83
    iput-boolean v0, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mWasSuspended:Z

    .line 85
    new-instance v0, Lcom/android/systemui/dynamicisland/DynamicIslandController$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0}, Lcom/android/systemui/dynamicisland/DynamicIslandController$$ExternalSyntheticLambda0;-><init>(Lcom/android/systemui/dynamicisland/DynamicIslandController;)V

    iput-object v0, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mExpireRunnable:Ljava/lang/Runnable;

    .line 87
    new-instance v0, Lcom/android/systemui/dynamicisland/DynamicIslandController$1;

    iget-object v1, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mMainHandler:Landroid/os/Handler;

    invoke-direct {v0, p0, v1}, Lcom/android/systemui/dynamicisland/DynamicIslandController$1;-><init>(Lcom/android/systemui/dynamicisland/DynamicIslandController;Landroid/os/Handler;)V

    iput-object v0, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mPrefsObserver:Landroid/database/ContentObserver;

    .line 100
    new-instance v0, Lcom/android/systemui/dynamicisland/DynamicIslandController$2;

    invoke-direct {v0, p0}, Lcom/android/systemui/dynamicisland/DynamicIslandController$2;-><init>(Lcom/android/systemui/dynamicisland/DynamicIslandController;)V

    iput-object v0, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mDisplayListener:Landroid/hardware/display/DisplayManager$DisplayListener;

    .line 117
    new-instance v0, Lcom/android/systemui/dynamicisland/DynamicIslandController$3;

    invoke-direct {v0, p0}, Lcom/android/systemui/dynamicisland/DynamicIslandController$3;-><init>(Lcom/android/systemui/dynamicisland/DynamicIslandController;)V

    iput-object v0, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mPowerReceiver:Landroid/content/BroadcastReceiver;

    .line 480
    new-instance v0, Lcom/android/systemui/dynamicisland/DynamicIslandController$$ExternalSyntheticLambda1;

    invoke-direct {v0, p0}, Lcom/android/systemui/dynamicisland/DynamicIslandController$$ExternalSyntheticLambda1;-><init>(Lcom/android/systemui/dynamicisland/DynamicIslandController;)V

    iput-object v0, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mSetOutsideWatchRunnable:Ljava/lang/Runnable;

    .line 137
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mContext:Landroid/content/Context;

    .line 138
    iget-object p1, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mContext:Landroid/content/Context;

    const-string v0, "window"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/WindowManager;

    iput-object p1, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mWindowManager:Landroid/view/WindowManager;

    .line 139
    iget-object p1, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mContext:Landroid/content/Context;

    const-string v0, "power"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/os/PowerManager;

    iput-object p1, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mPowerManager:Landroid/os/PowerManager;

    .line 140
    iget-object p1, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mContext:Landroid/content/Context;

    const-string v0, "display"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/hardware/display/DisplayManager;

    iput-object p1, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mDisplayManager:Landroid/hardware/display/DisplayManager;

    .line 142
    new-instance p1, Lcom/android/systemui/dynamicisland/MediaIslandSource;

    iget-object v0, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mContext:Landroid/content/Context;

    invoke-direct {p1, v0, p0}, Lcom/android/systemui/dynamicisland/MediaIslandSource;-><init>(Landroid/content/Context;Lcom/android/systemui/dynamicisland/MediaIslandSource$Listener;)V

    iput-object p1, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mMediaSource:Lcom/android/systemui/dynamicisland/MediaIslandSource;

    .line 143
    new-instance p1, Lcom/android/systemui/dynamicisland/SystemEventSource;

    iget-object v0, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mContext:Landroid/content/Context;

    invoke-direct {p1, v0, p0}, Lcom/android/systemui/dynamicisland/SystemEventSource;-><init>(Landroid/content/Context;Lcom/android/systemui/dynamicisland/SystemEventSource$Listener;)V

    iput-object p1, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mSystemSource:Lcom/android/systemui/dynamicisland/SystemEventSource;

    .line 144
    new-instance p1, Lcom/android/systemui/dynamicisland/NotificationIslandSource;

    iget-object v0, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mContext:Landroid/content/Context;

    invoke-direct {p1, v0, p0}, Lcom/android/systemui/dynamicisland/NotificationIslandSource;-><init>(Landroid/content/Context;Lcom/android/systemui/dynamicisland/NotificationIslandSource$Listener;)V

    iput-object p1, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mNotifSource:Lcom/android/systemui/dynamicisland/NotificationIslandSource;

    .line 145
    return-void
.end method

.method private applyDisplayCutout(Landroid/view/DisplayCutout;)Z
    .locals 16

    .line 362
    move-object/from16 v1, p0

    const/4 v2, 0x0

    if-nez p1, :cond_0

    .line 363
    return v2

    .line 365
    :cond_0
    iget-object v0, v1, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v3, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 367
    const/4 v4, 0x2

    const/4 v5, 0x1

    :try_start_0
    invoke-virtual/range {p1 .. p1}, Landroid/view/DisplayCutout;->getCutoutPath()Landroid/graphics/Path;

    move-result-object v0

    .line 368
    if-eqz v0, :cond_8

    invoke-virtual {v0}, Landroid/graphics/Path;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_8

    .line 371
    new-instance v6, Landroid/graphics/RectF;

    const v7, -0x800001

    const v8, 0x7f7fffff    # Float.MAX_VALUE

    invoke-direct {v6, v8, v8, v7, v7}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 372
    nop

    .line 373
    new-instance v7, Landroid/graphics/PathMeasure;

    invoke-direct {v7, v0, v2}, Landroid/graphics/PathMeasure;-><init>(Landroid/graphics/Path;Z)V

    .line 374
    new-array v8, v4, [F

    move v9, v2

    .line 376
    :cond_1
    invoke-virtual {v7}, Landroid/graphics/PathMeasure;->getLength()F

    move-result v10

    .line 377
    const/high16 v11, 0x40c00000    # 6.0f

    cmpl-float v12, v10, v11

    const/high16 v13, 0x42880000    # 68.0f

    if-lez v12, :cond_3

    .line 378
    nop

    .line 379
    move v12, v2

    :goto_0
    const/16 v14, 0x20

    if-gt v12, v14, :cond_3

    .line 380
    int-to-float v15, v12

    mul-float/2addr v15, v10

    int-to-float v14, v14

    div-float/2addr v15, v14

    const/4 v14, 0x0

    invoke-virtual {v7, v15, v8, v14}, Landroid/graphics/PathMeasure;->getPosTan(F[F[F)Z

    move-result v14

    if-eqz v14, :cond_2

    .line 381
    aget v14, v8, v5

    invoke-direct {v1, v13}, Lcom/android/systemui/dynamicisland/DynamicIslandController;->dp(F)I

    move-result v15

    int-to-float v15, v15

    cmpg-float v14, v14, v15

    if-gez v14, :cond_2

    .line 382
    iget v9, v6, Landroid/graphics/RectF;->left:F

    aget v14, v8, v2

    invoke-static {v9, v14}, Ljava/lang/Math;->min(FF)F

    move-result v9

    iput v9, v6, Landroid/graphics/RectF;->left:F

    .line 383
    iget v9, v6, Landroid/graphics/RectF;->top:F

    aget v14, v8, v5

    invoke-static {v9, v14}, Ljava/lang/Math;->min(FF)F

    move-result v9

    iput v9, v6, Landroid/graphics/RectF;->top:F

    .line 384
    iget v9, v6, Landroid/graphics/RectF;->right:F

    aget v14, v8, v2

    invoke-static {v9, v14}, Ljava/lang/Math;->max(FF)F

    move-result v9

    iput v9, v6, Landroid/graphics/RectF;->right:F

    .line 385
    iget v9, v6, Landroid/graphics/RectF;->bottom:F

    aget v14, v8, v5

    invoke-static {v9, v14}, Ljava/lang/Math;->max(FF)F

    move-result v9

    iput v9, v6, Landroid/graphics/RectF;->bottom:F

    .line 386
    move v9, v5

    .line 379
    :cond_2
    add-int/lit8 v12, v12, 0x1

    goto :goto_0

    .line 391
    :cond_3
    invoke-virtual {v7}, Landroid/graphics/PathMeasure;->nextContour()Z

    move-result v10

    if-nez v10, :cond_1

    .line 393
    if-nez v9, :cond_4

    .line 394
    invoke-virtual {v0, v6, v5}, Landroid/graphics/Path;->computeBounds(Landroid/graphics/RectF;Z)V

    .line 396
    :cond_4
    invoke-virtual {v6}, Landroid/graphics/RectF;->width()F

    move-result v0

    cmpl-float v0, v0, v11

    if-lez v0, :cond_8

    invoke-virtual {v6}, Landroid/graphics/RectF;->height()F

    move-result v0

    cmpl-float v0, v0, v11

    if-lez v0, :cond_8

    iget v0, v6, Landroid/graphics/RectF;->bottom:F

    invoke-direct {v1, v13}, Lcom/android/systemui/dynamicisland/DynamicIslandController;->dp(F)I

    move-result v7

    int-to-float v7, v7

    cmpg-float v0, v0, v7

    if-gez v0, :cond_8

    .line 397
    invoke-virtual {v6}, Landroid/graphics/RectF;->width()F

    move-result v0

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    .line 398
    invoke-virtual {v6}, Landroid/graphics/RectF;->height()F

    move-result v7

    invoke-static {v7}, Ljava/lang/Math;->round(F)I

    move-result v7

    .line 399
    iget v8, v6, Landroid/graphics/RectF;->top:F

    invoke-static {v8}, Ljava/lang/Math;->round(F)I

    move-result v8

    .line 400
    const/high16 v9, 0x40400000    # 3.0f

    invoke-direct {v1, v9}, Lcom/android/systemui/dynamicisland/DynamicIslandController;->dp(F)I

    move-result v9

    if-ge v8, v9, :cond_5

    int-to-float v9, v7

    int-to-float v10, v0

    const/high16 v11, 0x3fa00000    # 1.25f

    mul-float/2addr v11, v10

    cmpl-float v9, v9, v11

    if-lez v9, :cond_5

    iget v9, v6, Landroid/graphics/RectF;->bottom:F

    cmpl-float v9, v9, v10

    if-lez v9, :cond_5

    .line 401
    const/high16 v7, 0x41e80000    # 29.0f

    invoke-direct {v1, v7}, Lcom/android/systemui/dynamicisland/DynamicIslandController;->dp(F)I

    move-result v7

    invoke-static {v7, v0}, Ljava/lang/Math;->min(II)I

    move-result v7

    .line 402
    const/high16 v8, 0x41000000    # 8.0f

    invoke-direct {v1, v8}, Lcom/android/systemui/dynamicisland/DynamicIslandController;->dp(F)I

    move-result v8

    iget v9, v6, Landroid/graphics/RectF;->bottom:F

    int-to-float v10, v7

    sub-float/2addr v9, v10

    invoke-static {v9}, Ljava/lang/Math;->round(F)I

    move-result v9

    invoke-static {v8, v9}, Ljava/lang/Math;->max(II)I

    move-result v8

    .line 404
    :cond_5
    invoke-virtual {v6}, Landroid/graphics/RectF;->centerX()F

    move-result v6

    int-to-float v9, v3

    const/high16 v10, 0x3f000000    # 0.5f

    mul-float/2addr v9, v10

    sub-float/2addr v6, v9

    invoke-static {v6}, Ljava/lang/Math;->round(F)I

    move-result v6

    .line 405
    const/high16 v9, 0x40e00000    # 7.0f

    invoke-direct {v1, v9}, Lcom/android/systemui/dynamicisland/DynamicIslandController;->dp(F)I

    move-result v9

    invoke-static {v9, v8}, Ljava/lang/Math;->max(II)I

    move-result v8

    .line 406
    const/high16 v9, 0x41900000    # 18.0f

    invoke-direct {v1, v9}, Lcom/android/systemui/dynamicisland/DynamicIslandController;->dp(F)I

    move-result v10

    invoke-static {v10, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 407
    invoke-direct {v1, v9}, Lcom/android/systemui/dynamicisland/DynamicIslandController;->dp(F)I

    move-result v9

    invoke-static {v9, v7}, Ljava/lang/Math;->max(II)I

    move-result v7

    .line 408
    iget-boolean v9, v1, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mCutoutKnown:Z

    if-eqz v9, :cond_7

    iget v9, v1, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mCutoutCenterOffsetX:I

    if-ne v6, v9, :cond_7

    iget v9, v1, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mCutoutTopPx:I

    if-ne v8, v9, :cond_7

    iget v9, v1, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mCutoutWidthPx:I

    if-ne v0, v9, :cond_7

    iget v9, v1, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mCutoutHeightPx:I

    if-eq v7, v9, :cond_6

    goto :goto_1

    :cond_6
    move v9, v2

    goto :goto_2

    :cond_7
    :goto_1
    move v9, v5

    .line 410
    :goto_2
    iput v6, v1, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mCutoutCenterOffsetX:I

    .line 411
    iput v8, v1, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mCutoutTopPx:I

    .line 412
    iput v0, v1, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mCutoutWidthPx:I

    .line 413
    iput v7, v1, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mCutoutHeightPx:I

    .line 414
    iput-boolean v5, v1, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mCutoutKnown:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 415
    return v9

    .line 419
    :cond_8
    goto :goto_3

    .line 418
    :catchall_0
    move-exception v0

    .line 420
    :goto_3
    invoke-virtual/range {p1 .. p1}, Landroid/view/DisplayCutout;->getBoundingRectTop()Landroid/graphics/Rect;

    move-result-object v0

    .line 421
    if-eqz v0, :cond_b

    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v6

    if-lez v6, :cond_b

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v6

    if-lez v6, :cond_b

    .line 422
    invoke-virtual {v0}, Landroid/graphics/Rect;->centerX()I

    move-result v6

    div-int/2addr v3, v4

    sub-int/2addr v6, v3

    .line 423
    const/high16 v3, 0x41e00000    # 28.0f

    invoke-direct {v1, v3}, Lcom/android/systemui/dynamicisland/DynamicIslandController;->dp(F)I

    move-result v3

    const/high16 v4, 0x41a80000    # 21.0f

    invoke-direct {v1, v4}, Lcom/android/systemui/dynamicisland/DynamicIslandController;->dp(F)I

    move-result v4

    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v7

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v8

    int-to-float v8, v8

    const v9, 0x3f3851ec    # 0.72f

    mul-float/2addr v8, v9

    invoke-static {v8}, Ljava/lang/Math;->round(F)I

    move-result v8

    invoke-static {v7, v8}, Ljava/lang/Math;->min(II)I

    move-result v7

    invoke-static {v4, v7}, Ljava/lang/Math;->max(II)I

    move-result v4

    invoke-static {v3, v4}, Ljava/lang/Math;->min(II)I

    move-result v3

    .line 424
    const/high16 v4, 0x41100000    # 9.0f

    invoke-direct {v1, v4}, Lcom/android/systemui/dynamicisland/DynamicIslandController;->dp(F)I

    move-result v4

    iget v7, v0, Landroid/graphics/Rect;->bottom:I

    sub-int/2addr v7, v3

    invoke-static {v4, v7}, Ljava/lang/Math;->max(II)I

    move-result v4

    .line 425
    const/high16 v7, 0x40000000    # 2.0f

    invoke-direct {v1, v7}, Lcom/android/systemui/dynamicisland/DynamicIslandController;->dp(F)I

    move-result v7

    add-int/2addr v7, v3

    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v0

    invoke-static {v7, v0}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 426
    iget-boolean v7, v1, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mCutoutKnown:Z

    if-eqz v7, :cond_9

    iget v7, v1, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mCutoutCenterOffsetX:I

    if-ne v6, v7, :cond_9

    iget v7, v1, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mCutoutTopPx:I

    if-ne v4, v7, :cond_9

    iget v7, v1, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mCutoutWidthPx:I

    if-ne v0, v7, :cond_9

    iget v7, v1, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mCutoutHeightPx:I

    if-eq v3, v7, :cond_a

    :cond_9
    move v2, v5

    .line 428
    :cond_a
    iput v6, v1, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mCutoutCenterOffsetX:I

    .line 429
    iput v4, v1, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mCutoutTopPx:I

    .line 430
    iput v0, v1, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mCutoutWidthPx:I

    .line 431
    iput v3, v1, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mCutoutHeightPx:I

    .line 432
    iput-boolean v5, v1, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mCutoutKnown:Z

    .line 433
    return v2

    .line 435
    :cond_b
    return v2
.end method

.method private applyWindowLayoutUpdate()V
    .locals 3

    .line 472
    iget-boolean v0, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mWindowAttached:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mWindowManager:Landroid/view/WindowManager;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mOverlayView:Lcom/android/systemui/dynamicisland/IslandOverlayView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mLayoutParams:Landroid/view/WindowManager$LayoutParams;

    if-eqz v0, :cond_0

    .line 474
    :try_start_0
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mWindowManager:Landroid/view/WindowManager;

    iget-object v1, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mOverlayView:Lcom/android/systemui/dynamicisland/IslandOverlayView;

    iget-object v2, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mLayoutParams:Landroid/view/WindowManager$LayoutParams;

    invoke-interface {v0, v1, v2}, Landroid/view/WindowManager;->updateViewLayout(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 476
    goto :goto_0

    .line 475
    :catchall_0
    move-exception v0

    .line 478
    :cond_0
    :goto_0
    return-void
.end method

.method private dp(F)I
    .locals 1

    .line 621
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    mul-float/2addr p1, v0

    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    move-result p1

    return p1
.end method

.method private findCurrentIndex(Ljava/util/List;)I
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/systemui/dynamicisland/IslandItem;",
            ">;)I"
        }
    .end annotation

    .line 601
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mManualSelectedKey:Ljava/lang/String;

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    .line 602
    move v0, v1

    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v2

    if-ge v0, v2, :cond_1

    .line 603
    iget-object v2, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mManualSelectedKey:Ljava/lang/String;

    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/systemui/dynamicisland/IslandItem;

    iget-object v3, v3, Lcom/android/systemui/dynamicisland/IslandItem;->key:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 604
    return v0

    .line 602
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 607
    :cond_1
    const/4 p1, 0x0

    iput-object p1, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mManualSelectedKey:Ljava/lang/String;

    .line 609
    :cond_2
    return v1
.end method

.method private getOrderedItems()Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/android/systemui/dynamicisland/IslandItem;",
            ">;"
        }
    .end annotation

    .line 582
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mPrefs:Lcom/android/systemui/dynamicisland/LiveAlertsPrefs;

    iget-boolean v0, v0, Lcom/android/systemui/dynamicisland/LiveAlertsPrefs;->enabled:Z

    if-nez v0, :cond_0

    .line 583
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    return-object v0

    .line 585
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 586
    iget-object v1, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mItems:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/systemui/dynamicisland/IslandItem;

    .line 587
    const-string v3, "sys:live_preview"

    iget-object v4, v2, Lcom/android/systemui/dynamicisland/IslandItem;->key:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1

    iget-object v3, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mPrefs:Lcom/android/systemui/dynamicisland/LiveAlertsPrefs;

    iget-object v4, v2, Lcom/android/systemui/dynamicisland/IslandItem;->category:Lcom/android/systemui/dynamicisland/IslandItem$Category;

    invoke-virtual {v3, v4}, Lcom/android/systemui/dynamicisland/LiveAlertsPrefs;->isCategoryAllowed(Lcom/android/systemui/dynamicisland/IslandItem$Category;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 588
    :cond_1
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 590
    :cond_2
    goto :goto_0

    .line 591
    :cond_3
    new-instance v1, Lcom/android/systemui/dynamicisland/DynamicIslandController$4;

    invoke-direct {v1, p0}, Lcom/android/systemui/dynamicisland/DynamicIslandController$4;-><init>(Lcom/android/systemui/dynamicisland/DynamicIslandController;)V

    invoke-static {v0, v1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 597
    return-object v0
.end method

.method public static init(Landroid/content/Context;)V
    .locals 3

    .line 148
    if-eqz p0, :cond_2

    sget-object v0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->sInitialized:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_1

    .line 151
    :cond_0
    new-instance v0, Lcom/android/systemui/dynamicisland/DynamicIslandController;

    invoke-direct {v0, p0}, Lcom/android/systemui/dynamicisland/DynamicIslandController;-><init>(Landroid/content/Context;)V

    .line 152
    sput-object v0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->sInstance:Lcom/android/systemui/dynamicisland/DynamicIslandController;

    .line 153
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object p0

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    if-ne p0, v1, :cond_1

    .line 154
    invoke-direct {v0}, Lcom/android/systemui/dynamicisland/DynamicIslandController;->startInternal()V

    goto :goto_0

    .line 156
    :cond_1
    iget-object p0, v0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mMainHandler:Landroid/os/Handler;

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v1, Lcom/android/systemui/dynamicisland/DynamicIslandController$$ExternalSyntheticLambda5;

    invoke-direct {v1, v0}, Lcom/android/systemui/dynamicisland/DynamicIslandController$$ExternalSyntheticLambda5;-><init>(Lcom/android/systemui/dynamicisland/DynamicIslandController;)V

    invoke-virtual {p0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 158
    :goto_0
    return-void

    .line 149
    :cond_2
    :goto_1
    return-void
.end method

.method private inspectStatusBarView(Landroid/view/View;)V
    .locals 5

    .line 303
    iget-boolean v0, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mWindowAttached:Z

    if-eqz v0, :cond_9

    iget-object v0, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mOverlayView:Lcom/android/systemui/dynamicisland/IslandOverlayView;

    if-nez v0, :cond_0

    goto/16 :goto_5

    .line 306
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getRootWindowInsets()Landroid/view/WindowInsets;

    move-result-object v0

    .line 307
    nop

    .line 308
    nop

    .line 309
    const/4 v1, 0x0

    if-eqz v0, :cond_7

    .line 310
    invoke-virtual {v0}, Landroid/view/WindowInsets;->getDisplayCutout()Landroid/view/DisplayCutout;

    move-result-object v2

    .line 311
    const/4 v3, 0x1

    if-eqz v2, :cond_1

    invoke-direct {p0, v2}, Lcom/android/systemui/dynamicisland/DynamicIslandController;->applyDisplayCutout(Landroid/view/DisplayCutout;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 312
    move v2, v3

    goto :goto_0

    .line 314
    :cond_1
    move v2, v1

    :goto_0
    invoke-static {}, Landroid/view/WindowInsets$Type;->statusBars()I

    move-result v4

    invoke-virtual {v0, v4}, Landroid/view/WindowInsets;->isVisible(I)Z

    move-result v0

    .line 315
    invoke-virtual {p1}, Landroid/view/View;->getDisplay()Landroid/view/Display;

    move-result-object v4

    if-eqz v4, :cond_2

    .line 316
    invoke-virtual {p1}, Landroid/view/View;->getDisplay()Landroid/view/Display;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/Display;->getRotation()I

    move-result p1

    goto :goto_1

    .line 317
    :cond_2
    move p1, v1

    .line 318
    :goto_1
    if-nez p1, :cond_4

    if-nez v0, :cond_3

    goto :goto_2

    :cond_3
    move p1, v1

    goto :goto_3

    :cond_4
    :goto_2
    move p1, v3

    .line 319
    :goto_3
    iget-boolean v0, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mLandscapeOrFullscreenHidden:Z

    if-eq p1, v0, :cond_5

    .line 320
    iput-boolean p1, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mLandscapeOrFullscreenHidden:Z

    .line 321
    if-eqz p1, :cond_5

    iget-object p1, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mOverlayView:Lcom/android/systemui/dynamicisland/IslandOverlayView;

    invoke-virtual {p1}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->isExpanded()Z

    move-result p1

    if-eqz p1, :cond_5

    .line 322
    iget-object p1, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mOverlayView:Lcom/android/systemui/dynamicisland/IslandOverlayView;

    invoke-virtual {p1}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->collapse()V

    .line 325
    :cond_5
    iget-object p1, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mPowerManager:Landroid/os/PowerManager;

    if-eqz p1, :cond_6

    iget-object p1, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mPowerManager:Landroid/os/PowerManager;

    invoke-virtual {p1}, Landroid/os/PowerManager;->isInteractive()Z

    move-result p1

    if-eqz p1, :cond_6

    iget-boolean p1, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mInteractive:Z

    if-nez p1, :cond_6

    .line 326
    iput-boolean v3, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mInteractive:Z

    .line 327
    iput-boolean v3, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mDisplayOn:Z

    .line 328
    move v1, v2

    goto :goto_4

    .line 331
    :cond_6
    move v3, v1

    move v1, v2

    goto :goto_4

    .line 309
    :cond_7
    move v3, v1

    .line 331
    :goto_4
    if-eqz v1, :cond_8

    .line 332
    iget-object p1, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mOverlayView:Lcom/android/systemui/dynamicisland/IslandOverlayView;

    iget v0, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mCutoutCenterOffsetX:I

    iget v1, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mCutoutTopPx:I

    iget v2, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mCutoutWidthPx:I

    iget v4, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mCutoutHeightPx:I

    invoke-virtual {p1, v0, v1, v2, v4}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->setCutoutGeometry(IIII)V

    .line 334
    :cond_8
    invoke-direct {p0, v3}, Lcom/android/systemui/dynamicisland/DynamicIslandController;->render(Z)V

    .line 335
    return-void

    .line 304
    :cond_9
    :goto_5
    return-void
.end method

.method private static invokeSetTrustedOverlay(Landroid/view/WindowManager$LayoutParams;)V
    .locals 4

    .line 614
    :try_start_0
    const-class v0, Landroid/view/WindowManager$LayoutParams;

    const-string v1, "setTrustedOverlay"

    const/4 v2, 0x0

    new-array v3, v2, [Ljava/lang/Class;

    invoke-virtual {v0, v1, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 615
    new-array v1, v2, [Ljava/lang/Object;

    invoke-virtual {v0, p0, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 617
    goto :goto_0

    .line 616
    :catchall_0
    move-exception p0

    .line 618
    :goto_0
    return-void
.end method

.method static synthetic lambda$onNotificationPosted$0(Lcom/android/systemui/dynamicisland/DynamicIslandController;Landroid/service/notification/StatusBarNotification;)V
    .locals 0

    .line 168
    iget-object p0, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mNotifSource:Lcom/android/systemui/dynamicisland/NotificationIslandSource;

    invoke-virtual {p0, p1}, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->onPosted(Landroid/service/notification/StatusBarNotification;)V

    return-void
.end method

.method static synthetic lambda$onNotificationRemoved$0(Lcom/android/systemui/dynamicisland/DynamicIslandController;Landroid/service/notification/StatusBarNotification;)V
    .locals 0

    .line 180
    iget-object p0, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mNotifSource:Lcom/android/systemui/dynamicisland/NotificationIslandSource;

    invoke-virtual {p0, p1}, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->onRemoved(Landroid/service/notification/StatusBarNotification;)V

    return-void
.end method

.method static synthetic lambda$onStatusBarAttachedOrInsetsChanged$0(Lcom/android/systemui/dynamicisland/DynamicIslandController;Landroid/view/View;)V
    .locals 0

    .line 192
    invoke-direct {p0, p1}, Lcom/android/systemui/dynamicisland/DynamicIslandController;->inspectStatusBarView(Landroid/view/View;)V

    return-void
.end method

.method private onLivePrefsChanged()V
    .locals 7

    .line 229
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mPrefs:Lcom/android/systemui/dynamicisland/LiveAlertsPrefs;

    iget-object v1, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mContext:Landroid/content/Context;

    invoke-virtual {v0, v1}, Lcom/android/systemui/dynamicisland/LiveAlertsPrefs;->reload(Landroid/content/Context;)V

    .line 230
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mOverlayView:Lcom/android/systemui/dynamicisland/IslandOverlayView;

    if-eqz v0, :cond_0

    .line 231
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mOverlayView:Lcom/android/systemui/dynamicisland/IslandOverlayView;

    iget-object v1, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mPrefs:Lcom/android/systemui/dynamicisland/LiveAlertsPrefs;

    invoke-virtual {v0, v1}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->applyTuningConfig(Lcom/android/systemui/dynamicisland/LiveAlertsPrefs;)V

    .line 233
    :cond_0
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mPrefs:Lcom/android/systemui/dynamicisland/LiveAlertsPrefs;

    iget-wide v0, v0, Lcom/android/systemui/dynamicisland/LiveAlertsPrefs;->previewNonce:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-lez v0, :cond_1

    iget-object v0, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mPrefs:Lcom/android/systemui/dynamicisland/LiveAlertsPrefs;

    iget-wide v0, v0, Lcom/android/systemui/dynamicisland/LiveAlertsPrefs;->previewNonce:J

    iget-wide v2, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mLastPreviewNonce:J

    cmp-long v0, v0, v2

    if-eqz v0, :cond_1

    .line 234
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mPrefs:Lcom/android/systemui/dynamicisland/LiveAlertsPrefs;

    iget-wide v0, v0, Lcom/android/systemui/dynamicisland/LiveAlertsPrefs;->previewNonce:J

    iput-wide v0, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mLastPreviewNonce:J

    .line 235
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mPrefs:Lcom/android/systemui/dynamicisland/LiveAlertsPrefs;

    iget-boolean v0, v0, Lcom/android/systemui/dynamicisland/LiveAlertsPrefs;->enabled:Z

    if-eqz v0, :cond_1

    .line 236
    new-instance v0, Lcom/android/systemui/dynamicisland/IslandItem;

    sget-object v1, Lcom/android/systemui/dynamicisland/IslandItem$Category;->FLASH_EVENT:Lcom/android/systemui/dynamicisland/IslandItem$Category;

    const-string v2, "sys:live_preview"

    invoke-direct {v0, v2, v1}, Lcom/android/systemui/dynamicisland/IslandItem;-><init>(Ljava/lang/String;Lcom/android/systemui/dynamicisland/IslandItem$Category;)V

    .line 237
    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/android/systemui/dynamicisland/IslandItem;->transientItem:Z

    .line 238
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v3

    const-wide/16 v5, 0x2ee0

    add-long/2addr v3, v5

    iput-wide v3, v0, Lcom/android/systemui/dynamicisland/IslandItem;->expiresAtElapsedMs:J

    .line 239
    iput v1, v0, Lcom/android/systemui/dynamicisland/IslandItem;->vectorKind:I

    .line 240
    const v3, -0xcf2ea8

    iput v3, v0, Lcom/android/systemui/dynamicisland/IslandItem;->accentColor:I

    .line 241
    const-string v3, "OxygenOS 16 Live Alerts"

    iput-object v3, v0, Lcom/android/systemui/dynamicisland/IslandItem;->title:Ljava/lang/String;

    .line 242
    const-string v3, "SUPERVOOC \u2022 Fluid Glass preview"

    iput-object v3, v0, Lcom/android/systemui/dynamicisland/IslandItem;->subtitle:Ljava/lang/String;

    .line 243
    const-string v3, "100%"

    iput-object v3, v0, Lcom/android/systemui/dynamicisland/IslandItem;->compactRightText:Ljava/lang/String;

    .line 244
    iput-boolean v1, v0, Lcom/android/systemui/dynamicisland/IslandItem;->hasProgress:Z

    .line 245
    const-wide/16 v3, 0x52

    iput-wide v3, v0, Lcom/android/systemui/dynamicisland/IslandItem;->progressValue:J

    .line 246
    const-wide/16 v3, 0x64

    iput-wide v3, v0, Lcom/android/systemui/dynamicisland/IslandItem;->progressMax:J

    .line 247
    iget-object v1, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mItems:Ljava/util/Map;

    invoke-interface {v1, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 248
    iput-object v2, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mManualSelectedKey:Ljava/lang/String;

    .line 249
    invoke-direct {p0}, Lcom/android/systemui/dynamicisland/DynamicIslandController;->scheduleNextExpiration()V

    .line 252
    :cond_1
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/android/systemui/dynamicisland/DynamicIslandController;->render(Z)V

    .line 253
    return-void
.end method

.method public static onNotificationPosted(Landroid/service/notification/StatusBarNotification;)V
    .locals 3

    .line 161
    sget-object v0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->sInstance:Lcom/android/systemui/dynamicisland/DynamicIslandController;

    .line 162
    if-eqz v0, :cond_2

    if-nez p0, :cond_0

    goto :goto_1

    .line 165
    :cond_0
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v2

    if-ne v1, v2, :cond_1

    .line 166
    iget-object v0, v0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mNotifSource:Lcom/android/systemui/dynamicisland/NotificationIslandSource;

    invoke-virtual {v0, p0}, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->onPosted(Landroid/service/notification/StatusBarNotification;)V

    goto :goto_0

    .line 168
    :cond_1
    iget-object v1, v0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mMainHandler:Landroid/os/Handler;

    new-instance v2, Lcom/android/systemui/dynamicisland/DynamicIslandController$$ExternalSyntheticLambda2;

    invoke-direct {v2, v0, p0}, Lcom/android/systemui/dynamicisland/DynamicIslandController$$ExternalSyntheticLambda2;-><init>(Lcom/android/systemui/dynamicisland/DynamicIslandController;Landroid/service/notification/StatusBarNotification;)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 170
    :goto_0
    return-void

    .line 163
    :cond_2
    :goto_1
    return-void
.end method

.method public static onNotificationRemoved(Landroid/service/notification/StatusBarNotification;)V
    .locals 3

    .line 173
    sget-object v0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->sInstance:Lcom/android/systemui/dynamicisland/DynamicIslandController;

    .line 174
    if-eqz v0, :cond_2

    if-nez p0, :cond_0

    goto :goto_1

    .line 177
    :cond_0
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v2

    if-ne v1, v2, :cond_1

    .line 178
    iget-object v0, v0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mNotifSource:Lcom/android/systemui/dynamicisland/NotificationIslandSource;

    invoke-virtual {v0, p0}, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->onRemoved(Landroid/service/notification/StatusBarNotification;)V

    goto :goto_0

    .line 180
    :cond_1
    iget-object v1, v0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mMainHandler:Landroid/os/Handler;

    new-instance v2, Lcom/android/systemui/dynamicisland/DynamicIslandController$$ExternalSyntheticLambda4;

    invoke-direct {v2, v0, p0}, Lcom/android/systemui/dynamicisland/DynamicIslandController$$ExternalSyntheticLambda4;-><init>(Lcom/android/systemui/dynamicisland/DynamicIslandController;Landroid/service/notification/StatusBarNotification;)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 182
    :goto_0
    return-void

    .line 175
    :cond_2
    :goto_1
    return-void
.end method

.method public static onStatusBarAttachedOrInsetsChanged(Landroid/view/View;)V
    .locals 3

    .line 185
    sget-object v0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->sInstance:Lcom/android/systemui/dynamicisland/DynamicIslandController;

    .line 186
    if-eqz v0, :cond_2

    if-nez p0, :cond_0

    goto :goto_1

    .line 189
    :cond_0
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v2

    if-ne v1, v2, :cond_1

    .line 190
    invoke-direct {v0, p0}, Lcom/android/systemui/dynamicisland/DynamicIslandController;->inspectStatusBarView(Landroid/view/View;)V

    goto :goto_0

    .line 192
    :cond_1
    iget-object v1, v0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mMainHandler:Landroid/os/Handler;

    new-instance v2, Lcom/android/systemui/dynamicisland/DynamicIslandController$$ExternalSyntheticLambda3;

    invoke-direct {v2, v0, p0}, Lcom/android/systemui/dynamicisland/DynamicIslandController$$ExternalSyntheticLambda3;-><init>(Lcom/android/systemui/dynamicisland/DynamicIslandController;Landroid/view/View;)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 194
    :goto_0
    return-void

    .line 187
    :cond_2
    :goto_1
    return-void
.end method

.method private pruneExpiredAndRender()V
    .locals 10

    .line 516
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    .line 517
    nop

    .line 518
    iget-object v2, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mItems:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    const/4 v3, 0x0

    move v4, v3

    .line 519
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2

    .line 520
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/Map$Entry;

    invoke-interface {v5}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/android/systemui/dynamicisland/IslandItem;

    .line 521
    iget-boolean v6, v5, Lcom/android/systemui/dynamicisland/IslandItem;->transientItem:Z

    if-eqz v6, :cond_1

    iget-wide v6, v5, Lcom/android/systemui/dynamicisland/IslandItem;->expiresAtElapsedMs:J

    const-wide/16 v8, 0x0

    cmp-long v6, v6, v8

    if-lez v6, :cond_1

    iget-wide v6, v5, Lcom/android/systemui/dynamicisland/IslandItem;->expiresAtElapsedMs:J

    cmp-long v6, v0, v6

    if-ltz v6, :cond_1

    .line 522
    iget-object v4, v5, Lcom/android/systemui/dynamicisland/IslandItem;->key:Ljava/lang/String;

    iget-object v5, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mManualSelectedKey:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 523
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mManualSelectedKey:Ljava/lang/String;

    .line 525
    :cond_0
    invoke-interface {v2}, Ljava/util/Iterator;->remove()V

    .line 526
    const/4 v4, 0x1

    .line 528
    :cond_1
    goto :goto_0

    .line 529
    :cond_2
    invoke-direct {p0}, Lcom/android/systemui/dynamicisland/DynamicIslandController;->scheduleNextExpiration()V

    .line 530
    if-eqz v4, :cond_3

    .line 531
    invoke-direct {p0, v3}, Lcom/android/systemui/dynamicisland/DynamicIslandController;->render(Z)V

    .line 533
    :cond_3
    return-void
.end method

.method private render(Z)V
    .locals 10

    .line 553
    iget-boolean v0, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mWindowAttached:Z

    if-eqz v0, :cond_8

    iget-object v0, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mOverlayView:Lcom/android/systemui/dynamicisland/IslandOverlayView;

    if-nez v0, :cond_0

    goto :goto_4

    .line 556
    :cond_0
    invoke-direct {p0}, Lcom/android/systemui/dynamicisland/DynamicIslandController;->getOrderedItems()Ljava/util/List;

    move-result-object v0

    .line 557
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_1

    .line 558
    iput-boolean v2, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mWasSuspended:Z

    .line 559
    iget-object p1, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mOverlayView:Lcom/android/systemui/dynamicisland/IslandOverlayView;

    invoke-virtual {p1}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->hideAll()V

    .line 560
    return-void

    .line 562
    :cond_1
    iget-boolean v1, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mInteractive:Z

    const/4 v3, 0x1

    if-eqz v1, :cond_3

    iget-boolean v1, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mDisplayOn:Z

    if-eqz v1, :cond_3

    iget-boolean v1, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mLandscapeOrFullscreenHidden:Z

    if-eqz v1, :cond_2

    goto :goto_0

    :cond_2
    move v1, v2

    goto :goto_1

    :cond_3
    :goto_0
    move v1, v3

    .line 563
    :goto_1
    invoke-direct {p0, v0}, Lcom/android/systemui/dynamicisland/DynamicIslandController;->findCurrentIndex(Ljava/util/List;)I

    move-result v6

    .line 564
    invoke-interface {v0, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    move-object v5, v4

    check-cast v5, Lcom/android/systemui/dynamicisland/IslandItem;

    .line 566
    if-eqz v1, :cond_5

    .line 567
    iget-boolean p1, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mWasSuspended:Z

    if-nez p1, :cond_4

    .line 568
    iget-object p1, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mOverlayView:Lcom/android/systemui/dynamicisland/IslandOverlayView;

    invoke-virtual {p1}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->suspendVisibleWithoutTeardown()V

    .line 570
    :cond_4
    iput-boolean v3, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mWasSuspended:Z

    .line 572
    iget-object v4, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mOverlayView:Lcom/android/systemui/dynamicisland/IslandOverlayView;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v7

    const/4 v8, 0x1

    const/4 v9, 0x1

    invoke-virtual/range {v4 .. v9}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->showItem(Lcom/android/systemui/dynamicisland/IslandItem;IIZZ)V

    .line 573
    return-void

    .line 576
    :cond_5
    iget-boolean v1, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mWasSuspended:Z

    if-nez v1, :cond_7

    if-eqz p1, :cond_6

    goto :goto_2

    :cond_6
    move v9, v2

    goto :goto_3

    :cond_7
    :goto_2
    move v9, v3

    .line 577
    :goto_3
    iput-boolean v2, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mWasSuspended:Z

    .line 578
    iget-object v4, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mOverlayView:Lcom/android/systemui/dynamicisland/IslandOverlayView;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v7

    const/4 v8, 0x0

    invoke-virtual/range {v4 .. v9}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->showItem(Lcom/android/systemui/dynamicisland/IslandItem;IIZZ)V

    .line 579
    return-void

    .line 554
    :cond_8
    :goto_4
    return-void
.end method

.method private scheduleNextExpiration()V
    .locals 12

    .line 536
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mMainHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mExpireRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 537
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    .line 538
    nop

    .line 539
    iget-object v2, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mItems:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    const-wide v3, 0x7fffffffffffffffL

    move-wide v5, v3

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/android/systemui/dynamicisland/IslandItem;

    .line 540
    iget-boolean v8, v7, Lcom/android/systemui/dynamicisland/IslandItem;->transientItem:Z

    if-eqz v8, :cond_0

    iget-wide v8, v7, Lcom/android/systemui/dynamicisland/IslandItem;->expiresAtElapsedMs:J

    const-wide/16 v10, 0x0

    cmp-long v8, v8, v10

    if-lez v8, :cond_0

    .line 541
    iget-wide v7, v7, Lcom/android/systemui/dynamicisland/IslandItem;->expiresAtElapsedMs:J

    sub-long/2addr v7, v0

    const-wide/16 v9, 0x32

    invoke-static {v9, v10, v7, v8}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v7

    .line 542
    cmp-long v9, v7, v5

    if-gez v9, :cond_0

    .line 543
    move-wide v5, v7

    .line 546
    :cond_0
    goto :goto_0

    .line 547
    :cond_1
    cmp-long v0, v5, v3

    if-gez v0, :cond_2

    .line 548
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mMainHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mExpireRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1, v5, v6}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 550
    :cond_2
    return-void
.end method

.method private setupWindow()V
    .locals 5

    .line 256
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mWindowManager:Landroid/view/WindowManager;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mOverlayView:Lcom/android/systemui/dynamicisland/IslandOverlayView;

    if-eqz v0, :cond_0

    goto/16 :goto_2

    .line 259
    :cond_0
    const/high16 v0, 0x41300000    # 11.0f

    invoke-direct {p0, v0}, Lcom/android/systemui/dynamicisland/DynamicIslandController;->dp(F)I

    move-result v0

    iput v0, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mCutoutTopPx:I

    .line 260
    const/high16 v0, 0x41d40000    # 26.5f

    invoke-direct {p0, v0}, Lcom/android/systemui/dynamicisland/DynamicIslandController;->dp(F)I

    move-result v1

    iput v1, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mCutoutWidthPx:I

    .line 261
    invoke-direct {p0, v0}, Lcom/android/systemui/dynamicisland/DynamicIslandController;->dp(F)I

    move-result v0

    iput v0, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mCutoutHeightPx:I

    .line 263
    :try_start_0
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mWindowManager:Landroid/view/WindowManager;

    invoke-interface {v0}, Landroid/view/WindowManager;->getCurrentWindowMetrics()Landroid/view/WindowMetrics;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/WindowMetrics;->getWindowInsets()Landroid/view/WindowInsets;

    move-result-object v0

    .line 264
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Landroid/view/WindowInsets;->getDisplayCutout()Landroid/view/DisplayCutout;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 265
    invoke-virtual {v0}, Landroid/view/WindowInsets;->getDisplayCutout()Landroid/view/DisplayCutout;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/systemui/dynamicisland/DynamicIslandController;->applyDisplayCutout(Landroid/view/DisplayCutout;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 268
    :cond_1
    goto :goto_0

    .line 267
    :catchall_0
    move-exception v0

    .line 270
    :goto_0
    new-instance v0, Lcom/android/systemui/dynamicisland/IslandOverlayView;

    iget-object v1, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1, p0}, Lcom/android/systemui/dynamicisland/IslandOverlayView;-><init>(Landroid/content/Context;Lcom/android/systemui/dynamicisland/IslandOverlayView$Callbacks;)V

    iput-object v0, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mOverlayView:Lcom/android/systemui/dynamicisland/IslandOverlayView;

    .line 271
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mOverlayView:Lcom/android/systemui/dynamicisland/IslandOverlayView;

    iget v1, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mCutoutCenterOffsetX:I

    iget v2, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mCutoutTopPx:I

    iget v3, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mCutoutWidthPx:I

    iget v4, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mCutoutHeightPx:I

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->setCutoutGeometry(IIII)V

    .line 272
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mOverlayView:Lcom/android/systemui/dynamicisland/IslandOverlayView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->setVisibility(I)V

    .line 274
    new-instance v0, Landroid/view/WindowManager$LayoutParams;

    invoke-direct {v0}, Landroid/view/WindowManager$LayoutParams;-><init>()V

    iput-object v0, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mLayoutParams:Landroid/view/WindowManager$LayoutParams;

    .line 277
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mLayoutParams:Landroid/view/WindowManager$LayoutParams;

    const/4 v1, -0x1

    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->width:I

    .line 278
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mLayoutParams:Landroid/view/WindowManager$LayoutParams;

    const/high16 v1, 0x43b40000    # 360.0f

    invoke-direct {p0, v1}, Lcom/android/systemui/dynamicisland/DynamicIslandController;->dp(F)I

    move-result v1

    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->height:I

    .line 279
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mLayoutParams:Landroid/view/WindowManager$LayoutParams;

    const/16 v1, 0x7da

    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->type:I

    .line 280
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mLayoutParams:Landroid/view/WindowManager$LayoutParams;

    const v1, 0x1000328

    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->flags:I

    .line 285
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mLayoutParams:Landroid/view/WindowManager$LayoutParams;

    const/4 v1, -0x3

    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->format:I

    .line 286
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mLayoutParams:Landroid/view/WindowManager$LayoutParams;

    const/16 v1, 0x31

    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->gravity:I

    .line 287
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mLayoutParams:Landroid/view/WindowManager$LayoutParams;

    const/4 v1, 0x3

    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->layoutInDisplayCutoutMode:I

    .line 288
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mLayoutParams:Landroid/view/WindowManager$LayoutParams;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/WindowManager$LayoutParams;->setFitInsetsTypes(I)V

    .line 289
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mLayoutParams:Landroid/view/WindowManager$LayoutParams;

    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->x:I

    .line 290
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mLayoutParams:Landroid/view/WindowManager$LayoutParams;

    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->y:I

    .line 291
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mLayoutParams:Landroid/view/WindowManager$LayoutParams;

    const-string v2, "DynamicIslandOverlay"

    invoke-virtual {v0, v2}, Landroid/view/WindowManager$LayoutParams;->setTitle(Ljava/lang/CharSequence;)V

    .line 292
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mLayoutParams:Landroid/view/WindowManager$LayoutParams;

    invoke-static {v0}, Lcom/android/systemui/dynamicisland/DynamicIslandController;->invokeSetTrustedOverlay(Landroid/view/WindowManager$LayoutParams;)V

    .line 295
    :try_start_1
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mWindowManager:Landroid/view/WindowManager;

    iget-object v2, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mOverlayView:Lcom/android/systemui/dynamicisland/IslandOverlayView;

    iget-object v3, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mLayoutParams:Landroid/view/WindowManager$LayoutParams;

    invoke-interface {v0, v2, v3}, Landroid/view/WindowManager;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 296
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mWindowAttached:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 299
    goto :goto_1

    .line 297
    :catchall_1
    move-exception v0

    .line 298
    iput-boolean v1, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mWindowAttached:Z

    .line 300
    :goto_1
    return-void

    .line 257
    :cond_2
    :goto_2
    return-void
.end method

.method private startInternal()V
    .locals 4

    .line 198
    :try_start_0
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mPowerManager:Landroid/os/PowerManager;

    const/4 v1, 0x1

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mPowerManager:Landroid/os/PowerManager;

    invoke-virtual {v0}, Landroid/os/PowerManager;->isInteractive()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    move v0, v1

    :goto_1
    iput-boolean v0, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mInteractive:Z

    .line 199
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mPrefs:Lcom/android/systemui/dynamicisland/LiveAlertsPrefs;

    iget-object v2, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mContext:Landroid/content/Context;

    invoke-virtual {v0, v2}, Lcom/android/systemui/dynamicisland/LiveAlertsPrefs;->reload(Landroid/content/Context;)V

    .line 200
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mPrefs:Lcom/android/systemui/dynamicisland/LiveAlertsPrefs;

    iget-wide v2, v0, Lcom/android/systemui/dynamicisland/LiveAlertsPrefs;->previewNonce:J

    iput-wide v2, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mLastPreviewNonce:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 202
    :try_start_1
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v2, Landroid/provider/Settings$Secure;->CONTENT_URI:Landroid/net/Uri;

    iget-object v3, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mPrefsObserver:Landroid/database/ContentObserver;

    invoke-virtual {v0, v2, v1, v3}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 205
    goto :goto_2

    .line 204
    :catchall_0
    move-exception v0

    .line 207
    :goto_2
    :try_start_2
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 208
    const-string v1, "android.intent.action.SCREEN_OFF"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 209
    const-string v1, "android.intent.action.SCREEN_ON"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 210
    iget-object v1, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mPowerReceiver:Landroid/content/BroadcastReceiver;

    const/4 v3, 0x2

    invoke-virtual {v1, v2, v0, v3}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;I)Landroid/content/Intent;

    .line 212
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mDisplayManager:Landroid/hardware/display/DisplayManager;

    if-eqz v0, :cond_2

    .line 213
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mDisplayManager:Landroid/hardware/display/DisplayManager;

    iget-object v1, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mDisplayListener:Landroid/hardware/display/DisplayManager$DisplayListener;

    iget-object v2, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mMainHandler:Landroid/os/Handler;

    invoke-virtual {v0, v1, v2}, Landroid/hardware/display/DisplayManager;->registerDisplayListener(Landroid/hardware/display/DisplayManager$DisplayListener;Landroid/os/Handler;)V

    .line 216
    :cond_2
    invoke-direct {p0}, Lcom/android/systemui/dynamicisland/DynamicIslandController;->setupWindow()V

    .line 217
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mOverlayView:Lcom/android/systemui/dynamicisland/IslandOverlayView;

    if-eqz v0, :cond_3

    .line 218
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mOverlayView:Lcom/android/systemui/dynamicisland/IslandOverlayView;

    iget-object v1, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mPrefs:Lcom/android/systemui/dynamicisland/LiveAlertsPrefs;

    invoke-virtual {v0, v1}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->applyTuningConfig(Lcom/android/systemui/dynamicisland/LiveAlertsPrefs;)V

    .line 220
    :cond_3
    invoke-direct {p0}, Lcom/android/systemui/dynamicisland/DynamicIslandController;->updateDisplayVisibilityAndRotation()V

    .line 222
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mMediaSource:Lcom/android/systemui/dynamicisland/MediaIslandSource;

    invoke-virtual {v0}, Lcom/android/systemui/dynamicisland/MediaIslandSource;->start()V

    .line 223
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mSystemSource:Lcom/android/systemui/dynamicisland/SystemEventSource;

    invoke-virtual {v0}, Lcom/android/systemui/dynamicisland/SystemEventSource;->start()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 225
    goto :goto_3

    .line 224
    :catchall_1
    move-exception v0

    .line 226
    :goto_3
    return-void
.end method

.method private updateDisplayVisibilityAndRotation()V
    .locals 6

    .line 338
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mDisplayManager:Landroid/hardware/display/DisplayManager;

    const/4 v1, 0x1

    if-eqz v0, :cond_5

    .line 339
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mDisplayManager:Landroid/hardware/display/DisplayManager;

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/hardware/display/DisplayManager;->getDisplay(I)Landroid/view/Display;

    move-result-object v0

    .line 340
    if-eqz v0, :cond_5

    .line 341
    invoke-virtual {v0}, Landroid/view/Display;->getState()I

    move-result v3

    const/4 v4, 0x2

    if-ne v3, v4, :cond_0

    move v3, v1

    goto :goto_0

    :cond_0
    move v3, v2

    :goto_0
    iput-boolean v3, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mDisplayOn:Z

    .line 342
    iget-object v3, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mPowerManager:Landroid/os/PowerManager;

    if-eqz v3, :cond_1

    .line 343
    iget-object v3, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mPowerManager:Landroid/os/PowerManager;

    invoke-virtual {v3}, Landroid/os/PowerManager;->isInteractive()Z

    move-result v3

    iput-boolean v3, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mInteractive:Z

    .line 345
    :cond_1
    invoke-virtual {v0}, Landroid/view/Display;->getRotation()I

    move-result v3

    if-eqz v3, :cond_2

    move v3, v1

    goto :goto_1

    :cond_2
    move v3, v2

    .line 346
    :goto_1
    if-eqz v3, :cond_3

    .line 347
    iput-boolean v1, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mLandscapeOrFullscreenHidden:Z

    goto :goto_2

    .line 348
    :cond_3
    iget-boolean v3, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mLandscapeOrFullscreenHidden:Z

    if-eqz v3, :cond_4

    .line 349
    iput-boolean v2, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mLandscapeOrFullscreenHidden:Z

    .line 351
    :cond_4
    :goto_2
    iget-boolean v2, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mCutoutKnown:Z

    if-nez v2, :cond_5

    invoke-virtual {v0}, Landroid/view/Display;->getCutout()Landroid/view/DisplayCutout;

    move-result-object v2

    if-eqz v2, :cond_5

    invoke-virtual {v0}, Landroid/view/Display;->getCutout()Landroid/view/DisplayCutout;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/systemui/dynamicisland/DynamicIslandController;->applyDisplayCutout(Landroid/view/DisplayCutout;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 352
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mOverlayView:Lcom/android/systemui/dynamicisland/IslandOverlayView;

    if-eqz v0, :cond_5

    .line 353
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mOverlayView:Lcom/android/systemui/dynamicisland/IslandOverlayView;

    iget v2, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mCutoutCenterOffsetX:I

    iget v3, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mCutoutTopPx:I

    iget v4, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mCutoutWidthPx:I

    iget v5, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mCutoutHeightPx:I

    invoke-virtual {v0, v2, v3, v4, v5}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->setCutoutGeometry(IIII)V

    .line 358
    :cond_5
    invoke-direct {p0, v1}, Lcom/android/systemui/dynamicisland/DynamicIslandController;->render(Z)V

    .line 359
    return-void
.end method


# virtual methods
.method public onCycleIsland(I)V
    .locals 3

    .line 500
    invoke-direct {p0}, Lcom/android/systemui/dynamicisland/DynamicIslandController;->getOrderedItems()Ljava/util/List;

    move-result-object v0

    .line 501
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    const/4 v2, 0x1

    if-gt v1, v2, :cond_0

    .line 502
    return-void

    .line 504
    :cond_0
    invoke-direct {p0, v0}, Lcom/android/systemui/dynamicisland/DynamicIslandController;->findCurrentIndex(Ljava/util/List;)I

    move-result v1

    .line 505
    add-int/2addr v1, p1

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result p1

    add-int/2addr v1, p1

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result p1

    rem-int/2addr v1, p1

    .line 506
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/android/systemui/dynamicisland/IslandItem;

    iget-object p1, p1, Lcom/android/systemui/dynamicisland/IslandItem;->key:Ljava/lang/String;

    iput-object p1, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mManualSelectedKey:Ljava/lang/String;

    .line 507
    const/4 p1, 0x0

    invoke-direct {p0, p1}, Lcom/android/systemui/dynamicisland/DynamicIslandController;->render(Z)V

    .line 508
    return-void
.end method

.method public onDismissTransient(Ljava/lang/String;)V
    .locals 0

    .line 512
    invoke-virtual {p0, p1}, Lcom/android/systemui/dynamicisland/DynamicIslandController;->onItemRemoved(Ljava/lang/String;)V

    .line 513
    return-void
.end method

.method public onExpandedStateChanged(Z)V
    .locals 3

    .line 484
    iget-boolean v0, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mWindowAttached:Z

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mLayoutParams:Landroid/view/WindowManager$LayoutParams;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mOverlayView:Lcom/android/systemui/dynamicisland/IslandOverlayView;

    if-nez v0, :cond_0

    goto :goto_1

    .line 487
    :cond_0
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mMainHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mSetOutsideWatchRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 488
    if-eqz p1, :cond_1

    .line 489
    iget-object p1, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mLayoutParams:Landroid/view/WindowManager$LayoutParams;

    iget v0, p1, Landroid/view/WindowManager$LayoutParams;->flags:I

    const/high16 v1, 0x40000

    or-int/2addr v0, v1

    iput v0, p1, Landroid/view/WindowManager$LayoutParams;->flags:I

    .line 491
    iget-object p1, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mMainHandler:Landroid/os/Handler;

    iget-object v0, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mSetOutsideWatchRunnable:Ljava/lang/Runnable;

    const-wide/16 v1, 0x1cc

    invoke-virtual {p1, v0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_0

    .line 493
    :cond_1
    iget-object p1, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mLayoutParams:Landroid/view/WindowManager$LayoutParams;

    iget v0, p1, Landroid/view/WindowManager$LayoutParams;->flags:I

    const v1, -0x40001

    and-int/2addr v0, v1

    iput v0, p1, Landroid/view/WindowManager$LayoutParams;->flags:I

    .line 494
    iget-object p1, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mMainHandler:Landroid/os/Handler;

    iget-object v0, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mSetOutsideWatchRunnable:Ljava/lang/Runnable;

    const-wide/16 v1, 0x17c

    invoke-virtual {p1, v0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 496
    :goto_0
    return-void

    .line 485
    :cond_2
    :goto_1
    return-void
.end method

.method public onItemRemoved(Ljava/lang/String;)V
    .locals 1

    .line 460
    if-nez p1, :cond_0

    .line 461
    return-void

    .line 463
    :cond_0
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mItems:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 464
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mManualSelectedKey:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    .line 465
    const/4 p1, 0x0

    iput-object p1, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mManualSelectedKey:Ljava/lang/String;

    .line 467
    :cond_1
    const/4 p1, 0x0

    invoke-direct {p0, p1}, Lcom/android/systemui/dynamicisland/DynamicIslandController;->render(Z)V

    .line 469
    :cond_2
    return-void
.end method

.method public onItemUpdated(Lcom/android/systemui/dynamicisland/IslandItem;)V
    .locals 2

    .line 447
    if-nez p1, :cond_0

    .line 448
    return-void

    .line 450
    :cond_0
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mItems:Ljava/util/Map;

    iget-object v1, p1, Lcom/android/systemui/dynamicisland/IslandItem;->key:Ljava/lang/String;

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 451
    iget-boolean v0, p1, Lcom/android/systemui/dynamicisland/IslandItem;->transientItem:Z

    if-eqz v0, :cond_1

    .line 452
    iget-object p1, p1, Lcom/android/systemui/dynamicisland/IslandItem;->key:Ljava/lang/String;

    iput-object p1, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mManualSelectedKey:Ljava/lang/String;

    .line 454
    :cond_1
    invoke-direct {p0}, Lcom/android/systemui/dynamicisland/DynamicIslandController;->scheduleNextExpiration()V

    .line 455
    const/4 p1, 0x0

    invoke-direct {p0, p1}, Lcom/android/systemui/dynamicisland/DynamicIslandController;->render(Z)V

    .line 456
    return-void
.end method

.method public onOverlayCutoutChanged(Landroid/view/DisplayCutout;)V
    .locals 4

    .line 440
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mOverlayView:Lcom/android/systemui/dynamicisland/IslandOverlayView;

    if-eqz v0, :cond_0

    if-eqz p1, :cond_0

    invoke-direct {p0, p1}, Lcom/android/systemui/dynamicisland/DynamicIslandController;->applyDisplayCutout(Landroid/view/DisplayCutout;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 441
    iget-object p1, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mOverlayView:Lcom/android/systemui/dynamicisland/IslandOverlayView;

    iget v0, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mCutoutCenterOffsetX:I

    iget v1, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mCutoutTopPx:I

    iget v2, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mCutoutWidthPx:I

    iget v3, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController;->mCutoutHeightPx:I

    invoke-virtual {p1, v0, v1, v2, v3}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->setCutoutGeometry(IIII)V

    .line 443
    :cond_0
    return-void
.end method
