.class public final Lcom/android/systemui/dynamicisland/IslandItem;
.super Ljava/lang/Object;
.source "IslandItem.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/systemui/dynamicisland/IslandItem$Category;,
        Lcom/android/systemui/dynamicisland/IslandItem$ActionItem;
    }
.end annotation


# instance fields
.field public accentColor:I

.field public final actions:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/systemui/dynamicisland/IslandItem$ActionItem;",
            ">;"
        }
    .end annotation
.end field

.field public appName:Ljava/lang/String;

.field public artwork:Landroid/graphics/Bitmap;

.field public canSeekMedia:Z

.field public category:Lcom/android/systemui/dynamicisland/IslandItem$Category;

.field public chronometerBaseElapsedMs:J

.field public chronometerCountDown:Z

.field public compactRightText:Ljava/lang/String;

.field public contentIntent:Landroid/app/PendingIntent;

.field public expiresAtElapsedMs:J

.field public hasChronometer:Z

.field public hasProgress:Z

.field public iconDrawable:Landroid/graphics/drawable/Drawable;

.field public key:Ljava/lang/String;

.field public mediaController:Landroid/media/session/MediaController;

.field public mediaPositionUpdateElapsedMs:J

.field public mediaSpeed:F

.field public progressMax:J

.field public progressValue:J

.field public quietUpdate:Z

.field public showWaveform:Z

.field public subtitle:Ljava/lang/String;

.field public title:Ljava/lang/String;

.field public transientItem:Z

.field public vectorKind:I

.field public waveformPlaying:Z


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/android/systemui/dynamicisland/IslandItem$Category;)V
    .locals 2

    .line 83
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    const v0, -0xcf2ea8

    iput v0, p0, Lcom/android/systemui/dynamicisland/IslandItem;->accentColor:I

    .line 56
    const-string v0, ""

    iput-object v0, p0, Lcom/android/systemui/dynamicisland/IslandItem;->appName:Ljava/lang/String;

    .line 57
    iput-object v0, p0, Lcom/android/systemui/dynamicisland/IslandItem;->title:Ljava/lang/String;

    .line 58
    iput-object v0, p0, Lcom/android/systemui/dynamicisland/IslandItem;->subtitle:Ljava/lang/String;

    .line 59
    iput-object v0, p0, Lcom/android/systemui/dynamicisland/IslandItem;->compactRightText:Ljava/lang/String;

    .line 76
    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, p0, Lcom/android/systemui/dynamicisland/IslandItem;->mediaSpeed:F

    .line 81
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/android/systemui/dynamicisland/IslandItem;->actions:Ljava/util/List;

    .line 84
    iput-object p1, p0, Lcom/android/systemui/dynamicisland/IslandItem;->key:Ljava/lang/String;

    .line 85
    iput-object p2, p0, Lcom/android/systemui/dynamicisland/IslandItem;->category:Lcom/android/systemui/dynamicisland/IslandItem$Category;

    .line 86
    return-void
.end method


# virtual methods
.method public priority()I
    .locals 1

    .line 89
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandItem;->category:Lcom/android/systemui/dynamicisland/IslandItem$Category;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/systemui/dynamicisland/IslandItem;->category:Lcom/android/systemui/dynamicisland/IslandItem$Category;

    iget v0, v0, Lcom/android/systemui/dynamicisland/IslandItem$Category;->priority:I

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method
