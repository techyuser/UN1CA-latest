.class public Lio/mesalabs/unica/settings/ui/LiveAlertsSettingsFragment;
.super Lcom/android/settings/dashboard/DashboardFragment;
.source "LiveAlertsSettingsFragment.java"


# static fields
.field private static final CATEGORY_KEYS:[Ljava/lang/String;

.field private static final DEPENDENT_KEYS:[Ljava/lang/String;

.field private static final KEY_BLUR:Ljava/lang/String; = "unica_live_alerts_blur_radius"

.field private static final KEY_BOUNCE:Ljava/lang/String; = "unica_live_alerts_anim_bounce"

.field private static final KEY_CAT_CALLS:Ljava/lang/String; = "unica_live_alerts_cat_calls"

.field private static final KEY_CAT_DELIVERY:Ljava/lang/String; = "unica_live_alerts_cat_delivery"

.field private static final KEY_CAT_HOTSPOT:Ljava/lang/String; = "unica_live_alerts_cat_hotspot"

.field private static final KEY_CAT_MEDIA:Ljava/lang/String; = "unica_live_alerts_cat_media"

.field private static final KEY_CAT_PEEK:Ljava/lang/String; = "unica_live_alerts_cat_peek"

.field private static final KEY_CAT_RECORDING:Ljava/lang/String; = "unica_live_alerts_cat_recording"

.field private static final KEY_CAT_SYSTEM:Ljava/lang/String; = "unica_live_alerts_cat_system"

.field private static final KEY_CAT_TIMER:Ljava/lang/String; = "unica_live_alerts_cat_timer"

.field private static final KEY_CENTER:Ljava/lang/String; = "unica_live_alerts_center_offset_dp"

.field private static final KEY_ENABLED:Ljava/lang/String; = "unica_live_alerts_enabled"

.field private static final KEY_GAP:Ljava/lang/String; = "unica_live_alerts_gap_offset_dp"

.field private static final KEY_HEIGHT:Ljava/lang/String; = "unica_live_alerts_height_offset_dp"

.field private static final KEY_OPACITY:Ljava/lang/String; = "unica_live_alerts_glass_opacity"

.field private static final KEY_PREVIEW:Ljava/lang/String; = "unica_live_alerts_preview"

.field private static final KEY_RESET:Ljava/lang/String; = "unica_live_alerts_reset"

.field private static final KEY_RIM:Ljava/lang/String; = "unica_live_alerts_rim_alpha"

.field private static final KEY_SPEED:Ljava/lang/String; = "unica_live_alerts_anim_speed"

.field private static final KEY_TOP:Ljava/lang/String; = "unica_live_alerts_top_offset_dp"

.field private static final KEY_WIDTH:Ljava/lang/String; = "unica_live_alerts_expanded_width_dp"

.field public static final SEARCH_INDEX_DATA_PROVIDER:Lcom/android/settings/search/BaseSearchIndexProvider;


# direct methods
.method static constructor <clinit>()V
    .locals 20

    .line 22
    new-instance v0, Lcom/android/settings/search/BaseSearchIndexProvider;

    .line 23
    const-string v1, "xml"

    const-string v2, "unica_live_alerts_settings"

    invoke-static {v1, v2}, Lio/mesalabs/unica/utils/Utils;->getResourceId(Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    invoke-direct {v0, v1}, Lcom/android/settings/search/BaseSearchIndexProvider;-><init>(I)V

    sput-object v0, Lio/mesalabs/unica/settings/ui/LiveAlertsSettingsFragment;->SEARCH_INDEX_DATA_PROVIDER:Lcom/android/settings/search/BaseSearchIndexProvider;

    .line 49
    const-string v18, "unica_live_alerts_cat_system"

    const-string v19, "unica_live_alerts_cat_peek"

    const-string v2, "unica_live_alerts_blur_radius"

    const-string v3, "unica_live_alerts_glass_opacity"

    const-string v4, "unica_live_alerts_rim_alpha"

    const-string v5, "unica_live_alerts_anim_speed"

    const-string v6, "unica_live_alerts_anim_bounce"

    const-string v7, "unica_live_alerts_height_offset_dp"

    const-string v8, "unica_live_alerts_gap_offset_dp"

    const-string v9, "unica_live_alerts_top_offset_dp"

    const-string v10, "unica_live_alerts_center_offset_dp"

    const-string v11, "unica_live_alerts_expanded_width_dp"

    const-string v12, "unica_live_alerts_cat_media"

    const-string v13, "unica_live_alerts_cat_timer"

    const-string v14, "unica_live_alerts_cat_hotspot"

    const-string v15, "unica_live_alerts_cat_delivery"

    const-string v16, "unica_live_alerts_cat_calls"

    const-string v17, "unica_live_alerts_cat_recording"

    filled-new-array/range {v2 .. v19}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lio/mesalabs/unica/settings/ui/LiveAlertsSettingsFragment;->DEPENDENT_KEYS:[Ljava/lang/String;

    .line 57
    const-string v7, "unica_live_alerts_cat_system"

    const-string v8, "unica_live_alerts_cat_peek"

    const-string v1, "unica_live_alerts_cat_media"

    const-string v2, "unica_live_alerts_cat_timer"

    const-string v3, "unica_live_alerts_cat_hotspot"

    const-string v4, "unica_live_alerts_cat_delivery"

    const-string v5, "unica_live_alerts_cat_calls"

    const-string v6, "unica_live_alerts_cat_recording"

    filled-new-array/range {v1 .. v8}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lio/mesalabs/unica/settings/ui/LiveAlertsSettingsFragment;->CATEGORY_KEYS:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 20
    invoke-direct {p0}, Lcom/android/settings/dashboard/DashboardFragment;-><init>()V

    return-void
.end method

.method private bindSlider(Landroid/content/ContentResolver;Ljava/lang/String;IIII)V
    .locals 5

    .line 182
    invoke-virtual {p0, p2}, Lio/mesalabs/unica/settings/ui/LiveAlertsSettingsFragment;->findPreference(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    move-result-object v0

    .line 183
    instance-of v1, v0, Landroidx/preference/SeekBarPreference;

    if-nez v1, :cond_0

    .line 184
    return-void

    .line 186
    :cond_0
    check-cast v0, Landroidx/preference/SeekBarPreference;

    .line 187
    sub-int v1, p4, p3

    div-int/2addr v1, p5

    const/4 v2, 0x1

    invoke-static {v2, v1}, Ljava/lang/Math;->max(II)I

    move-result v1

    .line 188
    invoke-static {p1, p2, p6}, Lio/mesalabs/unica/settings/ui/LiveAlertsSettingsFragment;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result p6

    invoke-static {p6, p3, p4}, Lio/mesalabs/unica/settings/ui/LiveAlertsSettingsFragment;->clamp(III)I

    move-result p6

    .line 189
    sub-int/2addr p6, p3

    int-to-float p6, p6

    int-to-float v3, p5

    div-float/2addr p6, v3

    invoke-static {p6}, Ljava/lang/Math;->round(F)I

    move-result p6

    invoke-static {v1, p6}, Ljava/lang/Math;->min(II)I

    move-result p6

    const/4 v3, 0x0

    invoke-static {v3, p6}, Ljava/lang/Math;->max(II)I

    move-result p6

    .line 190
    mul-int v4, p6, p5

    add-int/2addr v4, p3

    .line 192
    iput-boolean v2, v0, Landroidx/preference/SeekBarPreference;->mUpdatesContinuously:Z

    .line 193
    invoke-virtual {v0, v3}, Landroidx/preference/SeekBarPreference;->setMin(I)V

    .line 194
    invoke-virtual {v0, v1}, Landroidx/preference/SeekBarPreference;->setMax(I)V

    .line 195
    invoke-virtual {v0, p6, v2}, Landroidx/preference/SeekBarPreference;->setValueInternal(IZ)V

    .line 196
    invoke-static {p2, v4}, Lio/mesalabs/unica/settings/ui/LiveAlertsSettingsFragment;->formatSliderSummary(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object p6

    invoke-virtual {v0, p6}, Landroidx/preference/SeekBarPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 197
    new-instance p6, Lio/mesalabs/unica/settings/ui/LiveAlertsSettingsFragment$$ExternalSyntheticLambda0;

    move-object p0, p6

    move-object p6, p2

    move p2, p3

    move p3, p5

    move-object p5, p1

    move p1, v1

    invoke-direct/range {p0 .. p6}, Lio/mesalabs/unica/settings/ui/LiveAlertsSettingsFragment$$ExternalSyntheticLambda0;-><init>(IIIILandroid/content/ContentResolver;Ljava/lang/String;)V

    move-object p1, p0

    invoke-virtual {v0, p1}, Landroidx/preference/SeekBarPreference;->setOnPreferenceChangeListener(Landroidx/preference/Preference$OnPreferenceChangeListener;)V

    .line 207
    return-void
.end method

.method private static clamp(III)I
    .locals 0

    .line 282
    invoke-static {p2, p0}, Ljava/lang/Math;->min(II)I

    move-result p0

    invoke-static {p1, p0}, Ljava/lang/Math;->max(II)I

    move-result p0

    return p0
.end method

.method private static formatSliderSummary(Ljava/lang/String;I)Ljava/lang/String;
    .locals 1

    .line 210
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result v0

    sparse-switch v0, :sswitch_data_0

    :cond_0
    goto/16 :goto_0

    :sswitch_0
    const-string v0, "unica_live_alerts_height_offset_dp"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x5

    goto :goto_1

    :sswitch_1
    const-string v0, "unica_live_alerts_glass_opacity"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_1

    :sswitch_2
    const-string v0, "unica_live_alerts_gap_offset_dp"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x6

    goto :goto_1

    :sswitch_3
    const-string v0, "unica_live_alerts_anim_speed"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x3

    goto :goto_1

    :sswitch_4
    const-string v0, "unica_live_alerts_center_offset_dp"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 p0, 0x8

    goto :goto_1

    :sswitch_5
    const-string v0, "unica_live_alerts_rim_alpha"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x2

    goto :goto_1

    :sswitch_6
    const-string v0, "unica_live_alerts_anim_bounce"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x4

    goto :goto_1

    :sswitch_7
    const-string v0, "unica_live_alerts_expanded_width_dp"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 p0, 0x9

    goto :goto_1

    :sswitch_8
    const-string v0, "unica_live_alerts_top_offset_dp"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x7

    goto :goto_1

    :sswitch_9
    const-string v0, "unica_live_alerts_blur_radius"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x0

    goto :goto_1

    :goto_0
    const/4 p0, -0x1

    :goto_1
    const-string v0, "+"

    packed-switch p0, :pswitch_data_0

    .line 238
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 236
    :pswitch_0
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, " dp (Default: 336 dp)"

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 231
    :pswitch_1
    if-nez p1, :cond_1

    .line 232
    const-string p0, "0 dp (Camera centered)"

    return-object p0

    .line 234
    :cond_1
    new-instance p0, Ljava/lang/StringBuilder;

    if-lez p1, :cond_2

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, " dp right"

    goto :goto_2

    :cond_2
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, " dp left"

    :goto_2
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 226
    :pswitch_2
    if-nez p1, :cond_3

    .line 227
    const-string p0, "0 dp (Auto cutout fit)"

    return-object p0

    .line 229
    :cond_3
    if-lez p1, :cond_4

    goto :goto_3

    :cond_4
    const-string v0, ""

    :goto_3
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, " dp"

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 221
    :pswitch_3
    if-gtz p1, :cond_5

    const-string p0, "0% (Critically damped)"

    goto :goto_4

    .line 222
    :cond_5
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, "% (Default: 26%)"

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 221
    :goto_4
    return-object p0

    .line 219
    :pswitch_4
    sget-object p0, Ljava/util/Locale;->US:Ljava/util/Locale;

    int-to-float p1, p1

    const/high16 v0, 0x42c80000    # 100.0f

    div-float/2addr p1, v0

    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p1

    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object p1

    const-string v0, "%.1fx (Default: 1.0x)"

    invoke-static {p0, v0, p1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 217
    :pswitch_5
    if-gtz p1, :cond_6

    const-string p0, "Off"

    goto :goto_5

    :cond_6
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, "% (Default: 85%)"

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    :goto_5
    return-object p0

    .line 215
    :pswitch_6
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, "% (Default: 55%)"

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 212
    :pswitch_7
    if-gtz p1, :cond_7

    const-string p0, "Off (translucent glass only)"

    goto :goto_6

    .line 213
    :cond_7
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, " px (Default: 280 px)"

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 212
    :goto_6
    return-object p0

    nop

    :sswitch_data_0
    .sparse-switch
        -0x7816dbfc -> :sswitch_9
        -0x73d7ac98 -> :sswitch_8
        -0x4c3f947b -> :sswitch_7
        -0x398436f0 -> :sswitch_6
        -0x29059ff1 -> :sswitch_5
        -0x134b8c0c -> :sswitch_4
        -0x92d4341 -> :sswitch_3
        0x3c9f3a9 -> :sswitch_2
        0x5658862 -> :sswitch_1
        0xf6fda46 -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private static getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I
    .locals 0

    .line 261
    :try_start_0
    invoke-static {p0, p1, p2}, Landroid/provider/Settings$Secure;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return p0

    .line 262
    :catchall_0
    move-exception p0

    .line 263
    return p2
.end method

.method static synthetic lambda$bindSlider$0(IIIILandroid/content/ContentResolver;Ljava/lang/String;Landroidx/preference/Preference;Ljava/lang/Object;)Z
    .locals 2

    .line 198
    instance-of v0, p7, Ljava/lang/Integer;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 199
    return v1

    .line 201
    :cond_0
    check-cast p7, Ljava/lang/Integer;

    invoke-virtual {p7}, Ljava/lang/Integer;->intValue()I

    move-result p7

    invoke-static {p0, p7}, Ljava/lang/Math;->min(II)I

    move-result p0

    invoke-static {v1, p0}, Ljava/lang/Math;->max(II)I

    move-result p0

    .line 202
    mul-int/2addr p0, p2

    add-int/2addr p0, p1

    invoke-static {p0, p1, p3}, Lio/mesalabs/unica/settings/ui/LiveAlertsSettingsFragment;->clamp(III)I

    move-result p0

    .line 203
    invoke-static {p4, p5, p0}, Lio/mesalabs/unica/settings/ui/LiveAlertsSettingsFragment;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)V

    .line 204
    invoke-static {p5, p0}, Lio/mesalabs/unica/settings/ui/LiveAlertsSettingsFragment;->formatSliderSummary(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p6, p0}, Landroidx/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    .line 205
    const/4 p0, 0x1

    return p0
.end method

.method static synthetic lambda$refreshUi$2(Landroid/content/ContentResolver;Ljava/lang/String;Landroidx/preference/Preference;Ljava/lang/Object;)Z
    .locals 0

    .line 152
    sget-object p2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {p2, p3}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result p2

    invoke-static {p0, p1, p2}, Lio/mesalabs/unica/settings/ui/LiveAlertsSettingsFragment;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)V

    .line 153
    const/4 p0, 0x1

    return p0
.end method

.method private static putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)V
    .locals 0

    .line 269
    :try_start_0
    invoke-static {p0, p1, p2}, Landroid/provider/Settings$Secure;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 271
    goto :goto_0

    .line 270
    :catchall_0
    move-exception p0

    .line 272
    :goto_0
    return-void
.end method

.method private static putLong(Landroid/content/ContentResolver;Ljava/lang/String;J)V
    .locals 0

    .line 276
    :try_start_0
    invoke-static {p0, p1, p2, p3}, Landroid/provider/Settings$Secure;->putLong(Landroid/content/ContentResolver;Ljava/lang/String;J)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 278
    goto :goto_0

    .line 277
    :catchall_0
    move-exception p0

    .line 279
    :goto_0
    return-void
.end method

.method private refreshUi()V
    .locals 12

    .line 91
    invoke-virtual {p0}, Lio/mesalabs/unica/settings/ui/LiveAlertsSettingsFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 92
    if-nez v0, :cond_0

    .line 93
    return-void

    .line 95
    :cond_0
    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    .line 96
    const-string v1, "unica_live_alerts_enabled"

    const/4 v8, 0x1

    invoke-static {v2, v1, v8}, Lio/mesalabs/unica/settings/ui/LiveAlertsSettingsFragment;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v3

    const/4 v9, 0x0

    if-eqz v3, :cond_1

    move v10, v8

    goto :goto_0

    :cond_1
    move v10, v9

    .line 98
    :goto_0
    invoke-virtual {p0, v1}, Lio/mesalabs/unica/settings/ui/LiveAlertsSettingsFragment;->findPreference(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    move-result-object v1

    .line 99
    instance-of v3, v1, Landroidx/preference/TwoStatePreference;

    if-eqz v3, :cond_3

    .line 100
    move-object v3, v1

    check-cast v3, Landroidx/preference/TwoStatePreference;

    .line 101
    invoke-virtual {v3, v10}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 102
    if-eqz v10, :cond_2

    .line 103
    const-string v4, "Active around front camera punch-hole"

    goto :goto_1

    .line 104
    :cond_2
    const-string v4, "Disabled (status bar notifications only)"

    .line 102
    :goto_1
    invoke-virtual {v3, v4}, Landroidx/preference/TwoStatePreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 105
    new-instance v4, Lio/mesalabs/unica/settings/ui/LiveAlertsSettingsFragment$$ExternalSyntheticLambda1;

    invoke-direct {v4, p0, v2}, Lio/mesalabs/unica/settings/ui/LiveAlertsSettingsFragment$$ExternalSyntheticLambda1;-><init>(Lio/mesalabs/unica/settings/ui/LiveAlertsSettingsFragment;Landroid/content/ContentResolver;)V

    invoke-virtual {v3, v4}, Landroidx/preference/TwoStatePreference;->setOnPreferenceChangeListener(Landroidx/preference/Preference$OnPreferenceChangeListener;)V

    .line 116
    :cond_3
    const-string v3, "unica_live_alerts_preview"

    invoke-virtual {p0, v3}, Lio/mesalabs/unica/settings/ui/LiveAlertsSettingsFragment;->findPreference(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    move-result-object v3

    .line 117
    if-eqz v3, :cond_4

    .line 118
    new-instance v4, Lio/mesalabs/unica/settings/ui/LiveAlertsSettingsFragment$$ExternalSyntheticLambda2;

    invoke-direct {v4, p0, v2, v1, v0}, Lio/mesalabs/unica/settings/ui/LiveAlertsSettingsFragment$$ExternalSyntheticLambda2;-><init>(Lio/mesalabs/unica/settings/ui/LiveAlertsSettingsFragment;Landroid/content/ContentResolver;Landroidx/preference/Preference;Landroid/content/Context;)V

    invoke-virtual {v3, v4}, Landroidx/preference/Preference;->setOnPreferenceClickListener(Landroidx/preference/Preference$OnPreferenceClickListener;)V

    .line 133
    :cond_4
    const/16 v6, 0xa

    const/16 v7, 0x118

    const-string v3, "unica_live_alerts_blur_radius"

    const/4 v4, 0x0

    const/16 v5, 0x190

    move-object v1, p0

    invoke-direct/range {v1 .. v7}, Lio/mesalabs/unica/settings/ui/LiveAlertsSettingsFragment;->bindSlider(Landroid/content/ContentResolver;Ljava/lang/String;IIII)V

    .line 134
    const/4 v6, 0x5

    const/16 v7, 0x37

    const-string v3, "unica_live_alerts_glass_opacity"

    const/16 v4, 0x19

    const/16 v5, 0x5f

    invoke-direct/range {v1 .. v7}, Lio/mesalabs/unica/settings/ui/LiveAlertsSettingsFragment;->bindSlider(Landroid/content/ContentResolver;Ljava/lang/String;IIII)V

    .line 135
    const/16 v7, 0x55

    const-string v3, "unica_live_alerts_rim_alpha"

    const/4 v4, 0x0

    const/16 v5, 0x64

    invoke-direct/range {v1 .. v7}, Lio/mesalabs/unica/settings/ui/LiveAlertsSettingsFragment;->bindSlider(Landroid/content/ContentResolver;Ljava/lang/String;IIII)V

    .line 137
    const/16 v6, 0xa

    const/16 v7, 0x64

    const-string v3, "unica_live_alerts_anim_speed"

    const/16 v4, 0x32

    const/16 v5, 0xa0

    invoke-direct/range {v1 .. v7}, Lio/mesalabs/unica/settings/ui/LiveAlertsSettingsFragment;->bindSlider(Landroid/content/ContentResolver;Ljava/lang/String;IIII)V

    .line 138
    const/4 v6, 0x2

    const/16 v7, 0x1a

    const-string v3, "unica_live_alerts_anim_bounce"

    const/4 v4, 0x0

    const/16 v5, 0x28

    invoke-direct/range {v1 .. v7}, Lio/mesalabs/unica/settings/ui/LiveAlertsSettingsFragment;->bindSlider(Landroid/content/ContentResolver;Ljava/lang/String;IIII)V

    .line 140
    const/4 v6, 0x1

    const/4 v7, 0x0

    const-string v3, "unica_live_alerts_height_offset_dp"

    const/4 v4, -0x4

    const/16 v5, 0x8

    invoke-direct/range {v1 .. v7}, Lio/mesalabs/unica/settings/ui/LiveAlertsSettingsFragment;->bindSlider(Landroid/content/ContentResolver;Ljava/lang/String;IIII)V

    .line 141
    const-string v3, "unica_live_alerts_gap_offset_dp"

    const/4 v4, -0x6

    const/16 v5, 0xa

    invoke-direct/range {v1 .. v7}, Lio/mesalabs/unica/settings/ui/LiveAlertsSettingsFragment;->bindSlider(Landroid/content/ContentResolver;Ljava/lang/String;IIII)V

    .line 142
    const-string v3, "unica_live_alerts_top_offset_dp"

    const/16 v5, 0xc

    invoke-direct/range {v1 .. v7}, Lio/mesalabs/unica/settings/ui/LiveAlertsSettingsFragment;->bindSlider(Landroid/content/ContentResolver;Ljava/lang/String;IIII)V

    .line 143
    const-string v3, "unica_live_alerts_center_offset_dp"

    const/16 v4, -0xa

    const/16 v5, 0xa

    invoke-direct/range {v1 .. v7}, Lio/mesalabs/unica/settings/ui/LiveAlertsSettingsFragment;->bindSlider(Landroid/content/ContentResolver;Ljava/lang/String;IIII)V

    .line 144
    const/4 v6, 0x2

    const/16 v7, 0x150

    const-string v3, "unica_live_alerts_expanded_width_dp"

    const/16 v4, 0x128

    const/16 v5, 0x168

    invoke-direct/range {v1 .. v7}, Lio/mesalabs/unica/settings/ui/LiveAlertsSettingsFragment;->bindSlider(Landroid/content/ContentResolver;Ljava/lang/String;IIII)V

    .line 146
    sget-object v3, Lio/mesalabs/unica/settings/ui/LiveAlertsSettingsFragment;->CATEGORY_KEYS:[Ljava/lang/String;

    array-length v4, v3

    move v5, v9

    :goto_2
    if-ge v5, v4, :cond_7

    aget-object v6, v3, v5

    .line 147
    invoke-virtual {p0, v6}, Lio/mesalabs/unica/settings/ui/LiveAlertsSettingsFragment;->findPreference(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    move-result-object v7

    .line 148
    instance-of v11, v7, Landroidx/preference/TwoStatePreference;

    if-eqz v11, :cond_6

    .line 149
    check-cast v7, Landroidx/preference/TwoStatePreference;

    .line 150
    invoke-static {v2, v6, v8}, Lio/mesalabs/unica/settings/ui/LiveAlertsSettingsFragment;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v11

    if-eqz v11, :cond_5

    move v11, v8

    goto :goto_3

    :cond_5
    move v11, v9

    :goto_3
    invoke-virtual {v7, v11}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 151
    new-instance v11, Lio/mesalabs/unica/settings/ui/LiveAlertsSettingsFragment$$ExternalSyntheticLambda3;

    invoke-direct {v11, v2, v6}, Lio/mesalabs/unica/settings/ui/LiveAlertsSettingsFragment$$ExternalSyntheticLambda3;-><init>(Landroid/content/ContentResolver;Ljava/lang/String;)V

    invoke-virtual {v7, v11}, Landroidx/preference/TwoStatePreference;->setOnPreferenceChangeListener(Landroidx/preference/Preference$OnPreferenceChangeListener;)V

    .line 146
    :cond_6
    add-int/lit8 v5, v5, 0x1

    goto :goto_2

    .line 158
    :cond_7
    const-string v3, "unica_live_alerts_reset"

    invoke-virtual {p0, v3}, Lio/mesalabs/unica/settings/ui/LiveAlertsSettingsFragment;->findPreference(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    move-result-object v3

    .line 159
    if-eqz v3, :cond_8

    .line 160
    new-instance v4, Lio/mesalabs/unica/settings/ui/LiveAlertsSettingsFragment$$ExternalSyntheticLambda4;

    invoke-direct {v4, p0, v2, v0}, Lio/mesalabs/unica/settings/ui/LiveAlertsSettingsFragment$$ExternalSyntheticLambda4;-><init>(Lio/mesalabs/unica/settings/ui/LiveAlertsSettingsFragment;Landroid/content/ContentResolver;Landroid/content/Context;)V

    invoke-virtual {v3, v4}, Landroidx/preference/Preference;->setOnPreferenceClickListener(Landroidx/preference/Preference$OnPreferenceClickListener;)V

    .line 168
    :cond_8
    invoke-direct {p0, v10}, Lio/mesalabs/unica/settings/ui/LiveAlertsSettingsFragment;->updateDependentEnabled(Z)V

    .line 169
    return-void
.end method

.method private static resetToDefaults(Landroid/content/ContentResolver;)V
    .locals 5

    .line 243
    const-string v0, "unica_live_alerts_enabled"

    const/4 v1, 0x1

    invoke-static {p0, v0, v1}, Lio/mesalabs/unica/settings/ui/LiveAlertsSettingsFragment;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)V

    .line 244
    const-string v0, "unica_live_alerts_blur_radius"

    const/16 v2, 0x118

    invoke-static {p0, v0, v2}, Lio/mesalabs/unica/settings/ui/LiveAlertsSettingsFragment;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)V

    .line 245
    const-string v0, "unica_live_alerts_glass_opacity"

    const/16 v2, 0x37

    invoke-static {p0, v0, v2}, Lio/mesalabs/unica/settings/ui/LiveAlertsSettingsFragment;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)V

    .line 246
    const-string v0, "unica_live_alerts_rim_alpha"

    const/16 v2, 0x55

    invoke-static {p0, v0, v2}, Lio/mesalabs/unica/settings/ui/LiveAlertsSettingsFragment;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)V

    .line 247
    const-string v0, "unica_live_alerts_anim_speed"

    const/16 v2, 0x64

    invoke-static {p0, v0, v2}, Lio/mesalabs/unica/settings/ui/LiveAlertsSettingsFragment;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)V

    .line 248
    const-string v0, "unica_live_alerts_anim_bounce"

    const/16 v2, 0x1a

    invoke-static {p0, v0, v2}, Lio/mesalabs/unica/settings/ui/LiveAlertsSettingsFragment;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)V

    .line 249
    const-string v0, "unica_live_alerts_height_offset_dp"

    const/4 v2, 0x0

    invoke-static {p0, v0, v2}, Lio/mesalabs/unica/settings/ui/LiveAlertsSettingsFragment;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)V

    .line 250
    const-string v0, "unica_live_alerts_gap_offset_dp"

    invoke-static {p0, v0, v2}, Lio/mesalabs/unica/settings/ui/LiveAlertsSettingsFragment;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)V

    .line 251
    const-string v0, "unica_live_alerts_top_offset_dp"

    invoke-static {p0, v0, v2}, Lio/mesalabs/unica/settings/ui/LiveAlertsSettingsFragment;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)V

    .line 252
    const-string v0, "unica_live_alerts_center_offset_dp"

    invoke-static {p0, v0, v2}, Lio/mesalabs/unica/settings/ui/LiveAlertsSettingsFragment;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)V

    .line 253
    const-string v0, "unica_live_alerts_expanded_width_dp"

    const/16 v3, 0x150

    invoke-static {p0, v0, v3}, Lio/mesalabs/unica/settings/ui/LiveAlertsSettingsFragment;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)V

    .line 254
    sget-object v0, Lio/mesalabs/unica/settings/ui/LiveAlertsSettingsFragment;->CATEGORY_KEYS:[Ljava/lang/String;

    array-length v3, v0

    :goto_0
    if-ge v2, v3, :cond_0

    aget-object v4, v0, v2

    .line 255
    invoke-static {p0, v4, v1}, Lio/mesalabs/unica/settings/ui/LiveAlertsSettingsFragment;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)V

    .line 254
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 257
    :cond_0
    return-void
.end method

.method private updateDependentEnabled(Z)V
    .locals 4

    .line 172
    sget-object v0, Lio/mesalabs/unica/settings/ui/LiveAlertsSettingsFragment;->DEPENDENT_KEYS:[Ljava/lang/String;

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-object v3, v0, v2

    .line 173
    invoke-virtual {p0, v3}, Lio/mesalabs/unica/settings/ui/LiveAlertsSettingsFragment;->findPreference(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    move-result-object v3

    .line 174
    if-eqz v3, :cond_0

    .line 175
    invoke-virtual {v3, p1}, Landroidx/preference/Preference;->setEnabled(Z)V

    .line 172
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 178
    :cond_1
    return-void
.end method


# virtual methods
.method public getLogTag()Ljava/lang/String;
    .locals 1

    .line 64
    const-string v0, "LiveAlertsSettingsFragment"

    return-object v0
.end method

.method public getMetricsCategory()I
    .locals 1

    .line 69
    const/16 v0, 0x2e8

    return v0
.end method

.method public getPreferenceScreenResId()I
    .locals 2

    .line 74
    const-string v0, "xml"

    const-string v1, "unica_live_alerts_settings"

    invoke-static {v0, v1}, Lio/mesalabs/unica/utils/Utils;->getResourceId(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method synthetic lambda$refreshUi$0$io-mesalabs-unica-settings-ui-LiveAlertsSettingsFragment(Landroid/content/ContentResolver;Landroidx/preference/Preference;Ljava/lang/Object;)Z
    .locals 1

    .line 106
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v0, p3}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result p3

    .line 107
    const-string v0, "unica_live_alerts_enabled"

    invoke-static {p1, v0, p3}, Lio/mesalabs/unica/settings/ui/LiveAlertsSettingsFragment;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)V

    .line 108
    if-eqz p3, :cond_0

    .line 109
    const-string p1, "Active around front camera punch-hole"

    goto :goto_0

    .line 110
    :cond_0
    const-string p1, "Disabled (status bar notifications only)"

    .line 108
    :goto_0
    invoke-virtual {p2, p1}, Landroidx/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    .line 111
    invoke-direct {p0, p3}, Lio/mesalabs/unica/settings/ui/LiveAlertsSettingsFragment;->updateDependentEnabled(Z)V

    .line 112
    const/4 p1, 0x1

    return p1
.end method

.method synthetic lambda$refreshUi$1$io-mesalabs-unica-settings-ui-LiveAlertsSettingsFragment(Landroid/content/ContentResolver;Landroidx/preference/Preference;Landroid/content/Context;Landroidx/preference/Preference;)Z
    .locals 3

    .line 119
    const-string p4, "unica_live_alerts_enabled"

    const/4 v0, 0x1

    invoke-static {p1, p4, v0}, Lio/mesalabs/unica/settings/ui/LiveAlertsSettingsFragment;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v1

    if-nez v1, :cond_1

    .line 120
    invoke-static {p1, p4, v0}, Lio/mesalabs/unica/settings/ui/LiveAlertsSettingsFragment;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)V

    .line 121
    instance-of p4, p2, Landroidx/preference/TwoStatePreference;

    if-eqz p4, :cond_0

    .line 122
    move-object p4, p2

    check-cast p4, Landroidx/preference/TwoStatePreference;

    invoke-virtual {p4, v0}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 123
    const-string p4, "Active around front camera punch-hole"

    invoke-virtual {p2, p4}, Landroidx/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    .line 125
    :cond_0
    invoke-direct {p0, v0}, Lio/mesalabs/unica/settings/ui/LiveAlertsSettingsFragment;->updateDependentEnabled(Z)V

    .line 127
    :cond_1
    const-string p2, "unica_live_alerts_preview_nonce"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-static {p1, p2, v1, v2}, Lio/mesalabs/unica/settings/ui/LiveAlertsSettingsFragment;->putLong(Landroid/content/ContentResolver;Ljava/lang/String;J)V

    .line 128
    const-string p1, "Live Alert preview triggered"

    const/4 p2, 0x0

    invoke-static {p3, p1, p2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    .line 129
    return v0
.end method

.method synthetic lambda$refreshUi$3$io-mesalabs-unica-settings-ui-LiveAlertsSettingsFragment(Landroid/content/ContentResolver;Landroid/content/Context;Landroidx/preference/Preference;)Z
    .locals 0

    .line 161
    invoke-static {p1}, Lio/mesalabs/unica/settings/ui/LiveAlertsSettingsFragment;->resetToDefaults(Landroid/content/ContentResolver;)V

    .line 162
    invoke-direct {p0}, Lio/mesalabs/unica/settings/ui/LiveAlertsSettingsFragment;->refreshUi()V

    .line 163
    const-string p1, "Reset to OxygenOS 16 defaults"

    const/4 p3, 0x0

    invoke-static {p2, p1, p3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    .line 164
    const/4 p1, 0x1

    return p1
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 0

    .line 79
    invoke-super {p0, p1}, Lcom/android/settings/dashboard/DashboardFragment;->onCreate(Landroid/os/Bundle;)V

    .line 80
    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Lio/mesalabs/unica/settings/ui/LiveAlertsSettingsFragment;->setAnimationAllowed(Z)V

    .line 81
    invoke-direct {p0}, Lio/mesalabs/unica/settings/ui/LiveAlertsSettingsFragment;->refreshUi()V

    .line 82
    return-void
.end method

.method public onResume()V
    .locals 0

    .line 86
    invoke-super {p0}, Lcom/android/settings/dashboard/DashboardFragment;->onResume()V

    .line 87
    invoke-direct {p0}, Lio/mesalabs/unica/settings/ui/LiveAlertsSettingsFragment;->refreshUi()V

    .line 88
    return-void
.end method
