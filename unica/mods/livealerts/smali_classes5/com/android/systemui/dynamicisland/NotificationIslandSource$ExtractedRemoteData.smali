.class final Lcom/android/systemui/dynamicisland/NotificationIslandSource$ExtractedRemoteData;
.super Ljava/lang/Object;
.source "NotificationIslandSource.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/systemui/dynamicisland/NotificationIslandSource;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "ExtractedRemoteData"
.end annotation


# instance fields
.field chronoBase:J

.field chronoCountDown:Z

.field chronoStarted:Z

.field hasChrono:Z

.field maxProg:I

.field parsedChronoMs:J

.field prog:I

.field final texts:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>()V
    .locals 3

    .line 114
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 115
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/systemui/dynamicisland/NotificationIslandSource$ExtractedRemoteData;->hasChrono:Z

    .line 116
    const-wide/16 v1, 0x0

    iput-wide v1, p0, Lcom/android/systemui/dynamicisland/NotificationIslandSource$ExtractedRemoteData;->chronoBase:J

    .line 117
    iput-boolean v0, p0, Lcom/android/systemui/dynamicisland/NotificationIslandSource$ExtractedRemoteData;->chronoCountDown:Z

    .line 118
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/android/systemui/dynamicisland/NotificationIslandSource$ExtractedRemoteData;->chronoStarted:Z

    .line 119
    const-wide/16 v1, -0x1

    iput-wide v1, p0, Lcom/android/systemui/dynamicisland/NotificationIslandSource$ExtractedRemoteData;->parsedChronoMs:J

    .line 120
    const/4 v1, -0x1

    iput v1, p0, Lcom/android/systemui/dynamicisland/NotificationIslandSource$ExtractedRemoteData;->prog:I

    .line 121
    iput v0, p0, Lcom/android/systemui/dynamicisland/NotificationIslandSource$ExtractedRemoteData;->maxProg:I

    .line 122
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/systemui/dynamicisland/NotificationIslandSource$ExtractedRemoteData;->texts:Ljava/util/List;

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/systemui/dynamicisland/NotificationIslandSource-IA;)V
    .locals 0

    invoke-direct {p0}, Lcom/android/systemui/dynamicisland/NotificationIslandSource$ExtractedRemoteData;-><init>()V

    return-void
.end method
