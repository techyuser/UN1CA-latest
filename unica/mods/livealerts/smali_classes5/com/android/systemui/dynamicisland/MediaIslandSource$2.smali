.class Lcom/android/systemui/dynamicisland/MediaIslandSource$2;
.super Landroid/media/session/MediaController$Callback;
.source "MediaIslandSource.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/systemui/dynamicisland/MediaIslandSource;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/systemui/dynamicisland/MediaIslandSource;


# direct methods
.method constructor <init>(Lcom/android/systemui/dynamicisland/MediaIslandSource;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 49
    iput-object p1, p0, Lcom/android/systemui/dynamicisland/MediaIslandSource$2;->this$0:Lcom/android/systemui/dynamicisland/MediaIslandSource;

    invoke-direct {p0}, Landroid/media/session/MediaController$Callback;-><init>()V

    return-void
.end method


# virtual methods
.method public onMetadataChanged(Landroid/media/MediaMetadata;)V
    .locals 0

    .line 57
    iget-object p1, p0, Lcom/android/systemui/dynamicisland/MediaIslandSource$2;->this$0:Lcom/android/systemui/dynamicisland/MediaIslandSource;

    invoke-static {p1}, Lcom/android/systemui/dynamicisland/MediaIslandSource;->-$$Nest$mpublishCurrentState(Lcom/android/systemui/dynamicisland/MediaIslandSource;)V

    .line 58
    return-void
.end method

.method public onPlaybackStateChanged(Landroid/media/session/PlaybackState;)V
    .locals 0

    .line 52
    iget-object p1, p0, Lcom/android/systemui/dynamicisland/MediaIslandSource$2;->this$0:Lcom/android/systemui/dynamicisland/MediaIslandSource;

    invoke-static {p1}, Lcom/android/systemui/dynamicisland/MediaIslandSource;->-$$Nest$mpublishCurrentState(Lcom/android/systemui/dynamicisland/MediaIslandSource;)V

    .line 53
    return-void
.end method

.method public onSessionDestroyed()V
    .locals 2

    .line 62
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/MediaIslandSource$2;->this$0:Lcom/android/systemui/dynamicisland/MediaIslandSource;

    invoke-static {v0}, Lcom/android/systemui/dynamicisland/MediaIslandSource;->-$$Nest$fgetmHandler(Lcom/android/systemui/dynamicisland/MediaIslandSource;)Landroid/os/Handler;

    move-result-object v0

    iget-object v1, p0, Lcom/android/systemui/dynamicisland/MediaIslandSource$2;->this$0:Lcom/android/systemui/dynamicisland/MediaIslandSource;

    invoke-static {v1}, Lcom/android/systemui/dynamicisland/MediaIslandSource;->-$$Nest$fgetmPauseTimeoutRunnable(Lcom/android/systemui/dynamicisland/MediaIslandSource;)Ljava/lang/Runnable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 63
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/MediaIslandSource$2;->this$0:Lcom/android/systemui/dynamicisland/MediaIslandSource;

    invoke-static {v0}, Lcom/android/systemui/dynamicisland/MediaIslandSource;->-$$Nest$mclearController(Lcom/android/systemui/dynamicisland/MediaIslandSource;)V

    .line 64
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/MediaIslandSource$2;->this$0:Lcom/android/systemui/dynamicisland/MediaIslandSource;

    invoke-static {v0}, Lcom/android/systemui/dynamicisland/MediaIslandSource;->-$$Nest$fgetmListener(Lcom/android/systemui/dynamicisland/MediaIslandSource;)Lcom/android/systemui/dynamicisland/MediaIslandSource$Listener;

    move-result-object v0

    const-string v1, "island:media"

    invoke-interface {v0, v1}, Lcom/android/systemui/dynamicisland/MediaIslandSource$Listener;->onItemRemoved(Ljava/lang/String;)V

    .line 65
    return-void
.end method
