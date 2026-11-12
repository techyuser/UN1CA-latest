.class Lcom/android/systemui/dynamicisland/IslandOverlayView$7;
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

    .line 368
    iput-object p1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$7;->this$0:Lcom/android/systemui/dynamicisland/IslandOverlayView;

    invoke-direct {p0}, Landroid/view/ViewOutlineProvider;-><init>()V

    return-void
.end method


# virtual methods
.method public getOutline(Landroid/view/View;Landroid/graphics/Outline;)V
    .locals 8

    .line 371
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result v0

    const/4 v1, 0x1

    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    move-result v5

    .line 372
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result p1

    invoke-static {v1, p1}, Ljava/lang/Math;->max(II)I

    move-result v6

    .line 373
    iget-object p1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$7;->this$0:Lcom/android/systemui/dynamicisland/IslandOverlayView;

    const/high16 v0, 0x41500000    # 13.0f

    invoke-static {p1, v0}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->-$$Nest$mdp(Lcom/android/systemui/dynamicisland/IslandOverlayView;F)I

    move-result p1

    int-to-float v7, p1

    const/4 v3, 0x0

    const/4 v4, 0x0

    move-object v2, p2

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Outline;->setRoundRect(IIIIF)V

    .line 374
    return-void
.end method
