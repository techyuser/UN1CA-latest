.class final Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidGlassDrawable;
.super Landroid/graphics/drawable/Drawable;
.source "IslandOverlayView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/systemui/dynamicisland/IslandOverlayView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "FluidGlassDrawable"
.end annotation


# instance fields
.field private mAccentColor:I

.field private final mAuraPaint:Landroid/graphics/Paint;

.field private mAuraShader:Landroid/graphics/Shader;

.field private final mBasePaint:Landroid/graphics/Paint;

.field private mBaseShader:Landroid/graphics/Shader;

.field private mCornerPx:F

.field private mExpanded:Z

.field private mHasBlur:Z

.field private final mMatrix:Landroid/graphics/Matrix;

.field private mOpacityPct:I

.field private final mRect:Landroid/graphics/RectF;

.field private mShadersDirty:Z

.field private final mSheenPaint:Landroid/graphics/Paint;

.field private mSheenShader:Landroid/graphics/Shader;


# direct methods
.method constructor <init>(F)V
    .locals 2

    .line 1854
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 1837
    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidGlassDrawable;->mBasePaint:Landroid/graphics/Paint;

    .line 1838
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidGlassDrawable;->mAuraPaint:Landroid/graphics/Paint;

    .line 1839
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidGlassDrawable;->mSheenPaint:Landroid/graphics/Paint;

    .line 1840
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidGlassDrawable;->mRect:Landroid/graphics/RectF;

    .line 1841
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidGlassDrawable;->mMatrix:Landroid/graphics/Matrix;

    .line 1847
    const v0, -0x9b2d01

    iput v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidGlassDrawable;->mAccentColor:I

    .line 1848
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidGlassDrawable;->mExpanded:Z

    .line 1849
    iput-boolean v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidGlassDrawable;->mHasBlur:Z

    .line 1850
    const/high16 v0, 0x41c00000    # 24.0f

    iput v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidGlassDrawable;->mCornerPx:F

    .line 1851
    const/16 v0, 0x37

    iput v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidGlassDrawable;->mOpacityPct:I

    .line 1852
    iput-boolean v1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidGlassDrawable;->mShadersDirty:Z

    .line 1855
    const/high16 v0, 0x41600000    # 14.0f

    mul-float/2addr p1, v0

    iput p1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidGlassDrawable;->mCornerPx:F

    .line 1856
    return-void
.end method

.method private rebuildShaders()V
    .locals 12

    .line 1878
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidGlassDrawable;->mShadersDirty:Z

    .line 1879
    iget v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidGlassDrawable;->mOpacityPct:I

    int-to-float v0, v0

    const/high16 v1, 0x425c0000    # 55.0f

    div-float/2addr v0, v1

    const v1, 0x40066666    # 2.1f

    invoke-static {v1, v0}, Ljava/lang/Math;->min(FF)F

    move-result v0

    const v1, 0x3eb33333    # 0.35f

    invoke-static {v1, v0}, Ljava/lang/Math;->max(FF)F

    move-result v0

    .line 1884
    iget-boolean v1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidGlassDrawable;->mExpanded:Z

    const/16 v2, 0xf5

    const/16 v3, 0xf0

    const/16 v4, 0xec

    const/16 v5, 0x80

    const/16 v6, 0x78

    const/16 v7, 0xfa

    if-eqz v1, :cond_1

    .line 1885
    iget-boolean v1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidGlassDrawable;->mHasBlur:Z

    if-eqz v1, :cond_0

    .line 1887
    const v1, 0x52363b48

    const/16 v5, 0x1e

    invoke-static {v1, v0, v5, v4}, Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidGlassDrawable;->scaleColorAlpha(IFII)I

    move-result v1

    .line 1888
    const v4, 0x62262a34

    const/16 v5, 0x24

    invoke-static {v4, v0, v5, v3}, Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidGlassDrawable;->scaleColorAlpha(IFII)I

    move-result v3

    .line 1889
    const v4, 0x721b1e26

    const/16 v5, 0x2a

    invoke-static {v4, v0, v5, v2}, Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidGlassDrawable;->scaleColorAlpha(IFII)I

    move-result v0

    goto :goto_0

    .line 1891
    :cond_0
    const v1, -0x35d7d3ca    # -2755341.5f

    const/16 v2, 0x70

    invoke-static {v1, v0, v2, v7}, Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidGlassDrawable;->scaleColorAlpha(IFII)I

    move-result v1

    .line 1892
    const v2, -0x2be2dfd8

    invoke-static {v2, v0, v6, v7}, Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidGlassDrawable;->scaleColorAlpha(IFII)I

    move-result v3

    .line 1893
    const v2, -0x21ebe8e3

    invoke-static {v2, v0, v5, v7}, Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidGlassDrawable;->scaleColorAlpha(IFII)I

    move-result v0

    goto :goto_0

    .line 1896
    :cond_1
    iget-boolean v1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidGlassDrawable;->mHasBlur:Z

    if-eqz v1, :cond_2

    .line 1897
    const v1, 0x7a292e38

    const/16 v5, 0x30

    invoke-static {v1, v0, v5, v4}, Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidGlassDrawable;->scaleColorAlpha(IFII)I

    move-result v1

    .line 1898
    const v4, -0x79e0dcd5

    const/16 v5, 0x36

    invoke-static {v4, v0, v5, v3}, Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidGlassDrawable;->scaleColorAlpha(IFII)I

    move-result v3

    .line 1899
    const v4, -0x6be9e6e0

    const/16 v5, 0x40

    invoke-static {v4, v0, v5, v2}, Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidGlassDrawable;->scaleColorAlpha(IFII)I

    move-result v0

    goto :goto_0

    .line 1901
    :cond_2
    const v1, -0x2fdbd7ce

    invoke-static {v1, v0, v6, v7}, Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidGlassDrawable;->scaleColorAlpha(IFII)I

    move-result v1

    .line 1902
    const v2, -0x25e5e2dc

    invoke-static {v2, v0, v5, v7}, Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidGlassDrawable;->scaleColorAlpha(IFII)I

    move-result v3

    .line 1903
    const v2, -0x1dedebe6

    const/16 v4, 0x88

    invoke-static {v2, v0, v4, v7}, Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidGlassDrawable;->scaleColorAlpha(IFII)I

    move-result v0

    .line 1906
    :goto_0
    new-instance v4, Landroid/graphics/LinearGradient;

    filled-new-array {v1, v3, v0}, [I

    move-result-object v9

    const/4 v0, 0x3

    new-array v10, v0, [F

    fill-array-data v10, :array_0

    sget-object v11, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/high16 v8, 0x42c80000    # 100.0f

    invoke-direct/range {v4 .. v11}, Landroid/graphics/LinearGradient;-><init>(FFFF[I[FLandroid/graphics/Shader$TileMode;)V

    iput-object v4, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidGlassDrawable;->mBaseShader:Landroid/graphics/Shader;

    .line 1912
    iget-object v1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidGlassDrawable;->mBasePaint:Landroid/graphics/Paint;

    iget-object v2, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidGlassDrawable;->mBaseShader:Landroid/graphics/Shader;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 1914
    iget v1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidGlassDrawable;->mAccentColor:I

    const v2, 0xffffff

    and-int/2addr v1, v2

    .line 1915
    iget-boolean v3, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidGlassDrawable;->mExpanded:Z

    if-eqz v3, :cond_3

    const/high16 v3, 0x38000000

    goto :goto_1

    :cond_3
    const/high16 v3, 0x2e000000

    .line 1916
    :goto_1
    new-instance v4, Landroid/graphics/RadialGradient;

    or-int v5, v1, v3

    div-int/2addr v3, v0

    or-int/2addr v3, v1

    filled-new-array {v5, v3, v1}, [I

    move-result-object v8

    new-array v9, v0, [F

    fill-array-data v9, :array_1

    sget-object v10, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/high16 v7, 0x42c80000    # 100.0f

    invoke-direct/range {v4 .. v10}, Landroid/graphics/RadialGradient;-><init>(FFF[I[FLandroid/graphics/Shader$TileMode;)V

    iput-object v4, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidGlassDrawable;->mAuraShader:Landroid/graphics/Shader;

    .line 1922
    iget-object v1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidGlassDrawable;->mAuraPaint:Landroid/graphics/Paint;

    iget-object v3, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidGlassDrawable;->mAuraShader:Landroid/graphics/Shader;

    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 1924
    iget-boolean v1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidGlassDrawable;->mExpanded:Z

    if-eqz v1, :cond_4

    const v1, 0x2effffff

    goto :goto_2

    :cond_4
    const v1, 0x22ffffff

    .line 1925
    :goto_2
    new-instance v3, Landroid/graphics/LinearGradient;

    const v4, 0x9ffffff

    filled-new-array {v1, v4, v2}, [I

    move-result-object v8

    new-array v9, v0, [F

    fill-array-data v9, :array_2

    sget-object v10, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/high16 v7, 0x42c80000    # 100.0f

    invoke-direct/range {v3 .. v10}, Landroid/graphics/LinearGradient;-><init>(FFFF[I[FLandroid/graphics/Shader$TileMode;)V

    iput-object v3, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidGlassDrawable;->mSheenShader:Landroid/graphics/Shader;

    .line 1931
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidGlassDrawable;->mSheenPaint:Landroid/graphics/Paint;

    iget-object v1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidGlassDrawable;->mSheenShader:Landroid/graphics/Shader;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 1932
    return-void

    :array_0
    .array-data 4
        0x0
        0x3ef5c28f    # 0.48f
        0x3f800000    # 1.0f
    .end array-data

    :array_1
    .array-data 4
        0x0
        0x3f0ccccd    # 0.55f
        0x3f800000    # 1.0f
    .end array-data

    :array_2
    .array-data 4
        0x0
        0x3f051eb8    # 0.52f
        0x3f800000    # 1.0f
    .end array-data
.end method

.method private static scaleColorAlpha(IFII)I
    .locals 1

    .line 1872
    ushr-int/lit8 v0, p0, 0x18

    and-int/lit16 v0, v0, 0xff

    .line 1873
    int-to-float v0, v0

    mul-float/2addr v0, p1

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result p1

    invoke-static {p3, p1}, Ljava/lang/Math;->min(II)I

    move-result p1

    invoke-static {p2, p1}, Ljava/lang/Math;->max(II)I

    move-result p1

    .line 1874
    shl-int/lit8 p1, p1, 0x18

    const p2, 0xffffff

    and-int/2addr p0, p2

    or-int/2addr p0, p1

    return p0
.end method


# virtual methods
.method configure(IZZFI)V
    .locals 1

    .line 1859
    iget v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidGlassDrawable;->mAccentColor:I

    if-ne v0, p1, :cond_0

    iget-boolean v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidGlassDrawable;->mExpanded:Z

    if-ne v0, p2, :cond_0

    iget-boolean v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidGlassDrawable;->mHasBlur:Z

    if-ne v0, p3, :cond_0

    iget v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidGlassDrawable;->mOpacityPct:I

    if-eq v0, p5, :cond_1

    .line 1860
    :cond_0
    iput p1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidGlassDrawable;->mAccentColor:I

    .line 1861
    iput-boolean p2, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidGlassDrawable;->mExpanded:Z

    .line 1862
    iput-boolean p3, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidGlassDrawable;->mHasBlur:Z

    .line 1863
    iput p5, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidGlassDrawable;->mOpacityPct:I

    .line 1864
    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidGlassDrawable;->mShadersDirty:Z

    .line 1866
    :cond_1
    iget p1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidGlassDrawable;->mCornerPx:F

    sub-float/2addr p1, p4

    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result p1

    const/high16 p2, 0x3e800000    # 0.25f

    cmpl-float p1, p1, p2

    if-lez p1, :cond_2

    .line 1867
    iput p4, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidGlassDrawable;->mCornerPx:F

    .line 1869
    :cond_2
    return-void
.end method

.method public draw(Landroid/graphics/Canvas;)V
    .locals 13

    .line 1936
    invoke-virtual {p0}, Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidGlassDrawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v0

    .line 1937
    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v1

    .line 1938
    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v2

    .line 1939
    if-lez v1, :cond_6

    if-gtz v2, :cond_0

    goto/16 :goto_3

    .line 1942
    :cond_0
    iget-boolean v3, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidGlassDrawable;->mShadersDirty:Z

    if-nez v3, :cond_1

    iget-object v3, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidGlassDrawable;->mBaseShader:Landroid/graphics/Shader;

    if-nez v3, :cond_2

    .line 1943
    :cond_1
    invoke-direct {p0}, Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidGlassDrawable;->rebuildShaders()V

    .line 1946
    :cond_2
    iget-object v3, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidGlassDrawable;->mMatrix:Landroid/graphics/Matrix;

    int-to-float v4, v2

    const/high16 v5, 0x42c80000    # 100.0f

    div-float v6, v4, v5

    const v7, 0x3c23d70a    # 0.01f

    invoke-static {v7, v6}, Ljava/lang/Math;->max(FF)F

    move-result v6

    const/high16 v8, 0x3f800000    # 1.0f

    invoke-virtual {v3, v8, v6}, Landroid/graphics/Matrix;->setScale(FF)V

    .line 1947
    iget-object v3, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidGlassDrawable;->mMatrix:Landroid/graphics/Matrix;

    iget v6, v0, Landroid/graphics/Rect;->left:I

    int-to-float v6, v6

    iget v9, v0, Landroid/graphics/Rect;->top:I

    int-to-float v9, v9

    invoke-virtual {v3, v6, v9}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 1948
    iget-object v3, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidGlassDrawable;->mBaseShader:Landroid/graphics/Shader;

    iget-object v6, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidGlassDrawable;->mMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v3, v6}, Landroid/graphics/Shader;->setLocalMatrix(Landroid/graphics/Matrix;)V

    .line 1950
    iget v3, v0, Landroid/graphics/Rect;->left:I

    int-to-float v3, v3

    int-to-float v6, v1

    iget-boolean v9, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidGlassDrawable;->mExpanded:Z

    if-eqz v9, :cond_3

    const v9, 0x3e23d70a    # 0.16f

    goto :goto_0

    :cond_3
    const v9, 0x3e3851ec    # 0.18f

    :goto_0
    mul-float/2addr v9, v6

    add-float/2addr v3, v9

    .line 1951
    iget v9, v0, Landroid/graphics/Rect;->top:I

    int-to-float v9, v9

    iget-boolean v10, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidGlassDrawable;->mExpanded:Z

    const/high16 v11, 0x3f000000    # 0.5f

    if-eqz v10, :cond_4

    const v10, 0x3e8f5c29    # 0.28f

    mul-float/2addr v10, v4

    goto :goto_1

    :cond_4
    mul-float v10, v4, v11

    :goto_1
    add-float/2addr v9, v10

    .line 1952
    iget-boolean v10, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidGlassDrawable;->mExpanded:Z

    if-eqz v10, :cond_5

    const v10, 0x3f0f5c29    # 0.56f

    mul-float/2addr v6, v10

    goto :goto_2

    :cond_5
    const v10, 0x400ccccd    # 2.2f

    mul-float/2addr v10, v4

    const v12, 0x3ec28f5c    # 0.38f

    mul-float/2addr v6, v12

    invoke-static {v10, v6}, Ljava/lang/Math;->max(FF)F

    move-result v6

    :goto_2
    const/high16 v10, 0x41c00000    # 24.0f

    invoke-static {v10, v6}, Ljava/lang/Math;->max(FF)F

    move-result v6

    .line 1953
    iget-object v10, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidGlassDrawable;->mMatrix:Landroid/graphics/Matrix;

    div-float/2addr v6, v5

    invoke-virtual {v10, v6, v6}, Landroid/graphics/Matrix;->setScale(FF)V

    .line 1954
    iget-object v6, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidGlassDrawable;->mMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v6, v3, v9}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 1955
    iget-object v3, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidGlassDrawable;->mAuraShader:Landroid/graphics/Shader;

    iget-object v6, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidGlassDrawable;->mMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v3, v6}, Landroid/graphics/Shader;->setLocalMatrix(Landroid/graphics/Matrix;)V

    .line 1957
    iget-object v3, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidGlassDrawable;->mMatrix:Landroid/graphics/Matrix;

    const v6, 0x3ee147ae    # 0.44f

    mul-float/2addr v4, v6

    div-float/2addr v4, v5

    invoke-static {v7, v4}, Ljava/lang/Math;->max(FF)F

    move-result v4

    invoke-virtual {v3, v8, v4}, Landroid/graphics/Matrix;->setScale(FF)V

    .line 1958
    iget-object v3, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidGlassDrawable;->mMatrix:Landroid/graphics/Matrix;

    iget v4, v0, Landroid/graphics/Rect;->left:I

    int-to-float v4, v4

    iget v5, v0, Landroid/graphics/Rect;->top:I

    int-to-float v5, v5

    invoke-virtual {v3, v4, v5}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 1959
    iget-object v3, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidGlassDrawable;->mSheenShader:Landroid/graphics/Shader;

    iget-object v4, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidGlassDrawable;->mMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v3, v4}, Landroid/graphics/Shader;->setLocalMatrix(Landroid/graphics/Matrix;)V

    .line 1961
    iget-object v3, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidGlassDrawable;->mRect:Landroid/graphics/RectF;

    iget v4, v0, Landroid/graphics/Rect;->left:I

    int-to-float v4, v4

    iget v5, v0, Landroid/graphics/Rect;->top:I

    int-to-float v5, v5

    iget v6, v0, Landroid/graphics/Rect;->right:I

    int-to-float v6, v6

    iget v0, v0, Landroid/graphics/Rect;->bottom:I

    int-to-float v0, v0

    invoke-virtual {v3, v4, v5, v6, v0}, Landroid/graphics/RectF;->set(FFFF)V

    .line 1962
    iget v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidGlassDrawable;->mCornerPx:F

    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v1

    int-to-float v1, v1

    mul-float/2addr v1, v11

    invoke-static {v0, v1}, Ljava/lang/Math;->min(FF)F

    move-result v0

    .line 1963
    iget-object v1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidGlassDrawable;->mRect:Landroid/graphics/RectF;

    iget-object v2, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidGlassDrawable;->mBasePaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v1, v0, v0, v2}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 1964
    iget-object v1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidGlassDrawable;->mRect:Landroid/graphics/RectF;

    iget-object v2, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidGlassDrawable;->mAuraPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v1, v0, v0, v2}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 1965
    iget-object v1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidGlassDrawable;->mRect:Landroid/graphics/RectF;

    iget-object v2, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$FluidGlassDrawable;->mSheenPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v1, v0, v0, v2}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 1966
    return-void

    .line 1940
    :cond_6
    :goto_3
    return-void
.end method

.method public getOpacity()I
    .locals 1

    .line 1978
    const/4 v0, -0x3

    return v0
.end method

.method public setAlpha(I)V
    .locals 0

    .line 1970
    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .locals 0

    .line 1974
    return-void
.end method
