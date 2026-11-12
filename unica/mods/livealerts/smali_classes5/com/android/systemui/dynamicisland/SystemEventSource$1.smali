.class Lcom/android/systemui/dynamicisland/SystemEventSource$1;
.super Landroid/content/BroadcastReceiver;
.source "SystemEventSource.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/systemui/dynamicisland/SystemEventSource;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/systemui/dynamicisland/SystemEventSource;


# direct methods
.method constructor <init>(Lcom/android/systemui/dynamicisland/SystemEventSource;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 59
    iput-object p1, p0, Lcom/android/systemui/dynamicisland/SystemEventSource$1;->this$0:Lcom/android/systemui/dynamicisland/SystemEventSource;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 3

    .line 62
    if-eqz p2, :cond_5

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p1

    if-nez p1, :cond_0

    goto/16 :goto_3

    .line 65
    :cond_0
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p1

    .line 66
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    move-result v0

    const/4 v1, 0x1

    const/4 v2, -0x1

    sparse-switch v0, :sswitch_data_0

    :cond_1
    goto :goto_0

    :sswitch_0
    const-string v0, "android.media.RINGER_MODE_CHANGED"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    move p1, v1

    goto :goto_1

    :sswitch_1
    const-string v0, "android.bluetooth.a2dp.profile.action.CONNECTION_STATE_CHANGED"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    const/4 p1, 0x3

    goto :goto_1

    :sswitch_2
    const-string v0, "android.bluetooth.headset.profile.action.CONNECTION_STATE_CHANGED"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    const/4 p1, 0x4

    goto :goto_1

    :sswitch_3
    const-string v0, "android.net.wifi.WIFI_AP_STATE_CHANGED"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    const/4 p1, 0x5

    goto :goto_1

    :sswitch_4
    const-string v0, "android.bluetooth.device.action.ACL_CONNECTED"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    const/4 p1, 0x2

    goto :goto_1

    :sswitch_5
    const-string v0, "android.intent.action.BATTERY_CHANGED"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    const/4 p1, 0x0

    goto :goto_1

    :sswitch_6
    const-string v0, "android.net.conn.TETHER_STATE_CHANGED"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    const/4 p1, 0x7

    goto :goto_1

    :sswitch_7
    const-string v0, "com.samsung.android.net.wifi.WIFI_AP_STA_STATE_CHANGED"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    const/4 p1, 0x6

    goto :goto_1

    :goto_0
    move p1, v2

    :goto_1
    packed-switch p1, :pswitch_data_0

    goto :goto_2

    .line 91
    :pswitch_0
    iget-object p1, p0, Lcom/android/systemui/dynamicisland/SystemEventSource$1;->this$0:Lcom/android/systemui/dynamicisland/SystemEventSource;

    invoke-static {p1}, Lcom/android/systemui/dynamicisland/SystemEventSource;->-$$Nest$fgetmHotspotActive(Lcom/android/systemui/dynamicisland/SystemEventSource;)Z

    move-result p1

    if-nez p1, :cond_2

    iget-object p1, p0, Lcom/android/systemui/dynamicisland/SystemEventSource$1;->this$0:Lcom/android/systemui/dynamicisland/SystemEventSource;

    invoke-static {p1}, Lcom/android/systemui/dynamicisland/SystemEventSource;->-$$Nest$misHotspotSystemEnabled(Lcom/android/systemui/dynamicisland/SystemEventSource;)Z

    move-result p1

    if-eqz p1, :cond_4

    .line 92
    :cond_2
    iget-object p1, p0, Lcom/android/systemui/dynamicisland/SystemEventSource$1;->this$0:Lcom/android/systemui/dynamicisland/SystemEventSource;

    invoke-static {p1, v2, v1}, Lcom/android/systemui/dynamicisland/SystemEventSource;->-$$Nest$memitHotspotUpdate(Lcom/android/systemui/dynamicisland/SystemEventSource;IZ)V

    goto :goto_2

    .line 84
    :pswitch_1
    const-string p1, "STA_COUNT"

    invoke-virtual {p2, p1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result p1

    .line 85
    iget-object p2, p0, Lcom/android/systemui/dynamicisland/SystemEventSource$1;->this$0:Lcom/android/systemui/dynamicisland/SystemEventSource;

    invoke-static {p2}, Lcom/android/systemui/dynamicisland/SystemEventSource;->-$$Nest$fgetmHotspotActive(Lcom/android/systemui/dynamicisland/SystemEventSource;)Z

    move-result p2

    if-nez p2, :cond_3

    iget-object p2, p0, Lcom/android/systemui/dynamicisland/SystemEventSource$1;->this$0:Lcom/android/systemui/dynamicisland/SystemEventSource;

    invoke-static {p2}, Lcom/android/systemui/dynamicisland/SystemEventSource;->-$$Nest$misHotspotSystemEnabled(Lcom/android/systemui/dynamicisland/SystemEventSource;)Z

    move-result p2

    if-eqz p2, :cond_4

    .line 86
    :cond_3
    iget-object p2, p0, Lcom/android/systemui/dynamicisland/SystemEventSource$1;->this$0:Lcom/android/systemui/dynamicisland/SystemEventSource;

    invoke-static {p2, p1, v1}, Lcom/android/systemui/dynamicisland/SystemEventSource;->-$$Nest$memitHotspotUpdate(Lcom/android/systemui/dynamicisland/SystemEventSource;IZ)V

    goto :goto_2

    .line 81
    :pswitch_2
    iget-object p1, p0, Lcom/android/systemui/dynamicisland/SystemEventSource$1;->this$0:Lcom/android/systemui/dynamicisland/SystemEventSource;

    invoke-static {p1, p2}, Lcom/android/systemui/dynamicisland/SystemEventSource;->-$$Nest$mhandleHotspotChanged(Lcom/android/systemui/dynamicisland/SystemEventSource;Landroid/content/Intent;)V

    .line 82
    goto :goto_2

    .line 78
    :pswitch_3
    iget-object p1, p0, Lcom/android/systemui/dynamicisland/SystemEventSource$1;->this$0:Lcom/android/systemui/dynamicisland/SystemEventSource;

    invoke-static {p1, p2}, Lcom/android/systemui/dynamicisland/SystemEventSource;->-$$Nest$mhandleBluetoothProfileState(Lcom/android/systemui/dynamicisland/SystemEventSource;Landroid/content/Intent;)V

    .line 79
    goto :goto_2

    .line 74
    :pswitch_4
    iget-object p1, p0, Lcom/android/systemui/dynamicisland/SystemEventSource$1;->this$0:Lcom/android/systemui/dynamicisland/SystemEventSource;

    invoke-static {p1, p2}, Lcom/android/systemui/dynamicisland/SystemEventSource;->-$$Nest$mhandleBluetoothAcl(Lcom/android/systemui/dynamicisland/SystemEventSource;Landroid/content/Intent;)V

    .line 75
    goto :goto_2

    .line 71
    :pswitch_5
    iget-object p1, p0, Lcom/android/systemui/dynamicisland/SystemEventSource$1;->this$0:Lcom/android/systemui/dynamicisland/SystemEventSource;

    invoke-static {p1, p2}, Lcom/android/systemui/dynamicisland/SystemEventSource;->-$$Nest$mhandleRingerChanged(Lcom/android/systemui/dynamicisland/SystemEventSource;Landroid/content/Intent;)V

    .line 72
    goto :goto_2

    .line 68
    :pswitch_6
    iget-object p1, p0, Lcom/android/systemui/dynamicisland/SystemEventSource$1;->this$0:Lcom/android/systemui/dynamicisland/SystemEventSource;

    invoke-static {p1, p2}, Lcom/android/systemui/dynamicisland/SystemEventSource;->-$$Nest$mhandleBatteryChanged(Lcom/android/systemui/dynamicisland/SystemEventSource;Landroid/content/Intent;)V

    .line 69
    nop

    .line 96
    :cond_4
    :goto_2
    return-void

    .line 63
    :cond_5
    :goto_3
    return-void

    nop

    :sswitch_data_0
    .sparse-switch
        -0x786ac7a7 -> :sswitch_7
        -0x6898c375 -> :sswitch_6
        -0x5bb23923 -> :sswitch_5
        -0x11f77b4b -> :sswitch_4
        0x186f64d7 -> :sswitch_3
        0x2083ec2d -> :sswitch_2
        0x4a286686 -> :sswitch_1
        0x7b621251 -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
