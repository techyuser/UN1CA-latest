.class final Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidRimDrawable;
.super Landroid/graphics/drawable/Drawable;
.source "IslandOverlayView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/systemui/dynamicisland/IslandOverlayView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "FluidRimDrawable"
.end annotation


# instance fields
.field private mAccentColor:I

.field private mCornerPx:F

.field private final mDensity:F

.field private mExpanded:Z

.field private final mMatrix:Landroid/graphics/Matrix;

.field private final mRect:Landroid/graphics/RectF;

.field private mRimAlphaPct:I

.field private mRimShader:Landroid/graphics/Shader;

.field private mShaderDirty:Z

.field private final mStrokePaint:Landroid/graphics/Paint;


# direct methods
.method constructor <init>(F)V
    .locals 2

    .line 1998
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 1986
    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidRimDrawable;->mStrokePaint:Landroid/graphics/Paint;

    .line 1987
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidRimDrawable;->mRect:Landroid/graphics/RectF;

    .line 1988
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidRimDrawable;->mMatrix:Landroid/graphics/Matrix;

    .line 1992
    const v0, -0x9b2d01

    iput v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidRimDrawable;->mAccentColor:I

    .line 1993
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidRimDrawable;->mExpanded:Z

    .line 1994
    const/high16 v0, 0x41c00000    # 24.0f

    iput v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidRimDrawable;->mCornerPx:F

    .line 1995
    const/16 v0, 0x55

    iput v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidRimDrawable;->mRimAlphaPct:I

    .line 1996
    iput-boolean v1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidRimDrawable;->mShaderDirty:Z

    .line 1999
    iput p1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidRimDrawable;->mDensity:F

    .line 2000
    iget-object p1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidRimDrawable;->mStrokePaint:Landroid/graphics/Paint;

    sget-object v0, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 2001
    return-void
.end method

.method private rebuildShader()V
    .locals 10

    .line 2022
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidRimDrawable;->mShaderDirty:Z

    .line 2023
    iget-boolean v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidRimDrawable;->mExpanded:Z

    if-eqz v0, :cond_0

    const v0, 0x3f8ccccd    # 1.1f

    goto :goto_0

    :cond_0
    const v0, 0x3f666666    # 0.9f

    :goto_0
    iget v1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidRimDrawable;->mDensity:F

    mul-float/2addr v0, v1

    .line 2024
    iget-object v1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidRimDrawable;->mStrokePaint:Landroid/graphics/Paint;

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-static {v2, v0}, Ljava/lang/Math;->max(FF)F

    move-result v0

    invoke-virtual {v1, v0}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 2025
    iget v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidRimDrawable;->mRimAlphaPct:I

    int-to-float v0, v0

    const/high16 v1, 0x42aa0000    # 85.0f

    div-float/2addr v0, v1

    const v1, 0x3faccccd    # 1.35f

    invoke-static {v1, v0}, Ljava/lang/Math;->min(FF)F

    move-result v0

    const/4 v1, 0x0

    invoke-static {v1, v0}, Ljava/lang/Math;->max(FF)F

    move-result v0

    .line 2026
    iget v1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidRimDrawable;->mAccentColor:I

    const v2, 0xffffff

    and-int/2addr v1, v2

    .line 2027
    new-instance v2, Landroid/graphics/LinearGradient;

    .line 2030
    iget-boolean v3, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidRimDrawable;->mExpanded:Z

    if-eqz v3, :cond_1

    const v3, -0x42000001    # -0.12499999f

    goto :goto_1

    :cond_1
    const v3, -0x66000001

    :goto_1
    invoke-static {v3, v0}, Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidRimDrawable;->scaleRimAlpha(IF)I

    move-result v3

    .line 2031
    const v4, 0x26ffffff

    invoke-static {v4, v0}, Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidRimDrawable;->scaleRimAlpha(IF)I

    move-result v4

    const/high16 v5, 0x42000000    # 32.0f

    or-int/2addr v1, v5

    .line 2032
    invoke-static {v1, v0}, Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidRimDrawable;->scaleRimAlpha(IF)I

    move-result v1

    .line 2033
    iget-boolean v5, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidRimDrawable;->mExpanded:Z

    if-eqz v5, :cond_2

    const v5, -0x75000001

    goto :goto_2

    :cond_2
    const v5, 0x6affffff

    :goto_2
    invoke-static {v5, v0}, Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidRimDrawable;->scaleRimAlpha(IF)I

    move-result v0

    filled-new-array {v3, v4, v1, v0}, [I

    move-result-object v7

    const/4 v0, 0x4

    new-array v8, v0, [F

    fill-array-data v8, :array_0

    sget-object v9, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/high16 v5, 0x42c80000    # 100.0f

    const/high16 v6, 0x42c80000    # 100.0f

    invoke-direct/range {v2 .. v9}, Landroid/graphics/LinearGradient;-><init>(FFFF[I[FLandroid/graphics/Shader$TileMode;)V

    iput-object v2, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidRimDrawable;->mRimShader:Landroid/graphics/Shader;

    .line 2038
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidRimDrawable;->mStrokePaint:Landroid/graphics/Paint;

    iget-object v1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidRimDrawable;->mRimShader:Landroid/graphics/Shader;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 2039
    return-void

    nop

    :array_0
    .array-data 4
        0x0
        0x3edc28f6    # 0.43f
        0x3f19999a    # 0.6f
        0x3f800000    # 1.0f
    .end array-data
.end method

.method private static scaleRimAlpha(IF)I
    .locals 2

    .line 2016
    ushr-int/lit8 v0, p0, 0x18

    const/16 v1, 0xff

    and-int/2addr v0, v1

    .line 2017
    int-to-float v0, v0

    mul-float/2addr v0, p1

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result p1

    invoke-static {v1, p1}, Ljava/lang/Math;->min(II)I

    move-result p1

    const/4 v0, 0x0

    invoke-static {v0, p1}, Ljava/lang/Math;->max(II)I

    move-result p1

    .line 2018
    shl-int/lit8 p1, p1, 0x18

    const v0, 0xffffff

    and-int/2addr p0, v0

    or-int/2addr p0, p1

    return p0
.end method


# virtual methods
.method configure(IZFI)V
    .locals 1

    .line 2004
    iget v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidRimDrawable;->mAccentColor:I

    if-ne v0, p1, :cond_0

    iget-boolean v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidRimDrawable;->mExpanded:Z

    if-ne v0, p2, :cond_0

    iget v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidRimDrawable;->mRimAlphaPct:I

    if-eq v0, p4, :cond_1

    .line 2005
    :cond_0
    iput p1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidRimDrawable;->mAccentColor:I

    .line 2006
    iput-boolean p2, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidRimDrawable;->mExpanded:Z

    .line 2007
    iput p4, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidRimDrawable;->mRimAlphaPct:I

    .line 2008
    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidRimDrawable;->mShaderDirty:Z

    .line 2010
    :cond_1
    iget p1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidRimDrawable;->mCornerPx:F

    sub-float/2addr p1, p3

    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result p1

    const/high16 p2, 0x3e800000    # 0.25f

    cmpl-float p1, p1, p2

    if-lez p1, :cond_2

    .line 2011
    iput p3, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidRimDrawable;->mCornerPx:F

    .line 2013
    :cond_2
    return-void
.end method

.method public draw(Landroid/graphics/Canvas;)V
    .locals 7

    .line 2043
    invoke-virtual {p0}, Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidRimDrawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v0

    .line 2044
    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v1

    .line 2045
    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v2

    .line 2046
    if-lez v1, :cond_3

    if-gtz v2, :cond_0

    goto :goto_0

    .line 2049
    :cond_0
    iget-boolean v3, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidRimDrawable;->mShaderDirty:Z

    if-nez v3, :cond_1

    iget-object v3, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidRimDrawable;->mRimShader:Landroid/graphics/Shader;

    if-nez v3, :cond_2

    .line 2050
    :cond_1
    invoke-direct {p0}, Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidRimDrawable;->rebuildShader()V

    .line 2052
    :cond_2
    iget-object v3, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidRimDrawable;->mMatrix:Landroid/graphics/Matrix;

    int-to-float v1, v1

    const/high16 v4, 0x42c80000    # 100.0f

    div-float/2addr v1, v4

    const v5, 0x3c23d70a    # 0.01f

    invoke-static {v5, v1}, Ljava/lang/Math;->max(FF)F

    move-result v1

    int-to-float v2, v2

    div-float/2addr v2, v4

    invoke-static {v5, v2}, Ljava/lang/Math;->max(FF)F

    move-result v2

    invoke-virtual {v3, v1, v2}, Landroid/graphics/Matrix;->setScale(FF)V

    .line 2053
    iget-object v1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidRimDrawable;->mMatrix:Landroid/graphics/Matrix;

    iget v2, v0, Landroid/graphics/Rect;->left:I

    int-to-float v2, v2

    iget v3, v0, Landroid/graphics/Rect;->top:I

    int-to-float v3, v3

    invoke-virtual {v1, v2, v3}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 2054
    iget-object v1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidRimDrawable;->mRimShader:Landroid/graphics/Shader;

    iget-object v2, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidRimDrawable;->mMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v1, v2}, Landroid/graphics/Shader;->setLocalMatrix(Landroid/graphics/Matrix;)V

    .line 2056
    iget-object v1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidRimDrawable;->mStrokePaint:Landroid/graphics/Paint;

    invoke-virtual {v1}, Landroid/graphics/Paint;->getStrokeWidth()F

    move-result v1

    const/high16 v2, 0x3f000000    # 0.5f

    mul-float/2addr v1, v2

    .line 2057
    iget-object v3, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidRimDrawable;->mRect:Landroid/graphics/RectF;

    iget v4, v0, Landroid/graphics/Rect;->left:I

    int-to-float v4, v4

    add-float/2addr v4, v1

    iget v5, v0, Landroid/graphics/Rect;->top:I

    int-to-float v5, v5

    add-float/2addr v5, v1

    iget v6, v0, Landroid/graphics/Rect;->right:I

    int-to-float v6, v6

    sub-float/2addr v6, v1

    iget v0, v0, Landroid/graphics/Rect;->bottom:I

    int-to-float v0, v0

    sub-float/2addr v0, v1

    invoke-virtual {v3, v4, v5, v6, v0}, Landroid/graphics/RectF;->set(FFFF)V

    .line 2058
    iget v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidRimDrawable;->mCornerPx:F

    sub-float/2addr v0, v1

    iget-object v1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidRimDrawable;->mRect:Landroid/graphics/RectF;

    invoke-virtual {v1}, Landroid/graphics/RectF;->width()F

    move-result v1

    iget-object v3, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidRimDrawable;->mRect:Landroid/graphics/RectF;

    invoke-virtual {v3}, Landroid/graphics/RectF;->height()F

    move-result v3

    invoke-static {v1, v3}, Ljava/lang/Math;->min(FF)F

    move-result v1

    mul-float/2addr v1, v2

    invoke-static {v0, v1}, Ljava/lang/Math;->min(FF)F

    move-result v0

    const/4 v1, 0x0

    invoke-static {v1, v0}, Ljava/lang/Math;->max(FF)F

    move-result v0

    .line 2059
    iget-object v1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidRimDrawable;->mRect:Landroid/graphics/RectF;

    iget-object v2, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidRimDrawable;->mStrokePaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v1, v0, v0, v2}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 2060
    return-void

    .line 2047
    :cond_3
    :goto_0
    return-void
.end method

.method public getOpacity()I
    .locals 1

    .line 2072
    const/4 v0, -0x3

    return v0
.end method

.method public setAlpha(I)V
    .locals 0

    .line 2064
    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .locals 0

    .line 2068
    return-void
.end method
