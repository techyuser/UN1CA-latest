.class Lcom/android/systemui/dynamicisland/MediaIslandSource$1;
.super Ljava/lang/Object;
.source "MediaIslandSource.java"

# interfaces
.implements Ljava/lang/Runnable;


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

    .line 42
    iput-object p1, p0, Lcom/android/systemui/dynamicisland/MediaIslandSource$1;->this$0:Lcom/android/systemui/dynamicisland/MediaIslandSource;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 45
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/MediaIslandSource$1;->this$0:Lcom/android/systemui/dynamicisland/MediaIslandSource;

    invoke-static {v0}, Lcom/android/systemui/dynamicisland/MediaIslandSource;->-$$Nest$fgetmListener(Lcom/android/systemui/dynamicisland/MediaIslandSource;)Lcom/android/systemui/dynamicisland/MediaIslandSource$Listener;

    move-result-object v0

    const-string v1, "island:media"

    invoke-interface {v0, v1}, Lcom/android/systemui/dynamicisland/MediaIslandSource$Listener;->onItemRemoved(Ljava/lang/String;)V

    .line 46
    return-void
.end method
