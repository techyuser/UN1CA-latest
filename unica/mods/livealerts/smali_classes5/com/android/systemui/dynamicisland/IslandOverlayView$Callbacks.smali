.class public interface abstract Lcom/android/systemui/dynamicisland/IslandOverlayView$Callbacks;
.super Ljava/lang/Object;
.source "IslandOverlayView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/systemui/dynamicisland/IslandOverlayView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "Callbacks"
.end annotation


# virtual methods
.method public abstract onCycleIsland(I)V
.end method

.method public abstract onDismissTransient(Ljava/lang/String;)V
.end method

.method public abstract onExpandedStateChanged(Z)V
.end method

.method public abstract onOverlayCutoutChanged(Landroid/view/DisplayCutout;)V
.end method
