.class public final synthetic Lio/mesalabs/unica/settings/ui/LiveAlertsSettingsFragment$$ExternalSyntheticLambda2;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroidx/preference/Preference$OnPreferenceClickListener;


# instance fields
.field public final synthetic f$0:Lio/mesalabs/unica/settings/ui/LiveAlertsSettingsFragment;

.field public final synthetic f$1:Landroid/content/ContentResolver;

.field public final synthetic f$2:Landroidx/preference/Preference;

.field public final synthetic f$3:Landroid/content/Context;


# direct methods
.method public synthetic constructor <init>(Lio/mesalabs/unica/settings/ui/LiveAlertsSettingsFragment;Landroid/content/ContentResolver;Landroidx/preference/Preference;Landroid/content/Context;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lio/mesalabs/unica/settings/ui/LiveAlertsSettingsFragment$$ExternalSyntheticLambda2;->f$0:Lio/mesalabs/unica/settings/ui/LiveAlertsSettingsFragment;

    iput-object p2, p0, Lio/mesalabs/unica/settings/ui/LiveAlertsSettingsFragment$$ExternalSyntheticLambda2;->f$1:Landroid/content/ContentResolver;

    iput-object p3, p0, Lio/mesalabs/unica/settings/ui/LiveAlertsSettingsFragment$$ExternalSyntheticLambda2;->f$2:Landroidx/preference/Preference;

    iput-object p4, p0, Lio/mesalabs/unica/settings/ui/LiveAlertsSettingsFragment$$ExternalSyntheticLambda2;->f$3:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method public final onPreferenceClick(Landroidx/preference/Preference;)Z
    .locals 4

    .line 0
    iget-object v0, p0, Lio/mesalabs/unica/settings/ui/LiveAlertsSettingsFragment$$ExternalSyntheticLambda2;->f$0:Lio/mesalabs/unica/settings/ui/LiveAlertsSettingsFragment;

    iget-object v1, p0, Lio/mesalabs/unica/settings/ui/LiveAlertsSettingsFragment$$ExternalSyntheticLambda2;->f$1:Landroid/content/ContentResolver;

    iget-object v2, p0, Lio/mesalabs/unica/settings/ui/LiveAlertsSettingsFragment$$ExternalSyntheticLambda2;->f$2:Landroidx/preference/Preference;

    iget-object v3, p0, Lio/mesalabs/unica/settings/ui/LiveAlertsSettingsFragment$$ExternalSyntheticLambda2;->f$3:Landroid/content/Context;

    invoke-virtual {v0, v1, v2, v3, p1}, Lio/mesalabs/unica/settings/ui/LiveAlertsSettingsFragment;->lambda$refreshUi$1$io-mesalabs-unica-settings-ui-LiveAlertsSettingsFragment(Landroid/content/ContentResolver;Landroidx/preference/Preference;Landroid/content/Context;Landroidx/preference/Preference;)Z

    move-result p1

    return p1
.end method
