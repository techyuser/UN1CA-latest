.class final Lcom/android/systemui/dynamicisland/NotificationIslandSource$BrandProfile;
.super Ljava/lang/Object;
.source "NotificationIslandSource.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/systemui/dynamicisland/NotificationIslandSource;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "BrandProfile"
.end annotation


# instance fields
.field final accentColor:I

.field final category:Lcom/android/systemui/dynamicisland/IslandItem$Category;

.field final shortBrand:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/android/systemui/dynamicisland/IslandItem$Category;ILjava/lang/String;)V
    .locals 0

    .line 107
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 108
    iput-object p1, p0, Lcom/android/systemui/dynamicisland/NotificationIslandSource$BrandProfile;->category:Lcom/android/systemui/dynamicisland/IslandItem$Category;

    .line 109
    iput p2, p0, Lcom/android/systemui/dynamicisland/NotificationIslandSource$BrandProfile;->accentColor:I

    .line 110
    iput-object p3, p0, Lcom/android/systemui/dynamicisland/NotificationIslandSource$BrandProfile;->shortBrand:Ljava/lang/String;

    .line 111
    return-void
.end method
