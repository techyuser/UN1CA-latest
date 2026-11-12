.class Lcom/android/systemui/dynamicisland/IslandOverlayView$3;
.super Landroid/widget/FrameLayout;
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
.method constructor <init>(Lcom/android/systemui/dynamicisland/IslandOverlayView;Landroid/content/Context;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x0
        }
        names = {
            null,
            null
        }
    .end annotation

    .line 233
    iput-object p1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$3;->this$0:Lcom/android/systemui/dynamicisland/IslandOverlayView;

    invoke-direct {p0, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method protected onLayout(ZIIII)V
    .locals 0

    .line 236
    invoke-super/range {p0 .. p5}, Landroid/widget/FrameLayout;->onLayout(ZIIII)V

    .line 237
    move-object p1, p0

    iget-object p1, p1, Lcom/android/systemui/dynamicisland/IslandOverlayView$3;->this$0:Lcom/android/systemui/dynamicisland/IslandOverlayView;

    invoke-static {p1}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->-$$Nest$mlayoutVisualLayersLocked(Lcom/android/systemui/dynamicisland/IslandOverlayView;)V

    .line 238
    return-void
.end method
