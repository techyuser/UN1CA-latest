.class Lcom/android/systemui/dynamicisland/DynamicIslandController$2;
.super Ljava/lang/Object;
.source "DynamicIslandController.java"

# interfaces
.implements Landroid/hardware/display/DisplayManager$DisplayListener;


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

    .line 100
    iput-object p1, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController$2;->this$0:Lcom/android/systemui/dynamicisland/DynamicIslandController;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDisplayAdded(I)V
    .locals 0

    .line 103
    return-void
.end method

.method public onDisplayChanged(I)V
    .locals 0

    .line 111
    if-nez p1, :cond_0

    .line 112
    iget-object p1, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController$2;->this$0:Lcom/android/systemui/dynamicisland/DynamicIslandController;

    invoke-static {p1}, Lcom/android/systemui/dynamicisland/DynamicIslandController;->-$$Nest$mupdateDisplayVisibilityAndRotation(Lcom/android/systemui/dynamicisland/DynamicIslandController;)V

    .line 114
    :cond_0
    return-void
.end method

.method public onDisplayRemoved(I)V
    .locals 0

    .line 107
    return-void
.end method
