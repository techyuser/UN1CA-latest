.class Lcom/android/systemui/dynamicisland/IslandOverlayView$2;
.super Ljava/lang/Object;
.source "IslandOverlayView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/systemui/dynamicisland/IslandOverlayView;
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

    .line 202
    iput-object p1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$2;->this$0:Lcom/android/systemui/dynamicisland/IslandOverlayView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 205
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$2;->this$0:Lcom/android/systemui/dynamicisland/IslandOverlayView;

    invoke-static {v0}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->-$$Nest$fgetmHasActiveContent(Lcom/android/systemui/dynamicisland/IslandOverlayView;)Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$2;->this$0:Lcom/android/systemui/dynamicisland/IslandOverlayView;

    invoke-static {v0}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->-$$Nest$fgetmSuspendedForSleep(Lcom/android/systemui/dynamicisland/IslandOverlayView;)Z

    move-result v0

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$2;->this$0:Lcom/android/systemui/dynamicisland/IslandOverlayView;

    invoke-static {v0}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->-$$Nest$fgetmCurrentItem(Lcom/android/systemui/dynamicisland/IslandOverlayView;)Lcom/android/systemui/dynamicisland/IslandItem;

    move-result-object v0

    if-nez v0, :cond_0

    goto :goto_1

    .line 208
    :cond_0
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$2;->this$0:Lcom/android/systemui/dynamicisland/IslandOverlayView;

    invoke-static {v0}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->-$$Nest$mupdateLiveTickValues(Lcom/android/systemui/dynamicisland/IslandOverlayView;)V

    .line 209
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$2;->this$0:Lcom/android/systemui/dynamicisland/IslandOverlayView;

    invoke-static {v0}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->-$$Nest$fgetmExpanded(Lcom/android/systemui/dynamicisland/IslandOverlayView;)Z

    move-result v0

    if-eqz v0, :cond_1

    const-wide/16 v0, 0x1f4

    goto :goto_0

    :cond_1
    const-wide/16 v0, 0x3e8

    .line 210
    :goto_0
    iget-object v2, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$2;->this$0:Lcom/android/systemui/dynamicisland/IslandOverlayView;

    invoke-static {v2}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->-$$Nest$fgetmHandler(Lcom/android/systemui/dynamicisland/IslandOverlayView;)Landroid/os/Handler;

    move-result-object v2

    invoke-virtual {v2, p0, v0, v1}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 211
    return-void

    .line 206
    :cond_2
    :goto_1
    return-void
.end method
