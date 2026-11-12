.class Lcom/android/systemui/dynamicisland/DynamicIslandController$1;
.super Landroid/database/ContentObserver;
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
.method constructor <init>(Lcom/android/systemui/dynamicisland/DynamicIslandController;Landroid/os/Handler;)V
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

    .line 87
    iput-object p1, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController$1;->this$0:Lcom/android/systemui/dynamicisland/DynamicIslandController;

    invoke-direct {p0, p2}, Landroid/database/ContentObserver;-><init>(Landroid/os/Handler;)V

    return-void
.end method


# virtual methods
.method public onChange(ZLandroid/net/Uri;)V
    .locals 0

    .line 90
    if-eqz p2, :cond_0

    .line 91
    invoke-virtual {p2}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object p1

    .line 92
    if-eqz p1, :cond_0

    const-string p2, "unica_live_alerts_"

    invoke-virtual {p1, p2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_0

    .line 93
    return-void

    .line 96
    :cond_0
    iget-object p1, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController$1;->this$0:Lcom/android/systemui/dynamicisland/DynamicIslandController;

    invoke-static {p1}, Lcom/android/systemui/dynamicisland/DynamicIslandController;->-$$Nest$monLivePrefsChanged(Lcom/android/systemui/dynamicisland/DynamicIslandController;)V

    .line 97
    return-void
.end method
