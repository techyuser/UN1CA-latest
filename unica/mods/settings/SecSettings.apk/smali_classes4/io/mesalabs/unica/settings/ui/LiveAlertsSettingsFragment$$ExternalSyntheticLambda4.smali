.class public final synthetic Lio/mesalabs/unica/settings/ui/LiveAlertsSettingsFragment$$ExternalSyntheticLambda4;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroidx/preference/Preference$OnPreferenceClickListener;


# instance fields
.field public final synthetic f$0:Lio/mesalabs/unica/settings/ui/LiveAlertsSettingsFragment;

.field public final synthetic f$1:Landroid/content/ContentResolver;

.field public final synthetic f$2:Landroid/content/Context;


# direct methods
.method public synthetic constructor <init>(Lio/mesalabs/unica/settings/ui/LiveAlertsSettingsFragment;Landroid/content/ContentResolver;Landroid/content/Context;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lio/mesalabs/unica/settings/ui/LiveAlertsSettingsFragment$$ExternalSyntheticLambda4;->f$0:Lio/mesalabs/unica/settings/ui/LiveAlertsSettingsFragment;

    iput-object p2, p0, Lio/mesalabs/unica/settings/ui/LiveAlertsSettingsFragment$$ExternalSyntheticLambda4;->f$1:Landroid/content/ContentResolver;

    iput-object p3, p0, Lio/mesalabs/unica/settings/ui/LiveAlertsSettingsFragment$$ExternalSyntheticLambda4;->f$2:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method public final onPreferenceClick(Landroidx/preference/Preference;)Z
    .locals 3

    .line 0
    iget-object v0, p0, Lio/mesalabs/unica/settings/ui/LiveAlertsSettingsFragment$$ExternalSyntheticLambda4;->f$0:Lio/mesalabs/unica/settings/ui/LiveAlertsSettingsFragment;

    iget-object v1, p0, Lio/mesalabs/unica/settings/ui/LiveAlertsSettingsFragment$$ExternalSyntheticLambda4;->f$1:Landroid/content/ContentResolver;

    iget-object v2, p0, Lio/mesalabs/unica/settings/ui/LiveAlertsSettingsFragment$$ExternalSyntheticLambda4;->f$2:Landroid/content/Context;

    invoke-virtual {v0, v1, v2, p1}, Lio/mesalabs/unica/settings/ui/LiveAlertsSettingsFragment;->lambda$refreshUi$3$io-mesalabs-unica-settings-ui-LiveAlertsSettingsFragment(Landroid/content/ContentResolver;Landroid/content/Context;Landroidx/preference/Preference;)Z

    move-result p1

    return p1
.end method
