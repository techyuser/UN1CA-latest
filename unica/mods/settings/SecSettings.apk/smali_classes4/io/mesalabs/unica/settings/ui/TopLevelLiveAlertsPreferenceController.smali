.class public Lio/mesalabs/unica/settings/ui/TopLevelLiveAlertsPreferenceController;
.super Lcom/samsung/android/settings/homepage/TopLevelPreferenceController;
.source "TopLevelLiveAlertsPreferenceController.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .locals 0

    .line 11
    invoke-direct {p0, p1, p2}, Lcom/samsung/android/settings/homepage/TopLevelPreferenceController;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 12
    return-void
.end method


# virtual methods
.method public getAvailabilityStatus()I
    .locals 1

    .line 16
    const/4 v0, 0x0

    return v0
.end method

.method public getSummary()Ljava/lang/CharSequence;
    .locals 3

    .line 21
    nop

    .line 23
    const/4 v0, 0x1

    :try_start_0
    iget-object v1, p0, Lio/mesalabs/unica/settings/ui/TopLevelLiveAlertsPreferenceController;->mContext:Landroid/content/Context;

    .line 24
    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "unica_live_alerts_enabled"

    .line 23
    invoke-static {v1, v2, v0}, Landroid/provider/Settings$Secure;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 26
    :goto_0
    goto :goto_1

    .line 25
    :catchall_0
    move-exception v1

    .line 27
    :goto_1
    if-eqz v0, :cond_1

    const-string v0, "On \u2022 OxygenOS 16 Fluid Glass"

    goto :goto_2

    :cond_1
    const-string v0, "Off"

    :goto_2
    return-object v0
.end method
