.class Lcom/android/systemui/dynamicisland/WaveformView$1;
.super Ljava/lang/Object;
.source "WaveformView.java"

# interfaces
.implements Landroid/view/Choreographer$FrameCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/systemui/dynamicisland/WaveformView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/systemui/dynamicisland/WaveformView;


# direct methods
.method constructor <init>(Lcom/android/systemui/dynamicisland/WaveformView;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 25
    iput-object p1, p0, Lcom/android/systemui/dynamicisland/WaveformView$1;->this$0:Lcom/android/systemui/dynamicisland/WaveformView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public doFrame(J)V
    .locals 4

    .line 28
    iget-object p1, p0, Lcom/android/systemui/dynamicisland/WaveformView$1;->this$0:Lcom/android/systemui/dynamicisland/WaveformView;

    invoke-static {p1}, Lcom/android/systemui/dynamicisland/WaveformView;->-$$Nest$fgetmAnimating(Lcom/android/systemui/dynamicisland/WaveformView;)Z

    move-result p1

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/android/systemui/dynamicisland/WaveformView$1;->this$0:Lcom/android/systemui/dynamicisland/WaveformView;

    invoke-static {p1}, Lcom/android/systemui/dynamicisland/WaveformView;->-$$Nest$fgetmAttached(Lcom/android/systemui/dynamicisland/WaveformView;)Z

    move-result p1

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/android/systemui/dynamicisland/WaveformView$1;->this$0:Lcom/android/systemui/dynamicisland/WaveformView;

    invoke-virtual {p1}, Lcom/android/systemui/dynamicisland/WaveformView;->getVisibility()I

    move-result p1

    if-eqz p1, :cond_0

    goto :goto_0

    .line 31
    :cond_0
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide p1

    .line 32
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/WaveformView$1;->this$0:Lcom/android/systemui/dynamicisland/WaveformView;

    invoke-static {v0}, Lcom/android/systemui/dynamicisland/WaveformView;->-$$Nest$fgetmLastFrameMs(Lcom/android/systemui/dynamicisland/WaveformView;)J

    move-result-wide v0

    sub-long v0, p1, v0

    const-wide/16 v2, 0x18

    cmp-long v0, v0, v2

    if-ltz v0, :cond_1

    .line 33
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/WaveformView$1;->this$0:Lcom/android/systemui/dynamicisland/WaveformView;

    invoke-static {v0, p1, p2}, Lcom/android/systemui/dynamicisland/WaveformView;->-$$Nest$fputmLastFrameMs(Lcom/android/systemui/dynamicisland/WaveformView;J)V

    .line 34
    iget-object p1, p0, Lcom/android/systemui/dynamicisland/WaveformView$1;->this$0:Lcom/android/systemui/dynamicisland/WaveformView;

    invoke-virtual {p1}, Lcom/android/systemui/dynamicisland/WaveformView;->invalidate()V

    .line 36
    :cond_1
    invoke-static {}, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;

    move-result-object p1

    invoke-virtual {p1, p0}, Landroid/view/Choreographer;->postFrameCallback(Landroid/view/Choreographer$FrameCallback;)V

    .line 37
    return-void

    .line 29
    :cond_2
    :goto_0
    return-void
.end method
