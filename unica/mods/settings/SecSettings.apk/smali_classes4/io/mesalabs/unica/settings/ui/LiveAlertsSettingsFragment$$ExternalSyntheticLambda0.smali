.class public final synthetic Lio/mesalabs/unica/settings/ui/LiveAlertsSettingsFragment$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroidx/preference/Preference$OnPreferenceChangeListener;


# instance fields
.field public final synthetic f$0:I

.field public final synthetic f$1:I

.field public final synthetic f$2:I

.field public final synthetic f$3:I

.field public final synthetic f$4:Landroid/content/ContentResolver;

.field public final synthetic f$5:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(IIIILandroid/content/ContentResolver;Ljava/lang/String;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lio/mesalabs/unica/settings/ui/LiveAlertsSettingsFragment$$ExternalSyntheticLambda0;->f$0:I

    iput p2, p0, Lio/mesalabs/unica/settings/ui/LiveAlertsSettingsFragment$$ExternalSyntheticLambda0;->f$1:I

    iput p3, p0, Lio/mesalabs/unica/settings/ui/LiveAlertsSettingsFragment$$ExternalSyntheticLambda0;->f$2:I

    iput p4, p0, Lio/mesalabs/unica/settings/ui/LiveAlertsSettingsFragment$$ExternalSyntheticLambda0;->f$3:I

    iput-object p5, p0, Lio/mesalabs/unica/settings/ui/LiveAlertsSettingsFragment$$ExternalSyntheticLambda0;->f$4:Landroid/content/ContentResolver;

    iput-object p6, p0, Lio/mesalabs/unica/settings/ui/LiveAlertsSettingsFragment$$ExternalSyntheticLambda0;->f$5:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final onPreferenceChange(Landroidx/preference/Preference;Ljava/lang/Object;)Z
    .locals 8

    .line 0
    iget v0, p0, Lio/mesalabs/unica/settings/ui/LiveAlertsSettingsFragment$$ExternalSyntheticLambda0;->f$0:I

    iget v1, p0, Lio/mesalabs/unica/settings/ui/LiveAlertsSettingsFragment$$ExternalSyntheticLambda0;->f$1:I

    iget v2, p0, Lio/mesalabs/unica/settings/ui/LiveAlertsSettingsFragment$$ExternalSyntheticLambda0;->f$2:I

    iget v3, p0, Lio/mesalabs/unica/settings/ui/LiveAlertsSettingsFragment$$ExternalSyntheticLambda0;->f$3:I

    iget-object v4, p0, Lio/mesalabs/unica/settings/ui/LiveAlertsSettingsFragment$$ExternalSyntheticLambda0;->f$4:Landroid/content/ContentResolver;

    iget-object v5, p0, Lio/mesalabs/unica/settings/ui/LiveAlertsSettingsFragment$$ExternalSyntheticLambda0;->f$5:Ljava/lang/String;

    move-object v6, p1

    move-object v7, p2

    invoke-static/range {v0 .. v7}, Lio/mesalabs/unica/settings/ui/LiveAlertsSettingsFragment;->lambda$bindSlider$0(IIIILandroid/content/ContentResolver;Ljava/lang/String;Landroidx/preference/Preference;Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method
