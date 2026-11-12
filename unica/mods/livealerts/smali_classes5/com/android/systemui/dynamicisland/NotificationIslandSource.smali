.class public final Lcom/android/systemui/dynamicisland/NotificationIslandSource;
.super Ljava/lang/Object;
.source "NotificationIslandSource.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/systemui/dynamicisland/NotificationIslandSource$Listener;,
        Lcom/android/systemui/dynamicisland/NotificationIslandSource$BrandProfile;,
        Lcom/android/systemui/dynamicisland/NotificationIslandSource$ExtractedRemoteData;
    }
.end annotation


# static fields
.field private static final BRAND_PROFILES:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/android/systemui/dynamicisland/NotificationIslandSource$BrandProfile;",
            ">;"
        }
    .end annotation
.end field

.field private static final CLOCK_PACKAGES:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final ETA_PATTERN:Ljava/util/regex/Pattern;

.field private static final FLAG_PROMOTED_ONGOING:I = 0x2000

.field private static final SYSTEM_NOISE_PACKAGES:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final TIME_PATTERN:Ljava/util/regex/Pattern;

.field private static sActionsField:Ljava/lang/reflect/Field;

.field private static sActionsProbed:Z

.field private static sChronoStartedField:Ljava/lang/reflect/Field;


# instance fields
.field private final mActiveOngoingKeys:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final mContext:Landroid/content/Context;

.field private final mListener:Lcom/android/systemui/dynamicisland/NotificationIslandSource$Listener;

.field private final mRecentPeeks:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 47
    const-string v0, "\\b(\\d{1,3}\\s*(?:min(?:ute)?s?|hr(?:s)?|sec(?:ond)?s?|m|h))\\b"

    const/4 v1, 0x2

    invoke-static {v0, v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->ETA_PATTERN:Ljava/util/regex/Pattern;

    .line 51
    const-string v0, "\\b(?:(\\d{1,2}):)?([0-5]?\\d):([0-5]\\d)\\b"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->TIME_PATTERN:Ljava/util/regex/Pattern;

    .line 55
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    sput-object v0, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->CLOCK_PACKAGES:Ljava/util/Set;

    .line 56
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->BRAND_PROFILES:Ljava/util/Map;

    .line 57
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    sput-object v0, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->SYSTEM_NOISE_PACKAGES:Ljava/util/Set;

    .line 60
    sget-object v0, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->CLOCK_PACKAGES:Ljava/util/Set;

    const-string v1, "com.sec.android.app.clockpackage"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 61
    sget-object v0, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->CLOCK_PACKAGES:Ljava/util/Set;

    const-string v1, "com.google.android.deskclock"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 62
    sget-object v0, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->CLOCK_PACKAGES:Ljava/util/Set;

    const-string v1, "com.android.deskclock"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 63
    sget-object v0, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->CLOCK_PACKAGES:Ljava/util/Set;

    const-string v1, "com.oneplus.deskclock"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 64
    sget-object v0, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->CLOCK_PACKAGES:Ljava/util/Set;

    const-string v1, "com.coloros.alarmclock"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 67
    sget-object v0, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->BRAND_PROFILES:Ljava/util/Map;

    new-instance v1, Lcom/android/systemui/dynamicisland/NotificationIslandSource$BrandProfile;

    sget-object v2, Lcom/android/systemui/dynamicisland/IslandItem$Category;->LIVE_DELIVERY:Lcom/android/systemui/dynamicisland/IslandItem$Category;

    const v3, -0x1dc8bc

    const-string v4, "Zomato"

    invoke-direct {v1, v2, v3, v4}, Lcom/android/systemui/dynamicisland/NotificationIslandSource$BrandProfile;-><init>(Lcom/android/systemui/dynamicisland/IslandItem$Category;ILjava/lang/String;)V

    const-string v2, "com.application.zomato"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 68
    sget-object v0, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->BRAND_PROFILES:Ljava/util/Map;

    new-instance v1, Lcom/android/systemui/dynamicisland/NotificationIslandSource$BrandProfile;

    sget-object v2, Lcom/android/systemui/dynamicisland/IslandItem$Category;->LIVE_DELIVERY:Lcom/android/systemui/dynamicisland/IslandItem$Category;

    const v3, -0x37fe7

    const-string v4, "Swiggy"

    invoke-direct {v1, v2, v3, v4}, Lcom/android/systemui/dynamicisland/NotificationIslandSource$BrandProfile;-><init>(Lcom/android/systemui/dynamicisland/IslandItem$Category;ILjava/lang/String;)V

    const-string v2, "in.swiggy.android"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 69
    sget-object v0, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->BRAND_PROFILES:Ljava/util/Map;

    new-instance v1, Lcom/android/systemui/dynamicisland/NotificationIslandSource$BrandProfile;

    sget-object v2, Lcom/android/systemui/dynamicisland/IslandItem$Category;->LIVE_DELIVERY:Lcom/android/systemui/dynamicisland/IslandItem$Category;

    const v3, -0x734ba

    const-string v4, "Blinkit"

    invoke-direct {v1, v2, v3, v4}, Lcom/android/systemui/dynamicisland/NotificationIslandSource$BrandProfile;-><init>(Lcom/android/systemui/dynamicisland/IslandItem$Category;ILjava/lang/String;)V

    const-string v2, "com.grofers.customerapp"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 70
    sget-object v0, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->BRAND_PROFILES:Ljava/util/Map;

    new-instance v1, Lcom/android/systemui/dynamicisland/NotificationIslandSource$BrandProfile;

    sget-object v2, Lcom/android/systemui/dynamicisland/IslandItem$Category;->LIVE_DELIVERY:Lcom/android/systemui/dynamicisland/IslandItem$Category;

    const v3, -0x4fbd01

    const-string v4, "Zepto"

    invoke-direct {v1, v2, v3, v4}, Lcom/android/systemui/dynamicisland/NotificationIslandSource$BrandProfile;-><init>(Lcom/android/systemui/dynamicisland/IslandItem$Category;ILjava/lang/String;)V

    const-string v2, "com.zeptoconsumerapp"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 71
    sget-object v0, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->BRAND_PROFILES:Ljava/util/Map;

    new-instance v1, Lcom/android/systemui/dynamicisland/NotificationIslandSource$BrandProfile;

    sget-object v2, Lcom/android/systemui/dynamicisland/IslandItem$Category;->LIVE_DELIVERY:Lcom/android/systemui/dynamicisland/IslandItem$Category;

    const v3, -0x7b3ddb

    const-string v4, "BigBasket"

    invoke-direct {v1, v2, v3, v4}, Lcom/android/systemui/dynamicisland/NotificationIslandSource$BrandProfile;-><init>(Lcom/android/systemui/dynamicisland/IslandItem$Category;ILjava/lang/String;)V

    const-string v2, "com.bigbasket.mobileapp"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 72
    sget-object v0, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->BRAND_PROFILES:Ljava/util/Map;

    new-instance v1, Lcom/android/systemui/dynamicisland/NotificationIslandSource$BrandProfile;

    sget-object v2, Lcom/android/systemui/dynamicisland/IslandItem$Category;->LIVE_DELIVERY:Lcom/android/systemui/dynamicisland/IslandItem$Category;

    const v3, -0xff9b6f

    const-string v4, "Domino\'s"

    invoke-direct {v1, v2, v3, v4}, Lcom/android/systemui/dynamicisland/NotificationIslandSource$BrandProfile;-><init>(Lcom/android/systemui/dynamicisland/IslandItem$Category;ILjava/lang/String;)V

    const-string v2, "com.Dominos"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 73
    sget-object v0, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->BRAND_PROFILES:Ljava/util/Map;

    new-instance v1, Lcom/android/systemui/dynamicisland/NotificationIslandSource$BrandProfile;

    sget-object v2, Lcom/android/systemui/dynamicisland/IslandItem$Category;->LIVE_DELIVERY:Lcom/android/systemui/dynamicisland/IslandItem$Category;

    const/16 v3, -0x43f3

    const-string v4, "McDelivery"

    invoke-direct {v1, v2, v3, v4}, Lcom/android/systemui/dynamicisland/NotificationIslandSource$BrandProfile;-><init>(Lcom/android/systemui/dynamicisland/IslandItem$Category;ILjava/lang/String;)V

    const-string v2, "in.co.mcdonalds.consumer"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 74
    sget-object v0, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->BRAND_PROFILES:Ljava/util/Map;

    new-instance v1, Lcom/android/systemui/dynamicisland/NotificationIslandSource$BrandProfile;

    sget-object v2, Lcom/android/systemui/dynamicisland/IslandItem$Category;->LIVE_DELIVERY:Lcom/android/systemui/dynamicisland/IslandItem$Category;

    const v3, -0x84c317

    const-string v4, "EatSure"

    invoke-direct {v1, v2, v3, v4}, Lcom/android/systemui/dynamicisland/NotificationIslandSource$BrandProfile;-><init>(Lcom/android/systemui/dynamicisland/IslandItem$Category;ILjava/lang/String;)V

    const-string v2, "com.done.faasos"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 75
    sget-object v0, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->BRAND_PROFILES:Ljava/util/Map;

    new-instance v1, Lcom/android/systemui/dynamicisland/NotificationIslandSource$BrandProfile;

    sget-object v2, Lcom/android/systemui/dynamicisland/IslandItem$Category;->LIVE_DELIVERY:Lcom/android/systemui/dynamicisland/IslandItem$Category;

    const v3, -0x83b201

    const-string v4, "magicpin"

    invoke-direct {v1, v2, v3, v4}, Lcom/android/systemui/dynamicisland/NotificationIslandSource$BrandProfile;-><init>(Lcom/android/systemui/dynamicisland/IslandItem$Category;ILjava/lang/String;)V

    const-string v2, "com.magicpin.android"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 76
    sget-object v0, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->BRAND_PROFILES:Ljava/util/Map;

    new-instance v1, Lcom/android/systemui/dynamicisland/NotificationIslandSource$BrandProfile;

    sget-object v2, Lcom/android/systemui/dynamicisland/IslandItem$Category;->LIVE_DELIVERY:Lcom/android/systemui/dynamicisland/IslandItem$Category;

    const v3, -0xd78b10

    const-string v4, "Flipkart"

    invoke-direct {v1, v2, v3, v4}, Lcom/android/systemui/dynamicisland/NotificationIslandSource$BrandProfile;-><init>(Lcom/android/systemui/dynamicisland/IslandItem$Category;ILjava/lang/String;)V

    const-string v2, "com.flipkart.android"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 77
    sget-object v0, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->BRAND_PROFILES:Ljava/util/Map;

    new-instance v1, Lcom/android/systemui/dynamicisland/NotificationIslandSource$BrandProfile;

    sget-object v2, Lcom/android/systemui/dynamicisland/IslandItem$Category;->LIVE_DELIVERY:Lcom/android/systemui/dynamicisland/IslandItem$Category;

    const/16 v3, -0x6700

    const-string v4, "Amazon"

    invoke-direct {v1, v2, v3, v4}, Lcom/android/systemui/dynamicisland/NotificationIslandSource$BrandProfile;-><init>(Lcom/android/systemui/dynamicisland/IslandItem$Category;ILjava/lang/String;)V

    const-string v2, "in.amazon.mShop.android.shopping"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 80
    sget-object v0, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->BRAND_PROFILES:Ljava/util/Map;

    new-instance v1, Lcom/android/systemui/dynamicisland/NotificationIslandSource$BrandProfile;

    sget-object v2, Lcom/android/systemui/dynamicisland/IslandItem$Category;->LIVE_RIDE:Lcom/android/systemui/dynamicisland/IslandItem$Category;

    const v3, -0xc7368a

    const-string v4, "Uber"

    invoke-direct {v1, v2, v3, v4}, Lcom/android/systemui/dynamicisland/NotificationIslandSource$BrandProfile;-><init>(Lcom/android/systemui/dynamicisland/IslandItem$Category;ILjava/lang/String;)V

    const-string v2, "com.ubercab"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 81
    sget-object v0, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->BRAND_PROFILES:Ljava/util/Map;

    new-instance v1, Lcom/android/systemui/dynamicisland/NotificationIslandSource$BrandProfile;

    sget-object v2, Lcom/android/systemui/dynamicisland/IslandItem$Category;->LIVE_RIDE:Lcom/android/systemui/dynamicisland/IslandItem$Category;

    const v3, -0x3a17d2

    const-string v4, "Ola"

    invoke-direct {v1, v2, v3, v4}, Lcom/android/systemui/dynamicisland/NotificationIslandSource$BrandProfile;-><init>(Lcom/android/systemui/dynamicisland/IslandItem$Category;ILjava/lang/String;)V

    const-string v2, "com.olacabs.customer"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 82
    sget-object v0, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->BRAND_PROFILES:Ljava/util/Map;

    new-instance v1, Lcom/android/systemui/dynamicisland/NotificationIslandSource$BrandProfile;

    sget-object v2, Lcom/android/systemui/dynamicisland/IslandItem$Category;->LIVE_RIDE:Lcom/android/systemui/dynamicisland/IslandItem$Category;

    const v3, -0x636cb

    const-string v4, "Rapido"

    invoke-direct {v1, v2, v3, v4}, Lcom/android/systemui/dynamicisland/NotificationIslandSource$BrandProfile;-><init>(Lcom/android/systemui/dynamicisland/IslandItem$Category;ILjava/lang/String;)V

    const-string v2, "com.rapido.passenger"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 83
    sget-object v0, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->BRAND_PROFILES:Ljava/util/Map;

    new-instance v1, Lcom/android/systemui/dynamicisland/NotificationIslandSource$BrandProfile;

    sget-object v2, Lcom/android/systemui/dynamicisland/IslandItem$Category;->LIVE_RIDE:Lcom/android/systemui/dynamicisland/IslandItem$Category;

    const v3, -0x33fec

    const-string v4, "Namma Yatri"

    invoke-direct {v1, v2, v3, v4}, Lcom/android/systemui/dynamicisland/NotificationIslandSource$BrandProfile;-><init>(Lcom/android/systemui/dynamicisland/IslandItem$Category;ILjava/lang/String;)V

    const-string v2, "in.juspay.nammayatri"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 84
    sget-object v0, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->BRAND_PROFILES:Ljava/util/Map;

    new-instance v1, Lcom/android/systemui/dynamicisland/NotificationIslandSource$BrandProfile;

    sget-object v2, Lcom/android/systemui/dynamicisland/IslandItem$Category;->LIVE_RIDE:Lcom/android/systemui/dynamicisland/IslandItem$Category;

    const v3, -0x3e0ee3

    const-string v4, "inDrive"

    invoke-direct {v1, v2, v3, v4}, Lcom/android/systemui/dynamicisland/NotificationIslandSource$BrandProfile;-><init>(Lcom/android/systemui/dynamicisland/IslandItem$Category;ILjava/lang/String;)V

    const-string v2, "sinet.startup.inDriver"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 85
    sget-object v0, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->BRAND_PROFILES:Ljava/util/Map;

    new-instance v1, Lcom/android/systemui/dynamicisland/NotificationIslandSource$BrandProfile;

    sget-object v2, Lcom/android/systemui/dynamicisland/IslandItem$Category;->LIVE_RIDE:Lcom/android/systemui/dynamicisland/IslandItem$Category;

    const v3, -0xff2f7c

    const-string v4, "BluSmart"

    invoke-direct {v1, v2, v3, v4}, Lcom/android/systemui/dynamicisland/NotificationIslandSource$BrandProfile;-><init>(Lcom/android/systemui/dynamicisland/IslandItem$Category;ILjava/lang/String;)V

    const-string v2, "com.blusmart.cab"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 86
    sget-object v0, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->BRAND_PROFILES:Ljava/util/Map;

    new-instance v1, Lcom/android/systemui/dynamicisland/NotificationIslandSource$BrandProfile;

    sget-object v2, Lcom/android/systemui/dynamicisland/IslandItem$Category;->LIVE_RIDE:Lcom/android/systemui/dynamicisland/IslandItem$Category;

    const v3, -0xcb57ad

    const-string v4, "Maps"

    invoke-direct {v1, v2, v3, v4}, Lcom/android/systemui/dynamicisland/NotificationIslandSource$BrandProfile;-><init>(Lcom/android/systemui/dynamicisland/IslandItem$Category;ILjava/lang/String;)V

    const-string v2, "com.google.android.apps.maps"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 87
    sget-object v0, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->BRAND_PROFILES:Ljava/util/Map;

    new-instance v1, Lcom/android/systemui/dynamicisland/NotificationIslandSource$BrandProfile;

    sget-object v2, Lcom/android/systemui/dynamicisland/IslandItem$Category;->LIVE_RIDE:Lcom/android/systemui/dynamicisland/IslandItem$Category;

    const v3, -0xcc3301

    const-string v4, "Waze"

    invoke-direct {v1, v2, v3, v4}, Lcom/android/systemui/dynamicisland/NotificationIslandSource$BrandProfile;-><init>(Lcom/android/systemui/dynamicisland/IslandItem$Category;ILjava/lang/String;)V

    const-string v2, "com.waze"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 88
    sget-object v0, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->BRAND_PROFILES:Ljava/util/Map;

    new-instance v1, Lcom/android/systemui/dynamicisland/NotificationIslandSource$BrandProfile;

    sget-object v2, Lcom/android/systemui/dynamicisland/IslandItem$Category;->LIVE_RIDE:Lcom/android/systemui/dynamicisland/IslandItem$Category;

    const v3, -0xd07f13

    const-string v4, "Train"

    invoke-direct {v1, v2, v3, v4}, Lcom/android/systemui/dynamicisland/NotificationIslandSource$BrandProfile;-><init>(Lcom/android/systemui/dynamicisland/IslandItem$Category;ILjava/lang/String;)V

    const-string v2, "com.whereismytrain.android"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 89
    sget-object v0, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->BRAND_PROFILES:Ljava/util/Map;

    new-instance v1, Lcom/android/systemui/dynamicisland/NotificationIslandSource$BrandProfile;

    sget-object v2, Lcom/android/systemui/dynamicisland/IslandItem$Category;->LIVE_RIDE:Lcom/android/systemui/dynamicisland/IslandItem$Category;

    const v3, -0xd49350

    const-string v4, "IRCTC"

    invoke-direct {v1, v2, v3, v4}, Lcom/android/systemui/dynamicisland/NotificationIslandSource$BrandProfile;-><init>(Lcom/android/systemui/dynamicisland/IslandItem$Category;ILjava/lang/String;)V

    const-string v2, "cris.org.in.prs.ima"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 90
    sget-object v0, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->BRAND_PROFILES:Ljava/util/Map;

    new-instance v1, Lcom/android/systemui/dynamicisland/NotificationIslandSource$BrandProfile;

    sget-object v2, Lcom/android/systemui/dynamicisland/IslandItem$Category;->LIVE_RIDE:Lcom/android/systemui/dynamicisland/IslandItem$Category;

    const v3, -0x1ac1c2

    const-string v4, "Trip"

    invoke-direct {v1, v2, v3, v4}, Lcom/android/systemui/dynamicisland/NotificationIslandSource$BrandProfile;-><init>(Lcom/android/systemui/dynamicisland/IslandItem$Category;ILjava/lang/String;)V

    const-string v2, "com.makemytrip"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 93
    sget-object v0, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->SYSTEM_NOISE_PACKAGES:Ljava/util/Set;

    const-string v1, "com.android.systemui"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 94
    sget-object v0, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->SYSTEM_NOISE_PACKAGES:Ljava/util/Set;

    const-string v1, "android"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 95
    sget-object v0, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->SYSTEM_NOISE_PACKAGES:Ljava/util/Set;

    const-string v1, "com.samsung.android.MtpApplication"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 96
    sget-object v0, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->SYSTEM_NOISE_PACKAGES:Ljava/util/Set;

    const-string v1, "com.samsung.android.mdx"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 97
    sget-object v0, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->SYSTEM_NOISE_PACKAGES:Ljava/util/Set;

    const-string v1, "com.samsung.android.app.sharelive"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 98
    sget-object v0, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->SYSTEM_NOISE_PACKAGES:Ljava/util/Set;

    const-string v1, "com.google.android.gms"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 99
    sget-object v0, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->SYSTEM_NOISE_PACKAGES:Ljava/util/Set;

    const-string v1, "com.sec.android.app.launcher"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 125
    const/4 v0, 0x0

    sput-boolean v0, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->sActionsProbed:Z

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/android/systemui/dynamicisland/NotificationIslandSource$Listener;)V
    .locals 1

    .line 134
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 131
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->mRecentPeeks:Ljava/util/Map;

    .line 132
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->mActiveOngoingKeys:Ljava/util/Set;

    .line 135
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->mContext:Landroid/content/Context;

    .line 136
    iput-object p2, p0, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->mListener:Lcom/android/systemui/dynamicisland/NotificationIslandSource$Listener;

    .line 137
    return-void
.end method

.method private buildBase(Ljava/lang/String;Lcom/android/systemui/dynamicisland/IslandItem$Category;Landroid/service/notification/StatusBarNotification;Landroid/app/Notification;Ljava/lang/String;Ljava/lang/String;)Lcom/android/systemui/dynamicisland/IslandItem;
    .locals 3

    .line 743
    new-instance v0, Lcom/android/systemui/dynamicisland/IslandItem;

    invoke-direct {v0, p1, p2}, Lcom/android/systemui/dynamicisland/IslandItem;-><init>(Ljava/lang/String;Lcom/android/systemui/dynamicisland/IslandItem$Category;)V

    .line 744
    invoke-virtual {p3}, Landroid/service/notification/StatusBarNotification;->getPackageName()Ljava/lang/String;

    move-result-object p1

    .line 745
    invoke-direct {p0, p1}, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->resolveAppName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 746
    iput-object p1, v0, Lcom/android/systemui/dynamicisland/IslandItem;->appName:Ljava/lang/String;

    .line 747
    invoke-static {p5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p2

    if-nez p2, :cond_0

    goto :goto_0

    :cond_0
    move-object p5, p1

    :goto_0
    iput-object p5, v0, Lcom/android/systemui/dynamicisland/IslandItem;->title:Ljava/lang/String;

    .line 748
    invoke-static {p6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p2

    if-nez p2, :cond_1

    goto :goto_1

    :cond_1
    move-object p6, p1

    :goto_1
    iput-object p6, v0, Lcom/android/systemui/dynamicisland/IslandItem;->subtitle:Ljava/lang/String;

    .line 749
    iget-object p1, p4, Landroid/app/Notification;->contentIntent:Landroid/app/PendingIntent;

    iput-object p1, v0, Lcom/android/systemui/dynamicisland/IslandItem;->contentIntent:Landroid/app/PendingIntent;

    .line 750
    invoke-direct {p0, p3, p4}, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->loadNotificationDrawable(Landroid/service/notification/StatusBarNotification;Landroid/app/Notification;)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    iput-object p1, v0, Lcom/android/systemui/dynamicisland/IslandItem;->iconDrawable:Landroid/graphics/drawable/Drawable;

    .line 752
    iget-object p1, p4, Landroid/app/Notification;->actions:[Landroid/app/Notification$Action;

    if-eqz p1, :cond_3

    .line 753
    iget-object p1, p4, Landroid/app/Notification;->actions:[Landroid/app/Notification$Action;

    array-length p1, p1

    const/4 p2, 0x2

    invoke-static {p2, p1}, Ljava/lang/Math;->min(II)I

    move-result p1

    .line 754
    const/4 p2, 0x0

    :goto_2
    if-ge p2, p1, :cond_3

    .line 755
    iget-object p3, p4, Landroid/app/Notification;->actions:[Landroid/app/Notification$Action;

    aget-object p3, p3, p2

    .line 756
    if-eqz p3, :cond_2

    iget-object p5, p3, Landroid/app/Notification$Action;->title:Ljava/lang/CharSequence;

    invoke-static {p5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p5

    if-nez p5, :cond_2

    iget-object p5, p3, Landroid/app/Notification$Action;->actionIntent:Landroid/app/PendingIntent;

    if-eqz p5, :cond_2

    .line 757
    iget-object p5, v0, Lcom/android/systemui/dynamicisland/IslandItem;->actions:Ljava/util/List;

    new-instance p6, Lcom/android/systemui/dynamicisland/IslandItem$ActionItem;

    iget-object v1, p3, Landroid/app/Notification$Action;->title:Ljava/lang/CharSequence;

    .line 758
    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p3, Landroid/app/Notification$Action;->actionIntent:Landroid/app/PendingIntent;

    .line 760
    invoke-virtual {p3}, Landroid/app/Notification$Action;->getIcon()Landroid/graphics/drawable/Icon;

    move-result-object p3

    invoke-direct {p6, v1, v2, p3}, Lcom/android/systemui/dynamicisland/IslandItem$ActionItem;-><init>(Ljava/lang/String;Landroid/app/PendingIntent;Landroid/graphics/drawable/Icon;)V

    .line 757
    invoke-interface {p5, p6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 754
    :cond_2
    add-int/lit8 p2, p2, 0x1

    goto :goto_2

    .line 765
    :cond_3
    return-object v0
.end method

.method private static extractCompactLiveBadge(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 666
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 667
    return-object p0

    .line 669
    :cond_0
    sget-object p0, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->ETA_PATTERN:Ljava/util/regex/Pattern;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p0

    .line 670
    invoke-virtual {p0}, Ljava/util/regex/Matcher;->find()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 671
    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object p0

    const-string p1, "\\s+"

    invoke-virtual {p0, p1, v1}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 673
    :cond_1
    sget-object p0, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->TIME_PATTERN:Ljava/util/regex/Pattern;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p0

    .line 674
    invoke-virtual {p0}, Ljava/util/regex/Matcher;->find()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 675
    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 677
    :cond_2
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p0

    const/16 v0, 0x10

    if-nez p0, :cond_3

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p0

    if-gt p0, v0, :cond_3

    .line 678
    return-object p1

    .line 680
    :cond_3
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p0

    if-nez p0, :cond_4

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result p0

    if-gt p0, v0, :cond_4

    .line 681
    return-object p2

    .line 683
    :cond_4
    return-object p3
.end method

.method private varargs extractFromAllRemoteViews(Ljava/lang/String;[Landroid/widget/RemoteViews;)Lcom/android/systemui/dynamicisland/NotificationIslandSource$ExtractedRemoteData;
    .locals 8

    .line 461
    new-instance v0, Lcom/android/systemui/dynamicisland/NotificationIslandSource$ExtractedRemoteData;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/android/systemui/dynamicisland/NotificationIslandSource$ExtractedRemoteData;-><init>(Lcom/android/systemui/dynamicisland/NotificationIslandSource-IA;)V

    .line 462
    iget-object v1, p0, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->mContext:Landroid/content/Context;

    .line 464
    :try_start_0
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_0

    iget-object v2, p0, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 465
    iget-object v1, p0, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->mContext:Landroid/content/Context;

    const/4 v2, 0x2

    invoke-virtual {v1, p1, v2}, Landroid/content/Context;->createPackageContext(Ljava/lang/String;I)Landroid/content/Context;

    move-result-object v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 469
    :cond_0
    goto :goto_0

    .line 467
    :catchall_0
    move-exception p1

    .line 468
    iget-object v1, p0, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->mContext:Landroid/content/Context;

    .line 470
    :goto_0
    new-instance p1, Landroid/widget/FrameLayout;

    invoke-direct {p1, v1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 472
    array-length v2, p2

    const/4 v3, 0x0

    :goto_1
    if-ge v3, v2, :cond_6

    aget-object v4, p2, v3

    .line 473
    if-nez v4, :cond_1

    .line 474
    goto :goto_2

    .line 476
    :cond_1
    invoke-static {v4, v0}, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->inspectRemoteViewsActions(Landroid/widget/RemoteViews;Lcom/android/systemui/dynamicisland/NotificationIslandSource$ExtractedRemoteData;)V

    .line 478
    :try_start_1
    invoke-virtual {v4, v1, p1}, Landroid/widget/RemoteViews;->apply(Landroid/content/Context;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v5

    .line 479
    if-nez v5, :cond_2

    iget-object v6, p0, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->mContext:Landroid/content/Context;

    if-eq v1, v6, :cond_2

    .line 480
    iget-object v5, p0, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->mContext:Landroid/content/Context;

    new-instance v6, Landroid/widget/FrameLayout;

    iget-object v7, p0, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->mContext:Landroid/content/Context;

    invoke-direct {v6, v7}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v4, v5, v6}, Landroid/widget/RemoteViews;->apply(Landroid/content/Context;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v5

    .line 482
    :cond_2
    if-eqz v5, :cond_3

    .line 483
    invoke-static {v5, v0}, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->walkViewTree(Landroid/view/View;Lcom/android/systemui/dynamicisland/NotificationIslandSource$ExtractedRemoteData;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 495
    :cond_3
    goto :goto_2

    .line 485
    :catchall_1
    move-exception v5

    .line 486
    iget-object v5, p0, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->mContext:Landroid/content/Context;

    if-eq v1, v5, :cond_5

    .line 488
    :try_start_2
    iget-object v5, p0, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->mContext:Landroid/content/Context;

    new-instance v6, Landroid/widget/FrameLayout;

    iget-object v7, p0, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->mContext:Landroid/content/Context;

    invoke-direct {v6, v7}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v4, v5, v6}, Landroid/widget/RemoteViews;->apply(Landroid/content/Context;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v4

    .line 489
    if-eqz v4, :cond_4

    .line 490
    invoke-static {v4, v0}, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->walkViewTree(Landroid/view/View;Lcom/android/systemui/dynamicisland/NotificationIslandSource$ExtractedRemoteData;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 493
    :cond_4
    goto :goto_2

    .line 492
    :catchall_2
    move-exception v4

    .line 472
    :cond_5
    :goto_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 497
    :cond_6
    return-object v0
.end method

.method private static formatTimerMs(J)Ljava/lang/String;
    .locals 8

    .line 637
    const-wide/16 v0, 0x3e8

    div-long/2addr p0, v0

    const-wide/16 v0, 0x0

    invoke-static {v0, v1, p0, p1}, Ljava/lang/Math;->max(JJ)J

    move-result-wide p0

    .line 638
    const-wide/16 v2, 0xe10

    div-long v4, p0, v2

    .line 639
    rem-long v2, p0, v2

    const-wide/16 v6, 0x3c

    div-long/2addr v2, v6

    .line 640
    rem-long/2addr p0, v6

    .line 641
    cmp-long v0, v4, v0

    if-lez v0, :cond_0

    .line 642
    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p0

    filled-new-array {v0, v1, p0}, [Ljava/lang/Object;

    move-result-object p0

    const-string p1, "%d:%02d:%02d"

    invoke-static {p1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 644
    :cond_0
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p0

    filled-new-array {v0, p0}, [Ljava/lang/Object;

    move-result-object p0

    const-string p1, "%02d:%02d"

    invoke-static {p1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static getRemoteViewExtra(Landroid/os/Bundle;Ljava/lang/String;)Landroid/widget/RemoteViews;
    .locals 1

    .line 453
    const/4 v0, 0x0

    :try_start_0
    invoke-virtual {p0, p1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object p0

    .line 454
    instance-of p1, p0, Landroid/widget/RemoteViews;

    if-eqz p1, :cond_0

    check-cast p0, Landroid/widget/RemoteViews;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-object v0, p0

    :cond_0
    return-object v0

    .line 455
    :catchall_0
    move-exception p0

    .line 456
    return-object v0
.end method

.method private static inspectRemoteViewsActions(Landroid/widget/RemoteViews;Lcom/android/systemui/dynamicisland/NotificationIslandSource$ExtractedRemoteData;)V
    .locals 6

    .line 501
    if-eqz p0, :cond_e

    if-nez p1, :cond_0

    goto/16 :goto_5

    .line 505
    :cond_0
    :try_start_0
    sget-boolean v0, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->sActionsProbed:Z

    const/4 v1, 0x1

    if-nez v0, :cond_1

    .line 506
    sput-boolean v1, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->sActionsProbed:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 508
    :try_start_1
    const-class v0, Landroid/widget/RemoteViews;

    const-string v2, "mActions"

    invoke-virtual {v0, v2}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    sput-object v0, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->sActionsField:Ljava/lang/reflect/Field;

    .line 509
    sget-object v0, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->sActionsField:Ljava/lang/reflect/Field;

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->setAccessible(Z)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 511
    goto :goto_0

    .line 510
    :catchall_0
    move-exception v0

    .line 513
    :goto_0
    :try_start_2
    const-class v0, Landroid/widget/Chronometer;

    const-string v2, "mStarted"

    invoke-virtual {v0, v2}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    sput-object v0, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->sChronoStartedField:Ljava/lang/reflect/Field;

    .line 514
    sget-object v0, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->sChronoStartedField:Ljava/lang/reflect/Field;

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->setAccessible(Z)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 516
    goto :goto_1

    .line 515
    :catchall_1
    move-exception v0

    .line 518
    :cond_1
    :goto_1
    :try_start_3
    sget-object v0, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->sActionsField:Ljava/lang/reflect/Field;

    if-nez v0, :cond_2

    .line 519
    return-void

    .line 521
    :cond_2
    sget-object v0, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->sActionsField:Ljava/lang/reflect/Field;

    invoke-virtual {v0, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    .line 522
    instance-of v0, p0, Ljava/util/List;

    if-nez v0, :cond_3

    .line 523
    return-void

    .line 525
    :cond_3
    check-cast p0, Ljava/util/List;

    .line 526
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_2
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_d

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    .line 527
    if-nez v0, :cond_4

    .line 528
    goto :goto_2

    .line 530
    :cond_4
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    .line 531
    const-string v3, "methodName"

    invoke-static {v2, v0, v3}, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->readStringField(Ljava/lang/Class;Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 532
    const-string v4, "value"

    invoke-static {v2, v0, v4}, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->readObjectField(Ljava/lang/Class;Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 533
    if-eqz v3, :cond_c

    .line 534
    const-string v2, "setBase"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    instance-of v2, v0, Ljava/lang/Number;

    if-eqz v2, :cond_5

    .line 535
    iput-boolean v1, p1, Lcom/android/systemui/dynamicisland/NotificationIslandSource$ExtractedRemoteData;->hasChrono:Z

    .line 536
    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->longValue()J

    move-result-wide v2

    iput-wide v2, p1, Lcom/android/systemui/dynamicisland/NotificationIslandSource$ExtractedRemoteData;->chronoBase:J

    goto/16 :goto_3

    .line 537
    :cond_5
    const-string v2, "setCountDown"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6

    instance-of v2, v0, Ljava/lang/Boolean;

    if-eqz v2, :cond_6

    .line 538
    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p1, Lcom/android/systemui/dynamicisland/NotificationIslandSource$ExtractedRemoteData;->chronoCountDown:Z

    goto/16 :goto_3

    .line 539
    :cond_6
    const-string v2, "setStarted"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_7

    instance-of v2, v0, Ljava/lang/Boolean;

    if-eqz v2, :cond_7

    .line 540
    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p1, Lcom/android/systemui/dynamicisland/NotificationIslandSource$ExtractedRemoteData;->chronoStarted:Z

    goto :goto_3

    .line 541
    :cond_7
    const-string v2, "setText"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_8

    const-string v2, "setTextViewText"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_a

    :cond_8
    instance-of v2, v0, Ljava/lang/CharSequence;

    if-eqz v2, :cond_a

    .line 543
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 544
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_9

    iget-object v2, p1, Lcom/android/systemui/dynamicisland/NotificationIslandSource$ExtractedRemoteData;->texts:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_9

    .line 545
    iget-object v2, p1, Lcom/android/systemui/dynamicisland/NotificationIslandSource$ExtractedRemoteData;->texts:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 546
    iget-wide v2, p1, Lcom/android/systemui/dynamicisland/NotificationIslandSource$ExtractedRemoteData;->parsedChronoMs:J

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    if-gez v2, :cond_9

    .line 547
    invoke-static {v0}, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->parseTimeStringMs(Ljava/lang/String;)J

    move-result-wide v2

    .line 548
    cmp-long v0, v2, v4

    if-ltz v0, :cond_9

    .line 549
    iput-wide v2, p1, Lcom/android/systemui/dynamicisland/NotificationIslandSource$ExtractedRemoteData;->parsedChronoMs:J

    .line 553
    :cond_9
    goto :goto_3

    :cond_a
    const-string v2, "setMax"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_b

    instance-of v2, v0, Ljava/lang/Number;

    if-eqz v2, :cond_b

    .line 554
    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->intValue()I

    move-result v0

    iput v0, p1, Lcom/android/systemui/dynamicisland/NotificationIslandSource$ExtractedRemoteData;->maxProg:I

    goto :goto_3

    .line 555
    :cond_b
    const-string v2, "setProgress"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_c

    instance-of v2, v0, Ljava/lang/Number;

    if-eqz v2, :cond_c

    .line 556
    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->intValue()I

    move-result v0

    iput v0, p1, Lcom/android/systemui/dynamicisland/NotificationIslandSource$ExtractedRemoteData;->prog:I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 559
    :cond_c
    :goto_3
    goto/16 :goto_2

    .line 561
    :cond_d
    goto :goto_4

    .line 560
    :catchall_2
    move-exception p0

    .line 562
    :goto_4
    return-void

    .line 502
    :cond_e
    :goto_5
    return-void
.end method

.method private static isClockApp(Ljava/lang/String;)Z
    .locals 3

    .line 731
    const/4 v0, 0x0

    if-nez p0, :cond_0

    .line 732
    return v0

    .line 734
    :cond_0
    sget-object v1, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->CLOCK_PACKAGES:Ljava/util/Set;

    invoke-interface {v1, p0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x1

    if-eqz v1, :cond_1

    .line 735
    return v2

    .line 737
    :cond_1
    invoke-virtual {p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p0

    .line 738
    const-string v1, "clockpackage"

    invoke-virtual {p0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_2

    const-string v1, "deskclock"

    invoke-virtual {p0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p0

    if-eqz p0, :cond_3

    :cond_2
    move v0, v2

    :cond_3
    return v0
.end method

.method private static isIrrelevantLiveService(Ljava/lang/String;)Z
    .locals 2

    .line 702
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 703
    return v1

    .line 705
    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p0

    .line 706
    const-string v0, "notification listener"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 707
    const-string v0, "running in background"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 708
    const-string v0, "displaying over other"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p0

    if-eqz p0, :cond_2

    :cond_1
    const/4 v1, 0x1

    .line 706
    :cond_2
    return v1
.end method

.method private static isRecorderPackageOrTag(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1

    .line 804
    const-string v0, ""

    if-eqz p0, :cond_0

    invoke-virtual {p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    :cond_0
    move-object p0, v0

    .line 805
    :goto_0
    if-eqz p1, :cond_1

    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p1

    goto :goto_1

    :cond_1
    move-object p1, v0

    .line 806
    :goto_1
    if-eqz p2, :cond_2

    goto :goto_2

    :cond_2
    move-object p2, v0

    :goto_2
    if-eqz p3, :cond_3

    goto :goto_3

    :cond_3
    move-object p3, v0

    :goto_3
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string v0, " "

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p2

    .line 807
    const-string p3, "screenrecorder"

    invoke-virtual {p0, p3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p3

    const/4 v0, 0x1

    if-nez p3, :cond_7

    const-string p3, "voicenote"

    invoke-virtual {p0, p3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p3

    if-nez p3, :cond_7

    const-string p3, "screen_record"

    invoke-virtual {p1, p3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p3

    if-eqz p3, :cond_4

    goto :goto_5

    .line 810
    :cond_4
    const-string p3, "smartcapture"

    invoke-virtual {p0, p3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p0

    if-eqz p0, :cond_6

    const-string p0, "record"

    invoke-virtual {p2, p0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p2

    if-nez p2, :cond_5

    invoke-virtual {p1, p0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p0

    if-eqz p0, :cond_6

    :cond_5
    goto :goto_4

    :cond_6
    const/4 v0, 0x0

    :goto_4
    return v0

    .line 808
    :cond_7
    :goto_5
    return v0
.end method

.method private static isSystemNoise(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 2

    .line 712
    const/4 v0, 0x1

    if-eqz p0, :cond_7

    sget-object v1, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->SYSTEM_NOISE_PACKAGES:Ljava/util/Set;

    invoke-interface {v1, p0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    goto/16 :goto_5

    .line 715
    :cond_0
    const-string v1, "com.samsung.android.app.settings"

    invoke-virtual {p0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_6

    const-string v1, "com.android.settings"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_1

    goto/16 :goto_4

    .line 718
    :cond_1
    const-string p0, ""

    if-eqz p1, :cond_2

    goto :goto_0

    :cond_2
    move-object p1, p0

    :goto_0
    if-eqz p2, :cond_3

    goto :goto_1

    :cond_3
    move-object p2, p0

    :goto_1
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, " "

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p0

    .line 719
    const-string p1, "usb"

    invoke-virtual {p0, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_5

    .line 720
    const-string p1, "vpn"

    invoke-virtual {p0, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_5

    .line 721
    const-string p1, "hotspot"

    invoke-virtual {p0, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_5

    .line 722
    const-string p1, "tethering"

    invoke-virtual {p0, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_5

    .line 723
    const-string p1, "charging"

    invoke-virtual {p0, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_5

    .line 724
    const-string p1, "keyboard"

    invoke-virtual {p0, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_5

    .line 725
    const-string p1, "battery"

    invoke-virtual {p0, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_5

    .line 726
    const-string p1, "tap for more options"

    invoke-virtual {p0, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_5

    .line 727
    const-string p1, "running in the background"

    invoke-virtual {p0, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p0

    if-eqz p0, :cond_4

    goto :goto_2

    :cond_4
    const/4 v0, 0x0

    goto :goto_3

    :cond_5
    :goto_2
    nop

    .line 719
    :goto_3
    return v0

    .line 716
    :cond_6
    :goto_4
    return v0

    .line 713
    :cond_7
    :goto_5
    return v0
.end method

.method private loadNotificationDrawable(Landroid/service/notification/StatusBarNotification;Landroid/app/Notification;)Landroid/graphics/drawable/Drawable;
    .locals 4

    .line 771
    :try_start_0
    invoke-virtual {p2}, Landroid/app/Notification;->getLargeIcon()Landroid/graphics/drawable/Icon;

    move-result-object v0

    .line 772
    if-eqz v0, :cond_1

    .line 773
    iget-object v1, p0, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->mContext:Landroid/content/Context;

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Icon;->loadDrawable(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 774
    instance-of v1, v0, Landroid/graphics/drawable/BitmapDrawable;

    if-eqz v1, :cond_0

    .line 775
    move-object v1, v0

    check-cast v1, Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {v1}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v1

    .line 776
    if-eqz v1, :cond_0

    .line 777
    const/16 v2, 0x80

    const/16 v3, 0x20

    invoke-static {v1, v2, v3}, Lcom/android/systemui/dynamicisland/ColorExtractor;->createRoundedSquare(Landroid/graphics/Bitmap;II)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 778
    if-eqz v1, :cond_0

    .line 779
    new-instance v0, Landroid/graphics/drawable/BitmapDrawable;

    iget-object v2, p0, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-direct {v0, v2, v1}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-object v0

    .line 783
    :cond_0
    if-eqz v0, :cond_1

    .line 784
    return-object v0

    .line 788
    :cond_1
    goto :goto_0

    .line 787
    :catchall_0
    move-exception v0

    .line 790
    :goto_0
    :try_start_1
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    invoke-virtual {p1}, Landroid/service/notification/StatusBarNotification;->getPackageName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/content/pm/PackageManager;->getApplicationIcon(Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    return-object p1

    .line 791
    :catchall_1
    move-exception p1

    .line 794
    :try_start_2
    invoke-virtual {p2}, Landroid/app/Notification;->getSmallIcon()Landroid/graphics/drawable/Icon;

    move-result-object p1

    .line 795
    if-eqz p1, :cond_2

    .line 796
    iget-object p2, p0, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->mContext:Landroid/content/Context;

    invoke-virtual {p1, p2}, Landroid/graphics/drawable/Icon;->loadDrawable(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    return-object p1

    .line 799
    :cond_2
    goto :goto_1

    .line 798
    :catchall_2
    move-exception p1

    .line 800
    :goto_1
    const/4 p1, 0x0

    return-object p1
.end method

.method private static looksLikeLiveDeliveryOrRide(Ljava/lang/String;)Z
    .locals 2

    .line 687
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 688
    return v1

    .line 690
    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p0

    .line 691
    const-string v0, "arriving"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 692
    const-string v0, "on the way"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 693
    const-string v0, "out for delivery"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 694
    const-string v0, "picked up"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 695
    const-string v0, "preparing"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 696
    const-string v0, "driver"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 697
    const-string v0, "mins away"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 698
    const-string v0, "eta"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p0

    if-eqz p0, :cond_2

    :cond_1
    const/4 v1, 0x1

    .line 691
    :cond_2
    return v1
.end method

.method private static parseTimeStringMs(Ljava/lang/String;)J
    .locals 9

    .line 648
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const-wide/16 v1, -0x1

    if-eqz v0, :cond_0

    .line 649
    return-wide v1

    .line 651
    :cond_0
    sget-object v0, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->TIME_PATTERN:Ljava/util/regex/Pattern;

    invoke-virtual {v0, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p0

    .line 652
    invoke-virtual {p0}, Ljava/util/regex/Matcher;->find()Z

    move-result v0

    if-nez v0, :cond_1

    .line 653
    return-wide v1

    .line 656
    :cond_1
    const/4 v0, 0x1

    :try_start_0
    invoke-virtual {p0, v0}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_2

    invoke-virtual {p0, v0}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v3

    goto :goto_0

    :cond_2
    const-wide/16 v3, 0x0

    .line 657
    :goto_0
    const/4 v0, 0x2

    invoke-virtual {p0, v0}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v5

    .line 658
    const/4 v0, 0x3

    invoke-virtual {p0, v0}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 659
    const-wide/16 v7, 0xe10

    mul-long/2addr v3, v7

    const-wide/16 v7, 0x3c

    mul-long/2addr v5, v7

    add-long/2addr v3, v5

    add-long/2addr v3, v0

    const-wide/16 v0, 0x3e8

    mul-long/2addr v3, v0

    return-wide v3

    .line 660
    :catchall_0
    move-exception p0

    .line 661
    return-wide v1
.end method

.method private static readObjectField(Ljava/lang/Class;Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/Object;",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 570
    nop

    .line 571
    :goto_0
    if-eqz p0, :cond_0

    const-class v0, Ljava/lang/Object;

    if-eq p0, v0, :cond_0

    .line 573
    :try_start_0
    invoke-virtual {p0, p2}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    .line 574
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 575
    invoke-virtual {v0, p1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-object p0

    .line 576
    :catchall_0
    move-exception v0

    .line 577
    invoke-virtual {p0}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object p0

    .line 578
    goto :goto_0

    .line 580
    :cond_0
    const/4 p0, 0x0

    return-object p0
.end method

.method private static readStringField(Ljava/lang/Class;Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/Object;",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 565
    invoke-static {p0, p1, p2}, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->readObjectField(Ljava/lang/Class;Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    .line 566
    instance-of p1, p0, Ljava/lang/String;

    if-eqz p1, :cond_0

    check-cast p0, Ljava/lang/String;

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return-object p0
.end method

.method private resolveAppName(Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    .line 823
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const-string v1, "App"

    if-eqz v0, :cond_0

    .line 824
    return-object v1

    .line 827
    :cond_0
    :try_start_0
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    .line 828
    const/4 v2, 0x0

    invoke-virtual {v0, p1, v2}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/content/pm/PackageManager;->getApplicationLabel(Landroid/content/pm/ApplicationInfo;)Ljava/lang/CharSequence;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-object p1

    .line 829
    :catchall_0
    move-exception p1

    .line 830
    return-object v1
.end method

.method private static safeString(Ljava/lang/CharSequence;)Ljava/lang/String;
    .locals 0

    .line 819
    if-eqz p0, :cond_0

    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    :cond_0
    const-string p0, ""

    :goto_0
    return-object p0
.end method

.method private static walkViewTree(Landroid/view/View;Lcom/android/systemui/dynamicisland/NotificationIslandSource$ExtractedRemoteData;)V
    .locals 5

    .line 584
    if-eqz p0, :cond_9

    invoke-virtual {p0}, Landroid/view/View;->getVisibility()I

    move-result v0

    const/16 v1, 0x8

    if-ne v0, v1, :cond_0

    goto/16 :goto_4

    .line 587
    :cond_0
    instance-of v0, p0, Landroid/widget/Chronometer;

    const-wide/16 v1, 0x0

    if-eqz v0, :cond_4

    .line 588
    move-object v0, p0

    check-cast v0, Landroid/widget/Chronometer;

    .line 589
    const/4 v3, 0x1

    iput-boolean v3, p1, Lcom/android/systemui/dynamicisland/NotificationIslandSource$ExtractedRemoteData;->hasChrono:Z

    .line 590
    invoke-virtual {v0}, Landroid/widget/Chronometer;->getBase()J

    move-result-wide v3

    cmp-long v1, v3, v1

    if-lez v1, :cond_1

    .line 591
    invoke-virtual {v0}, Landroid/widget/Chronometer;->getBase()J

    move-result-wide v1

    iput-wide v1, p1, Lcom/android/systemui/dynamicisland/NotificationIslandSource$ExtractedRemoteData;->chronoBase:J

    .line 593
    :cond_1
    invoke-virtual {v0}, Landroid/widget/Chronometer;->isCountDown()Z

    move-result v1

    iput-boolean v1, p1, Lcom/android/systemui/dynamicisland/NotificationIslandSource$ExtractedRemoteData;->chronoCountDown:Z

    .line 594
    sget-object v1, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->sChronoStartedField:Ljava/lang/reflect/Field;

    if-eqz v1, :cond_2

    .line 596
    :try_start_0
    sget-object v1, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->sChronoStartedField:Ljava/lang/reflect/Field;

    invoke-virtual {v1, v0}, Ljava/lang/reflect/Field;->getBoolean(Ljava/lang/Object;)Z

    move-result v1

    iput-boolean v1, p1, Lcom/android/systemui/dynamicisland/NotificationIslandSource$ExtractedRemoteData;->chronoStarted:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 598
    goto :goto_0

    .line 597
    :catchall_0
    move-exception v1

    .line 600
    :cond_2
    :goto_0
    invoke-virtual {v0}, Landroid/widget/Chronometer;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    .line 601
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_3

    .line 602
    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 603
    iget-object v1, p1, Lcom/android/systemui/dynamicisland/NotificationIslandSource$ExtractedRemoteData;->texts:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3

    .line 604
    iget-object v1, p1, Lcom/android/systemui/dynamicisland/NotificationIslandSource$ExtractedRemoteData;->texts:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 607
    :cond_3
    goto :goto_2

    :cond_4
    instance-of v0, p0, Landroid/widget/ProgressBar;

    if-eqz v0, :cond_5

    instance-of v0, p0, Landroid/widget/SeekBar;

    if-nez v0, :cond_5

    .line 608
    move-object v0, p0

    check-cast v0, Landroid/widget/ProgressBar;

    .line 609
    invoke-virtual {v0}, Landroid/widget/ProgressBar;->isIndeterminate()Z

    move-result v1

    if-nez v1, :cond_6

    invoke-virtual {v0}, Landroid/widget/ProgressBar;->getMax()I

    move-result v1

    if-lez v1, :cond_6

    .line 610
    invoke-virtual {v0}, Landroid/widget/ProgressBar;->getProgress()I

    move-result v1

    iput v1, p1, Lcom/android/systemui/dynamicisland/NotificationIslandSource$ExtractedRemoteData;->prog:I

    .line 611
    invoke-virtual {v0}, Landroid/widget/ProgressBar;->getMax()I

    move-result v0

    iput v0, p1, Lcom/android/systemui/dynamicisland/NotificationIslandSource$ExtractedRemoteData;->maxProg:I

    goto :goto_1

    .line 613
    :cond_5
    instance-of v0, p0, Landroid/widget/TextView;

    if-eqz v0, :cond_6

    .line 614
    move-object v0, p0

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    .line 615
    if-eqz v0, :cond_7

    .line 616
    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 617
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_7

    iget-object v3, p1, Lcom/android/systemui/dynamicisland/NotificationIslandSource$ExtractedRemoteData;->texts:Ljava/util/List;

    invoke-interface {v3, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_7

    .line 618
    iget-object v3, p1, Lcom/android/systemui/dynamicisland/NotificationIslandSource$ExtractedRemoteData;->texts:Ljava/util/List;

    invoke-interface {v3, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 619
    iget-wide v3, p1, Lcom/android/systemui/dynamicisland/NotificationIslandSource$ExtractedRemoteData;->parsedChronoMs:J

    cmp-long v3, v3, v1

    if-gez v3, :cond_7

    .line 620
    invoke-static {v0}, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->parseTimeStringMs(Ljava/lang/String;)J

    move-result-wide v3

    .line 621
    cmp-long v0, v3, v1

    if-ltz v0, :cond_7

    .line 622
    iput-wide v3, p1, Lcom/android/systemui/dynamicisland/NotificationIslandSource$ExtractedRemoteData;->parsedChronoMs:J

    goto :goto_2

    .line 613
    :cond_6
    :goto_1
    nop

    .line 628
    :cond_7
    :goto_2
    instance-of v0, p0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_8

    .line 629
    check-cast p0, Landroid/view/ViewGroup;

    .line 630
    const/4 v0, 0x0

    :goto_3
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    if-ge v0, v1, :cond_8

    .line 631
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-static {v1, p1}, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->walkViewTree(Landroid/view/View;Lcom/android/systemui/dynamicisland/NotificationIslandSource$ExtractedRemoteData;)V

    .line 630
    add-int/lit8 v0, v0, 0x1

    goto :goto_3

    .line 634
    :cond_8
    return-void

    .line 585
    :cond_9
    :goto_4
    return-void
.end method

.method private static wallToElapsed(J)J
    .locals 2

    .line 814
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    sub-long/2addr p0, v0

    .line 815
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    add-long/2addr v0, p0

    return-wide v0
.end method


# virtual methods
.method public onPosted(Landroid/service/notification/StatusBarNotification;)V
    .locals 33

    .line 140
    move-object/from16 v0, p0

    if-eqz p1, :cond_57

    invoke-virtual/range {p1 .. p1}, Landroid/service/notification/StatusBarNotification;->getNotification()Landroid/app/Notification;

    move-result-object v1

    if-nez v1, :cond_0

    goto/16 :goto_2c

    .line 143
    :cond_0
    invoke-virtual/range {p1 .. p1}, Landroid/service/notification/StatusBarNotification;->getNotification()Landroid/app/Notification;

    move-result-object v4

    .line 144
    iget v1, v4, Landroid/app/Notification;->flags:I

    and-int/lit16 v1, v1, 0x200

    if-eqz v1, :cond_1

    .line 145
    return-void

    .line 148
    :cond_1
    invoke-virtual/range {p1 .. p1}, Landroid/service/notification/StatusBarNotification;->getPackageName()Ljava/lang/String;

    move-result-object v7

    .line 149
    invoke-virtual/range {p1 .. p1}, Landroid/service/notification/StatusBarNotification;->getKey()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "sbn:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 150
    iget-object v2, v4, Landroid/app/Notification;->extras:Landroid/os/Bundle;

    if-eqz v2, :cond_2

    iget-object v2, v4, Landroid/app/Notification;->extras:Landroid/os/Bundle;

    goto :goto_0

    :cond_2
    sget-object v2, Landroid/os/Bundle;->EMPTY:Landroid/os/Bundle;

    .line 153
    :goto_0
    const-string v3, "android.mediaSession"

    invoke-virtual {v2, v3}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 154
    return-void

    .line 157
    :cond_3
    invoke-virtual/range {p1 .. p1}, Landroid/service/notification/StatusBarNotification;->isOngoing()Z

    move-result v3

    const/4 v5, 0x2

    const/4 v8, 0x0

    if-nez v3, :cond_5

    iget v3, v4, Landroid/app/Notification;->flags:I

    and-int/2addr v3, v5

    if-nez v3, :cond_5

    iget v3, v4, Landroid/app/Notification;->flags:I

    and-int/lit16 v3, v3, 0x2000

    if-eqz v3, :cond_4

    goto :goto_1

    :cond_4
    move v3, v8

    goto :goto_2

    :cond_5
    :goto_1
    const/4 v3, 0x1

    .line 160
    :goto_2
    iget-object v6, v0, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->mActiveOngoingKeys:Ljava/util/Set;

    invoke-interface {v6, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v10

    .line 162
    const-string v6, "android.title"

    invoke-virtual {v2, v6}, Landroid/os/Bundle;->getCharSequence(Ljava/lang/String;)Ljava/lang/CharSequence;

    move-result-object v6

    invoke-static {v6}, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->safeString(Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v6

    .line 163
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v11

    if-eqz v11, :cond_6

    .line 164
    const-string v6, "android.title.big"

    invoke-virtual {v2, v6}, Landroid/os/Bundle;->getCharSequence(Ljava/lang/String;)Ljava/lang/CharSequence;

    move-result-object v6

    invoke-static {v6}, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->safeString(Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v6

    .line 166
    :cond_6
    const-string v11, "android.text"

    invoke-virtual {v2, v11}, Landroid/os/Bundle;->getCharSequence(Ljava/lang/String;)Ljava/lang/CharSequence;

    move-result-object v11

    invoke-static {v11}, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->safeString(Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v11

    .line 167
    invoke-static {v11}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v12

    if-eqz v12, :cond_7

    .line 168
    const-string v11, "android.bigText"

    invoke-virtual {v2, v11}, Landroid/os/Bundle;->getCharSequence(Ljava/lang/String;)Ljava/lang/CharSequence;

    move-result-object v11

    invoke-static {v11}, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->safeString(Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v11

    .line 170
    :cond_7
    const-string v12, "android.subText"

    invoke-virtual {v2, v12}, Landroid/os/Bundle;->getCharSequence(Ljava/lang/String;)Ljava/lang/CharSequence;

    move-result-object v12

    invoke-static {v12}, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->safeString(Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v12

    .line 171
    const-string v13, "android.shortCriticalText"

    invoke-virtual {v2, v13}, Landroid/os/Bundle;->getCharSequence(Ljava/lang/String;)Ljava/lang/CharSequence;

    move-result-object v13

    invoke-static {v13}, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->safeString(Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v13

    .line 173
    const-string v14, "android.showChronometer"

    invoke-virtual {v2, v14, v8}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v14

    move/from16 v16, v10

    const/4 v15, 0x1

    if-eqz v14, :cond_8

    const-wide/16 v17, 0x0

    iget-wide v9, v4, Landroid/app/Notification;->when:J

    cmp-long v9, v9, v17

    if-lez v9, :cond_9

    move v9, v15

    goto :goto_3

    :cond_8
    const-wide/16 v17, 0x0

    :cond_9
    move v9, v8

    .line 174
    :goto_3
    const-string v10, "android.chronometerCountDown"

    invoke-virtual {v2, v10, v8}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v10

    .line 175
    if-eqz v9, :cond_a

    move-object/from16 v19, v6

    iget-wide v5, v4, Landroid/app/Notification;->when:J

    invoke-static {v5, v6}, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->wallToElapsed(J)J

    move-result-wide v5

    goto :goto_4

    :cond_a
    move-object/from16 v19, v6

    move-wide/from16 v5, v17

    .line 176
    :goto_4
    nop

    .line 178
    const-string v14, "android.progressMax"

    invoke-virtual {v2, v14, v8}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v14

    .line 179
    move/from16 v21, v15

    const-string v15, "android.progress"

    invoke-virtual {v2, v15, v8}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v22

    .line 180
    const-string v15, "android.progressIndeterminate"

    invoke-virtual {v2, v15, v8}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v23

    .line 182
    invoke-static {v7}, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->isClockApp(Ljava/lang/String;)Z

    move-result v24

    .line 183
    sget-object v15, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->BRAND_PROFILES:Ljava/util/Map;

    invoke-interface {v15, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Lcom/android/systemui/dynamicisland/NotificationIslandSource$BrandProfile;

    .line 186
    if-eqz v24, :cond_b

    .line 187
    const-string v8, "android.ongoingActivityNoti.chronometerRemoteView"

    invoke-static {v2, v8}, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->getRemoteViewExtra(Landroid/os/Bundle;Ljava/lang/String;)Landroid/widget/RemoteViews;

    move-result-object v2

    goto :goto_5

    .line 188
    :cond_b
    const/4 v2, 0x0

    .line 189
    :goto_5
    if-nez v2, :cond_d

    iget-object v8, v4, Landroid/app/Notification;->contentView:Landroid/widget/RemoteViews;

    if-nez v8, :cond_d

    iget-object v8, v4, Landroid/app/Notification;->bigContentView:Landroid/widget/RemoteViews;

    if-nez v8, :cond_d

    iget-object v8, v4, Landroid/app/Notification;->headsUpContentView:Landroid/widget/RemoteViews;

    if-eqz v8, :cond_c

    goto :goto_6

    :cond_c
    const/4 v8, 0x0

    goto :goto_7

    :cond_d
    :goto_6
    move/from16 v8, v21

    .line 191
    :goto_7
    move-object/from16 v26, v1

    const-string v1, "paused"

    move/from16 v27, v3

    const-string v3, "elapsed"

    move-wide/from16 v28, v5

    const-string v5, "stopwatch"

    const-string v6, " "

    if-eqz v27, :cond_1b

    if-eqz v8, :cond_1b

    if-nez v24, :cond_f

    if-nez v15, :cond_f

    if-eqz v9, :cond_f

    .line 192
    invoke-static/range {v19 .. v19}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    if-nez v8, :cond_f

    invoke-static {v11}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    if-eqz v8, :cond_e

    goto :goto_8

    :cond_e
    move/from16 v30, v9

    move/from16 v31, v10

    move-object v9, v15

    goto/16 :goto_f

    .line 193
    :cond_f
    :goto_8
    iget-object v8, v4, Landroid/app/Notification;->bigContentView:Landroid/widget/RemoteViews;

    move/from16 v30, v9

    iget-object v9, v4, Landroid/app/Notification;->contentView:Landroid/widget/RemoteViews;

    move/from16 v31, v10

    iget-object v10, v4, Landroid/app/Notification;->headsUpContentView:Landroid/widget/RemoteViews;

    filled-new-array {v2, v8, v9, v10}, [Landroid/widget/RemoteViews;

    move-result-object v2

    invoke-direct {v0, v7, v2}, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->extractFromAllRemoteViews(Ljava/lang/String;[Landroid/widget/RemoteViews;)Lcom/android/systemui/dynamicisland/NotificationIslandSource$ExtractedRemoteData;

    move-result-object v2

    .line 195
    if-eqz v2, :cond_1a

    .line 196
    if-nez v30, :cond_10

    iget-boolean v8, v2, Lcom/android/systemui/dynamicisland/NotificationIslandSource$ExtractedRemoteData;->hasChrono:Z

    if-eqz v8, :cond_10

    .line 197
    nop

    .line 198
    iget-boolean v10, v2, Lcom/android/systemui/dynamicisland/NotificationIslandSource$ExtractedRemoteData;->chronoCountDown:Z

    .line 199
    iget-wide v8, v2, Lcom/android/systemui/dynamicisland/NotificationIslandSource$ExtractedRemoteData;->chronoBase:J

    .line 200
    iget-boolean v0, v2, Lcom/android/systemui/dynamicisland/NotificationIslandSource$ExtractedRemoteData;->chronoStarted:Z

    move/from16 v30, v21

    goto :goto_9

    .line 202
    :cond_10
    move/from16 v0, v21

    move-wide/from16 v8, v28

    move/from16 v10, v31

    :goto_9
    if-nez v30, :cond_14

    move-wide/from16 v28, v8

    iget-wide v8, v2, Lcom/android/systemui/dynamicisland/NotificationIslandSource$ExtractedRemoteData;->parsedChronoMs:J

    cmp-long v8, v8, v17

    if-ltz v8, :cond_15

    .line 203
    nop

    .line 204
    iget-object v0, v2, Lcom/android/systemui/dynamicisland/NotificationIslandSource$ExtractedRemoteData;->texts:Ljava/util/List;

    invoke-static {v6, v0}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v0

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v9, v19

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    .line 205
    if-eqz v24, :cond_12

    invoke-virtual {v0, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v8

    if-nez v8, :cond_11

    invoke-virtual {v0, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v8

    if-nez v8, :cond_11

    goto :goto_a

    :cond_11
    const/4 v8, 0x0

    goto :goto_b

    :cond_12
    :goto_a
    move/from16 v8, v21

    .line 206
    :goto_b
    if-eqz v8, :cond_13

    .line 207
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v28

    move v10, v8

    move-object/from16 v19, v9

    iget-wide v8, v2, Lcom/android/systemui/dynamicisland/NotificationIslandSource$ExtractedRemoteData;->parsedChronoMs:J

    add-long v28, v28, v8

    goto :goto_c

    .line 208
    :cond_13
    move v10, v8

    move-object/from16 v19, v9

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v8

    move-wide/from16 v28, v8

    iget-wide v8, v2, Lcom/android/systemui/dynamicisland/NotificationIslandSource$ExtractedRemoteData;->parsedChronoMs:J

    sub-long v28, v28, v8

    .line 209
    :goto_c
    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    move/from16 v30, v21

    goto :goto_d

    .line 202
    :cond_14
    move-wide/from16 v28, v8

    .line 211
    :cond_15
    :goto_d
    if-gtz v14, :cond_16

    iget v8, v2, Lcom/android/systemui/dynamicisland/NotificationIslandSource$ExtractedRemoteData;->maxProg:I

    if-lez v8, :cond_16

    iget v8, v2, Lcom/android/systemui/dynamicisland/NotificationIslandSource$ExtractedRemoteData;->prog:I

    if-ltz v8, :cond_16

    .line 212
    iget v8, v2, Lcom/android/systemui/dynamicisland/NotificationIslandSource$ExtractedRemoteData;->maxProg:I

    .line 213
    iget v9, v2, Lcom/android/systemui/dynamicisland/NotificationIslandSource$ExtractedRemoteData;->prog:I

    .line 214
    move v14, v8

    move/from16 v22, v9

    const/16 v23, 0x0

    .line 216
    :cond_16
    invoke-static/range {v19 .. v19}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    if-eqz v8, :cond_17

    iget-object v8, v2, Lcom/android/systemui/dynamicisland/NotificationIslandSource$ExtractedRemoteData;->texts:Ljava/util/List;

    invoke-interface {v8}, Ljava/util/List;->isEmpty()Z

    move-result v8

    if-nez v8, :cond_17

    .line 217
    iget-object v8, v2, Lcom/android/systemui/dynamicisland/NotificationIslandSource$ExtractedRemoteData;->texts:Ljava/util/List;

    const/4 v9, 0x0

    invoke-interface {v8, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    move-object/from16 v19, v8

    .line 219
    :cond_17
    invoke-static {v11}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    if-eqz v8, :cond_18

    iget-object v8, v2, Lcom/android/systemui/dynamicisland/NotificationIslandSource$ExtractedRemoteData;->texts:Ljava/util/List;

    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v8

    move/from16 v9, v21

    if-le v8, v9, :cond_18

    .line 220
    iget-object v8, v2, Lcom/android/systemui/dynamicisland/NotificationIslandSource$ExtractedRemoteData;->texts:Ljava/util/List;

    invoke-interface {v8, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    move-object v9, v15

    check-cast v8, Ljava/lang/String;

    move-object v11, v8

    goto :goto_e

    .line 219
    :cond_18
    move-object v9, v15

    .line 222
    :goto_e
    if-eqz v24, :cond_19

    invoke-static {v11}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    if-eqz v8, :cond_19

    iget-object v8, v2, Lcom/android/systemui/dynamicisland/NotificationIslandSource$ExtractedRemoteData;->texts:Ljava/util/List;

    invoke-interface {v8}, Ljava/util/List;->isEmpty()Z

    move-result v8

    if-nez v8, :cond_19

    .line 223
    iget-object v8, v2, Lcom/android/systemui/dynamicisland/NotificationIslandSource$ExtractedRemoteData;->texts:Ljava/util/List;

    iget-object v2, v2, Lcom/android/systemui/dynamicisland/NotificationIslandSource$ExtractedRemoteData;->texts:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    const/4 v11, 0x2

    invoke-static {v11, v2}, Ljava/lang/Math;->min(II)I

    move-result v2

    const/4 v11, 0x0

    invoke-interface {v8, v11, v2}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object v2

    const-string v8, " \u2022 "

    invoke-static {v8, v2}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v11

    move v2, v0

    move-object/from16 v0, v19

    move/from16 v8, v22

    goto :goto_10

    .line 229
    :cond_19
    move v2, v0

    move-object/from16 v0, v19

    move/from16 v8, v22

    goto :goto_10

    .line 195
    :cond_1a
    move-object v9, v15

    goto :goto_f

    .line 191
    :cond_1b
    move/from16 v30, v9

    move/from16 v31, v10

    move-object v9, v15

    .line 229
    :goto_f
    move-object/from16 v0, v19

    move/from16 v8, v22

    move/from16 v10, v31

    const/4 v2, 0x1

    :goto_10
    if-eqz v27, :cond_1e

    if-eqz v24, :cond_1e

    if-nez v30, :cond_1e

    .line 230
    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v15, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-static {v15}, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->parseTimeStringMs(Ljava/lang/String;)J

    move-result-wide v19

    .line 231
    cmp-long v15, v19, v17

    if-ltz v15, :cond_1e

    .line 232
    nop

    .line 233
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v2

    .line 234
    invoke-virtual {v2, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v10

    if-nez v10, :cond_1c

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_1c

    const/4 v3, 0x1

    goto :goto_11

    :cond_1c
    const/4 v3, 0x0

    .line 235
    :goto_11
    if-eqz v3, :cond_1d

    .line 236
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v28

    add-long v28, v28, v19

    goto :goto_12

    .line 237
    :cond_1d
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v28

    sub-long v28, v28, v19

    .line 238
    :goto_12
    invoke-virtual {v2, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    const/4 v15, 0x1

    xor-int/lit8 v2, v1, 0x1

    const/16 v30, 0x1

    move v10, v2

    goto :goto_13

    .line 243
    :cond_1e
    move v3, v10

    move v10, v2

    :goto_13
    const-string v1, "call"

    iget-object v2, v4, Landroid/app/Notification;->category:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_21

    if-eqz v27, :cond_21

    .line 244
    sget-object v2, Lcom/android/systemui/dynamicisland/IslandItem$Category;->CALL:Lcom/android/systemui/dynamicisland/IslandItem$Category;

    move-object/from16 v3, p1

    move-object v5, v0

    move-object v6, v11

    move-object/from16 v1, v26

    move-wide/from16 v7, v28

    move-object/from16 v0, p0

    invoke-direct/range {v0 .. v6}, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->buildBase(Ljava/lang/String;Lcom/android/systemui/dynamicisland/IslandItem$Category;Landroid/service/notification/StatusBarNotification;Landroid/app/Notification;Ljava/lang/String;Ljava/lang/String;)Lcom/android/systemui/dynamicisland/IslandItem;

    move-result-object v2

    .line 245
    move-object v4, v1

    move-object v1, v0

    move-object v0, v5

    const/16 v3, 0x8

    iput v3, v2, Lcom/android/systemui/dynamicisland/IslandItem;->vectorKind:I

    .line 246
    const v3, -0xcf2ea8

    iput v3, v2, Lcom/android/systemui/dynamicisland/IslandItem;->accentColor:I

    .line 247
    move/from16 v11, v16

    iput-boolean v11, v2, Lcom/android/systemui/dynamicisland/IslandItem;->quietUpdate:Z

    .line 248
    if-eqz v30, :cond_1f

    .line 249
    const/4 v15, 0x1

    iput-boolean v15, v2, Lcom/android/systemui/dynamicisland/IslandItem;->hasChronometer:Z

    .line 250
    const/4 v9, 0x0

    iput-boolean v9, v2, Lcom/android/systemui/dynamicisland/IslandItem;->chronometerCountDown:Z

    .line 251
    iput-wide v7, v2, Lcom/android/systemui/dynamicisland/IslandItem;->chronometerBaseElapsedMs:J

    goto :goto_15

    .line 253
    :cond_1f
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_20

    goto :goto_14

    :cond_20
    const-string v0, "In Call"

    :goto_14
    iput-object v0, v2, Lcom/android/systemui/dynamicisland/IslandItem;->compactRightText:Ljava/lang/String;

    .line 255
    :goto_15
    iget-object v0, v1, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->mActiveOngoingKeys:Ljava/util/Set;

    invoke-interface {v0, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 256
    iget-object v0, v1, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->mListener:Lcom/android/systemui/dynamicisland/NotificationIslandSource$Listener;

    invoke-interface {v0, v2}, Lcom/android/systemui/dynamicisland/NotificationIslandSource$Listener;->onItemUpdated(Lcom/android/systemui/dynamicisland/IslandItem;)V

    .line 257
    return-void

    .line 243
    :cond_21
    move-object/from16 v1, p0

    move-object v15, v6

    move-object v6, v11

    move-object v2, v12

    move/from16 v11, v16

    move-object/from16 v16, v13

    move-wide/from16 v12, v28

    .line 261
    if-eqz v27, :cond_24

    invoke-virtual/range {p1 .. p1}, Landroid/service/notification/StatusBarNotification;->getTag()Ljava/lang/String;

    move-result-object v1

    invoke-static {v7, v1, v0, v6}, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->isRecorderPackageOrTag(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_23

    .line 262
    sget-object v2, Lcom/android/systemui/dynamicisland/IslandItem$Category;->RECORDING:Lcom/android/systemui/dynamicisland/IslandItem$Category;

    move-object/from16 v3, p1

    move-object v5, v0

    move-object/from16 v1, v26

    move-object/from16 v0, p0

    invoke-direct/range {v0 .. v6}, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->buildBase(Ljava/lang/String;Lcom/android/systemui/dynamicisland/IslandItem$Category;Landroid/service/notification/StatusBarNotification;Landroid/app/Notification;Ljava/lang/String;Ljava/lang/String;)Lcom/android/systemui/dynamicisland/IslandItem;

    move-result-object v2

    .line 263
    const/4 v3, 0x7

    iput v3, v2, Lcom/android/systemui/dynamicisland/IslandItem;->vectorKind:I

    .line 264
    const v3, -0xbac6

    iput v3, v2, Lcom/android/systemui/dynamicisland/IslandItem;->accentColor:I

    .line 265
    iput-boolean v11, v2, Lcom/android/systemui/dynamicisland/IslandItem;->quietUpdate:Z

    .line 266
    if-eqz v30, :cond_22

    .line 267
    const/4 v15, 0x1

    iput-boolean v15, v2, Lcom/android/systemui/dynamicisland/IslandItem;->hasChronometer:Z

    .line 268
    const/4 v9, 0x0

    iput-boolean v9, v2, Lcom/android/systemui/dynamicisland/IslandItem;->chronometerCountDown:Z

    .line 269
    iput-wide v12, v2, Lcom/android/systemui/dynamicisland/IslandItem;->chronometerBaseElapsedMs:J

    goto :goto_16

    .line 271
    :cond_22
    const-string v3, "REC"

    iput-object v3, v2, Lcom/android/systemui/dynamicisland/IslandItem;->compactRightText:Ljava/lang/String;

    .line 273
    :goto_16
    iget-object v3, v0, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->mActiveOngoingKeys:Ljava/util/Set;

    invoke-interface {v3, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 274
    iget-object v0, v0, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->mListener:Lcom/android/systemui/dynamicisland/NotificationIslandSource$Listener;

    invoke-interface {v0, v2}, Lcom/android/systemui/dynamicisland/NotificationIslandSource$Listener;->onItemUpdated(Lcom/android/systemui/dynamicisland/IslandItem;)V

    .line 275
    return-void

    .line 261
    :cond_23
    move-object v1, v5

    move-object v5, v0

    move-object/from16 v0, p0

    goto :goto_17

    :cond_24
    move-object/from16 v32, v5

    move-object v5, v0

    move-object v0, v1

    move-object/from16 v1, v32

    .line 279
    :goto_17
    if-eqz v27, :cond_36

    if-nez v24, :cond_26

    if-eqz v30, :cond_25

    goto :goto_18

    :cond_25
    move/from16 v17, v10

    move v10, v3

    move-object v3, v4

    move-object/from16 v4, v26

    goto/16 :goto_21

    .line 280
    :cond_26
    :goto_18
    if-eqz v24, :cond_27

    const-string v1, "Timer"

    goto :goto_19

    :cond_27
    invoke-direct {v0, v7}, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->resolveAppName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 281
    :goto_19
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    move-object/from16 v19, v5

    if-nez v7, :cond_28

    goto :goto_1a

    :cond_28
    move-object v5, v1

    .line 282
    :goto_1a
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_29

    move-object v1, v6

    goto :goto_1b

    :cond_29
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_2a

    move-object v1, v2

    .line 283
    :cond_2a
    :goto_1b
    if-eqz v24, :cond_2b

    if-nez v30, :cond_2b

    invoke-static/range {v19 .. v19}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_2b

    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_2b

    .line 284
    return-void

    .line 286
    :cond_2b
    sget-object v2, Lcom/android/systemui/dynamicisland/IslandItem$Category;->TIMER:Lcom/android/systemui/dynamicisland/IslandItem$Category;

    move v8, v3

    move-object v7, v6

    move-object/from16 v3, p1

    move-object v6, v1

    move-object/from16 v1, v26

    invoke-direct/range {v0 .. v6}, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->buildBase(Ljava/lang/String;Lcom/android/systemui/dynamicisland/IslandItem$Category;Landroid/service/notification/StatusBarNotification;Landroid/app/Notification;Ljava/lang/String;Ljava/lang/String;)Lcom/android/systemui/dynamicisland/IslandItem;

    move-result-object v2

    .line 287
    move-object v4, v1

    const/16 v1, -0x60f6

    iput v1, v2, Lcom/android/systemui/dynamicisland/IslandItem;->accentColor:I

    .line 288
    iput-boolean v11, v2, Lcom/android/systemui/dynamicisland/IslandItem;->quietUpdate:Z

    .line 289
    if-nez v24, :cond_2c

    iget-object v1, v2, Lcom/android/systemui/dynamicisland/IslandItem;->iconDrawable:Landroid/graphics/drawable/Drawable;

    if-nez v1, :cond_2d

    .line 290
    :cond_2c
    const/16 v1, 0xe

    iput v1, v2, Lcom/android/systemui/dynamicisland/IslandItem;->vectorKind:I

    .line 292
    :cond_2d
    if-eqz v30, :cond_2f

    if-eqz v10, :cond_2f

    .line 293
    const/4 v15, 0x1

    iput-boolean v15, v2, Lcom/android/systemui/dynamicisland/IslandItem;->hasChronometer:Z

    .line 294
    iput-boolean v8, v2, Lcom/android/systemui/dynamicisland/IslandItem;->chronometerCountDown:Z

    .line 295
    iput-wide v12, v2, Lcom/android/systemui/dynamicisland/IslandItem;->chronometerBaseElapsedMs:J

    .line 296
    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_35

    .line 297
    if-eqz v8, :cond_2e

    const-string v1, "Countdown running"

    goto :goto_1c

    :cond_2e
    const-string v1, "Stopwatch running"

    :goto_1c
    iput-object v1, v2, Lcom/android/systemui/dynamicisland/IslandItem;->subtitle:Ljava/lang/String;

    goto :goto_20

    .line 299
    :cond_2f
    if-eqz v30, :cond_32

    .line 300
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v5

    .line 301
    if-eqz v8, :cond_30

    sub-long v5, v12, v5

    move-wide/from16 v8, v17

    goto :goto_1d

    :cond_30
    move-wide/from16 v8, v17

    sub-long/2addr v5, v12

    :goto_1d
    invoke-static {v8, v9, v5, v6}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v5

    .line 302
    invoke-static {v5, v6}, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->formatTimerMs(J)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v2, Lcom/android/systemui/dynamicisland/IslandItem;->compactRightText:Ljava/lang/String;

    .line 303
    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_31

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, " \u2022 Paused"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_1e

    :cond_31
    const-string v1, "Paused"

    :goto_1e
    iput-object v1, v2, Lcom/android/systemui/dynamicisland/IslandItem;->subtitle:Ljava/lang/String;

    .line 304
    goto :goto_20

    .line 305
    :cond_32
    invoke-static/range {v16 .. v16}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_33

    .line 306
    move-object/from16 v13, v16

    goto :goto_1f

    .line 307
    :cond_33
    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_34

    move-object v13, v7

    goto :goto_1f

    :cond_34
    move-object v13, v5

    :goto_1f
    iput-object v13, v2, Lcom/android/systemui/dynamicisland/IslandItem;->compactRightText:Ljava/lang/String;

    .line 309
    :cond_35
    :goto_20
    iget-object v1, v0, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->mActiveOngoingKeys:Ljava/util/Set;

    invoke-interface {v1, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 310
    iget-object v0, v0, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->mListener:Lcom/android/systemui/dynamicisland/NotificationIslandSource$Listener;

    invoke-interface {v0, v2}, Lcom/android/systemui/dynamicisland/NotificationIslandSource$Listener;->onItemUpdated(Lcom/android/systemui/dynamicisland/IslandItem;)V

    .line 311
    return-void

    .line 279
    :cond_36
    move/from16 v17, v10

    move v10, v3

    move-object v3, v4

    move-object/from16 v4, v26

    .line 315
    :goto_21
    if-eqz v27, :cond_3d

    if-eqz v9, :cond_3d

    .line 316
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_37

    goto :goto_22

    :cond_37
    iget-object v1, v9, Lcom/android/systemui/dynamicisland/NotificationIslandSource$BrandProfile;->shortBrand:Ljava/lang/String;

    move-object v5, v1

    .line 317
    :goto_22
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_38

    goto :goto_23

    :cond_38
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_39

    move-object v6, v2

    goto :goto_23

    :cond_39
    const-string v12, "Live update"

    move-object v6, v12

    .line 318
    :goto_23
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->isIrrelevantLiveService(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3b

    .line 319
    if-eqz v11, :cond_3a

    .line 320
    iget-object v1, v0, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->mActiveOngoingKeys:Ljava/util/Set;

    invoke-interface {v1, v4}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 321
    iget-object v0, v0, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->mListener:Lcom/android/systemui/dynamicisland/NotificationIslandSource$Listener;

    invoke-interface {v0, v4}, Lcom/android/systemui/dynamicisland/NotificationIslandSource$Listener;->onItemRemoved(Ljava/lang/String;)V

    .line 323
    :cond_3a
    return-void

    .line 326
    :cond_3b
    iget-object v2, v9, Lcom/android/systemui/dynamicisland/NotificationIslandSource$BrandProfile;->category:Lcom/android/systemui/dynamicisland/IslandItem$Category;

    move-object v1, v4

    move-object v4, v3

    move-object/from16 v3, p1

    invoke-direct/range {v0 .. v6}, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->buildBase(Ljava/lang/String;Lcom/android/systemui/dynamicisland/IslandItem$Category;Landroid/service/notification/StatusBarNotification;Landroid/app/Notification;Ljava/lang/String;Ljava/lang/String;)Lcom/android/systemui/dynamicisland/IslandItem;

    move-result-object v2

    .line 327
    move-object v4, v1

    iget-object v1, v9, Lcom/android/systemui/dynamicisland/NotificationIslandSource$BrandProfile;->shortBrand:Ljava/lang/String;

    iput-object v1, v2, Lcom/android/systemui/dynamicisland/IslandItem;->appName:Ljava/lang/String;

    .line 328
    iget v1, v9, Lcom/android/systemui/dynamicisland/NotificationIslandSource$BrandProfile;->accentColor:I

    iput v1, v2, Lcom/android/systemui/dynamicisland/IslandItem;->accentColor:I

    .line 329
    iput-boolean v11, v2, Lcom/android/systemui/dynamicisland/IslandItem;->quietUpdate:Z

    .line 331
    if-lez v14, :cond_3c

    if-nez v23, :cond_3c

    .line 332
    const/4 v15, 0x1

    iput-boolean v15, v2, Lcom/android/systemui/dynamicisland/IslandItem;->hasProgress:Z

    .line 333
    int-to-long v7, v8

    iput-wide v7, v2, Lcom/android/systemui/dynamicisland/IslandItem;->progressValue:J

    .line 334
    int-to-long v7, v14

    iput-wide v7, v2, Lcom/android/systemui/dynamicisland/IslandItem;->progressMax:J

    .line 337
    :cond_3c
    iget-object v1, v9, Lcom/android/systemui/dynamicisland/NotificationIslandSource$BrandProfile;->shortBrand:Ljava/lang/String;

    move-object/from16 v9, v16

    invoke-static {v9, v5, v6, v1}, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->extractCompactLiveBadge(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 338
    iput-object v1, v2, Lcom/android/systemui/dynamicisland/IslandItem;->compactRightText:Ljava/lang/String;

    .line 340
    iget-object v1, v0, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->mActiveOngoingKeys:Ljava/util/Set;

    invoke-interface {v1, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 341
    iget-object v0, v0, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->mListener:Lcom/android/systemui/dynamicisland/NotificationIslandSource$Listener;

    invoke-interface {v0, v2}, Lcom/android/systemui/dynamicisland/NotificationIslandSource$Listener;->onItemUpdated(Lcom/android/systemui/dynamicisland/IslandItem;)V

    .line 342
    return-void

    .line 315
    :cond_3d
    move-object/from16 v9, v16

    .line 346
    if-eqz v27, :cond_3e

    if-lez v14, :cond_3e

    if-nez v23, :cond_3e

    invoke-static {v7, v5, v6}, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->isSystemNoise(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v16

    if-nez v16, :cond_3e

    .line 347
    int-to-float v1, v8

    const/high16 v2, 0x42c80000    # 100.0f

    mul-float/2addr v1, v2

    int-to-float v2, v14

    div-float/2addr v1, v2

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v1

    const/16 v2, 0x64

    invoke-static {v2, v1}, Ljava/lang/Math;->min(II)I

    move-result v1

    const/4 v2, 0x0

    invoke-static {v2, v1}, Ljava/lang/Math;->max(II)I

    move-result v7

    .line 348
    sget-object v2, Lcom/android/systemui/dynamicisland/IslandItem$Category;->DOWNLOAD:Lcom/android/systemui/dynamicisland/IslandItem$Category;

    move-object v1, v4

    move-object v4, v3

    move-object/from16 v3, p1

    invoke-direct/range {v0 .. v6}, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->buildBase(Ljava/lang/String;Lcom/android/systemui/dynamicisland/IslandItem$Category;Landroid/service/notification/StatusBarNotification;Landroid/app/Notification;Ljava/lang/String;Ljava/lang/String;)Lcom/android/systemui/dynamicisland/IslandItem;

    move-result-object v2

    .line 349
    move-object v4, v1

    const v1, -0xf57b01

    iput v1, v2, Lcom/android/systemui/dynamicisland/IslandItem;->accentColor:I

    .line 350
    iput-boolean v11, v2, Lcom/android/systemui/dynamicisland/IslandItem;->quietUpdate:Z

    .line 351
    const/4 v15, 0x1

    iput-boolean v15, v2, Lcom/android/systemui/dynamicisland/IslandItem;->hasProgress:Z

    .line 352
    int-to-long v5, v8

    iput-wide v5, v2, Lcom/android/systemui/dynamicisland/IslandItem;->progressValue:J

    .line 353
    int-to-long v5, v14

    iput-wide v5, v2, Lcom/android/systemui/dynamicisland/IslandItem;->progressMax:J

    .line 354
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, "%"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v2, Lcom/android/systemui/dynamicisland/IslandItem;->compactRightText:Ljava/lang/String;

    .line 355
    iget-object v1, v0, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->mActiveOngoingKeys:Ljava/util/Set;

    invoke-interface {v1, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 356
    iget-object v0, v0, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->mListener:Lcom/android/systemui/dynamicisland/NotificationIslandSource$Listener;

    invoke-interface {v0, v2}, Lcom/android/systemui/dynamicisland/NotificationIslandSource$Listener;->onItemUpdated(Lcom/android/systemui/dynamicisland/IslandItem;)V

    .line 357
    return-void

    .line 346
    :cond_3e
    const/16 v25, 0x0

    .line 361
    const/high16 v16, -0x1000000

    move-object/from16 v18, v2

    const-string v2, "android"

    if-eqz v27, :cond_4b

    .line 362
    if-eqz v7, :cond_41

    invoke-static {v7, v5, v6}, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->isSystemNoise(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v18

    if-eqz v18, :cond_41

    invoke-virtual {v7, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_3f

    const-string v2, "com.android."

    invoke-virtual {v7, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_3f

    const-string v2, "com.samsung.android."

    invoke-virtual {v7, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_41

    .line 363
    :cond_3f
    if-eqz v11, :cond_40

    .line 364
    iget-object v1, v0, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->mActiveOngoingKeys:Ljava/util/Set;

    invoke-interface {v1, v4}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 365
    iget-object v0, v0, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->mListener:Lcom/android/systemui/dynamicisland/NotificationIslandSource$Listener;

    invoke-interface {v0, v4}, Lcom/android/systemui/dynamicisland/NotificationIslandSource$Listener;->onItemRemoved(Ljava/lang/String;)V

    .line 367
    :cond_40
    return-void

    .line 369
    :cond_41
    iget v2, v3, Landroid/app/Notification;->flags:I

    and-int/lit16 v2, v2, 0x2000

    if-nez v2, :cond_42

    .line 370
    invoke-static {v9}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_42

    iget-object v2, v3, Landroid/app/Notification;->category:Ljava/lang/String;

    .line 371
    const-string v0, "navigation"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_42

    iget-object v0, v3, Landroid/app/Notification;->category:Ljava/lang/String;

    .line 372
    const-string v2, "progress"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_42

    iget-object v0, v3, Landroid/app/Notification;->category:Ljava/lang/String;

    .line 373
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_42

    iget-object v0, v3, Landroid/app/Notification;->category:Ljava/lang/String;

    .line 374
    const-string v1, "workout"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_42

    .line 375
    invoke-static {v7, v5, v6}, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->isSystemNoise(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_43

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->looksLikeLiveDeliveryOrRide(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_43

    :cond_42
    const/16 v25, 0x1

    .line 376
    :cond_43
    if-eqz v25, :cond_49

    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_45

    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_45

    if-eqz v30, :cond_44

    goto :goto_24

    :cond_44
    move-object/from16 v0, p0

    move-object v1, v4

    goto :goto_27

    .line 377
    :cond_45
    :goto_24
    sget-object v2, Lcom/android/systemui/dynamicisland/IslandItem$Category;->LIVE_GENERAL:Lcom/android/systemui/dynamicisland/IslandItem$Category;

    move-object/from16 v0, p0

    move-object v1, v4

    move-object v4, v3

    move-object/from16 v3, p1

    invoke-direct/range {v0 .. v6}, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->buildBase(Ljava/lang/String;Lcom/android/systemui/dynamicisland/IslandItem$Category;Landroid/service/notification/StatusBarNotification;Landroid/app/Notification;Ljava/lang/String;Ljava/lang/String;)Lcom/android/systemui/dynamicisland/IslandItem;

    move-result-object v2

    .line 378
    iget v3, v4, Landroid/app/Notification;->color:I

    if-eqz v3, :cond_46

    iget v3, v4, Landroid/app/Notification;->color:I

    or-int v3, v3, v16

    goto :goto_25

    :cond_46
    const v3, -0xcd521a

    .line 379
    :goto_25
    iput v3, v2, Lcom/android/systemui/dynamicisland/IslandItem;->accentColor:I

    .line 380
    iput-boolean v11, v2, Lcom/android/systemui/dynamicisland/IslandItem;->quietUpdate:Z

    .line 381
    if-eqz v30, :cond_47

    if-eqz v17, :cond_47

    .line 382
    const/4 v15, 0x1

    iput-boolean v15, v2, Lcom/android/systemui/dynamicisland/IslandItem;->hasChronometer:Z

    .line 383
    iput-boolean v10, v2, Lcom/android/systemui/dynamicisland/IslandItem;->chronometerCountDown:Z

    .line 384
    iput-wide v12, v2, Lcom/android/systemui/dynamicisland/IslandItem;->chronometerBaseElapsedMs:J

    goto :goto_26

    .line 386
    :cond_47
    invoke-direct {v0, v7}, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->resolveAppName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v9, v5, v6, v3}, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->extractCompactLiveBadge(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/android/systemui/dynamicisland/IslandItem;->compactRightText:Ljava/lang/String;

    .line 388
    :goto_26
    if-lez v14, :cond_48

    if-nez v23, :cond_48

    .line 389
    const/4 v15, 0x1

    iput-boolean v15, v2, Lcom/android/systemui/dynamicisland/IslandItem;->hasProgress:Z

    .line 390
    int-to-long v3, v8

    iput-wide v3, v2, Lcom/android/systemui/dynamicisland/IslandItem;->progressValue:J

    .line 391
    int-to-long v3, v14

    iput-wide v3, v2, Lcom/android/systemui/dynamicisland/IslandItem;->progressMax:J

    .line 393
    :cond_48
    iget-object v3, v0, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->mActiveOngoingKeys:Ljava/util/Set;

    invoke-interface {v3, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 394
    iget-object v0, v0, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->mListener:Lcom/android/systemui/dynamicisland/NotificationIslandSource$Listener;

    invoke-interface {v0, v2}, Lcom/android/systemui/dynamicisland/NotificationIslandSource$Listener;->onItemUpdated(Lcom/android/systemui/dynamicisland/IslandItem;)V

    .line 395
    return-void

    .line 376
    :cond_49
    move-object/from16 v0, p0

    move-object v1, v4

    .line 398
    :goto_27
    if-eqz v11, :cond_4a

    .line 399
    iget-object v2, v0, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->mActiveOngoingKeys:Ljava/util/Set;

    invoke-interface {v2, v1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 400
    iget-object v0, v0, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->mListener:Lcom/android/systemui/dynamicisland/NotificationIslandSource$Listener;

    invoke-interface {v0, v1}, Lcom/android/systemui/dynamicisland/NotificationIslandSource$Listener;->onItemRemoved(Ljava/lang/String;)V

    .line 402
    :cond_4a
    return-void

    .line 406
    :cond_4b
    move-object v1, v4

    move-object v4, v3

    const-string v3, "com.android.systemui"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_56

    invoke-virtual {v2, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4c

    goto/16 :goto_2b

    .line 409
    :cond_4c
    const-string v2, "transport"

    iget-object v3, v4, Landroid/app/Notification;->category:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_55

    iget-object v2, v4, Landroid/app/Notification;->category:Ljava/lang/String;

    .line 410
    const-string v3, "sys"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_55

    iget-object v2, v4, Landroid/app/Notification;->category:Ljava/lang/String;

    .line 411
    const-string v3, "service"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4d

    goto/16 :goto_2a

    .line 414
    :cond_4d
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_4e

    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_4e

    .line 415
    return-void

    .line 418
    :cond_4e
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v8

    .line 419
    iget-object v2, v0, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->mRecentPeeks:Ljava/util/Map;

    invoke-interface {v2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Long;

    .line 420
    if-eqz v2, :cond_4f

    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    sub-long v2, v8, v2

    const-wide/16 v10, 0x2710

    cmp-long v2, v2, v10

    if-gez v2, :cond_4f

    .line 421
    return-void

    .line 423
    :cond_4f
    iget-object v2, v0, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->mRecentPeeks:Ljava/util/Map;

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-interface {v2, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 424
    iget-object v2, v0, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->mRecentPeeks:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->size()I

    move-result v2

    const/16 v3, 0x40

    if-le v2, v3, :cond_50

    .line 425
    iget-object v2, v0, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->mRecentPeeks:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->clear()V

    .line 428
    :cond_50
    invoke-direct {v0, v7}, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->resolveAppName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 429
    sget-object v2, Lcom/android/systemui/dynamicisland/IslandItem$Category;->NOTIFICATION_PEEK:Lcom/android/systemui/dynamicisland/IslandItem$Category;

    .line 430
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_51

    goto :goto_28

    :cond_51
    invoke-static/range {v18 .. v18}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_52

    move-object/from16 v5, v18

    goto :goto_28

    :cond_52
    move-object v5, v7

    .line 429
    :goto_28
    move-object/from16 v3, p1

    invoke-direct/range {v0 .. v6}, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->buildBase(Ljava/lang/String;Lcom/android/systemui/dynamicisland/IslandItem$Category;Landroid/service/notification/StatusBarNotification;Landroid/app/Notification;Ljava/lang/String;Ljava/lang/String;)Lcom/android/systemui/dynamicisland/IslandItem;

    move-result-object v1

    .line 432
    iput-object v7, v1, Lcom/android/systemui/dynamicisland/IslandItem;->appName:Ljava/lang/String;

    .line 433
    const/4 v15, 0x1

    iput-boolean v15, v1, Lcom/android/systemui/dynamicisland/IslandItem;->transientItem:Z

    .line 434
    const-wide/16 v2, 0xed8

    add-long/2addr v8, v2

    iput-wide v8, v1, Lcom/android/systemui/dynamicisland/IslandItem;->expiresAtElapsedMs:J

    .line 435
    iget v2, v4, Landroid/app/Notification;->color:I

    if-eqz v2, :cond_53

    iget v2, v4, Landroid/app/Notification;->color:I

    or-int v2, v2, v16

    goto :goto_29

    :cond_53
    const v2, -0x9b2d01

    :goto_29
    iput v2, v1, Lcom/android/systemui/dynamicisland/IslandItem;->accentColor:I

    .line 436
    iget-object v2, v1, Lcom/android/systemui/dynamicisland/IslandItem;->title:Ljava/lang/String;

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_54

    iget-object v7, v1, Lcom/android/systemui/dynamicisland/IslandItem;->title:Ljava/lang/String;

    :cond_54
    iput-object v7, v1, Lcom/android/systemui/dynamicisland/IslandItem;->compactRightText:Ljava/lang/String;

    .line 437
    iget-object v0, v0, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->mListener:Lcom/android/systemui/dynamicisland/NotificationIslandSource$Listener;

    invoke-interface {v0, v1}, Lcom/android/systemui/dynamicisland/NotificationIslandSource$Listener;->onItemUpdated(Lcom/android/systemui/dynamicisland/IslandItem;)V

    .line 438
    return-void

    .line 412
    :cond_55
    :goto_2a
    return-void

    .line 407
    :cond_56
    :goto_2b
    return-void

    .line 141
    :cond_57
    :goto_2c
    return-void
.end method

.method public onRemoved(Landroid/service/notification/StatusBarNotification;)V
    .locals 2

    .line 441
    if-nez p1, :cond_0

    .line 442
    return-void

    .line 444
    :cond_0
    invoke-virtual {p1}, Landroid/service/notification/StatusBarNotification;->getKey()Ljava/lang/String;

    move-result-object p1

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "sbn:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 445
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->mRecentPeeks:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 446
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->mActiveOngoingKeys:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 447
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/NotificationIslandSource;->mListener:Lcom/android/systemui/dynamicisland/NotificationIslandSource$Listener;

    invoke-interface {v0, p1}, Lcom/android/systemui/dynamicisland/NotificationIslandSource$Listener;->onItemRemoved(Ljava/lang/String;)V

    .line 448
    return-void
.end method
