.class public final Lcom/android/systemui/dynamicisland/IslandItem$ActionItem;
.super Ljava/lang/Object;
.source "IslandItem.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/systemui/dynamicisland/IslandItem;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "ActionItem"
.end annotation


# instance fields
.field public final icon:Landroid/graphics/drawable/Icon;

.field public final intent:Landroid/app/PendingIntent;

.field public final label:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Landroid/app/PendingIntent;Landroid/graphics/drawable/Icon;)V
    .locals 0

    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    iput-object p1, p0, Lcom/android/systemui/dynamicisland/IslandItem$ActionItem;->label:Ljava/lang/String;

    .line 44
    iput-object p2, p0, Lcom/android/systemui/dynamicisland/IslandItem$ActionItem;->intent:Landroid/app/PendingIntent;

    .line 45
    iput-object p3, p0, Lcom/android/systemui/dynamicisland/IslandItem$ActionItem;->icon:Landroid/graphics/drawable/Icon;

    .line 46
    return-void
.end method
