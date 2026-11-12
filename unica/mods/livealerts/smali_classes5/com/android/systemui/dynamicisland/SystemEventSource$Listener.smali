.class public interface abstract Lcom/android/systemui/dynamicisland/SystemEventSource$Listener;
.super Ljava/lang/Object;
.source "SystemEventSource.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/systemui/dynamicisland/SystemEventSource;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "Listener"
.end annotation


# virtual methods
.method public abstract onItemRemoved(Ljava/lang/String;)V
.end method

.method public abstract onItemUpdated(Lcom/android/systemui/dynamicisland/IslandItem;)V
.end method
