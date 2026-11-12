.class Lcom/android/systemui/dynamicisland/DynamicIslandController$4;
.super Ljava/lang/Object;
.source "DynamicIslandController.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/systemui/dynamicisland/DynamicIslandController;->getOrderedItems()Ljava/util/List;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator<",
        "Lcom/android/systemui/dynamicisland/IslandItem;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/systemui/dynamicisland/DynamicIslandController;


# direct methods
.method constructor <init>(Lcom/android/systemui/dynamicisland/DynamicIslandController;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 591
    iput-object p1, p0, Lcom/android/systemui/dynamicisland/DynamicIslandController$4;->this$0:Lcom/android/systemui/dynamicisland/DynamicIslandController;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Lcom/android/systemui/dynamicisland/IslandItem;Lcom/android/systemui/dynamicisland/IslandItem;)I
    .locals 0

    .line 594
    invoke-virtual {p2}, Lcom/android/systemui/dynamicisland/IslandItem;->priority()I

    move-result p2

    invoke-virtual {p1}, Lcom/android/systemui/dynamicisland/IslandItem;->priority()I

    move-result p1

    invoke-static {p2, p1}, Ljava/lang/Integer;->compare(II)I

    move-result p1

    return p1
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000,
            0x1000
        }
        names = {
            null,
            null
        }
    .end annotation

    .line 591
    check-cast p1, Lcom/android/systemui/dynamicisland/IslandItem;

    check-cast p2, Lcom/android/systemui/dynamicisland/IslandItem;

    invoke-virtual {p0, p1, p2}, Lcom/android/systemui/dynamicisland/DynamicIslandController$4;->compare(Lcom/android/systemui/dynamicisland/IslandItem;Lcom/android/systemui/dynamicisland/IslandItem;)I

    move-result p1

    return p1
.end method
