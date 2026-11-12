.class Lcom/android/systemui/dynamicisland/DynamicIslandController$3;
.super Landroid/content/BroadcastReceiver;
.source "DynamicIslandController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/systemui/dynamicisland/DynamicIslandController;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/systemui/dynamicisland/DynamicIslandController;


# direct methods
.method constructor <init>(Lcom/android/systemui/dynamicisland/DynamicIslandController;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 117
    iput-object p1, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController$3;->this$0:Lcom/android/systemui/dynamicisland/DynamicIslandController;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 1

    .line 120
    if-eqz p2, :cond_0

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    .line 121
    :goto_0
    const-string p2, "android.intent.action.SCREEN_OFF"

    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    const/4 v0, 0x1

    if-eqz p2, :cond_2

    .line 122
    iget-object p1, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController$3;->this$0:Lcom/android/systemui/dynamicisland/DynamicIslandController;

    const/4 p2, 0x0

    invoke-static {p1, p2}, Lcom/android/systemui/dynamicisland/DynamicIslandController;->-$$Nest$fputmInteractive(Lcom/android/systemui/dynamicisland/DynamicIslandController;Z)V

    .line 123
    iget-object p1, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController$3;->this$0:Lcom/android/systemui/dynamicisland/DynamicIslandController;

    invoke-static {p1}, Lcom/android/systemui/dynamicisland/DynamicIslandController;->-$$Nest$fgetmOverlayView(Lcom/android/systemui/dynamicisland/DynamicIslandController;)Lcom/android/systemui/dynamicisland/IslandOverlayView;

    move-result-object p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController$3;->this$0:Lcom/android/systemui/dynamicisland/DynamicIslandController;

    invoke-static {p1}, Lcom/android/systemui/dynamicisland/DynamicIslandController;->-$$Nest$fgetmOverlayView(Lcom/android/systemui/dynamicisland/DynamicIslandController;)Lcom/android/systemui/dynamicisland/IslandOverlayView;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->isExpanded()Z

    move-result p1

    if-eqz p1, :cond_1

    .line 124
    iget-object p1, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController$3;->this$0:Lcom/android/systemui/dynamicisland/DynamicIslandController;

    invoke-static {p1}, Lcom/android/systemui/dynamicisland/DynamicIslandController;->-$$Nest$fgetmOverlayView(Lcom/android/systemui/dynamicisland/DynamicIslandController;)Lcom/android/systemui/dynamicisland/IslandOverlayView;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->collapse()V

    .line 126
    :cond_1
    iget-object p1, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController$3;->this$0:Lcom/android/systemui/dynamicisland/DynamicIslandController;

    invoke-static {p1, v0}, Lcom/android/systemui/dynamicisland/DynamicIslandController;->-$$Nest$mrender(Lcom/android/systemui/dynamicisland/DynamicIslandController;Z)V

    goto :goto_1

    .line 127
    :cond_2
    const-string p2, "android.intent.action.SCREEN_ON"

    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    .line 128
    iget-object p1, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController$3;->this$0:Lcom/android/systemui/dynamicisland/DynamicIslandController;

    invoke-static {p1, v0}, Lcom/android/systemui/dynamicisland/DynamicIslandController;->-$$Nest$fputmInteractive(Lcom/android/systemui/dynamicisland/DynamicIslandController;Z)V

    .line 129
    iget-object p1, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController$3;->this$0:Lcom/android/systemui/dynamicisland/DynamicIslandController;

    invoke-static {p1, v0}, Lcom/android/systemui/dynamicisland/DynamicIslandController;->-$$Nest$fputmDisplayOn(Lcom/android/systemui/dynamicisland/DynamicIslandController;Z)V

    .line 130
    iget-object p1, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController$3;->this$0:Lcom/android/systemui/dynamicisland/DynamicIslandController;

    invoke-static {p1, v0}, Lcom/android/systemui/dynamicisland/DynamicIslandController;->-$$Nest$mrender(Lcom/android/systemui/dynamicisland/DynamicIslandController;Z)V

    .line 133
    :cond_3
    :goto_1
    return-void
.end method
