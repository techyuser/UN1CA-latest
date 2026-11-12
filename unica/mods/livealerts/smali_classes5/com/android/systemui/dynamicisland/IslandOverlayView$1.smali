.class Lcom/android/systemui/dynamicisland/IslandOverlayView$1;
.super Ljava/lang/Object;
.source "IslandOverlayView.java"

# interfaces
.implements Landroid/view/Choreographer$FrameCallback;


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

    .line 195
    iput-object p1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$1;->this$0:Lcom/android/systemui/dynamicisland/IslandOverlayView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public doFrame(J)V
    .locals 1

    .line 198
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$1;->this$0:Lcom/android/systemui/dynamicisland/IslandOverlayView;

    invoke-static {v0, p1, p2}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->-$$Nest$mstepAnimationsFrame(Lcom/android/systemui/dynamicisland/IslandOverlayView;J)V

    .line 199
    return-void
.end method
