.class public final Lcom/android/systemui/dynamicisland/SystemEventSource;
.super Ljava/lang/Object;
.source "SystemEventSource.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/systemui/dynamicisland/SystemEventSource$Listener;
    }
.end annotation


# static fields
.field private static final ACTION_SAMSUNG_WIFI_AP_STA_CHANGED:Ljava/lang/String; = "com.samsung.android.net.wifi.WIFI_AP_STA_STATE_CHANGED"

.field private static final ACTION_TETHER_STATE_CHANGED:Ljava/lang/String; = "android.net.conn.TETHER_STATE_CHANGED"

.field private static final ACTION_WIFI_AP_STATE_CHANGED:Ljava/lang/String; = "android.net.wifi.WIFI_AP_STATE_CHANGED"

.field private static final KEY_FLASH_BT:Ljava/lang/String; = "island:flash:bluetooth"

.field private static final KEY_FLASH_CHARGING:Ljava/lang/String; = "island:flash:charging"

.field private static final KEY_FLASH_RINGER:Ljava/lang/String; = "island:flash:ringer"

.field private static final KEY_HOTSPOT:Ljava/lang/String; = "island:hotspot"


# instance fields
.field private final mContext:Landroid/content/Context;

.field private mHotspotActive:Z

.field private mHotspotClientCount:I

.field private mLastBtAddress:Ljava/lang/String;

.field private mLastBtTimeMs:J

.field private mLastPlugged:I

.field private mLastRingerMode:I

.field private final mListener:Lcom/android/systemui/dynamicisland/SystemEventSource$Listener;

.field private final mReceiver:Landroid/content/BroadcastReceiver;

.field private mRegistered:Z

.field private mRingerSeeded:Z

.field private mSoftApCallbackProxy:Ljava/lang/Object;

.field private mWifiManagerRef:Ljava/lang/Object;


# direct methods
.method static bridge synthetic -$$Nest$fgetmHotspotActive(Lcom/android/systemui/dynamicisland/SystemEventSource;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/android/systemui/dynamicisland/SystemEventSource;->mHotspotActive:Z

    return p0
.end method

.method static bridge synthetic -$$Nest$memitHotspotUpdate(Lcom/android/systemui/dynamicisland/SystemEventSource;IZ)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/android/systemui/dynamicisland/SystemEventSource;->emitHotspotUpdate(IZ)V

    return-void
.end method

.method static bridge synthetic -$$Nest$mhandleBatteryChanged(Lcom/android/systemui/dynamicisland/SystemEventSource;Landroid/content/Intent;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/android/systemui/dynamicisland/SystemEventSource;->handleBatteryChanged(Landroid/content/Intent;)V

    return-void
.end method

.method static bridge synthetic -$$Nest$mhandleBluetoothAcl(Lcom/android/systemui/dynamicisland/SystemEventSource;Landroid/content/Intent;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/android/systemui/dynamicisland/SystemEventSource;->handleBluetoothAcl(Landroid/content/Intent;)V

    return-void
.end method

.method static bridge synthetic -$$Nest$mhandleBluetoothProfileState(Lcom/android/systemui/dynamicisland/SystemEventSource;Landroid/content/Intent;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/android/systemui/dynamicisland/SystemEventSource;->handleBluetoothProfileState(Landroid/content/Intent;)V

    return-void
.end method

.method static bridge synthetic -$$Nest$mhandleHotspotChanged(Lcom/android/systemui/dynamicisland/SystemEventSource;Landroid/content/Intent;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/android/systemui/dynamicisland/SystemEventSource;->handleHotspotChanged(Landroid/content/Intent;)V

    return-void
.end method

.method static bridge synthetic -$$Nest$mhandleRingerChanged(Lcom/android/systemui/dynamicisland/SystemEventSource;Landroid/content/Intent;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/android/systemui/dynamicisland/SystemEventSource;->handleRingerChanged(Landroid/content/Intent;)V

    return-void
.end method

.method static bridge synthetic -$$Nest$misHotspotSystemEnabled(Lcom/android/systemui/dynamicisland/SystemEventSource;)Z
    .locals 0

    invoke-direct {p0}, Lcom/android/systemui/dynamicisland/SystemEventSource;->isHotspotSystemEnabled()Z

    move-result p0

    return p0
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/android/systemui/dynamicisland/SystemEventSource$Listener;)V
    .locals 4

    .line 99
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 46
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/systemui/dynamicisland/SystemEventSource;->mRegistered:Z

    .line 48
    const/4 v1, -0x1

    iput v1, p0, Lcom/android/systemui/dynamicisland/SystemEventSource;->mLastPlugged:I

    .line 49
    iput v1, p0, Lcom/android/systemui/dynamicisland/SystemEventSource;->mLastRingerMode:I

    .line 50
    iput-boolean v0, p0, Lcom/android/systemui/dynamicisland/SystemEventSource;->mRingerSeeded:Z

    .line 51
    const-string v2, ""

    iput-object v2, p0, Lcom/android/systemui/dynamicisland/SystemEventSource;->mLastBtAddress:Ljava/lang/String;

    .line 52
    const-wide/16 v2, 0x0

    iput-wide v2, p0, Lcom/android/systemui/dynamicisland/SystemEventSource;->mLastBtTimeMs:J

    .line 54
    iput-boolean v0, p0, Lcom/android/systemui/dynamicisland/SystemEventSource;->mHotspotActive:Z

    .line 55
    iput v1, p0, Lcom/android/systemui/dynamicisland/SystemEventSource;->mHotspotClientCount:I

    .line 56
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/systemui/dynamicisland/SystemEventSource;->mWifiManagerRef:Ljava/lang/Object;

    .line 57
    iput-object v0, p0, Lcom/android/systemui/dynamicisland/SystemEventSource;->mSoftApCallbackProxy:Ljava/lang/Object;

    .line 59
    new-instance v0, Lcom/android/systemui/dynamicisland/SystemEventSource$1;

    invoke-direct {v0, p0}, Lcom/android/systemui/dynamicisland/SystemEventSource$1;-><init>(Lcom/android/systemui/dynamicisland/SystemEventSource;)V

    iput-object v0, p0, Lcom/android/systemui/dynamicisland/SystemEventSource;->mReceiver:Landroid/content/BroadcastReceiver;

    .line 100
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lcom/android/systemui/dynamicisland/SystemEventSource;->mContext:Landroid/content/Context;

    .line 101
    iput-object p2, p0, Lcom/android/systemui/dynamicisland/SystemEventSource;->mListener:Lcom/android/systemui/dynamicisland/SystemEventSource$Listener;

    .line 102
    return-void
.end method

.method private buildHotspotSettingsIntent()Landroid/app/PendingIntent;
    .locals 4

    .line 490
    :try_start_0
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.settings.TETHER_SETTINGS"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 491
    const/high16 v1, 0x10000000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 492
    iget-object v2, p0, Lcom/android/systemui/dynamicisland/SystemEventSource;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/content/Intent;->resolveActivity(Landroid/content/pm/PackageManager;)Landroid/content/ComponentName;

    move-result-object v2

    if-nez v2, :cond_0

    .line 493
    new-instance v0, Landroid/content/Intent;

    const-string v2, "android.settings.WIRELESS_SETTINGS"

    invoke-direct {v0, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 494
    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 496
    :cond_0
    iget-object v1, p0, Lcom/android/systemui/dynamicisland/SystemEventSource;->mContext:Landroid/content/Context;

    const/16 v2, 0xfa6

    const/high16 v3, 0xc000000

    invoke-static {v1, v2, v0, v3}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-object v0

    .line 502
    :catchall_0
    move-exception v0

    .line 503
    const/4 v0, 0x0

    return-object v0
.end method

.method private emitBluetoothConnected(Landroid/bluetooth/BluetoothDevice;)V
    .locals 8

    .line 238
    const-string v0, "%"

    :try_start_0
    invoke-virtual {p1}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v1

    .line 239
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    .line 240
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_0

    iget-object v4, p0, Lcom/android/systemui/dynamicisland/SystemEventSource;->mLastBtAddress:Ljava/lang/String;

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    iget-wide v4, p0, Lcom/android/systemui/dynamicisland/SystemEventSource;->mLastBtTimeMs:J

    sub-long v4, v2, v4

    const-wide/16 v6, 0x1388

    cmp-long v4, v4, v6

    if-gez v4, :cond_0

    .line 241
    return-void

    .line 243
    :cond_0
    if-eqz v1, :cond_1

    goto :goto_0

    :cond_1
    const-string v1, ""

    :goto_0
    iput-object v1, p0, Lcom/android/systemui/dynamicisland/SystemEventSource;->mLastBtAddress:Ljava/lang/String;

    .line 244
    iput-wide v2, p0, Lcom/android/systemui/dynamicisland/SystemEventSource;->mLastBtTimeMs:J
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    .line 246
    nop

    .line 248
    :try_start_1
    invoke-virtual {p1}, Landroid/bluetooth/BluetoothDevice;->getAlias()Ljava/lang/String;

    move-result-object v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 250
    goto :goto_1

    .line 249
    :catchall_0
    move-exception v1

    const/4 v1, 0x0

    .line 251
    :goto_1
    :try_start_2
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 252
    invoke-virtual {p1}, Landroid/bluetooth/BluetoothDevice;->getName()Ljava/lang/String;

    move-result-object v1

    .line 254
    :cond_2
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 255
    const-string v1, "Bluetooth Device"

    .line 258
    :cond_3
    invoke-static {p1}, Lcom/android/systemui/dynamicisland/SystemEventSource;->getBluetoothBatteryReflection(Landroid/bluetooth/BluetoothDevice;)I

    move-result p1

    .line 259
    new-instance v4, Lcom/android/systemui/dynamicisland/IslandItem;

    const-string v5, "island:flash:bluetooth"

    sget-object v6, Lcom/android/systemui/dynamicisland/IslandItem$Category;->FLASH_EVENT:Lcom/android/systemui/dynamicisland/IslandItem$Category;

    invoke-direct {v4, v5, v6}, Lcom/android/systemui/dynamicisland/IslandItem;-><init>(Ljava/lang/String;Lcom/android/systemui/dynamicisland/IslandItem$Category;)V

    .line 260
    const/4 v5, 0x1

    iput-boolean v5, v4, Lcom/android/systemui/dynamicisland/IslandItem;->transientItem:Z

    .line 261
    const-wide/16 v5, 0xdac

    add-long/2addr v2, v5

    iput-wide v2, v4, Lcom/android/systemui/dynamicisland/IslandItem;->expiresAtElapsedMs:J

    .line 262
    const/4 v2, 0x2

    iput v2, v4, Lcom/android/systemui/dynamicisland/IslandItem;->vectorKind:I

    .line 263
    const v2, -0xf57b01

    iput v2, v4, Lcom/android/systemui/dynamicisland/IslandItem;->accentColor:I

    .line 264
    iput-object v1, v4, Lcom/android/systemui/dynamicisland/IslandItem;->title:Ljava/lang/String;

    .line 265
    if-ltz p1, :cond_4

    const/16 v2, 0x64

    if-gt p1, v2, :cond_4

    .line 266
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Connected \u2022 "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v4, Lcom/android/systemui/dynamicisland/IslandItem;->subtitle:Ljava/lang/String;

    .line 267
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    iput-object p1, v4, Lcom/android/systemui/dynamicisland/IslandItem;->compactRightText:Ljava/lang/String;

    goto :goto_2

    .line 269
    :cond_4
    const-string p1, "Connected"

    iput-object p1, v4, Lcom/android/systemui/dynamicisland/IslandItem;->subtitle:Ljava/lang/String;

    .line 270
    iput-object v1, v4, Lcom/android/systemui/dynamicisland/IslandItem;->compactRightText:Ljava/lang/String;

    .line 272
    :goto_2
    iget-object p1, p0, Lcom/android/systemui/dynamicisland/SystemEventSource;->mListener:Lcom/android/systemui/dynamicisland/SystemEventSource$Listener;

    invoke-interface {p1, v4}, Lcom/android/systemui/dynamicisland/SystemEventSource$Listener;->onItemUpdated(Lcom/android/systemui/dynamicisland/IslandItem;)V
    :try_end_2
    .catch Ljava/lang/SecurityException; {:try_start_2 .. :try_end_2} :catch_0

    .line 274
    goto :goto_3

    .line 273
    :catch_0
    move-exception p1

    .line 275
    :goto_3
    return-void
.end method

.method private emitHotspotUpdate(IZ)V
    .locals 6

    .line 306
    if-ltz p1, :cond_0

    goto :goto_0

    :cond_0
    invoke-direct {p0}, Lcom/android/systemui/dynamicisland/SystemEventSource;->queryHotspotConnectedCount()I

    move-result p1

    .line 307
    :goto_0
    invoke-direct {p0}, Lcom/android/systemui/dynamicisland/SystemEventSource;->queryHotspotDeviceNames()Ljava/util/List;

    move-result-object v0

    .line 308
    if-gtz p1, :cond_1

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_1

    .line 309
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result p1

    .line 311
    :cond_1
    const/4 v1, 0x0

    invoke-static {v1, p1}, Ljava/lang/Math;->max(II)I

    move-result p1

    .line 313
    invoke-direct {p0}, Lcom/android/systemui/dynamicisland/SystemEventSource;->queryHotspotSsid()Ljava/lang/String;

    move-result-object v2

    .line 315
    new-instance v3, Lcom/android/systemui/dynamicisland/IslandItem;

    const-string v4, "island:hotspot"

    sget-object v5, Lcom/android/systemui/dynamicisland/IslandItem$Category;->HOTSPOT:Lcom/android/systemui/dynamicisland/IslandItem$Category;

    invoke-direct {v3, v4, v5}, Lcom/android/systemui/dynamicisland/IslandItem;-><init>(Ljava/lang/String;Lcom/android/systemui/dynamicisland/IslandItem$Category;)V

    .line 316
    const/4 v4, 0x6

    iput v4, v3, Lcom/android/systemui/dynamicisland/IslandItem;->vectorKind:I

    .line 317
    const v4, -0xcf2ea8

    iput v4, v3, Lcom/android/systemui/dynamicisland/IslandItem;->accentColor:I

    .line 318
    const/4 v4, 0x1

    if-eqz p2, :cond_2

    iget-boolean p2, p0, Lcom/android/systemui/dynamicisland/SystemEventSource;->mHotspotActive:Z

    if-eqz p2, :cond_2

    move v1, v4

    :cond_2
    iput-boolean v1, v3, Lcom/android/systemui/dynamicisland/IslandItem;->quietUpdate:Z

    .line 319
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p2

    if-nez p2, :cond_3

    goto :goto_1

    :cond_3
    const-string v2, "Personal hotspot"

    :goto_1
    iput-object v2, v3, Lcom/android/systemui/dynamicisland/IslandItem;->title:Ljava/lang/String;

    .line 320
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result p2

    if-nez p2, :cond_4

    .line 321
    const-string p2, ", "

    invoke-static {p2, v0}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object p2

    iput-object p2, v3, Lcom/android/systemui/dynamicisland/IslandItem;->subtitle:Ljava/lang/String;

    goto :goto_3

    .line 322
    :cond_4
    if-lez p1, :cond_6

    .line 323
    if-ne p1, v4, :cond_5

    const-string p2, " device connected"

    goto :goto_2

    :cond_5
    const-string p2, " devices connected"

    :goto_2
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    iput-object p2, v3, Lcom/android/systemui/dynamicisland/IslandItem;->subtitle:Ljava/lang/String;

    goto :goto_3

    .line 325
    :cond_6
    const-string p2, "No devices connected"

    iput-object p2, v3, Lcom/android/systemui/dynamicisland/IslandItem;->subtitle:Ljava/lang/String;

    .line 328
    :goto_3
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p2

    iput-object p2, v3, Lcom/android/systemui/dynamicisland/IslandItem;->compactRightText:Ljava/lang/String;

    .line 329
    invoke-direct {p0}, Lcom/android/systemui/dynamicisland/SystemEventSource;->buildHotspotSettingsIntent()Landroid/app/PendingIntent;

    move-result-object p2

    iput-object p2, v3, Lcom/android/systemui/dynamicisland/IslandItem;->contentIntent:Landroid/app/PendingIntent;

    .line 331
    iput-boolean v4, p0, Lcom/android/systemui/dynamicisland/SystemEventSource;->mHotspotActive:Z

    .line 332
    iput p1, p0, Lcom/android/systemui/dynamicisland/SystemEventSource;->mHotspotClientCount:I

    .line 333
    iget-object p1, p0, Lcom/android/systemui/dynamicisland/SystemEventSource;->mListener:Lcom/android/systemui/dynamicisland/SystemEventSource$Listener;

    invoke-interface {p1, v3}, Lcom/android/systemui/dynamicisland/SystemEventSource$Listener;->onItemUpdated(Lcom/android/systemui/dynamicisland/IslandItem;)V

    .line 334
    return-void
.end method

.method private static getBluetoothBatteryReflection(Landroid/bluetooth/BluetoothDevice;)I
    .locals 4

    .line 279
    :try_start_0
    const-class v0, Landroid/bluetooth/BluetoothDevice;

    const-string v1, "getBatteryLevel"

    const/4 v2, 0x0

    new-array v3, v2, [Ljava/lang/Class;

    invoke-virtual {v0, v1, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 280
    new-array v1, v2, [Ljava/lang/Object;

    invoke-virtual {v0, p0, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    .line 281
    instance-of v0, p0, Ljava/lang/Integer;

    if-eqz v0, :cond_0

    .line 282
    check-cast p0, Ljava/lang/Integer;

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return p0

    .line 285
    :cond_0
    goto :goto_0

    .line 284
    :catchall_0
    move-exception p0

    .line 286
    :goto_0
    const/4 p0, -0x1

    return p0
.end method

.method private handleBatteryChanged(Landroid/content/Intent;)V
    .locals 8

    .line 139
    const-string v0, "plugged"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    .line 140
    iget v2, p0, Lcom/android/systemui/dynamicisland/SystemEventSource;->mLastPlugged:I

    const/4 v3, -0x1

    if-ne v2, v3, :cond_0

    .line 141
    iput v0, p0, Lcom/android/systemui/dynamicisland/SystemEventSource;->mLastPlugged:I

    .line 142
    return-void

    .line 144
    :cond_0
    iget v2, p0, Lcom/android/systemui/dynamicisland/SystemEventSource;->mLastPlugged:I

    .line 145
    iput v0, p0, Lcom/android/systemui/dynamicisland/SystemEventSource;->mLastPlugged:I

    .line 147
    if-nez v2, :cond_5

    if-eqz v0, :cond_5

    .line 148
    const-string v2, "level"

    invoke-virtual {p1, v2, v3}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v2

    .line 149
    const-string v4, "scale"

    const/16 v5, 0x64

    invoke-virtual {p1, v4, v5}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v4

    .line 150
    if-ltz v2, :cond_1

    if-lez v4, :cond_1

    int-to-float v1, v2

    const/high16 v2, 0x42c80000    # 100.0f

    mul-float/2addr v1, v2

    int-to-float v2, v4

    div-float/2addr v1, v2

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v1

    .line 153
    :cond_1
    const-string v2, "charge_type"

    invoke-virtual {p1, v2, v3}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result p1

    .line 154
    const/4 v2, 0x4

    const/4 v3, 0x1

    if-ne v0, v2, :cond_2

    .line 155
    const-string p1, "AirVOOC charging"

    goto :goto_0

    .line 156
    :cond_2
    const/4 v0, 0x2

    if-lt p1, v0, :cond_3

    .line 157
    const-string p1, "SUPERVOOC"

    goto :goto_0

    .line 158
    :cond_3
    if-ne p1, v3, :cond_4

    .line 159
    const-string p1, "Fast charging"

    goto :goto_0

    .line 161
    :cond_4
    const-string p1, "Charging"

    .line 164
    :goto_0
    new-instance v0, Lcom/android/systemui/dynamicisland/IslandItem;

    const-string v2, "island:flash:charging"

    sget-object v4, Lcom/android/systemui/dynamicisland/IslandItem$Category;->FLASH_EVENT:Lcom/android/systemui/dynamicisland/IslandItem$Category;

    invoke-direct {v0, v2, v4}, Lcom/android/systemui/dynamicisland/IslandItem;-><init>(Ljava/lang/String;Lcom/android/systemui/dynamicisland/IslandItem$Category;)V

    .line 165
    iput-boolean v3, v0, Lcom/android/systemui/dynamicisland/IslandItem;->transientItem:Z

    .line 166
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v4

    const-wide/16 v6, 0xd48

    add-long/2addr v4, v6

    iput-wide v4, v0, Lcom/android/systemui/dynamicisland/IslandItem;->expiresAtElapsedMs:J

    .line 167
    iput v3, v0, Lcom/android/systemui/dynamicisland/IslandItem;->vectorKind:I

    .line 168
    const v2, -0xcf2ea8

    iput v2, v0, Lcom/android/systemui/dynamicisland/IslandItem;->accentColor:I

    .line 169
    iput-object p1, v0, Lcom/android/systemui/dynamicisland/IslandItem;->title:Ljava/lang/String;

    .line 170
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v2, "% Battery"

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    iput-object p1, v0, Lcom/android/systemui/dynamicisland/IslandItem;->subtitle:Ljava/lang/String;

    .line 171
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v2, "%"

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    iput-object p1, v0, Lcom/android/systemui/dynamicisland/IslandItem;->compactRightText:Ljava/lang/String;

    .line 172
    iput-boolean v3, v0, Lcom/android/systemui/dynamicisland/IslandItem;->hasProgress:Z

    .line 173
    int-to-long v1, v1

    iput-wide v1, v0, Lcom/android/systemui/dynamicisland/IslandItem;->progressValue:J

    .line 174
    const-wide/16 v1, 0x64

    iput-wide v1, v0, Lcom/android/systemui/dynamicisland/IslandItem;->progressMax:J

    .line 175
    iget-object p1, p0, Lcom/android/systemui/dynamicisland/SystemEventSource;->mListener:Lcom/android/systemui/dynamicisland/SystemEventSource$Listener;

    invoke-interface {p1, v0}, Lcom/android/systemui/dynamicisland/SystemEventSource$Listener;->onItemUpdated(Lcom/android/systemui/dynamicisland/IslandItem;)V

    .line 177
    :cond_5
    return-void
.end method

.method private handleBluetoothAcl(Landroid/content/Intent;)V
    .locals 2

    .line 220
    const-string v0, "android.bluetooth.device.extra.DEVICE"

    const-class v1, Landroid/bluetooth/BluetoothDevice;

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/bluetooth/BluetoothDevice;

    .line 221
    if-eqz p1, :cond_0

    .line 222
    invoke-direct {p0, p1}, Lcom/android/systemui/dynamicisland/SystemEventSource;->emitBluetoothConnected(Landroid/bluetooth/BluetoothDevice;)V

    .line 224
    :cond_0
    return-void
.end method

.method private handleBluetoothProfileState(Landroid/content/Intent;)V
    .locals 2

    .line 227
    const-string v0, "android.bluetooth.profile.extra.STATE"

    const/4 v1, -0x1

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    .line 228
    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    .line 229
    const-string v0, "android.bluetooth.device.extra.DEVICE"

    const-class v1, Landroid/bluetooth/BluetoothDevice;

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/bluetooth/BluetoothDevice;

    .line 230
    if-eqz p1, :cond_0

    .line 231
    invoke-direct {p0, p1}, Lcom/android/systemui/dynamicisland/SystemEventSource;->emitBluetoothConnected(Landroid/bluetooth/BluetoothDevice;)V

    .line 234
    :cond_0
    return-void
.end method

.method private handleHotspotChanged(Landroid/content/Intent;)V
    .locals 2

    .line 290
    const-string v0, "wifi_state"

    const/16 v1, 0xb

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result p1

    .line 291
    invoke-direct {p0, p1}, Lcom/android/systemui/dynamicisland/SystemEventSource;->handleHotspotState(I)V

    .line 292
    return-void
.end method

.method private handleHotspotState(I)V
    .locals 2

    .line 296
    const/16 v0, 0xd

    const/4 v1, -0x1

    if-ne p1, v0, :cond_0

    .line 297
    iget-boolean p1, p0, Lcom/android/systemui/dynamicisland/SystemEventSource;->mHotspotActive:Z

    invoke-direct {p0, v1, p1}, Lcom/android/systemui/dynamicisland/SystemEventSource;->emitHotspotUpdate(IZ)V

    goto :goto_0

    .line 298
    :cond_0
    const/16 v0, 0xb

    if-eq p1, v0, :cond_1

    const/16 v0, 0xa

    if-eq p1, v0, :cond_1

    const/16 v0, 0xe

    if-ne p1, v0, :cond_2

    .line 299
    :cond_1
    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/android/systemui/dynamicisland/SystemEventSource;->mHotspotActive:Z

    .line 300
    iput v1, p0, Lcom/android/systemui/dynamicisland/SystemEventSource;->mHotspotClientCount:I

    .line 301
    iget-object p1, p0, Lcom/android/systemui/dynamicisland/SystemEventSource;->mListener:Lcom/android/systemui/dynamicisland/SystemEventSource$Listener;

    const-string v0, "island:hotspot"

    invoke-interface {p1, v0}, Lcom/android/systemui/dynamicisland/SystemEventSource$Listener;->onItemRemoved(Ljava/lang/String;)V

    .line 303
    :cond_2
    :goto_0
    return-void
.end method

.method private handleRingerChanged(Landroid/content/Intent;)V
    .locals 6

    .line 180
    const-string v0, "android.media.EXTRA_RINGER_MODE"

    const/4 v1, -0x1

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result p1

    .line 181
    if-ne p1, v1, :cond_0

    .line 182
    return-void

    .line 184
    :cond_0
    iget-boolean v0, p0, Lcom/android/systemui/dynamicisland/SystemEventSource;->mRingerSeeded:Z

    const/4 v1, 0x1

    if-nez v0, :cond_1

    .line 185
    iput-boolean v1, p0, Lcom/android/systemui/dynamicisland/SystemEventSource;->mRingerSeeded:Z

    .line 186
    iput p1, p0, Lcom/android/systemui/dynamicisland/SystemEventSource;->mLastRingerMode:I

    .line 187
    return-void

    .line 189
    :cond_1
    iget v0, p0, Lcom/android/systemui/dynamicisland/SystemEventSource;->mLastRingerMode:I

    if-ne p1, v0, :cond_2

    .line 190
    return-void

    .line 192
    :cond_2
    iput p1, p0, Lcom/android/systemui/dynamicisland/SystemEventSource;->mLastRingerMode:I

    .line 194
    new-instance v0, Lcom/android/systemui/dynamicisland/IslandItem;

    const-string v2, "island:flash:ringer"

    sget-object v3, Lcom/android/systemui/dynamicisland/IslandItem$Category;->FLASH_EVENT:Lcom/android/systemui/dynamicisland/IslandItem$Category;

    invoke-direct {v0, v2, v3}, Lcom/android/systemui/dynamicisland/IslandItem;-><init>(Ljava/lang/String;Lcom/android/systemui/dynamicisland/IslandItem$Category;)V

    .line 195
    iput-boolean v1, v0, Lcom/android/systemui/dynamicisland/IslandItem;->transientItem:Z

    .line 196
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    const-wide/16 v4, 0x960

    add-long/2addr v2, v4

    iput-wide v2, v0, Lcom/android/systemui/dynamicisland/IslandItem;->expiresAtElapsedMs:J

    .line 197
    if-nez p1, :cond_3

    .line 198
    const/4 p1, 0x5

    iput p1, v0, Lcom/android/systemui/dynamicisland/IslandItem;->vectorKind:I

    .line 199
    const p1, -0xbac6

    iput p1, v0, Lcom/android/systemui/dynamicisland/IslandItem;->accentColor:I

    .line 200
    const-string p1, "Silent"

    iput-object p1, v0, Lcom/android/systemui/dynamicisland/IslandItem;->title:Ljava/lang/String;

    .line 201
    const-string v1, "Alerts muted"

    iput-object v1, v0, Lcom/android/systemui/dynamicisland/IslandItem;->subtitle:Ljava/lang/String;

    .line 202
    iput-object p1, v0, Lcom/android/systemui/dynamicisland/IslandItem;->compactRightText:Ljava/lang/String;

    goto :goto_0

    .line 203
    :cond_3
    if-ne p1, v1, :cond_4

    .line 204
    const/4 p1, 0x4

    iput p1, v0, Lcom/android/systemui/dynamicisland/IslandItem;->vectorKind:I

    .line 205
    const/16 p1, -0x60f6

    iput p1, v0, Lcom/android/systemui/dynamicisland/IslandItem;->accentColor:I

    .line 206
    const-string p1, "Vibrate"

    iput-object p1, v0, Lcom/android/systemui/dynamicisland/IslandItem;->title:Ljava/lang/String;

    .line 207
    const-string v1, "Ringer vibrate"

    iput-object v1, v0, Lcom/android/systemui/dynamicisland/IslandItem;->subtitle:Ljava/lang/String;

    .line 208
    iput-object p1, v0, Lcom/android/systemui/dynamicisland/IslandItem;->compactRightText:Ljava/lang/String;

    goto :goto_0

    .line 210
    :cond_4
    const/4 p1, 0x3

    iput p1, v0, Lcom/android/systemui/dynamicisland/IslandItem;->vectorKind:I

    .line 211
    const p1, -0xcf2ea8

    iput p1, v0, Lcom/android/systemui/dynamicisland/IslandItem;->accentColor:I

    .line 212
    const-string p1, "Ring"

    iput-object p1, v0, Lcom/android/systemui/dynamicisland/IslandItem;->title:Ljava/lang/String;

    .line 213
    const-string v1, "Ringtone enabled"

    iput-object v1, v0, Lcom/android/systemui/dynamicisland/IslandItem;->subtitle:Ljava/lang/String;

    .line 214
    iput-object p1, v0, Lcom/android/systemui/dynamicisland/IslandItem;->compactRightText:Ljava/lang/String;

    .line 216
    :goto_0
    iget-object p1, p0, Lcom/android/systemui/dynamicisland/SystemEventSource;->mListener:Lcom/android/systemui/dynamicisland/SystemEventSource$Listener;

    invoke-interface {p1, v0}, Lcom/android/systemui/dynamicisland/SystemEventSource$Listener;->onItemUpdated(Lcom/android/systemui/dynamicisland/IslandItem;)V

    .line 217
    return-void
.end method

.method private isHotspotSystemEnabled()Z
    .locals 7

    .line 388
    const-string v0, "getWifiApState"

    const/4 v1, 0x1

    const/16 v2, 0xd

    const/4 v3, 0x0

    :try_start_0
    iget-object v4, p0, Lcom/android/systemui/dynamicisland/SystemEventSource;->mContext:Landroid/content/Context;

    const-string v5, "sem_wifi"

    invoke-virtual {v4, v5}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    .line 389
    if-eqz v4, :cond_0

    .line 390
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    new-array v6, v3, [Ljava/lang/Class;

    invoke-virtual {v5, v0, v6}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v5

    .line 391
    new-array v6, v3, [Ljava/lang/Object;

    invoke-virtual {v5, v4, v6}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    .line 392
    instance-of v5, v4, Ljava/lang/Integer;

    if-eqz v5, :cond_0

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-ne v4, v2, :cond_0

    .line 393
    return v1

    .line 397
    :cond_0
    goto :goto_0

    .line 396
    :catchall_0
    move-exception v4

    .line 399
    :goto_0
    :try_start_1
    iget-object v4, p0, Lcom/android/systemui/dynamicisland/SystemEventSource;->mContext:Landroid/content/Context;

    const-string v5, "wifi"

    invoke-virtual {v4, v5}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    .line 400
    if-eqz v4, :cond_1

    .line 401
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    new-array v6, v3, [Ljava/lang/Class;

    invoke-virtual {v5, v0, v6}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 402
    new-array v5, v3, [Ljava/lang/Object;

    invoke-virtual {v0, v4, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 403
    instance-of v4, v0, Ljava/lang/Integer;

    if-eqz v4, :cond_1

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    if-ne v0, v2, :cond_1

    .line 404
    return v1

    .line 408
    :cond_1
    goto :goto_1

    .line 407
    :catchall_1
    move-exception v0

    .line 409
    :goto_1
    return v3
.end method

.method private queryHotspotConnectedCount()I
    .locals 5

    .line 414
    const/4 v0, 0x0

    :try_start_0
    iget-object v1, p0, Lcom/android/systemui/dynamicisland/SystemEventSource;->mContext:Landroid/content/Context;

    const-string v2, "sem_wifi"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    .line 415
    if-eqz v1, :cond_0

    .line 416
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    const-string v3, "getWifiApConnectedStationCount"

    new-array v4, v0, [Ljava/lang/Class;

    invoke-virtual {v2, v3, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    .line 417
    new-array v3, v0, [Ljava/lang/Object;

    invoke-virtual {v2, v1, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 418
    instance-of v2, v1, Ljava/lang/Integer;

    if-eqz v2, :cond_0

    .line 419
    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return v0

    .line 423
    :cond_0
    goto :goto_0

    .line 422
    :catchall_0
    move-exception v1

    .line 424
    :goto_0
    iget v1, p0, Lcom/android/systemui/dynamicisland/SystemEventSource;->mHotspotClientCount:I

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    return v0
.end method

.method private queryHotspotDeviceNames()Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 428
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 430
    :try_start_0
    iget-object v1, p0, Lcom/android/systemui/dynamicisland/SystemEventSource;->mContext:Landroid/content/Context;

    const-string v2, "sem_wifi"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    .line 431
    if-eqz v1, :cond_4

    .line 432
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    const-string v3, "getWifiApStaListDetail"

    const/4 v4, 0x0

    new-array v5, v4, [Ljava/lang/Class;

    invoke-virtual {v2, v3, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    .line 433
    new-array v3, v4, [Ljava/lang/Object;

    invoke-virtual {v2, v1, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 434
    instance-of v2, v1, Ljava/util/List;

    if-eqz v2, :cond_4

    .line 435
    check-cast v1, Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_4

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    .line 436
    instance-of v3, v2, Ljava/lang/String;

    if-nez v3, :cond_0

    .line 437
    goto :goto_0

    .line 439
    :cond_0
    check-cast v2, Ljava/lang/String;

    const-string v3, "\n"

    invoke-virtual {v2, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    .line 440
    array-length v3, v2

    const/4 v4, 0x2

    if-le v3, v4, :cond_1

    aget-object v3, v2, v4

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    goto :goto_1

    :cond_1
    const-string v3, ""

    .line 441
    :goto_1
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_2

    const-string v4, "*"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_2

    const-string v4, "null"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_2

    .line 442
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 443
    :cond_2
    array-length v3, v2

    const/4 v4, 0x1

    if-le v3, v4, :cond_3

    aget-object v3, v2, v4

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_3

    .line 444
    aget-object v2, v2, v4

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 446
    :cond_3
    :goto_2
    goto :goto_0

    .line 450
    :cond_4
    goto :goto_3

    .line 449
    :catchall_0
    move-exception v1

    .line 451
    :goto_3
    return-object v0
.end method

.method private queryHotspotSsid()Ljava/lang/String;
    .locals 6

    .line 456
    const-string v0, "getSsid"

    const-string v1, "getSoftApConfiguration"

    const/4 v2, 0x0

    :try_start_0
    iget-object v3, p0, Lcom/android/systemui/dynamicisland/SystemEventSource;->mContext:Landroid/content/Context;

    const-string v4, "sem_wifi"

    invoke-virtual {v3, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    .line 457
    if-eqz v3, :cond_0

    .line 458
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    new-array v5, v2, [Ljava/lang/Class;

    invoke-virtual {v4, v1, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v4

    .line 459
    new-array v5, v2, [Ljava/lang/Object;

    invoke-virtual {v4, v3, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    .line 460
    if-eqz v3, :cond_0

    .line 461
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    new-array v5, v2, [Ljava/lang/Class;

    invoke-virtual {v4, v0, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v4

    .line 462
    new-array v5, v2, [Ljava/lang/Object;

    invoke-virtual {v4, v3, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    .line 463
    if-eqz v3, :cond_0

    .line 464
    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-object v0

    .line 469
    :cond_0
    goto :goto_0

    .line 468
    :catchall_0
    move-exception v3

    .line 471
    :goto_0
    :try_start_1
    iget-object v3, p0, Lcom/android/systemui/dynamicisland/SystemEventSource;->mContext:Landroid/content/Context;

    const-string v4, "wifi"

    invoke-virtual {v3, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    .line 472
    if-eqz v3, :cond_1

    .line 473
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    new-array v5, v2, [Ljava/lang/Class;

    invoke-virtual {v4, v1, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 474
    new-array v4, v2, [Ljava/lang/Object;

    invoke-virtual {v1, v3, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 475
    if-eqz v1, :cond_1

    .line 476
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    new-array v4, v2, [Ljava/lang/Class;

    invoke-virtual {v3, v0, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 477
    new-array v2, v2, [Ljava/lang/Object;

    invoke-virtual {v0, v1, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 478
    if-eqz v0, :cond_1

    .line 479
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    return-object v0

    .line 484
    :cond_1
    goto :goto_1

    .line 483
    :catchall_1
    move-exception v0

    .line 485
    :goto_1
    const-string v0, ""

    return-object v0
.end method

.method private registerSoftApCallback()V
    .locals 6

    .line 338
    :try_start_0
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/SystemEventSource;->mContext:Landroid/content/Context;

    const-string v1, "wifi"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 339
    if-nez v0, :cond_0

    .line 340
    return-void

    .line 342
    :cond_0
    const-string v1, "android.net.wifi.WifiManager$SoftApCallback"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    .line 343
    new-instance v2, Lcom/android/systemui/dynamicisland/SystemEventSource$$ExternalSyntheticLambda0;

    invoke-direct {v2, p0}, Lcom/android/systemui/dynamicisland/SystemEventSource$$ExternalSyntheticLambda0;-><init>(Lcom/android/systemui/dynamicisland/SystemEventSource;)V

    .line 364
    invoke-virtual {v1}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v3

    filled-new-array {v1}, [Ljava/lang/Class;

    move-result-object v4

    invoke-static {v3, v4, v2}, Ljava/lang/reflect/Proxy;->newProxyInstance(Ljava/lang/ClassLoader;[Ljava/lang/Class;Ljava/lang/reflect/InvocationHandler;)Ljava/lang/Object;

    move-result-object v2

    .line 365
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    const-string v4, "registerSoftApCallback"

    const-class v5, Ljava/util/concurrent/Executor;

    filled-new-array {v5, v1}, [Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v3, v4, v1}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 366
    iget-object v3, p0, Lcom/android/systemui/dynamicisland/SystemEventSource;->mContext:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getMainExecutor()Ljava/util/concurrent/Executor;

    move-result-object v3

    filled-new-array {v3, v2}, [Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v1, v0, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 367
    iput-object v0, p0, Lcom/android/systemui/dynamicisland/SystemEventSource;->mWifiManagerRef:Ljava/lang/Object;

    .line 368
    iput-object v2, p0, Lcom/android/systemui/dynamicisland/SystemEventSource;->mSoftApCallbackProxy:Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 370
    goto :goto_0

    .line 369
    :catchall_0
    move-exception v0

    .line 371
    :goto_0
    return-void
.end method

.method private unregisterSoftApCallback()V
    .locals 3

    .line 374
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/SystemEventSource;->mWifiManagerRef:Ljava/lang/Object;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/systemui/dynamicisland/SystemEventSource;->mSoftApCallbackProxy:Ljava/lang/Object;

    if-nez v0, :cond_0

    goto :goto_1

    .line 378
    :cond_0
    :try_start_0
    const-string v0, "android.net.wifi.WifiManager$SoftApCallback"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 379
    iget-object v1, p0, Lcom/android/systemui/dynamicisland/SystemEventSource;->mWifiManagerRef:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-string v2, "unregisterSoftApCallback"

    filled-new-array {v0}, [Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v1, v2, v0}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 380
    iget-object v1, p0, Lcom/android/systemui/dynamicisland/SystemEventSource;->mWifiManagerRef:Ljava/lang/Object;

    iget-object v2, p0, Lcom/android/systemui/dynamicisland/SystemEventSource;->mSoftApCallbackProxy:Ljava/lang/Object;

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 382
    goto :goto_0

    .line 381
    :catchall_0
    move-exception v0

    .line 383
    :goto_0
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/systemui/dynamicisland/SystemEventSource;->mSoftApCallbackProxy:Ljava/lang/Object;

    .line 384
    return-void

    .line 375
    :cond_1
    :goto_1
    return-void
.end method


# virtual methods
.method synthetic lambda$registerSoftApCallback$0$com-android-systemui-dynamicisland-SystemEventSource(Ljava/lang/Object;Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 344
    invoke-virtual {p2}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object p2

    .line 345
    const-string v0, "equals"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_1

    .line 346
    if-eqz p3, :cond_0

    array-length p2, p3

    if-ne p2, v1, :cond_0

    aget-object p2, p3, v2

    if-ne p1, p2, :cond_0

    goto :goto_0

    :cond_0
    move v1, v2

    :goto_0
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    return-object p1

    .line 348
    :cond_1
    const-string v0, "hashCode"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 349
    invoke-static {p1}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    return-object p1

    .line 351
    :cond_2
    const-string p1, "toString"

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    .line 352
    const-string p1, "DynamicIslandSoftApCallback"

    return-object p1

    .line 354
    :cond_3
    const-string p1, "onStateChanged"

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_4

    if-eqz p3, :cond_4

    array-length p1, p3

    if-lt p1, v1, :cond_4

    aget-object p1, p3, v2

    instance-of p1, p1, Ljava/lang/Integer;

    if-eqz p1, :cond_4

    .line 355
    aget-object p1, p3, v2

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-direct {p0, p1}, Lcom/android/systemui/dynamicisland/SystemEventSource;->handleHotspotState(I)V

    goto :goto_1

    .line 356
    :cond_4
    const-string p1, "onConnectedClientsChanged"

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_6

    if-eqz p3, :cond_6

    array-length p1, p3

    if-lt p1, v1, :cond_6

    aget-object p1, p3, v2

    instance-of p1, p1, Ljava/util/List;

    if-eqz p1, :cond_6

    .line 357
    aget-object p1, p3, v2

    check-cast p1, Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p1

    .line 358
    iget-boolean p2, p0, Lcom/android/systemui/dynamicisland/SystemEventSource;->mHotspotActive:Z

    if-nez p2, :cond_5

    invoke-direct {p0}, Lcom/android/systemui/dynamicisland/SystemEventSource;->isHotspotSystemEnabled()Z

    move-result p2

    if-eqz p2, :cond_6

    .line 359
    :cond_5
    invoke-direct {p0, p1, v1}, Lcom/android/systemui/dynamicisland/SystemEventSource;->emitHotspotUpdate(IZ)V

    .line 362
    :cond_6
    :goto_1
    const/4 p1, 0x0

    return-object p1
.end method

.method public start()V
    .locals 4

    .line 105
    iget-boolean v0, p0, Lcom/android/systemui/dynamicisland/SystemEventSource;->mRegistered:Z

    if-eqz v0, :cond_0

    .line 106
    return-void

    .line 108
    :cond_0
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 109
    const-string v1, "android.intent.action.BATTERY_CHANGED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 110
    const-string v1, "android.media.RINGER_MODE_CHANGED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 111
    const-string v1, "android.bluetooth.device.action.ACL_CONNECTED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 112
    const-string v1, "android.bluetooth.a2dp.profile.action.CONNECTION_STATE_CHANGED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 113
    const-string v1, "android.bluetooth.headset.profile.action.CONNECTION_STATE_CHANGED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 114
    const-string v1, "android.net.wifi.WIFI_AP_STATE_CHANGED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 115
    const-string v1, "com.samsung.android.net.wifi.WIFI_AP_STA_STATE_CHANGED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 116
    const-string v1, "android.net.conn.TETHER_STATE_CHANGED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 117
    iget-object v1, p0, Lcom/android/systemui/dynamicisland/SystemEventSource;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/android/systemui/dynamicisland/SystemEventSource;->mReceiver:Landroid/content/BroadcastReceiver;

    const/4 v3, 0x2

    invoke-virtual {v1, v2, v0, v3}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;I)Landroid/content/Intent;

    .line 118
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/systemui/dynamicisland/SystemEventSource;->mRegistered:Z

    .line 120
    invoke-direct {p0}, Lcom/android/systemui/dynamicisland/SystemEventSource;->registerSoftApCallback()V

    .line 121
    invoke-direct {p0}, Lcom/android/systemui/dynamicisland/SystemEventSource;->isHotspotSystemEnabled()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 122
    const/4 v0, -0x1

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lcom/android/systemui/dynamicisland/SystemEventSource;->emitHotspotUpdate(IZ)V

    .line 124
    :cond_1
    return-void
.end method

.method public stop()V
    .locals 2

    .line 127
    iget-boolean v0, p0, Lcom/android/systemui/dynamicisland/SystemEventSource;->mRegistered:Z

    if-nez v0, :cond_0

    .line 128
    return-void

    .line 130
    :cond_0
    invoke-direct {p0}, Lcom/android/systemui/dynamicisland/SystemEventSource;->unregisterSoftApCallback()V

    .line 132
    :try_start_0
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/SystemEventSource;->mContext:Landroid/content/Context;

    iget-object v1, p0, Lcom/android/systemui/dynamicisland/SystemEventSource;->mReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v1}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 134
    goto :goto_0

    .line 133
    :catchall_0
    move-exception v0

    .line 135
    :goto_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/systemui/dynamicisland/SystemEventSource;->mRegistered:Z

    .line 136
    return-void
.end method
