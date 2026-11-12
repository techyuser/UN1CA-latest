.class public final synthetic Lcom/android/systemui/dynamicisland/IslandOverlayView$$ExternalSyntheticLambda6;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic f$0:Lcom/android/systemui/dynamicisland/IslandOverlayView;

.field public final synthetic f$1:Lcom/android/systemui/dynamicisland/IslandItem$ActionItem;


# direct methods
.method public synthetic constructor <init>(Lcom/android/systemui/dynamicisland/IslandOverlayView;Lcom/android/systemui/dynamicisland/IslandItem$ActionItem;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$$ExternalSyntheticLambda6;->f$0:Lcom/android/systemui/dynamicisland/IslandOverlayView;

    iput-object p2, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$$ExternalSyntheticLambda6;->f$1:Lcom/android/systemui/dynamicisland/IslandItem$ActionItem;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 0
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$$ExternalSyntheticLambda6;->f$0:Lcom/android/systemui/dynamicisland/IslandOverlayView;

    iget-object v1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$$ExternalSyntheticLambda6;->f$1:Lcom/android/systemui/dynamicisland/IslandItem$ActionItem;

    invoke-virtual {v0, v1, p1}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->lambda$bindExpanded$0$com-android-systemui-dynamicisland-IslandOverlayView(Lcom/android/systemui/dynamicisland/IslandItem$ActionItem;Landroid/view/View;)V

    return-void
.end method
