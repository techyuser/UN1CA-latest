.class public final Lcom/android/systemui/dynamicisland/GlyphIconView;
.super Landroid/view/View;
.source "GlyphIconView.java"


# static fields
.field public static final GLYPH_BLUETOOTH:I = 0x2

.field public static final GLYPH_BOLT:I = 0x1

.field public static final GLYPH_CALL:I = 0x8

.field public static final GLYPH_CHEVRON_UP:I = 0xd

.field public static final GLYPH_HOTSPOT:I = 0x6

.field public static final GLYPH_NEXT:I = 0xc

.field public static final GLYPH_PAUSE:I = 0xb

.field public static final GLYPH_PLAY:I = 0xa

.field public static final GLYPH_PREV:I = 0x9

.field public static final GLYPH_REC:I = 0x7

.field public static final GLYPH_SILENT:I = 0x5

.field public static final GLYPH_SOUND:I = 0x3

.field public static final GLYPH_TIMER:I = 0xe

.field public static final GLYPH_VIBRATE:I = 0x4


# instance fields
.field private mColor:I

.field private final mFillPaint:Landroid/graphics/Paint;

.field private mKind:I

.field private final mPath:Landroid/graphics/Path;

.field private final mRect:Landroid/graphics/RectF;

.field private final mStrokePaint:Landroid/graphics/Paint;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 39
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 30
    new-instance p1, Landroid/graphics/Paint;

    const/4 v0, 0x1

    invoke-direct {p1, v0}, Landroid/graphics/Paint;-><init>(I)V

    iput-object p1, p0, Lcom/android/systemui/dynamicisland/GlyphIconView;->mFillPaint:Landroid/graphics/Paint;

    .line 31
    new-instance p1, Landroid/graphics/Paint;

    invoke-direct {p1, v0}, Landroid/graphics/Paint;-><init>(I)V

    iput-object p1, p0, Lcom/android/systemui/dynamicisland/GlyphIconView;->mStrokePaint:Landroid/graphics/Paint;

    .line 32
    new-instance p1, Landroid/graphics/Path;

    invoke-direct {p1}, Landroid/graphics/Path;-><init>()V

    iput-object p1, p0, Lcom/android/systemui/dynamicisland/GlyphIconView;->mPath:Landroid/graphics/Path;

    .line 33
    new-instance p1, Landroid/graphics/RectF;

    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    iput-object p1, p0, Lcom/android/systemui/dynamicisland/GlyphIconView;->mRect:Landroid/graphics/RectF;

    .line 35
    const/4 p1, 0x0

    iput p1, p0, Lcom/android/systemui/dynamicisland/GlyphIconView;->mKind:I

    .line 36
    const/4 p1, -0x1

    iput p1, p0, Lcom/android/systemui/dynamicisland/GlyphIconView;->mColor:I

    .line 40
    iget-object p1, p0, Lcom/android/systemui/dynamicisland/GlyphIconView;->mFillPaint:Landroid/graphics/Paint;

    sget-object v0, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 41
    iget-object p1, p0, Lcom/android/systemui/dynamicisland/GlyphIconView;->mFillPaint:Landroid/graphics/Paint;

    iget v0, p0, Lcom/android/systemui/dynamicisland/GlyphIconView;->mColor:I

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 42
    iget-object p1, p0, Lcom/android/systemui/dynamicisland/GlyphIconView;->mStrokePaint:Landroid/graphics/Paint;

    sget-object v0, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 43
    iget-object p1, p0, Lcom/android/systemui/dynamicisland/GlyphIconView;->mStrokePaint:Landroid/graphics/Paint;

    sget-object v0, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    .line 44
    iget-object p1, p0, Lcom/android/systemui/dynamicisland/GlyphIconView;->mStrokePaint:Landroid/graphics/Paint;

    sget-object v0, Landroid/graphics/Paint$Join;->ROUND:Landroid/graphics/Paint$Join;

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setStrokeJoin(Landroid/graphics/Paint$Join;)V

    .line 45
    iget-object p1, p0, Lcom/android/systemui/dynamicisland/GlyphIconView;->mStrokePaint:Landroid/graphics/Paint;

    iget v0, p0, Lcom/android/systemui/dynamicisland/GlyphIconView;->mColor:I

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 46
    return-void
.end method


# virtual methods
.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 26

    .line 60
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-super/range {p0 .. p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 61
    invoke-virtual {v0}, Lcom/android/systemui/dynamicisland/GlyphIconView;->getWidth()I

    move-result v2

    .line 62
    invoke-virtual {v0}, Lcom/android/systemui/dynamicisland/GlyphIconView;->getHeight()I

    move-result v3

    .line 63
    if-lez v2, :cond_1

    if-lez v3, :cond_1

    iget v4, v0, Lcom/android/systemui/dynamicisland/GlyphIconView;->mKind:I

    if-nez v4, :cond_0

    goto/16 :goto_1

    .line 66
    :cond_0
    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    move-result v4

    int-to-float v7, v4

    .line 67
    int-to-float v2, v2

    sub-float/2addr v2, v7

    const/high16 v4, 0x3f000000    # 0.5f

    mul-float v8, v2, v4

    .line 68
    int-to-float v2, v3

    sub-float/2addr v2, v7

    mul-float v9, v2, v4

    .line 69
    iget-object v2, v0, Lcom/android/systemui/dynamicisland/GlyphIconView;->mStrokePaint:Landroid/graphics/Paint;

    const v3, 0x3de147ae    # 0.11f

    mul-float v10, v7, v3

    const v3, 0x3fe66666    # 1.8f

    invoke-static {v3, v10}, Ljava/lang/Math;->max(FF)F

    move-result v3

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 71
    iget v2, v0, Lcom/android/systemui/dynamicisland/GlyphIconView;->mKind:I

    const v3, 0x3d23d70a    # 0.04f

    const v5, 0x3f47ae14    # 0.78f

    const v6, 0x3e6147ae    # 0.22f

    const v11, 0x3f51eb85    # 0.82f

    const v12, 0x3f28f5c3    # 0.66f

    const v13, 0x3e0f5c29    # 0.14f

    const v14, 0x3e3851ec    # 0.18f

    const v15, 0x3f147ae1    # 0.58f

    const v16, 0x3f4ccccd    # 0.8f

    const v17, 0x3eae147b    # 0.34f

    const v18, 0x3eb851ec    # 0.36f

    const v19, 0x3f333333    # 0.7f

    const v20, 0x3ecccccd    # 0.4f

    const v21, 0x3f0a3d71    # 0.54f

    const v22, 0x3e4ccccd    # 0.2f

    const v23, 0x3e99999a    # 0.3f

    const v24, 0x3f428f5c    # 0.76f

    const v25, 0x3e75c28f    # 0.24f

    packed-switch v2, :pswitch_data_0

    goto/16 :goto_0

    .line 194
    :pswitch_0
    mul-float/2addr v4, v7

    add-float v2, v8, v4

    .line 195
    mul-float v21, v21, v7

    add-float v3, v9, v21

    .line 196
    const v4, 0x3ea8f5c3    # 0.33f

    mul-float/2addr v4, v7

    iget-object v5, v0, Lcom/android/systemui/dynamicisland/GlyphIconView;->mStrokePaint:Landroid/graphics/Paint;

    invoke-virtual {v1, v2, v3, v4, v5}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 197
    mul-float v17, v17, v7

    add-float v5, v9, v17

    iget-object v6, v0, Lcom/android/systemui/dynamicisland/GlyphIconView;->mStrokePaint:Landroid/graphics/Paint;

    move v4, v2

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 198
    const v1, 0x3e2e147b    # 0.17f

    mul-float/2addr v1, v7

    add-float v4, v2, v1

    add-float v5, v3, v10

    iget-object v6, v0, Lcom/android/systemui/dynamicisland/GlyphIconView;->mStrokePaint:Landroid/graphics/Paint;

    move-object/from16 v1, p1

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 199
    const v1, 0x3df5c28f    # 0.12f

    mul-float/2addr v1, v7

    move v3, v1

    sub-float v1, v2, v3

    mul-float/2addr v7, v13

    add-float/2addr v9, v7

    add-float/2addr v3, v2

    iget-object v5, v0, Lcom/android/systemui/dynamicisland/GlyphIconView;->mStrokePaint:Landroid/graphics/Paint;

    move v4, v9

    move-object/from16 v0, p1

    move v2, v9

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 200
    goto/16 :goto_0

    .line 186
    :pswitch_1
    iget-object v2, v0, Lcom/android/systemui/dynamicisland/GlyphIconView;->mPath:Landroid/graphics/Path;

    invoke-virtual {v2}, Landroid/graphics/Path;->reset()V

    .line 187
    iget-object v2, v0, Lcom/android/systemui/dynamicisland/GlyphIconView;->mPath:Landroid/graphics/Path;

    const v3, 0x3e851eb8    # 0.26f

    mul-float/2addr v3, v7

    add-float/2addr v3, v8

    const v5, 0x3f19999a    # 0.6f

    mul-float/2addr v5, v7

    add-float/2addr v5, v9

    invoke-virtual {v2, v3, v5}, Landroid/graphics/Path;->moveTo(FF)V

    .line 188
    iget-object v2, v0, Lcom/android/systemui/dynamicisland/GlyphIconView;->mPath:Landroid/graphics/Path;

    mul-float/2addr v4, v7

    add-float/2addr v4, v8

    mul-float v18, v18, v7

    add-float v9, v9, v18

    invoke-virtual {v2, v4, v9}, Landroid/graphics/Path;->lineTo(FF)V

    .line 189
    iget-object v2, v0, Lcom/android/systemui/dynamicisland/GlyphIconView;->mPath:Landroid/graphics/Path;

    const v3, 0x3f3d70a4    # 0.74f

    mul-float/2addr v7, v3

    add-float/2addr v8, v7

    invoke-virtual {v2, v8, v5}, Landroid/graphics/Path;->lineTo(FF)V

    .line 190
    iget-object v2, v0, Lcom/android/systemui/dynamicisland/GlyphIconView;->mPath:Landroid/graphics/Path;

    iget-object v0, v0, Lcom/android/systemui/dynamicisland/GlyphIconView;->mStrokePaint:Landroid/graphics/Paint;

    invoke-virtual {v1, v2, v0}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 191
    goto/16 :goto_0

    .line 174
    :pswitch_2
    mul-float/2addr v3, v7

    .line 175
    iget-object v2, v0, Lcom/android/systemui/dynamicisland/GlyphIconView;->mRect:Landroid/graphics/RectF;

    mul-float v19, v19, v7

    add-float v5, v8, v19

    mul-float v25, v25, v7

    add-float v6, v9, v25

    mul-float v16, v16, v7

    add-float v10, v8, v16

    mul-float v24, v24, v7

    add-float v11, v9, v24

    invoke-virtual {v2, v5, v6, v10, v11}, Landroid/graphics/RectF;->set(FFFF)V

    .line 176
    iget-object v2, v0, Lcom/android/systemui/dynamicisland/GlyphIconView;->mRect:Landroid/graphics/RectF;

    iget-object v5, v0, Lcom/android/systemui/dynamicisland/GlyphIconView;->mFillPaint:Landroid/graphics/Paint;

    invoke-virtual {v1, v2, v3, v3, v5}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 177
    iget-object v2, v0, Lcom/android/systemui/dynamicisland/GlyphIconView;->mPath:Landroid/graphics/Path;

    invoke-virtual {v2}, Landroid/graphics/Path;->reset()V

    .line 178
    iget-object v2, v0, Lcom/android/systemui/dynamicisland/GlyphIconView;->mPath:Landroid/graphics/Path;

    add-float v3, v8, v25

    invoke-virtual {v2, v3, v6}, Landroid/graphics/Path;->moveTo(FF)V

    .line 179
    iget-object v2, v0, Lcom/android/systemui/dynamicisland/GlyphIconView;->mPath:Landroid/graphics/Path;

    mul-float/2addr v12, v7

    add-float/2addr v8, v12

    mul-float/2addr v7, v4

    add-float/2addr v9, v7

    invoke-virtual {v2, v8, v9}, Landroid/graphics/Path;->lineTo(FF)V

    .line 180
    iget-object v2, v0, Lcom/android/systemui/dynamicisland/GlyphIconView;->mPath:Landroid/graphics/Path;

    invoke-virtual {v2, v3, v11}, Landroid/graphics/Path;->lineTo(FF)V

    .line 181
    iget-object v2, v0, Lcom/android/systemui/dynamicisland/GlyphIconView;->mPath:Landroid/graphics/Path;

    invoke-virtual {v2}, Landroid/graphics/Path;->close()V

    .line 182
    iget-object v2, v0, Lcom/android/systemui/dynamicisland/GlyphIconView;->mPath:Landroid/graphics/Path;

    iget-object v0, v0, Lcom/android/systemui/dynamicisland/GlyphIconView;->mFillPaint:Landroid/graphics/Paint;

    invoke-virtual {v1, v2, v0}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 183
    goto/16 :goto_0

    .line 154
    :pswitch_3
    const v2, 0x3d4ccccd    # 0.05f

    mul-float/2addr v2, v7

    .line 155
    iget-object v3, v0, Lcom/android/systemui/dynamicisland/GlyphIconView;->mRect:Landroid/graphics/RectF;

    const v4, 0x3e8a3d71    # 0.27f

    mul-float/2addr v4, v7

    add-float/2addr v4, v8

    mul-float/2addr v6, v7

    add-float/2addr v6, v9

    const v10, 0x3edc28f6    # 0.43f

    mul-float/2addr v10, v7

    add-float/2addr v10, v8

    mul-float/2addr v5, v7

    add-float/2addr v9, v5

    invoke-virtual {v3, v4, v6, v10, v9}, Landroid/graphics/RectF;->set(FFFF)V

    .line 156
    iget-object v3, v0, Lcom/android/systemui/dynamicisland/GlyphIconView;->mRect:Landroid/graphics/RectF;

    iget-object v4, v0, Lcom/android/systemui/dynamicisland/GlyphIconView;->mFillPaint:Landroid/graphics/Paint;

    invoke-virtual {v1, v3, v2, v2, v4}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 157
    iget-object v3, v0, Lcom/android/systemui/dynamicisland/GlyphIconView;->mRect:Landroid/graphics/RectF;

    const v4, 0x3f11eb85    # 0.57f

    mul-float/2addr v4, v7

    add-float/2addr v4, v8

    const v5, 0x3f3ae148    # 0.73f

    mul-float/2addr v7, v5

    add-float/2addr v8, v7

    invoke-virtual {v3, v4, v6, v8, v9}, Landroid/graphics/RectF;->set(FFFF)V

    .line 158
    iget-object v3, v0, Lcom/android/systemui/dynamicisland/GlyphIconView;->mRect:Landroid/graphics/RectF;

    iget-object v0, v0, Lcom/android/systemui/dynamicisland/GlyphIconView;->mFillPaint:Landroid/graphics/Paint;

    invoke-virtual {v1, v3, v2, v2, v0}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 159
    goto/16 :goto_0

    .line 145
    :pswitch_4
    iget-object v2, v0, Lcom/android/systemui/dynamicisland/GlyphIconView;->mPath:Landroid/graphics/Path;

    invoke-virtual {v2}, Landroid/graphics/Path;->reset()V

    .line 146
    iget-object v2, v0, Lcom/android/systemui/dynamicisland/GlyphIconView;->mPath:Landroid/graphics/Path;

    mul-float v23, v23, v7

    add-float v3, v8, v23

    mul-float v22, v22, v7

    add-float v5, v9, v22

    invoke-virtual {v2, v3, v5}, Landroid/graphics/Path;->moveTo(FF)V

    .line 147
    iget-object v2, v0, Lcom/android/systemui/dynamicisland/GlyphIconView;->mPath:Landroid/graphics/Path;

    mul-float v16, v16, v7

    add-float v8, v8, v16

    mul-float/2addr v7, v4

    add-float/2addr v7, v9

    invoke-virtual {v2, v8, v7}, Landroid/graphics/Path;->lineTo(FF)V

    .line 148
    iget-object v2, v0, Lcom/android/systemui/dynamicisland/GlyphIconView;->mPath:Landroid/graphics/Path;

    add-float v9, v9, v16

    invoke-virtual {v2, v3, v9}, Landroid/graphics/Path;->lineTo(FF)V

    .line 149
    iget-object v2, v0, Lcom/android/systemui/dynamicisland/GlyphIconView;->mPath:Landroid/graphics/Path;

    invoke-virtual {v2}, Landroid/graphics/Path;->close()V

    .line 150
    iget-object v2, v0, Lcom/android/systemui/dynamicisland/GlyphIconView;->mPath:Landroid/graphics/Path;

    iget-object v0, v0, Lcom/android/systemui/dynamicisland/GlyphIconView;->mFillPaint:Landroid/graphics/Paint;

    invoke-virtual {v1, v2, v0}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 151
    goto/16 :goto_0

    .line 162
    :pswitch_5
    mul-float/2addr v3, v7

    .line 163
    iget-object v2, v0, Lcom/android/systemui/dynamicisland/GlyphIconView;->mRect:Landroid/graphics/RectF;

    mul-float v22, v22, v7

    add-float v5, v8, v22

    mul-float v25, v25, v7

    add-float v6, v9, v25

    mul-float v23, v23, v7

    add-float v10, v8, v23

    mul-float v24, v24, v7

    add-float v11, v9, v24

    invoke-virtual {v2, v5, v6, v10, v11}, Landroid/graphics/RectF;->set(FFFF)V

    .line 164
    iget-object v2, v0, Lcom/android/systemui/dynamicisland/GlyphIconView;->mRect:Landroid/graphics/RectF;

    iget-object v5, v0, Lcom/android/systemui/dynamicisland/GlyphIconView;->mFillPaint:Landroid/graphics/Paint;

    invoke-virtual {v1, v2, v3, v3, v5}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 165
    iget-object v2, v0, Lcom/android/systemui/dynamicisland/GlyphIconView;->mPath:Landroid/graphics/Path;

    invoke-virtual {v2}, Landroid/graphics/Path;->reset()V

    .line 166
    iget-object v2, v0, Lcom/android/systemui/dynamicisland/GlyphIconView;->mPath:Landroid/graphics/Path;

    add-float v3, v8, v24

    invoke-virtual {v2, v3, v6}, Landroid/graphics/Path;->moveTo(FF)V

    .line 167
    iget-object v2, v0, Lcom/android/systemui/dynamicisland/GlyphIconView;->mPath:Landroid/graphics/Path;

    mul-float v17, v17, v7

    add-float v8, v8, v17

    mul-float/2addr v7, v4

    add-float/2addr v9, v7

    invoke-virtual {v2, v8, v9}, Landroid/graphics/Path;->lineTo(FF)V

    .line 168
    iget-object v2, v0, Lcom/android/systemui/dynamicisland/GlyphIconView;->mPath:Landroid/graphics/Path;

    invoke-virtual {v2, v3, v11}, Landroid/graphics/Path;->lineTo(FF)V

    .line 169
    iget-object v2, v0, Lcom/android/systemui/dynamicisland/GlyphIconView;->mPath:Landroid/graphics/Path;

    invoke-virtual {v2}, Landroid/graphics/Path;->close()V

    .line 170
    iget-object v2, v0, Lcom/android/systemui/dynamicisland/GlyphIconView;->mPath:Landroid/graphics/Path;

    iget-object v0, v0, Lcom/android/systemui/dynamicisland/GlyphIconView;->mFillPaint:Landroid/graphics/Paint;

    invoke-virtual {v1, v2, v0}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 171
    goto/16 :goto_0

    .line 135
    :pswitch_6
    iget-object v2, v0, Lcom/android/systemui/dynamicisland/GlyphIconView;->mPath:Landroid/graphics/Path;

    invoke-virtual {v2}, Landroid/graphics/Path;->reset()V

    .line 136
    iget-object v2, v0, Lcom/android/systemui/dynamicisland/GlyphIconView;->mPath:Landroid/graphics/Path;

    const v3, 0x3e8f5c29    # 0.28f

    mul-float/2addr v3, v7

    add-float/2addr v3, v8

    mul-float/2addr v6, v7

    add-float/2addr v6, v9

    invoke-virtual {v2, v3, v6}, Landroid/graphics/Path;->moveTo(FF)V

    .line 137
    iget-object v2, v0, Lcom/android/systemui/dynamicisland/GlyphIconView;->mPath:Landroid/graphics/Path;

    mul-float v22, v22, v7

    add-float v3, v8, v22

    const v4, 0x3ee66666    # 0.45f

    mul-float/2addr v4, v7

    add-float/2addr v4, v9

    mul-float v20, v20, v7

    add-float v6, v8, v20

    const v10, 0x3f23d70a    # 0.64f

    mul-float/2addr v10, v7

    add-float/2addr v10, v9

    invoke-virtual {v2, v3, v4, v6, v10}, Landroid/graphics/Path;->quadTo(FFFF)V

    .line 138
    iget-object v2, v0, Lcom/android/systemui/dynamicisland/GlyphIconView;->mPath:Landroid/graphics/Path;

    mul-float/2addr v15, v7

    add-float/2addr v15, v8

    mul-float/2addr v11, v7

    add-float/2addr v11, v9

    mul-float/2addr v5, v7

    add-float/2addr v5, v8

    const v3, 0x3f3851ec    # 0.72f

    mul-float/2addr v3, v7

    add-float/2addr v3, v9

    invoke-virtual {v2, v15, v11, v5, v3}, Landroid/graphics/Path;->quadTo(FFFF)V

    .line 139
    iget-object v2, v0, Lcom/android/systemui/dynamicisland/GlyphIconView;->mPath:Landroid/graphics/Path;

    iget-object v3, v0, Lcom/android/systemui/dynamicisland/GlyphIconView;->mStrokePaint:Landroid/graphics/Paint;

    invoke-virtual {v1, v2, v3}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 140
    mul-float v23, v23, v7

    add-float v2, v8, v23

    mul-float v25, v25, v7

    add-float v3, v9, v25

    const v4, 0x3db851ec    # 0.09f

    mul-float/2addr v4, v7

    iget-object v5, v0, Lcom/android/systemui/dynamicisland/GlyphIconView;->mFillPaint:Landroid/graphics/Paint;

    invoke-virtual {v1, v2, v3, v4, v5}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 141
    mul-float v24, v24, v7

    add-float v8, v8, v24

    mul-float v7, v7, v19

    add-float/2addr v9, v7

    iget-object v0, v0, Lcom/android/systemui/dynamicisland/GlyphIconView;->mFillPaint:Landroid/graphics/Paint;

    invoke-virtual {v1, v8, v9, v4, v0}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 142
    goto/16 :goto_0

    .line 128
    :pswitch_7
    mul-float/2addr v4, v7

    add-float/2addr v8, v4

    .line 129
    add-float/2addr v9, v4

    .line 130
    mul-float v2, v7, v18

    iget-object v3, v0, Lcom/android/systemui/dynamicisland/GlyphIconView;->mStrokePaint:Landroid/graphics/Paint;

    invoke-virtual {v1, v8, v9, v2, v3}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 131
    const v2, 0x3e428f5c    # 0.19f

    mul-float/2addr v7, v2

    iget-object v0, v0, Lcom/android/systemui/dynamicisland/GlyphIconView;->mFillPaint:Landroid/graphics/Paint;

    invoke-virtual {v1, v8, v9, v7, v0}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 132
    goto/16 :goto_0

    .line 118
    :pswitch_8
    mul-float/2addr v4, v7

    add-float/2addr v8, v4

    .line 119
    mul-float v21, v21, v7

    add-float v9, v9, v21

    .line 120
    iget-object v2, v0, Lcom/android/systemui/dynamicisland/GlyphIconView;->mFillPaint:Landroid/graphics/Paint;

    invoke-virtual {v1, v8, v9, v10, v2}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 121
    iget-object v2, v0, Lcom/android/systemui/dynamicisland/GlyphIconView;->mRect:Landroid/graphics/RectF;

    const/high16 v3, 0x3e800000    # 0.25f

    mul-float/2addr v3, v7

    sub-float v4, v8, v3

    sub-float v5, v9, v3

    add-float v6, v8, v3

    add-float/2addr v3, v9

    invoke-virtual {v2, v4, v5, v6, v3}, Landroid/graphics/RectF;->set(FFFF)V

    .line 122
    iget-object v2, v0, Lcom/android/systemui/dynamicisland/GlyphIconView;->mRect:Landroid/graphics/RectF;

    const/4 v5, 0x0

    iget-object v6, v0, Lcom/android/systemui/dynamicisland/GlyphIconView;->mStrokePaint:Landroid/graphics/Paint;

    const/high16 v3, -0x3ca40000    # -220.0f

    const/high16 v4, 0x43820000    # 260.0f

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    .line 123
    iget-object v1, v0, Lcom/android/systemui/dynamicisland/GlyphIconView;->mRect:Landroid/graphics/RectF;

    mul-float v7, v7, v20

    sub-float v2, v8, v7

    sub-float v3, v9, v7

    add-float/2addr v8, v7

    add-float/2addr v9, v7

    invoke-virtual {v1, v2, v3, v8, v9}, Landroid/graphics/RectF;->set(FFFF)V

    .line 124
    iget-object v1, v0, Lcom/android/systemui/dynamicisland/GlyphIconView;->mRect:Landroid/graphics/RectF;

    const/4 v4, 0x0

    iget-object v5, v0, Lcom/android/systemui/dynamicisland/GlyphIconView;->mStrokePaint:Landroid/graphics/Paint;

    const/high16 v2, -0x3cae0000    # -210.0f

    const/high16 v3, 0x43700000    # 240.0f

    move-object/from16 v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    .line 125
    goto/16 :goto_0

    .line 113
    :pswitch_9
    mul-float/2addr v4, v7

    add-float v2, v8, v4

    add-float/2addr v4, v9

    mul-float v3, v7, v23

    iget-object v5, v0, Lcom/android/systemui/dynamicisland/GlyphIconView;->mStrokePaint:Landroid/graphics/Paint;

    invoke-virtual {v1, v2, v4, v3, v5}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 114
    mul-float v25, v25, v7

    add-float v1, v8, v25

    add-float v2, v9, v25

    mul-float v7, v7, v24

    add-float v3, v8, v7

    add-float v4, v9, v7

    iget-object v5, v0, Lcom/android/systemui/dynamicisland/GlyphIconView;->mStrokePaint:Landroid/graphics/Paint;

    move-object/from16 v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 115
    goto/16 :goto_0

    .line 106
    :pswitch_a
    iget-object v2, v0, Lcom/android/systemui/dynamicisland/GlyphIconView;->mRect:Landroid/graphics/RectF;

    mul-float v17, v17, v7

    add-float v3, v8, v17

    mul-float v22, v22, v7

    add-float v4, v9, v22

    mul-float/2addr v12, v7

    add-float v5, v8, v12

    mul-float v16, v16, v7

    add-float v6, v9, v16

    invoke-virtual {v2, v3, v4, v5, v6}, Landroid/graphics/RectF;->set(FFFF)V

    .line 107
    iget-object v2, v0, Lcom/android/systemui/dynamicisland/GlyphIconView;->mRect:Landroid/graphics/RectF;

    const v3, 0x3da3d70a    # 0.08f

    mul-float/2addr v3, v7

    iget-object v4, v0, Lcom/android/systemui/dynamicisland/GlyphIconView;->mStrokePaint:Landroid/graphics/Paint;

    invoke-virtual {v1, v2, v3, v3, v4}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 108
    mul-float/2addr v14, v7

    add-float v2, v8, v14

    add-float v3, v9, v17

    add-float v4, v9, v12

    iget-object v6, v0, Lcom/android/systemui/dynamicisland/GlyphIconView;->mStrokePaint:Landroid/graphics/Paint;

    move v5, v4

    move v4, v2

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 109
    move v2, v3

    mul-float/2addr v7, v11

    add-float v1, v8, v7

    move v4, v5

    iget-object v5, v0, Lcom/android/systemui/dynamicisland/GlyphIconView;->mStrokePaint:Landroid/graphics/Paint;

    move v3, v1

    move-object/from16 v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 110
    goto/16 :goto_0

    .line 97
    :pswitch_b
    mul-float/2addr v4, v7

    add-float/2addr v8, v4

    .line 98
    add-float/2addr v9, v4

    .line 99
    const v2, 0x3e23d70a    # 0.16f

    mul-float/2addr v2, v7

    iget-object v3, v0, Lcom/android/systemui/dynamicisland/GlyphIconView;->mFillPaint:Landroid/graphics/Paint;

    invoke-virtual {v1, v8, v9, v2, v3}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 100
    iget-object v2, v0, Lcom/android/systemui/dynamicisland/GlyphIconView;->mRect:Landroid/graphics/RectF;

    mul-float v7, v7, v18

    sub-float v3, v8, v7

    sub-float v4, v9, v7

    add-float/2addr v8, v7

    add-float/2addr v9, v7

    invoke-virtual {v2, v3, v4, v8, v9}, Landroid/graphics/RectF;->set(FFFF)V

    .line 101
    iget-object v2, v0, Lcom/android/systemui/dynamicisland/GlyphIconView;->mRect:Landroid/graphics/RectF;

    const/4 v5, 0x0

    iget-object v6, v0, Lcom/android/systemui/dynamicisland/GlyphIconView;->mStrokePaint:Landroid/graphics/Paint;

    const/high16 v3, -0x3de00000    # -40.0f

    const/high16 v4, 0x42a00000    # 80.0f

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    .line 102
    iget-object v1, v0, Lcom/android/systemui/dynamicisland/GlyphIconView;->mRect:Landroid/graphics/RectF;

    const/4 v4, 0x0

    iget-object v5, v0, Lcom/android/systemui/dynamicisland/GlyphIconView;->mStrokePaint:Landroid/graphics/Paint;

    const/high16 v2, 0x430c0000    # 140.0f

    const/high16 v3, 0x42a00000    # 80.0f

    move-object/from16 v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    .line 103
    goto/16 :goto_0

    .line 85
    :pswitch_c
    iget-object v2, v0, Lcom/android/systemui/dynamicisland/GlyphIconView;->mPath:Landroid/graphics/Path;

    invoke-virtual {v2}, Landroid/graphics/Path;->reset()V

    .line 86
    mul-float/2addr v4, v7

    add-float/2addr v8, v4

    .line 87
    iget-object v2, v0, Lcom/android/systemui/dynamicisland/GlyphIconView;->mPath:Landroid/graphics/Path;

    mul-float/2addr v14, v7

    sub-float v3, v8, v14

    mul-float v23, v23, v7

    add-float v4, v9, v23

    invoke-virtual {v2, v3, v4}, Landroid/graphics/Path;->moveTo(FF)V

    .line 88
    iget-object v2, v0, Lcom/android/systemui/dynamicisland/GlyphIconView;->mPath:Landroid/graphics/Path;

    mul-float v22, v22, v7

    add-float v4, v8, v22

    const v5, 0x3f2e147b    # 0.68f

    mul-float/2addr v5, v7

    add-float/2addr v5, v9

    invoke-virtual {v2, v4, v5}, Landroid/graphics/Path;->lineTo(FF)V

    .line 89
    iget-object v2, v0, Lcom/android/systemui/dynamicisland/GlyphIconView;->mPath:Landroid/graphics/Path;

    const v5, 0x3f5c28f6    # 0.86f

    mul-float/2addr v5, v7

    add-float/2addr v5, v9

    invoke-virtual {v2, v8, v5}, Landroid/graphics/Path;->lineTo(FF)V

    .line 90
    iget-object v2, v0, Lcom/android/systemui/dynamicisland/GlyphIconView;->mPath:Landroid/graphics/Path;

    mul-float/2addr v13, v7

    add-float/2addr v13, v9

    invoke-virtual {v2, v8, v13}, Landroid/graphics/Path;->lineTo(FF)V

    .line 91
    iget-object v2, v0, Lcom/android/systemui/dynamicisland/GlyphIconView;->mPath:Landroid/graphics/Path;

    const v5, 0x3ea3d70a    # 0.32f

    mul-float/2addr v5, v7

    add-float/2addr v5, v9

    invoke-virtual {v2, v4, v5}, Landroid/graphics/Path;->lineTo(FF)V

    .line 92
    iget-object v2, v0, Lcom/android/systemui/dynamicisland/GlyphIconView;->mPath:Landroid/graphics/Path;

    mul-float v7, v7, v19

    add-float/2addr v9, v7

    invoke-virtual {v2, v3, v9}, Landroid/graphics/Path;->lineTo(FF)V

    .line 93
    iget-object v2, v0, Lcom/android/systemui/dynamicisland/GlyphIconView;->mPath:Landroid/graphics/Path;

    iget-object v0, v0, Lcom/android/systemui/dynamicisland/GlyphIconView;->mStrokePaint:Landroid/graphics/Paint;

    invoke-virtual {v1, v2, v0}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 94
    goto :goto_0

    .line 73
    :pswitch_d
    iget-object v2, v0, Lcom/android/systemui/dynamicisland/GlyphIconView;->mPath:Landroid/graphics/Path;

    invoke-virtual {v2}, Landroid/graphics/Path;->reset()V

    .line 74
    iget-object v2, v0, Lcom/android/systemui/dynamicisland/GlyphIconView;->mPath:Landroid/graphics/Path;

    mul-float/2addr v15, v7

    add-float/2addr v15, v8

    const v3, 0x3dcccccd    # 0.1f

    mul-float/2addr v3, v7

    add-float/2addr v3, v9

    invoke-virtual {v2, v15, v3}, Landroid/graphics/Path;->moveTo(FF)V

    .line 75
    iget-object v2, v0, Lcom/android/systemui/dynamicisland/GlyphIconView;->mPath:Landroid/graphics/Path;

    mul-float v25, v25, v7

    add-float v3, v8, v25

    mul-float v21, v21, v7

    add-float v4, v9, v21

    invoke-virtual {v2, v3, v4}, Landroid/graphics/Path;->lineTo(FF)V

    .line 76
    iget-object v2, v0, Lcom/android/systemui/dynamicisland/GlyphIconView;->mPath:Landroid/graphics/Path;

    const v3, 0x3ef5c28f    # 0.48f

    mul-float/2addr v3, v7

    add-float/2addr v3, v8

    invoke-virtual {v2, v3, v4}, Landroid/graphics/Path;->lineTo(FF)V

    .line 77
    iget-object v2, v0, Lcom/android/systemui/dynamicisland/GlyphIconView;->mPath:Landroid/graphics/Path;

    mul-float v20, v20, v7

    add-float v3, v8, v20

    const v4, 0x3f666666    # 0.9f

    mul-float/2addr v4, v7

    add-float/2addr v4, v9

    invoke-virtual {v2, v3, v4}, Landroid/graphics/Path;->lineTo(FF)V

    .line 78
    iget-object v2, v0, Lcom/android/systemui/dynamicisland/GlyphIconView;->mPath:Landroid/graphics/Path;

    mul-float v24, v24, v7

    add-float v3, v8, v24

    const v4, 0x3ee147ae    # 0.44f

    mul-float/2addr v4, v7

    add-float/2addr v9, v4

    invoke-virtual {v2, v3, v9}, Landroid/graphics/Path;->lineTo(FF)V

    .line 79
    iget-object v2, v0, Lcom/android/systemui/dynamicisland/GlyphIconView;->mPath:Landroid/graphics/Path;

    const v3, 0x3f051eb8    # 0.52f

    mul-float/2addr v7, v3

    add-float/2addr v8, v7

    invoke-virtual {v2, v8, v9}, Landroid/graphics/Path;->lineTo(FF)V

    .line 80
    iget-object v2, v0, Lcom/android/systemui/dynamicisland/GlyphIconView;->mPath:Landroid/graphics/Path;

    invoke-virtual {v2}, Landroid/graphics/Path;->close()V

    .line 81
    iget-object v2, v0, Lcom/android/systemui/dynamicisland/GlyphIconView;->mPath:Landroid/graphics/Path;

    iget-object v0, v0, Lcom/android/systemui/dynamicisland/GlyphIconView;->mFillPaint:Landroid/graphics/Paint;

    invoke-virtual {v1, v2, v0}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 82
    nop

    .line 203
    :goto_0
    return-void

    .line 64
    :cond_1
    :goto_1
    return-void

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public setGlyph(II)V
    .locals 1

    .line 49
    iget v0, p0, Lcom/android/systemui/dynamicisland/GlyphIconView;->mKind:I

    if-ne v0, p1, :cond_0

    iget v0, p0, Lcom/android/systemui/dynamicisland/GlyphIconView;->mColor:I

    if-eq v0, p2, :cond_1

    .line 50
    :cond_0
    iput p1, p0, Lcom/android/systemui/dynamicisland/GlyphIconView;->mKind:I

    .line 51
    iput p2, p0, Lcom/android/systemui/dynamicisland/GlyphIconView;->mColor:I

    .line 52
    iget-object p1, p0, Lcom/android/systemui/dynamicisland/GlyphIconView;->mFillPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setColor(I)V

    .line 53
    iget-object p1, p0, Lcom/android/systemui/dynamicisland/GlyphIconView;->mStrokePaint:Landroid/graphics/Paint;

    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setColor(I)V

    .line 54
    invoke-virtual {p0}, Lcom/android/systemui/dynamicisland/GlyphIconView;->invalidate()V

    .line 56
    :cond_1
    return-void
.end method
