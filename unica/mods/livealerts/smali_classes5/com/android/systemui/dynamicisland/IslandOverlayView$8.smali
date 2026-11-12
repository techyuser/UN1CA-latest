.class Lcom/android/systemui/dynamicisland/IslandOverlayView$8;
.super Ljava/lang/Object;
.source "IslandOverlayView.java"

# interfaces
.implements Landroid/widget/SeekBar$OnSeekBarChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/systemui/dynamicisland/IslandOverlayView;-><init>(Landroid/content/Context;Lcom/android/systemui/dynamicisland/IslandOverlayView$Callbacks;)V
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

    .line 455
    iput-object p1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$8;->this$0:Lcom/android/systemui/dynamicisland/IslandOverlayView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onProgressChanged(Landroid/widget/SeekBar;IZ)V
    .locals 4

    .line 458
    if-eqz p3, :cond_0

    iget-object p1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$8;->this$0:Lcom/android/systemui/dynamicisland/IslandOverlayView;

    invoke-static {p1}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->-$$Nest$fgetmCurrentItem(Lcom/android/systemui/dynamicisland/IslandOverlayView;)Lcom/android/systemui/dynamicisland/IslandItem;

    move-result-object p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$8;->this$0:Lcom/android/systemui/dynamicisland/IslandOverlayView;

    invoke-static {p1}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->-$$Nest$fgetmCurrentItem(Lcom/android/systemui/dynamicisland/IslandOverlayView;)Lcom/android/systemui/dynamicisland/IslandItem;

    move-result-object p1

    iget-wide v0, p1, Lcom/android/systemui/dynamicisland/IslandItem;->progressMax:J

    const-wide/16 v2, 0x0

    cmp-long p1, v0, v2

    if-lez p1, :cond_0

    .line 459
    int-to-long p1, p2

    iget-object p3, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$8;->this$0:Lcom/android/systemui/dynamicisland/IslandOverlayView;

    invoke-static {p3}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->-$$Nest$fgetmCurrentItem(Lcom/android/systemui/dynamicisland/IslandOverlayView;)Lcom/android/systemui/dynamicisland/IslandItem;

    move-result-object p3

    iget-wide v0, p3, Lcom/android/systemui/dynamicisland/IslandItem;->progressMax:J

    mul-long/2addr p1, v0

    const-wide/16 v0, 0x3e8

    div-long/2addr p1, v0

    .line 460
    iget-object p3, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$8;->this$0:Lcom/android/systemui/dynamicisland/IslandOverlayView;

    invoke-static {p3}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->-$$Nest$fgetmExpElapsedText(Lcom/android/systemui/dynamicisland/IslandOverlayView;)Landroid/widget/TextView;

    move-result-object p3

    invoke-static {p1, p2}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->-$$Nest$smformatMs(J)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p3, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 462
    :cond_0
    return-void
.end method

.method public onStartTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 1

    .line 466
    iget-object p1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$8;->this$0:Lcom/android/systemui/dynamicisland/IslandOverlayView;

    const/4 v0, 0x1

    invoke-static {p1, v0}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->-$$Nest$fputmUserSeeking(Lcom/android/systemui/dynamicisland/IslandOverlayView;Z)V

    .line 467
    return-void
.end method

.method public onStopTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 4

    .line 471
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$8;->this$0:Lcom/android/systemui/dynamicisland/IslandOverlayView;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->-$$Nest$fputmUserSeeking(Lcom/android/systemui/dynamicisland/IslandOverlayView;Z)V

    .line 472
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$8;->this$0:Lcom/android/systemui/dynamicisland/IslandOverlayView;

    invoke-static {v0}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->-$$Nest$fgetmCurrentItem(Lcom/android/systemui/dynamicisland/IslandOverlayView;)Lcom/android/systemui/dynamicisland/IslandItem;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$8;->this$0:Lcom/android/systemui/dynamicisland/IslandOverlayView;

    invoke-static {v0}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->-$$Nest$fgetmCurrentItem(Lcom/android/systemui/dynamicisland/IslandOverlayView;)Lcom/android/systemui/dynamicisland/IslandItem;

    move-result-object v0

    iget-object v0, v0, Lcom/android/systemui/dynamicisland/IslandItem;->mediaController:Landroid/media/session/MediaController;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$8;->this$0:Lcom/android/systemui/dynamicisland/IslandOverlayView;

    invoke-static {v0}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->-$$Nest$fgetmCurrentItem(Lcom/android/systemui/dynamicisland/IslandOverlayView;)Lcom/android/systemui/dynamicisland/IslandItem;

    move-result-object v0

    iget-wide v0, v0, Lcom/android/systemui/dynamicisland/IslandItem;->progressMax:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-lez v0, :cond_0

    .line 473
    invoke-virtual {p1}, Landroid/widget/SeekBar;->getProgress()I

    move-result p1

    int-to-long v0, p1

    iget-object p1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$8;->this$0:Lcom/android/systemui/dynamicisland/IslandOverlayView;

    invoke-static {p1}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->-$$Nest$fgetmCurrentItem(Lcom/android/systemui/dynamicisland/IslandOverlayView;)Lcom/android/systemui/dynamicisland/IslandItem;

    move-result-object p1

    iget-wide v2, p1, Lcom/android/systemui/dynamicisland/IslandItem;->progressMax:J

    mul-long/2addr v0, v2

    const-wide/16 v2, 0x3e8

    div-long/2addr v0, v2

    .line 475
    :try_start_0
    iget-object p1, p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$8;->this$0:Lcom/android/systemui/dynamicisland/IslandOverlayView;

    invoke-static {p1}, Lcom/android/systemui/dynamicisland/IslandOverlayView;->-$$Nest$fgetmCurrentItem(Lcom/android/systemui/dynamicisland/IslandOverlayView;)Lcom/android/systemui/dynamicisland/IslandItem;

    move-result-object p1

    iget-object p1, p1, Lcom/android/systemui/dynamicisland/IslandItem;->mediaController:Landroid/media/session/MediaController;

    invoke-virtual {p1}, Landroid/media/session/MediaController;->getTransportControls()Landroid/media/session/MediaController$TransportControls;

    move-result-object p1

    invoke-virtual {p1, v0, v1}, Landroid/media/session/MediaController$TransportControls;->seekTo(J)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 477
    goto :goto_0

    .line 476
    :catchall_0
    move-exception p1

    .line 479
    :cond_0
    :goto_0
    return-void
.end method
