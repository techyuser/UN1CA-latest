.class public final synthetic Lcom/android/systemui/dynamicisland/IslandOverlayView$$ExternalSyntheticLambda5;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/reflect/InvocationHandler;


# instance fields
.field public final synthetic f$0:Lcom/android/systemui/dynamicisland/IslandOverlayView;

.field public final synthetic f$1:Ljava/lang/reflect/Method;

.field public final synthetic f$2:Ljava/lang/reflect/Field;


# direct methods
.method public synthetic constructor <init>(Lcom/android/systemui/dynamicisland/IslandOverlayView;Ljava/lang/reflect/Method;Ljava/lang/reflect/Field;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$$ExternalSyntheticLambda5;->f$0:Lcom/android/systemui/dynamicisland/IslandOverlayView;

    iput-object p2, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$$ExternalSyntheticLambda5;->f$1:Ljava/lang/reflect/Method;

    iput-object p3, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$$ExternalSyntheticLambda5;->f$2:Ljava/lang/reflect/Field;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 6

    .line 0
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$$ExternalSyntheticLambda5;->f$0:Lcom/android/systemui/dynamicisland/IslandOverlayView;

    iget-object v1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$$ExternalSyntheticLambda5;->f$1:Ljava/lang/reflect/Method;

    iget-object v2, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$$ExternalSyntheticLambda5;->f$2:Ljava/lang/reflect/Field;

    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    invoke-virtual/range {v0 .. v5}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->lambda$registerTouchableInsetsListener$0$com-android-systemui-dynamicisland-IslandOverlayView(Ljava/lang/reflect/Method;Ljava/lang/reflect/Field;Ljava/lang/Object;Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method
