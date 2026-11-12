.class Lcom/android/systemui/dynamicisland/IslandOverlayView$4;
.super Landroid/view/ViewOutlineProvider;
.source "IslandOverlayView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/systemui/dynamicisland/IslandOverlayView;-><init>(Landroid/content/Context;Lcom/android/systemui/dynamicisland/IslandOverlayView$Callbacks;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/systemui/dynamicisland/IslandOverlayView;


# direct methods
.method constructor <init>(Lcom/android/systemui/dynamicisland/IslandOverlayView;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 243
    iput-object p1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$4;->this$0:Lcom/android/systemui/dynamicisland/IslandOverlayView;

    invoke-direct {p0}, Landroid/view/ViewOutlineProvider;-><init>()V

    return-void
.end method


# virtual methods
.method public getOutline(Landroid/view/View;Landroid/graphics/Outline;)V
    .locals 11

    .line 246
    iget-object v1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$4;->this$0:Lcom/android/systemui/dynamicisland/IslandOverlayView;

    invoke-static {v1}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->-$$Nest$fgetmCurrRect(Lcom/android/systemui/dynamicisland/IslandOverlayView;)Landroid/graphics/RectF;

    move-result-object v1

    invoke-virtual {v1}, Landroid/graphics/RectF;->width()F

    move-result v1

    const/4 v2, 0x0

    cmpl-float v1, v1, v2

    const/high16 v3, 0x3f000000    # 0.5f

    const/4 v4, 0x1

    if-lez v1, :cond_0

    iget-object v1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$4;->this$0:Lcom/android/systemui/dynamicisland/IslandOverlayView;

    invoke-static {v1}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->-$$Nest$fgetmCurrRect(Lcom/android/systemui/dynamicisland/IslandOverlayView;)Landroid/graphics/RectF;

    move-result-object v1

    invoke-virtual {v1}, Landroid/graphics/RectF;->height()F

    move-result v1

    cmpl-float v1, v1, v2

    if-lez v1, :cond_0

    .line 247
    iget-object v1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$4;->this$0:Lcom/android/systemui/dynamicisland/IslandOverlayView;

    invoke-static {v1}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->-$$Nest$fgetmCurrRect(Lcom/android/systemui/dynamicisland/IslandOverlayView;)Landroid/graphics/RectF;

    move-result-object v1

    iget v1, v1, Landroid/graphics/RectF;->left:F

    iget-object v2, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$4;->this$0:Lcom/android/systemui/dynamicisland/IslandOverlayView;

    invoke-static {v2}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->-$$Nest$fgetmBoxLeft(Lcom/android/systemui/dynamicisland/IslandOverlayView;)I

    move-result v2

    int-to-float v2, v2

    sub-float/2addr v1, v2

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v6

    .line 248
    iget-object v1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$4;->this$0:Lcom/android/systemui/dynamicisland/IslandOverlayView;

    invoke-static {v1}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->-$$Nest$fgetmCurrRect(Lcom/android/systemui/dynamicisland/IslandOverlayView;)Landroid/graphics/RectF;

    move-result-object v1

    iget v1, v1, Landroid/graphics/RectF;->top:F

    iget-object v2, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$4;->this$0:Lcom/android/systemui/dynamicisland/IslandOverlayView;

    invoke-static {v2}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->-$$Nest$fgetmBoxTop(Lcom/android/systemui/dynamicisland/IslandOverlayView;)I

    move-result v2

    int-to-float v2, v2

    sub-float/2addr v1, v2

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v7

    .line 249
    iget-object v1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$4;->this$0:Lcom/android/systemui/dynamicisland/IslandOverlayView;

    invoke-static {v1}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->-$$Nest$fgetmCurrRect(Lcom/android/systemui/dynamicisland/IslandOverlayView;)Landroid/graphics/RectF;

    move-result-object v1

    invoke-virtual {v1}, Landroid/graphics/RectF;->width()F

    move-result v1

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v1

    invoke-static {v4, v1}, Ljava/lang/Math;->max(II)I

    move-result v1

    .line 250
    iget-object v2, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$4;->this$0:Lcom/android/systemui/dynamicisland/IslandOverlayView;

    invoke-static {v2}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->-$$Nest$fgetmCurrRect(Lcom/android/systemui/dynamicisland/IslandOverlayView;)Landroid/graphics/RectF;

    move-result-object v2

    invoke-virtual {v2}, Landroid/graphics/RectF;->height()F

    move-result v2

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v2

    invoke-static {v4, v2}, Ljava/lang/Math;->max(II)I

    move-result v2

    .line 251
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$4;->this$0:Lcom/android/systemui/dynamicisland/IslandOverlayView;

    invoke-static {v0}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->-$$Nest$fgetmCurrCornerPx(Lcom/android/systemui/dynamicisland/IslandOverlayView;)F

    move-result v0

    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v4

    int-to-float v4, v4

    mul-float/2addr v4, v3

    invoke-static {v0, v4}, Ljava/lang/Math;->min(FF)F

    move-result v10

    .line 252
    add-int v8, v6, v1

    add-int v9, v7, v2

    move-object v5, p2

    invoke-virtual/range {v5 .. v10}, Landroid/graphics/Outline;->setRoundRect(IIIIF)V

    .line 253
    goto :goto_0

    .line 254
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result v1

    invoke-static {v4, v1}, Ljava/lang/Math;->max(II)I

    move-result v1

    .line 255
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result v2

    invoke-static {v4, v2}, Ljava/lang/Math;->max(II)I

    move-result v4

    .line 256
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$4;->this$0:Lcom/android/systemui/dynamicisland/IslandOverlayView;

    invoke-static {v0}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->-$$Nest$fgetmCurrCornerPx(Lcom/android/systemui/dynamicisland/IslandOverlayView;)F

    move-result v0

    invoke-static {v1, v4}, Ljava/lang/Math;->min(II)I

    move-result v2

    int-to-float v2, v2

    mul-float/2addr v2, v3

    invoke-static {v0, v2}, Ljava/lang/Math;->min(FF)F

    move-result v5

    .line 257
    move v3, v1

    const/4 v1, 0x0

    const/4 v2, 0x0

    move-object v0, p2

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Outline;->setRoundRect(IIIIF)V

    .line 259
    :goto_0
    return-void
.end method
