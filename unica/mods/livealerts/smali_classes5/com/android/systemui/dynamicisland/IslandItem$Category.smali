.class public final enum Lcom/android/systemui/dynamicisland/IslandItem$Category;
.super Ljava/lang/Enum;
.source "IslandItem.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/systemui/dynamicisland/IslandItem;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Category"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/android/systemui/dynamicisland/IslandItem$Category;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/android/systemui/dynamicisland/IslandItem$Category;

.field public static final enum CALL:Lcom/android/systemui/dynamicisland/IslandItem$Category;

.field public static final enum DOWNLOAD:Lcom/android/systemui/dynamicisland/IslandItem$Category;

.field public static final enum FLASH_EVENT:Lcom/android/systemui/dynamicisland/IslandItem$Category;

.field public static final enum HOTSPOT:Lcom/android/systemui/dynamicisland/IslandItem$Category;

.field public static final enum LIVE_DELIVERY:Lcom/android/systemui/dynamicisland/IslandItem$Category;

.field public static final enum LIVE_GENERAL:Lcom/android/systemui/dynamicisland/IslandItem$Category;

.field public static final enum LIVE_RIDE:Lcom/android/systemui/dynamicisland/IslandItem$Category;

.field public static final enum MEDIA:Lcom/android/systemui/dynamicisland/IslandItem$Category;

.field public static final enum NOTIFICATION_PEEK:Lcom/android/systemui/dynamicisland/IslandItem$Category;

.field public static final enum RECORDING:Lcom/android/systemui/dynamicisland/IslandItem$Category;

.field public static final enum TIMER:Lcom/android/systemui/dynamicisland/IslandItem$Category;


# instance fields
.field public final priority:I


# direct methods
.method private static synthetic $values()[Lcom/android/systemui/dynamicisland/IslandItem$Category;
    .locals 11

    .line 17
    sget-object v0, Lcom/android/systemui/dynamicisland/IslandItem$Category;->CALL:Lcom/android/systemui/dynamicisland/IslandItem$Category;

    sget-object v1, Lcom/android/systemui/dynamicisland/IslandItem$Category;->FLASH_EVENT:Lcom/android/systemui/dynamicisland/IslandItem$Category;

    sget-object v2, Lcom/android/systemui/dynamicisland/IslandItem$Category;->TIMER:Lcom/android/systemui/dynamicisland/IslandItem$Category;

    sget-object v3, Lcom/android/systemui/dynamicisland/IslandItem$Category;->RECORDING:Lcom/android/systemui/dynamicisland/IslandItem$Category;

    sget-object v4, Lcom/android/systemui/dynamicisland/IslandItem$Category;->LIVE_DELIVERY:Lcom/android/systemui/dynamicisland/IslandItem$Category;

    sget-object v5, Lcom/android/systemui/dynamicisland/IslandItem$Category;->LIVE_RIDE:Lcom/android/systemui/dynamicisland/IslandItem$Category;

    sget-object v6, Lcom/android/systemui/dynamicisland/IslandItem$Category;->HOTSPOT:Lcom/android/systemui/dynamicisland/IslandItem$Category;

    sget-object v7, Lcom/android/systemui/dynamicisland/IslandItem$Category;->LIVE_GENERAL:Lcom/android/systemui/dynamicisland/IslandItem$Category;

    sget-object v8, Lcom/android/systemui/dynamicisland/IslandItem$Category;->DOWNLOAD:Lcom/android/systemui/dynamicisland/IslandItem$Category;

    sget-object v9, Lcom/android/systemui/dynamicisland/IslandItem$Category;->MEDIA:Lcom/android/systemui/dynamicisland/IslandItem$Category;

    sget-object v10, Lcom/android/systemui/dynamicisland/IslandItem$Category;->NOTIFICATION_PEEK:Lcom/android/systemui/dynamicisland/IslandItem$Category;

    filled-new-array/range {v0 .. v10}, [Lcom/android/systemui/dynamicisland/IslandItem$Category;

    move-result-object v0

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 4

    .line 18
    new-instance v0, Lcom/android/systemui/dynamicisland/IslandItem$Category;

    const/4 v1, 0x0

    const/16 v2, 0x64

    const-string v3, "CALL"

    invoke-direct {v0, v3, v1, v2}, Lcom/android/systemui/dynamicisland/IslandItem$Category;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/android/systemui/dynamicisland/IslandItem$Category;->CALL:Lcom/android/systemui/dynamicisland/IslandItem$Category;

    .line 19
    new-instance v0, Lcom/android/systemui/dynamicisland/IslandItem$Category;

    const/4 v1, 0x1

    const/16 v2, 0x5a

    const-string v3, "FLASH_EVENT"

    invoke-direct {v0, v3, v1, v2}, Lcom/android/systemui/dynamicisland/IslandItem$Category;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/android/systemui/dynamicisland/IslandItem$Category;->FLASH_EVENT:Lcom/android/systemui/dynamicisland/IslandItem$Category;

    .line 20
    new-instance v0, Lcom/android/systemui/dynamicisland/IslandItem$Category;

    const/4 v1, 0x2

    const/16 v2, 0x50

    const-string v3, "TIMER"

    invoke-direct {v0, v3, v1, v2}, Lcom/android/systemui/dynamicisland/IslandItem$Category;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/android/systemui/dynamicisland/IslandItem$Category;->TIMER:Lcom/android/systemui/dynamicisland/IslandItem$Category;

    .line 21
    new-instance v0, Lcom/android/systemui/dynamicisland/IslandItem$Category;

    const/4 v1, 0x3

    const/16 v2, 0x4c

    const-string v3, "RECORDING"

    invoke-direct {v0, v3, v1, v2}, Lcom/android/systemui/dynamicisland/IslandItem$Category;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/android/systemui/dynamicisland/IslandItem$Category;->RECORDING:Lcom/android/systemui/dynamicisland/IslandItem$Category;

    .line 22
    new-instance v0, Lcom/android/systemui/dynamicisland/IslandItem$Category;

    const/4 v1, 0x4

    const/16 v2, 0x48

    const-string v3, "LIVE_DELIVERY"

    invoke-direct {v0, v3, v1, v2}, Lcom/android/systemui/dynamicisland/IslandItem$Category;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/android/systemui/dynamicisland/IslandItem$Category;->LIVE_DELIVERY:Lcom/android/systemui/dynamicisland/IslandItem$Category;

    .line 23
    new-instance v0, Lcom/android/systemui/dynamicisland/IslandItem$Category;

    const/4 v1, 0x5

    const/16 v2, 0x46

    const-string v3, "LIVE_RIDE"

    invoke-direct {v0, v3, v1, v2}, Lcom/android/systemui/dynamicisland/IslandItem$Category;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/android/systemui/dynamicisland/IslandItem$Category;->LIVE_RIDE:Lcom/android/systemui/dynamicisland/IslandItem$Category;

    .line 24
    new-instance v0, Lcom/android/systemui/dynamicisland/IslandItem$Category;

    const/4 v1, 0x6

    const/16 v2, 0x41

    const-string v3, "HOTSPOT"

    invoke-direct {v0, v3, v1, v2}, Lcom/android/systemui/dynamicisland/IslandItem$Category;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/android/systemui/dynamicisland/IslandItem$Category;->HOTSPOT:Lcom/android/systemui/dynamicisland/IslandItem$Category;

    .line 25
    new-instance v0, Lcom/android/systemui/dynamicisland/IslandItem$Category;

    const/4 v1, 0x7

    const/16 v2, 0x3e

    const-string v3, "LIVE_GENERAL"

    invoke-direct {v0, v3, v1, v2}, Lcom/android/systemui/dynamicisland/IslandItem$Category;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/android/systemui/dynamicisland/IslandItem$Category;->LIVE_GENERAL:Lcom/android/systemui/dynamicisland/IslandItem$Category;

    .line 26
    new-instance v0, Lcom/android/systemui/dynamicisland/IslandItem$Category;

    const/16 v1, 0x8

    const/16 v2, 0x3a

    const-string v3, "DOWNLOAD"

    invoke-direct {v0, v3, v1, v2}, Lcom/android/systemui/dynamicisland/IslandItem$Category;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/android/systemui/dynamicisland/IslandItem$Category;->DOWNLOAD:Lcom/android/systemui/dynamicisland/IslandItem$Category;

    .line 27
    new-instance v0, Lcom/android/systemui/dynamicisland/IslandItem$Category;

    const/16 v1, 0x9

    const/16 v2, 0x32

    const-string v3, "MEDIA"

    invoke-direct {v0, v3, v1, v2}, Lcom/android/systemui/dynamicisland/IslandItem$Category;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/android/systemui/dynamicisland/IslandItem$Category;->MEDIA:Lcom/android/systemui/dynamicisland/IslandItem$Category;

    .line 28
    new-instance v0, Lcom/android/systemui/dynamicisland/IslandItem$Category;

    const/16 v1, 0xa

    const/16 v2, 0x28

    const-string v3, "NOTIFICATION_PEEK"

    invoke-direct {v0, v3, v1, v2}, Lcom/android/systemui/dynamicisland/IslandItem$Category;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/android/systemui/dynamicisland/IslandItem$Category;->NOTIFICATION_PEEK:Lcom/android/systemui/dynamicisland/IslandItem$Category;

    .line 17
    invoke-static {}, Lcom/android/systemui/dynamicisland/IslandItem$Category;->$values()[Lcom/android/systemui/dynamicisland/IslandItem$Category;

    move-result-object v0

    sput-object v0, Lcom/android/systemui/dynamicisland/IslandItem$Category;->$VALUES:[Lcom/android/systemui/dynamicisland/IslandItem$Category;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000,
            0x1000,
            0x0
        }
        names = {
            null,
            null,
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .line 32
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 33
    iput p3, p0, Lcom/android/systemui/dynamicisland/IslandItem$Category;->priority:I

    .line 34
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/android/systemui/dynamicisland/IslandItem$Category;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8000
        }
        names = {
            null
        }
    .end annotation

    .line 17
    const-class v0, Lcom/android/systemui/dynamicisland/IslandItem$Category;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/android/systemui/dynamicisland/IslandItem$Category;

    return-object p0
.end method

.method public static values()[Lcom/android/systemui/dynamicisland/IslandItem$Category;
    .locals 1

    .line 17
    sget-object v0, Lcom/android/systemui/dynamicisland/IslandItem$Category;->$VALUES:[Lcom/android/systemui/dynamicisland/IslandItem$Category;

    invoke-virtual {v0}, [Lcom/android/systemui/dynamicisland/IslandItem$Category;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/android/systemui/dynamicisland/IslandItem$Category;

    return-object v0
.end method
