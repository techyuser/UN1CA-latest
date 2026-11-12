.class public final Lcom/android/systemui/dynamicisland/ColorExtractor;
.super Ljava/lang/Object;
.source "ColorExtractor.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    return-void
.end method

.method public static createRoundedSquare(Landroid/graphics/Bitmap;II)Landroid/graphics/Bitmap;
    .locals 7

    .line 67
    if-eqz p0, :cond_1

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v0

    if-nez v0, :cond_1

    if-gtz p1, :cond_0

    goto :goto_0

    .line 70
    :cond_0
    sget-object v0, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {p1, p1, v0}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 71
    new-instance v1, Landroid/graphics/Canvas;

    invoke-direct {v1, v0}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 72
    new-instance v2, Landroid/graphics/Paint;

    const/4 v3, 0x3

    invoke-direct {v2, v3}, Landroid/graphics/Paint;-><init>(I)V

    .line 73
    new-instance v3, Landroid/graphics/RectF;

    int-to-float p1, p1

    const/4 v4, 0x0

    invoke-direct {v3, v4, v4, p1, p1}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 74
    int-to-float p1, p2

    invoke-virtual {v1, v3, p1, p1, v2}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 75
    new-instance p1, Landroid/graphics/PorterDuffXfermode;

    sget-object p2, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    invoke-direct {p1, p2}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    invoke-virtual {v2, p1}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 77
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result p1

    .line 78
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result p2

    .line 79
    invoke-static {p1, p2}, Ljava/lang/Math;->min(II)I

    move-result v4

    .line 80
    sub-int/2addr p1, v4

    div-int/lit8 p1, p1, 0x2

    .line 81
    sub-int/2addr p2, v4

    div-int/lit8 p2, p2, 0x2

    .line 82
    new-instance v5, Landroid/graphics/Rect;

    add-int v6, p1, v4

    add-int/2addr v4, p2

    invoke-direct {v5, p1, p2, v6, v4}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 83
    invoke-virtual {v1, p0, v5, v3, v2}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 84
    return-object v0

    .line 68
    :cond_1
    :goto_0
    const/4 p0, 0x0

    return-object p0
.end method

.method public static extractVibrantAccent(Landroid/graphics/Bitmap;I)I
    .locals 16

    .line 21
    move-object/from16 v0, p0

    if-eqz v0, :cond_8

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v1

    if-nez v1, :cond_8

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    if-lez v1, :cond_8

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    if-gtz v1, :cond_0

    goto/16 :goto_3

    .line 25
    :cond_0
    const/16 v1, 0xc

    const/4 v2, 0x0

    :try_start_0
    invoke-static {v0, v1, v1, v2}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 26
    const/4 v3, 0x3

    new-array v3, v3, [F

    .line 27
    nop

    .line 28
    nop

    .line 30
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v4

    .line 31
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v5

    .line 32
    const/high16 v6, -0x40800000    # -1.0f

    move/from16 v8, p1

    move v7, v2

    :goto_0
    const/4 v9, 0x2

    const/4 v10, 0x1

    if-ge v7, v5, :cond_5

    .line 33
    move v11, v2

    :goto_1
    if-ge v11, v4, :cond_4

    .line 34
    invoke-virtual {v1, v11, v7}, Landroid/graphics/Bitmap;->getPixel(II)I

    move-result v12

    .line 35
    invoke-static {v12}, Landroid/graphics/Color;->alpha(I)I

    move-result v13

    const/16 v14, 0xb4

    if-ge v13, v14, :cond_1

    .line 36
    goto :goto_2

    .line 38
    :cond_1
    invoke-static {v12, v3}, Landroid/graphics/Color;->colorToHSV(I[F)V

    .line 39
    aget v13, v3, v10

    .line 40
    aget v14, v3, v9

    .line 41
    const v15, 0x3e4ccccd    # 0.2f

    cmpg-float v15, v14, v15

    if-ltz v15, :cond_3

    const v15, 0x3f75c28f    # 0.96f

    cmpl-float v15, v14, v15

    if-lez v15, :cond_2

    .line 42
    goto :goto_2

    .line 44
    :cond_2
    const v15, 0x400ccccd    # 2.2f

    mul-float/2addr v13, v15

    const v15, 0x3f333333    # 0.7f

    mul-float/2addr v14, v15

    add-float/2addr v13, v14

    .line 45
    cmpl-float v14, v13, v6

    if-lez v14, :cond_3

    .line 46
    nop

    .line 47
    move v8, v12

    move v6, v13

    .line 33
    :cond_3
    :goto_2
    add-int/lit8 v11, v11, 0x1

    goto :goto_1

    .line 32
    :cond_4
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    .line 51
    :cond_5
    if-eq v1, v0, :cond_6

    .line 52
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->recycle()V

    .line 54
    :cond_6
    const/4 v0, 0x0

    cmpg-float v0, v6, v0

    if-gez v0, :cond_7

    .line 55
    return p1

    .line 57
    :cond_7
    invoke-static {v8, v3}, Landroid/graphics/Color;->colorToHSV(I[F)V

    .line 58
    aget v0, v3, v10

    const v1, 0x3f6147ae    # 0.88f

    invoke-static {v1, v0}, Ljava/lang/Math;->min(FF)F

    move-result v0

    const v1, 0x3ee66666    # 0.45f

    invoke-static {v1, v0}, Ljava/lang/Math;->max(FF)F

    move-result v0

    aput v0, v3, v10

    .line 59
    aget v0, v3, v9

    const v1, 0x3f733333    # 0.95f

    invoke-static {v1, v0}, Ljava/lang/Math;->min(FF)F

    move-result v0

    const v1, 0x3f3851ec    # 0.72f

    invoke-static {v1, v0}, Ljava/lang/Math;->max(FF)F

    move-result v0

    aput v0, v3, v9

    .line 60
    const/16 v0, 0xff

    invoke-static {v0, v3}, Landroid/graphics/Color;->HSVToColor(I[F)I

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return v0

    .line 61
    :catchall_0
    move-exception v0

    .line 62
    return p1

    .line 22
    :cond_8
    :goto_3
    return p1
.end method
