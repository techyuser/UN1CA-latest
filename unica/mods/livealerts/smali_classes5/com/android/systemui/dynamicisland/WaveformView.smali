.class public final Lcom/android/systemui/dynamicisland/WaveformView;
.super Landroid/view/View;
.source "WaveformView.java"


# instance fields
.field private mAccentColor:I

.field private mAnimating:Z

.field private mAttached:Z

.field private final mFrameCallback:Landroid/view/Choreographer$FrameCallback;

.field private mLastFrameMs:J

.field private final mPaint:Landroid/graphics/Paint;

.field private final mPhaseOffsets:[F

.field private final mSpeeds:[F


# direct methods
.method static bridge synthetic -$$Nest$fgetmAnimating(Lcom/android/systemui/dynamicisland/WaveformView;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/android/systemui/dynamicisland/WaveformView;->mAnimating:Z

    return p0
.end method

.method static bridge synthetic -$$Nest$fgetmAttached(Lcom/android/systemui/dynamicisland/WaveformView;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/android/systemui/dynamicisland/WaveformView;->mAttached:Z

    return p0
.end method

.method static bridge synthetic -$$Nest$fgetmLastFrameMs(Lcom/android/systemui/dynamicisland/WaveformView;)J
    .locals 2

    iget-wide v0, p0, Lcom/android/systemui/dynamicisland/WaveformView;->mLastFrameMs:J

    return-wide v0
.end method

.method static bridge synthetic -$$Nest$fputmLastFrameMs(Lcom/android/systemui/dynamicisland/WaveformView;J)V
    .locals 0

    iput-wide p1, p0, Lcom/android/systemui/dynamicisland/WaveformView;->mLastFrameMs:J

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 41
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 16
    new-instance p1, Landroid/graphics/Paint;

    const/4 v0, 0x1

    invoke-direct {p1, v0}, Landroid/graphics/Paint;-><init>(I)V

    iput-object p1, p0, Lcom/android/systemui/dynamicisland/WaveformView;->mPaint:Landroid/graphics/Paint;

    .line 17
    const/4 p1, 0x5

    new-array v0, p1, [F

    fill-array-data v0, :array_0

    iput-object v0, p0, Lcom/android/systemui/dynamicisland/WaveformView;->mPhaseOffsets:[F

    .line 18
    new-array p1, p1, [F

    fill-array-data p1, :array_1

    iput-object p1, p0, Lcom/android/systemui/dynamicisland/WaveformView;->mSpeeds:[F

    .line 20
    const p1, -0xe128a0

    iput p1, p0, Lcom/android/systemui/dynamicisland/WaveformView;->mAccentColor:I

    .line 21
    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/android/systemui/dynamicisland/WaveformView;->mAnimating:Z

    .line 22
    iput-boolean p1, p0, Lcom/android/systemui/dynamicisland/WaveformView;->mAttached:Z

    .line 23
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/android/systemui/dynamicisland/WaveformView;->mLastFrameMs:J

    .line 25
    new-instance p1, Lcom/android/systemui/dynamicisland/WaveformView$1;

    invoke-direct {p1, p0}, Lcom/android/systemui/dynamicisland/WaveformView$1;-><init>(Lcom/android/systemui/dynamicisland/WaveformView;)V

    iput-object p1, p0, Lcom/android/systemui/dynamicisland/WaveformView;->mFrameCallback:Landroid/view/Choreographer$FrameCallback;

    .line 42
    iget-object p1, p0, Lcom/android/systemui/dynamicisland/WaveformView;->mPaint:Landroid/graphics/Paint;

    sget-object v0, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 43
    iget-object p1, p0, Lcom/android/systemui/dynamicisland/WaveformView;->mPaint:Landroid/graphics/Paint;

    iget v0, p0, Lcom/android/systemui/dynamicisland/WaveformView;->mAccentColor:I

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 44
    return-void

    :array_0
    .array-data 4
        0x3e4ccccd    # 0.2f
        0x3feccccd    # 1.85f
        0x40533333    # 3.3f
        0x3f733333    # 0.95f
        0x4019999a    # 2.4f
    .end array-data

    :array_1
    .array-data 4
        0x40a66666    # 5.2f
        0x40e33333    # 7.1f
        0x40c00000    # 6.0f
        0x40f9999a    # 7.8f
        0x409ccccd    # 4.9f
    .end array-data
.end method


# virtual methods
.method protected onAttachedToWindow()V
    .locals 2

    .line 68
    invoke-super {p0}, Landroid/view/View;->onAttachedToWindow()V

    .line 69
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/systemui/dynamicisland/WaveformView;->mAttached:Z

    .line 70
    iget-boolean v0, p0, Lcom/android/systemui/dynamicisland/WaveformView;->mAnimating:Z

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/android/systemui/dynamicisland/WaveformView;->getVisibility()I

    move-result v0

    if-nez v0, :cond_0

    .line 71
    invoke-static {}, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;

    move-result-object v0

    iget-object v1, p0, Lcom/android/systemui/dynamicisland/WaveformView;->mFrameCallback:Landroid/view/Choreographer$FrameCallback;

    invoke-virtual {v0, v1}, Landroid/view/Choreographer;->postFrameCallback(Landroid/view/Choreographer$FrameCallback;)V

    .line 73
    :cond_0
    return-void
.end method

.method protected onDetachedFromWindow()V
    .locals 2

    .line 77
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/systemui/dynamicisland/WaveformView;->mAttached:Z

    .line 78
    invoke-static {}, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;

    move-result-object v0

    iget-object v1, p0, Lcom/android/systemui/dynamicisland/WaveformView;->mFrameCallback:Landroid/view/Choreographer$FrameCallback;

    invoke-virtual {v0, v1}, Landroid/view/Choreographer;->removeFrameCallback(Landroid/view/Choreographer$FrameCallback;)V

    .line 79
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 80
    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 19

    .line 93
    move-object/from16 v0, p0

    invoke-super/range {p0 .. p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 94
    invoke-virtual {v0}, Lcom/android/systemui/dynamicisland/WaveformView;->getWidth()I

    move-result v1

    .line 95
    invoke-virtual {v0}, Lcom/android/systemui/dynamicisland/WaveformView;->getHeight()I

    move-result v2

    .line 96
    if-lez v1, :cond_8

    if-gtz v2, :cond_0

    goto/16 :goto_5

    .line 99
    :cond_0
    nop

    .line 100
    int-to-float v1, v1

    const/high16 v3, 0x41380000    # 11.5f

    div-float v3, v1, v3

    const/high16 v4, 0x40000000    # 2.0f

    invoke-static {v4, v3}, Ljava/lang/Math;->max(FF)F

    move-result v3

    .line 101
    const/4 v4, 0x5

    int-to-float v5, v4

    mul-float/2addr v5, v3

    .line 102
    sub-float/2addr v1, v5

    const/4 v5, 0x4

    int-to-float v6, v5

    div-float/2addr v1, v6

    .line 103
    const v6, 0x3f933333    # 1.15f

    mul-float/2addr v6, v3

    int-to-float v2, v2

    const v7, 0x3e6147ae    # 0.22f

    mul-float/2addr v7, v2

    invoke-static {v6, v7}, Ljava/lang/Math;->max(FF)F

    move-result v6

    .line 104
    const v7, 0x3f6b851f    # 0.92f

    mul-float/2addr v7, v2

    .line 105
    const/high16 v8, 0x3f000000    # 0.5f

    mul-float/2addr v2, v8

    .line 106
    mul-float v14, v3, v8

    .line 108
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v9

    long-to-float v9, v9

    const/high16 v10, 0x447a0000    # 1000.0f

    div-float v17, v9, v10

    .line 109
    const/4 v9, 0x0

    :goto_0
    if-ge v9, v4, :cond_7

    .line 111
    iget-boolean v10, v0, Lcom/android/systemui/dynamicisland/WaveformView;->mAnimating:Z

    if-eqz v10, :cond_3

    .line 112
    iget-object v10, v0, Lcom/android/systemui/dynamicisland/WaveformView;->mSpeeds:[F

    aget v10, v10, v9

    mul-float v10, v10, v17

    iget-object v11, v0, Lcom/android/systemui/dynamicisland/WaveformView;->mPhaseOffsets:[F

    aget v11, v11, v9

    add-float/2addr v10, v11

    float-to-double v10, v10

    invoke-static {v10, v11}, Ljava/lang/Math;->sin(D)D

    move-result-wide v10

    .line 113
    if-eqz v9, :cond_2

    if-ne v9, v5, :cond_1

    goto :goto_1

    :cond_1
    const/high16 v12, 0x3f800000    # 1.0f

    goto :goto_2

    :cond_2
    :goto_1
    const v12, 0x3f3851ec    # 0.72f

    .line 114
    :goto_2
    const-wide/high16 v15, 0x3fe0000000000000L    # 0.5

    mul-double/2addr v10, v15

    add-double/2addr v10, v15

    double-to-float v10, v10

    const v11, 0x3f51eb85    # 0.82f

    mul-float/2addr v10, v11

    const v11, 0x3e3851ec    # 0.18f

    add-float/2addr v10, v11

    mul-float/2addr v10, v12

    .line 115
    goto :goto_4

    .line 116
    :cond_3
    const/4 v10, 0x2

    if-ne v9, v10, :cond_4

    const v10, 0x3ed70a3d    # 0.42f

    goto :goto_4

    :cond_4
    const/4 v10, 0x1

    if-eq v9, v10, :cond_6

    const/4 v10, 0x3

    if-ne v9, v10, :cond_5

    goto :goto_3

    :cond_5
    const v10, 0x3e4ccccd    # 0.2f

    goto :goto_4

    :cond_6
    :goto_3
    const v10, 0x3e99999a    # 0.3f

    .line 118
    :goto_4
    sub-float v11, v7, v6

    mul-float/2addr v11, v10

    add-float/2addr v11, v6

    .line 119
    int-to-float v10, v9

    add-float v12, v3, v1

    mul-float/2addr v10, v12

    .line 120
    mul-float/2addr v11, v8

    move v12, v11

    sub-float v11, v2, v12

    .line 121
    move v13, v12

    add-float v12, v10, v3

    .line 122
    add-float/2addr v13, v2

    .line 123
    iget-object v15, v0, Lcom/android/systemui/dynamicisland/WaveformView;->mPaint:Landroid/graphics/Paint;

    move-object/from16 v16, v15

    move v15, v14

    move/from16 v18, v9

    move-object/from16 v9, p1

    invoke-virtual/range {v9 .. v16}, Landroid/graphics/Canvas;->drawRoundRect(FFFFFFLandroid/graphics/Paint;)V

    .line 109
    add-int/lit8 v9, v18, 0x1

    goto :goto_0

    .line 125
    :cond_7
    return-void

    .line 97
    :cond_8
    :goto_5
    return-void
.end method

.method public setAccentColor(I)V
    .locals 1

    .line 47
    iget v0, p0, Lcom/android/systemui/dynamicisland/WaveformView;->mAccentColor:I

    if-eq v0, p1, :cond_0

    .line 48
    iput p1, p0, Lcom/android/systemui/dynamicisland/WaveformView;->mAccentColor:I

    .line 49
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/WaveformView;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColor(I)V

    .line 50
    invoke-virtual {p0}, Lcom/android/systemui/dynamicisland/WaveformView;->invalidate()V

    .line 52
    :cond_0
    return-void
.end method

.method public setAnimating(Z)V
    .locals 1

    .line 55
    iget-boolean v0, p0, Lcom/android/systemui/dynamicisland/WaveformView;->mAnimating:Z

    if-ne v0, p1, :cond_0

    .line 56
    return-void

    .line 58
    :cond_0
    iput-boolean p1, p0, Lcom/android/systemui/dynamicisland/WaveformView;->mAnimating:Z

    .line 59
    invoke-static {}, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;

    move-result-object p1

    iget-object v0, p0, Lcom/android/systemui/dynamicisland/WaveformView;->mFrameCallback:Landroid/view/Choreographer$FrameCallback;

    invoke-virtual {p1, v0}, Landroid/view/Choreographer;->removeFrameCallback(Landroid/view/Choreographer$FrameCallback;)V

    .line 60
    iget-boolean p1, p0, Lcom/android/systemui/dynamicisland/WaveformView;->mAnimating:Z

    if-eqz p1, :cond_1

    iget-boolean p1, p0, Lcom/android/systemui/dynamicisland/WaveformView;->mAttached:Z

    if-eqz p1, :cond_1

    invoke-virtual {p0}, Lcom/android/systemui/dynamicisland/WaveformView;->getVisibility()I

    move-result p1

    if-nez p1, :cond_1

    .line 61
    invoke-static {}, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;

    move-result-object p1

    iget-object v0, p0, Lcom/android/systemui/dynamicisland/WaveformView;->mFrameCallback:Landroid/view/Choreographer$FrameCallback;

    invoke-virtual {p1, v0}, Landroid/view/Choreographer;->postFrameCallback(Landroid/view/Choreographer$FrameCallback;)V

    .line 63
    :cond_1
    invoke-virtual {p0}, Lcom/android/systemui/dynamicisland/WaveformView;->invalidate()V

    .line 64
    return-void
.end method

.method public setVisibility(I)V
    .locals 2

    .line 84
    invoke-super {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 85
    invoke-static {}, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;

    move-result-object v0

    iget-object v1, p0, Lcom/android/systemui/dynamicisland/WaveformView;->mFrameCallback:Landroid/view/Choreographer$FrameCallback;

    invoke-virtual {v0, v1}, Landroid/view/Choreographer;->removeFrameCallback(Landroid/view/Choreographer$FrameCallback;)V

    .line 86
    if-nez p1, :cond_0

    iget-boolean p1, p0, Lcom/android/systemui/dynamicisland/WaveformView;->mAnimating:Z

    if-eqz p1, :cond_0

    iget-boolean p1, p0, Lcom/android/systemui/dynamicisland/WaveformView;->mAttached:Z

    if-eqz p1, :cond_0

    .line 87
    invoke-static {}, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;

    move-result-object p1

    iget-object v0, p0, Lcom/android/systemui/dynamicisland/WaveformView;->mFrameCallback:Landroid/view/Choreographer$FrameCallback;

    invoke-virtual {p1, v0}, Landroid/view/Choreographer;->postFrameCallback(Landroid/view/Choreographer$FrameCallback;)V

    .line 89
    :cond_0
    return-void
.end method
