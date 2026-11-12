.class public final Lcom/android/systemui/dynamicisland/LiveAlertsPrefs;
.super Ljava/lang/Object;
.source "LiveAlertsPrefs.java"


# static fields
.field public static final KEY_ANIM_BOUNCE:Ljava/lang/String; = "unica_live_alerts_anim_bounce"

.field public static final KEY_ANIM_SPEED:Ljava/lang/String; = "unica_live_alerts_anim_speed"

.field public static final KEY_BLUR_RADIUS:Ljava/lang/String; = "unica_live_alerts_blur_radius"

.field public static final KEY_CAT_CALLS:Ljava/lang/String; = "unica_live_alerts_cat_calls"

.field public static final KEY_CAT_DELIVERY:Ljava/lang/String; = "unica_live_alerts_cat_delivery"

.field public static final KEY_CAT_HOTSPOT:Ljava/lang/String; = "unica_live_alerts_cat_hotspot"

.field public static final KEY_CAT_MEDIA:Ljava/lang/String; = "unica_live_alerts_cat_media"

.field public static final KEY_CAT_PEEK:Ljava/lang/String; = "unica_live_alerts_cat_peek"

.field public static final KEY_CAT_RECORDING:Ljava/lang/String; = "unica_live_alerts_cat_recording"

.field public static final KEY_CAT_SYSTEM:Ljava/lang/String; = "unica_live_alerts_cat_system"

.field public static final KEY_CAT_TIMER:Ljava/lang/String; = "unica_live_alerts_cat_timer"

.field public static final KEY_CENTER_OFFSET_DP:Ljava/lang/String; = "unica_live_alerts_center_offset_dp"

.field public static final KEY_ENABLED:Ljava/lang/String; = "unica_live_alerts_enabled"

.field public static final KEY_EXPANDED_WIDTH_DP:Ljava/lang/String; = "unica_live_alerts_expanded_width_dp"

.field public static final KEY_GAP_OFFSET_DP:Ljava/lang/String; = "unica_live_alerts_gap_offset_dp"

.field public static final KEY_GLASS_OPACITY:Ljava/lang/String; = "unica_live_alerts_glass_opacity"

.field public static final KEY_HEIGHT_OFFSET_DP:Ljava/lang/String; = "unica_live_alerts_height_offset_dp"

.field public static final KEY_PREVIEW_NONCE:Ljava/lang/String; = "unica_live_alerts_preview_nonce"

.field public static final KEY_RIM_ALPHA:Ljava/lang/String; = "unica_live_alerts_rim_alpha"

.field public static final KEY_TOP_OFFSET_DP:Ljava/lang/String; = "unica_live_alerts_top_offset_dp"

.field public static final PREFIX:Ljava/lang/String; = "unica_live_alerts_"


# instance fields
.field public animBouncePct:I

.field public animSpeedPct:I

.field public blurRadius:I

.field public catCalls:Z

.field public catDelivery:Z

.field public catHotspot:Z

.field public catMedia:Z

.field public catPeek:Z

.field public catRecording:Z

.field public catSystem:Z

.field public catTimer:Z

.field public centerOffsetDp:I

.field public enabled:Z

.field public expandedWidthDp:I

.field public gapOffsetDp:I

.field public glassOpacityPct:I

.field public heightOffsetDp:I

.field public previewNonce:J

.field public rimAlphaPct:I

.field public topOffsetDp:I


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/systemui/dynamicisland/LiveAlertsPrefs;->enabled:Z

    .line 39
    const/16 v1, 0x118

    iput v1, p0, Lcom/android/systemui/dynamicisland/LiveAlertsPrefs;->blurRadius:I

    .line 40
    const/16 v1, 0x37

    iput v1, p0, Lcom/android/systemui/dynamicisland/LiveAlertsPrefs;->glassOpacityPct:I

    .line 41
    const/16 v1, 0x55

    iput v1, p0, Lcom/android/systemui/dynamicisland/LiveAlertsPrefs;->rimAlphaPct:I

    .line 42
    const/16 v1, 0x64

    iput v1, p0, Lcom/android/systemui/dynamicisland/LiveAlertsPrefs;->animSpeedPct:I

    .line 43
    const/16 v1, 0x1a

    iput v1, p0, Lcom/android/systemui/dynamicisland/LiveAlertsPrefs;->animBouncePct:I

    .line 44
    const/4 v1, 0x0

    iput v1, p0, Lcom/android/systemui/dynamicisland/LiveAlertsPrefs;->heightOffsetDp:I

    .line 45
    iput v1, p0, Lcom/android/systemui/dynamicisland/LiveAlertsPrefs;->gapOffsetDp:I

    .line 46
    iput v1, p0, Lcom/android/systemui/dynamicisland/LiveAlertsPrefs;->topOffsetDp:I

    .line 47
    iput v1, p0, Lcom/android/systemui/dynamicisland/LiveAlertsPrefs;->centerOffsetDp:I

    .line 48
    const/16 v1, 0x150

    iput v1, p0, Lcom/android/systemui/dynamicisland/LiveAlertsPrefs;->expandedWidthDp:I

    .line 50
    iput-boolean v0, p0, Lcom/android/systemui/dynamicisland/LiveAlertsPrefs;->catMedia:Z

    .line 51
    iput-boolean v0, p0, Lcom/android/systemui/dynamicisland/LiveAlertsPrefs;->catTimer:Z

    .line 52
    iput-boolean v0, p0, Lcom/android/systemui/dynamicisland/LiveAlertsPrefs;->catHotspot:Z

    .line 53
    iput-boolean v0, p0, Lcom/android/systemui/dynamicisland/LiveAlertsPrefs;->catDelivery:Z

    .line 54
    iput-boolean v0, p0, Lcom/android/systemui/dynamicisland/LiveAlertsPrefs;->catCalls:Z

    .line 55
    iput-boolean v0, p0, Lcom/android/systemui/dynamicisland/LiveAlertsPrefs;->catRecording:Z

    .line 56
    iput-boolean v0, p0, Lcom/android/systemui/dynamicisland/LiveAlertsPrefs;->catSystem:Z

    .line 57
    iput-boolean v0, p0, Lcom/android/systemui/dynamicisland/LiveAlertsPrefs;->catPeek:Z

    .line 59
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/android/systemui/dynamicisland/LiveAlertsPrefs;->previewNonce:J

    return-void
.end method

.method private static clamp(III)I
    .locals 0

    .line 136
    invoke-static {p2, p0}, Ljava/lang/Math;->min(II)I

    move-result p0

    invoke-static {p1, p0}, Ljava/lang/Math;->max(II)I

    move-result p0

    return p0
.end method

.method private static getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I
    .locals 0

    .line 121
    :try_start_0
    invoke-static {p0, p1, p2}, Landroid/provider/Settings$Secure;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return p0

    .line 122
    :catchall_0
    move-exception p0

    .line 123
    return p2
.end method

.method private static getLong(Landroid/content/ContentResolver;Ljava/lang/String;J)J
    .locals 0

    .line 129
    :try_start_0
    invoke-static {p0, p1, p2, p3}, Landroid/provider/Settings$Secure;->getLong(Landroid/content/ContentResolver;Ljava/lang/String;J)J

    move-result-wide p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-wide p0

    .line 130
    :catchall_0
    move-exception p0

    .line 131
    return-wide p2
.end method


# virtual methods
.method public isCategoryAllowed(Lcom/android/systemui/dynamicisland/IslandItem$Category;)Z
    .locals 2

    .line 91
    const/4 v0, 0x1

    if-nez p1, :cond_0

    .line 92
    return v0

    .line 94
    :cond_0
    sget-object v1, Lcom/android/systemui/dynamicisland/LiveAlertsPrefs$1;->$SwitchMap$com$android$systemui$dynamicisland$IslandItem$Category:[I

    invoke-virtual {p1}, Lcom/android/systemui/dynamicisland/IslandItem$Category;->ordinal()I

    move-result p1

    aget p1, v1, p1

    packed-switch p1, :pswitch_data_0

    .line 115
    return v0

    .line 113
    :pswitch_0
    iget-boolean p1, p0, Lcom/android/systemui/dynamicisland/LiveAlertsPrefs;->catPeek:Z

    return p1

    .line 111
    :pswitch_1
    iget-boolean p1, p0, Lcom/android/systemui/dynamicisland/LiveAlertsPrefs;->catSystem:Z

    return p1

    .line 109
    :pswitch_2
    iget-boolean p1, p0, Lcom/android/systemui/dynamicisland/LiveAlertsPrefs;->catRecording:Z

    return p1

    .line 107
    :pswitch_3
    iget-boolean p1, p0, Lcom/android/systemui/dynamicisland/LiveAlertsPrefs;->catCalls:Z

    return p1

    .line 105
    :pswitch_4
    iget-boolean p1, p0, Lcom/android/systemui/dynamicisland/LiveAlertsPrefs;->catDelivery:Z

    return p1

    .line 100
    :pswitch_5
    iget-boolean p1, p0, Lcom/android/systemui/dynamicisland/LiveAlertsPrefs;->catHotspot:Z

    return p1

    .line 98
    :pswitch_6
    iget-boolean p1, p0, Lcom/android/systemui/dynamicisland/LiveAlertsPrefs;->catTimer:Z

    return p1

    .line 96
    :pswitch_7
    iget-boolean p1, p0, Lcom/android/systemui/dynamicisland/LiveAlertsPrefs;->catMedia:Z

    return p1

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_4
        :pswitch_4
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public reload(Landroid/content/Context;)V
    .locals 6

    .line 62
    if-nez p1, :cond_0

    .line 63
    return-void

    .line 65
    :cond_0
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    .line 66
    const-string v0, "unica_live_alerts_enabled"

    const/4 v1, 0x1

    invoke-static {p1, v0, v1}, Lcom/android/systemui/dynamicisland/LiveAlertsPrefs;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    const/4 v2, 0x0

    if-eqz v0, :cond_1

    move v0, v1

    goto :goto_0

    :cond_1
    move v0, v2

    :goto_0
    iput-boolean v0, p0, Lcom/android/systemui/dynamicisland/LiveAlertsPrefs;->enabled:Z

    .line 67
    const-string v0, "unica_live_alerts_blur_radius"

    const/16 v3, 0x118

    invoke-static {p1, v0, v3}, Lcom/android/systemui/dynamicisland/LiveAlertsPrefs;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    const/16 v3, 0x190

    invoke-static {v0, v2, v3}, Lcom/android/systemui/dynamicisland/LiveAlertsPrefs;->clamp(III)I

    move-result v0

    iput v0, p0, Lcom/android/systemui/dynamicisland/LiveAlertsPrefs;->blurRadius:I

    .line 68
    const-string v0, "unica_live_alerts_glass_opacity"

    const/16 v3, 0x37

    invoke-static {p1, v0, v3}, Lcom/android/systemui/dynamicisland/LiveAlertsPrefs;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    const/16 v3, 0x19

    const/16 v4, 0x5f

    invoke-static {v0, v3, v4}, Lcom/android/systemui/dynamicisland/LiveAlertsPrefs;->clamp(III)I

    move-result v0

    iput v0, p0, Lcom/android/systemui/dynamicisland/LiveAlertsPrefs;->glassOpacityPct:I

    .line 69
    const-string v0, "unica_live_alerts_rim_alpha"

    const/16 v3, 0x55

    invoke-static {p1, v0, v3}, Lcom/android/systemui/dynamicisland/LiveAlertsPrefs;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    const/16 v3, 0x64

    invoke-static {v0, v2, v3}, Lcom/android/systemui/dynamicisland/LiveAlertsPrefs;->clamp(III)I

    move-result v0

    iput v0, p0, Lcom/android/systemui/dynamicisland/LiveAlertsPrefs;->rimAlphaPct:I

    .line 70
    const-string v0, "unica_live_alerts_anim_speed"

    invoke-static {p1, v0, v3}, Lcom/android/systemui/dynamicisland/LiveAlertsPrefs;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    const/16 v3, 0x32

    const/16 v4, 0xa0

    invoke-static {v0, v3, v4}, Lcom/android/systemui/dynamicisland/LiveAlertsPrefs;->clamp(III)I

    move-result v0

    iput v0, p0, Lcom/android/systemui/dynamicisland/LiveAlertsPrefs;->animSpeedPct:I

    .line 71
    const-string v0, "unica_live_alerts_anim_bounce"

    const/16 v3, 0x1a

    invoke-static {p1, v0, v3}, Lcom/android/systemui/dynamicisland/LiveAlertsPrefs;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    const/16 v3, 0x28

    invoke-static {v0, v2, v3}, Lcom/android/systemui/dynamicisland/LiveAlertsPrefs;->clamp(III)I

    move-result v0

    iput v0, p0, Lcom/android/systemui/dynamicisland/LiveAlertsPrefs;->animBouncePct:I

    .line 72
    const-string v0, "unica_live_alerts_height_offset_dp"

    invoke-static {p1, v0, v2}, Lcom/android/systemui/dynamicisland/LiveAlertsPrefs;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    const/4 v3, -0x4

    const/16 v4, 0x8

    invoke-static {v0, v3, v4}, Lcom/android/systemui/dynamicisland/LiveAlertsPrefs;->clamp(III)I

    move-result v0

    iput v0, p0, Lcom/android/systemui/dynamicisland/LiveAlertsPrefs;->heightOffsetDp:I

    .line 73
    const-string v0, "unica_live_alerts_gap_offset_dp"

    invoke-static {p1, v0, v2}, Lcom/android/systemui/dynamicisland/LiveAlertsPrefs;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    const/4 v3, -0x6

    const/16 v4, 0xa

    invoke-static {v0, v3, v4}, Lcom/android/systemui/dynamicisland/LiveAlertsPrefs;->clamp(III)I

    move-result v0

    iput v0, p0, Lcom/android/systemui/dynamicisland/LiveAlertsPrefs;->gapOffsetDp:I

    .line 74
    const-string v0, "unica_live_alerts_top_offset_dp"

    invoke-static {p1, v0, v2}, Lcom/android/systemui/dynamicisland/LiveAlertsPrefs;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    const/16 v5, 0xc

    invoke-static {v0, v3, v5}, Lcom/android/systemui/dynamicisland/LiveAlertsPrefs;->clamp(III)I

    move-result v0

    iput v0, p0, Lcom/android/systemui/dynamicisland/LiveAlertsPrefs;->topOffsetDp:I

    .line 75
    const-string v0, "unica_live_alerts_center_offset_dp"

    invoke-static {p1, v0, v2}, Lcom/android/systemui/dynamicisland/LiveAlertsPrefs;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    const/16 v3, -0xa

    invoke-static {v0, v3, v4}, Lcom/android/systemui/dynamicisland/LiveAlertsPrefs;->clamp(III)I

    move-result v0

    iput v0, p0, Lcom/android/systemui/dynamicisland/LiveAlertsPrefs;->centerOffsetDp:I

    .line 76
    const-string v0, "unica_live_alerts_expanded_width_dp"

    const/16 v3, 0x150

    invoke-static {p1, v0, v3}, Lcom/android/systemui/dynamicisland/LiveAlertsPrefs;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    const/16 v3, 0x122

    const/16 v4, 0x168

    invoke-static {v0, v3, v4}, Lcom/android/systemui/dynamicisland/LiveAlertsPrefs;->clamp(III)I

    move-result v0

    iput v0, p0, Lcom/android/systemui/dynamicisland/LiveAlertsPrefs;->expandedWidthDp:I

    .line 78
    const-string v0, "unica_live_alerts_cat_media"

    invoke-static {p1, v0, v1}, Lcom/android/systemui/dynamicisland/LiveAlertsPrefs;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    if-eqz v0, :cond_2

    move v0, v1

    goto :goto_1

    :cond_2
    move v0, v2

    :goto_1
    iput-boolean v0, p0, Lcom/android/systemui/dynamicisland/LiveAlertsPrefs;->catMedia:Z

    .line 79
    const-string v0, "unica_live_alerts_cat_timer"

    invoke-static {p1, v0, v1}, Lcom/android/systemui/dynamicisland/LiveAlertsPrefs;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    if-eqz v0, :cond_3

    move v0, v1

    goto :goto_2

    :cond_3
    move v0, v2

    :goto_2
    iput-boolean v0, p0, Lcom/android/systemui/dynamicisland/LiveAlertsPrefs;->catTimer:Z

    .line 80
    const-string v0, "unica_live_alerts_cat_hotspot"

    invoke-static {p1, v0, v1}, Lcom/android/systemui/dynamicisland/LiveAlertsPrefs;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    if-eqz v0, :cond_4

    move v0, v1

    goto :goto_3

    :cond_4
    move v0, v2

    :goto_3
    iput-boolean v0, p0, Lcom/android/systemui/dynamicisland/LiveAlertsPrefs;->catHotspot:Z

    .line 81
    const-string v0, "unica_live_alerts_cat_delivery"

    invoke-static {p1, v0, v1}, Lcom/android/systemui/dynamicisland/LiveAlertsPrefs;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    if-eqz v0, :cond_5

    move v0, v1

    goto :goto_4

    :cond_5
    move v0, v2

    :goto_4
    iput-boolean v0, p0, Lcom/android/systemui/dynamicisland/LiveAlertsPrefs;->catDelivery:Z

    .line 82
    const-string v0, "unica_live_alerts_cat_calls"

    invoke-static {p1, v0, v1}, Lcom/android/systemui/dynamicisland/LiveAlertsPrefs;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    if-eqz v0, :cond_6

    move v0, v1

    goto :goto_5

    :cond_6
    move v0, v2

    :goto_5
    iput-boolean v0, p0, Lcom/android/systemui/dynamicisland/LiveAlertsPrefs;->catCalls:Z

    .line 83
    const-string v0, "unica_live_alerts_cat_recording"

    invoke-static {p1, v0, v1}, Lcom/android/systemui/dynamicisland/LiveAlertsPrefs;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    if-eqz v0, :cond_7

    move v0, v1

    goto :goto_6

    :cond_7
    move v0, v2

    :goto_6
    iput-boolean v0, p0, Lcom/android/systemui/dynamicisland/LiveAlertsPrefs;->catRecording:Z

    .line 84
    const-string v0, "unica_live_alerts_cat_system"

    invoke-static {p1, v0, v1}, Lcom/android/systemui/dynamicisland/LiveAlertsPrefs;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    if-eqz v0, :cond_8

    move v0, v1

    goto :goto_7

    :cond_8
    move v0, v2

    :goto_7
    iput-boolean v0, p0, Lcom/android/systemui/dynamicisland/LiveAlertsPrefs;->catSystem:Z

    .line 85
    const-string v0, "unica_live_alerts_cat_peek"

    invoke-static {p1, v0, v1}, Lcom/android/systemui/dynamicisland/LiveAlertsPrefs;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    if-eqz v0, :cond_9

    goto :goto_8

    :cond_9
    move v1, v2

    :goto_8
    iput-boolean v1, p0, Lcom/android/systemui/dynamicisland/LiveAlertsPrefs;->catPeek:Z

    .line 87
    const-string v0, "unica_live_alerts_preview_nonce"

    const-wide/16 v1, 0x0

    invoke-static {p1, v0, v1, v2}, Lcom/android/systemui/dynamicisland/LiveAlertsPrefs;->getLong(Landroid/content/ContentResolver;Ljava/lang/String;J)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/android/systemui/dynamicisland/LiveAlertsPrefs;->previewNonce:J

    .line 88
    return-void
.end method
