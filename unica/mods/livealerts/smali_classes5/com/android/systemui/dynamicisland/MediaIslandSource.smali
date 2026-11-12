.class public final Lcom/android/systemui/dynamicisland/MediaIslandSource;
.super Ljava/lang/Object;
.source "MediaIslandSource.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/systemui/dynamicisland/MediaIslandSource$Listener;
    }
.end annotation


# static fields
.field public static final MEDIA_KEY:Ljava/lang/String; = "island:media"

.field private static final PAUSED_HIDE_DELAY_MS:J = 0xafc8L


# instance fields
.field private mActiveController:Landroid/media/session/MediaController;

.field private mCachedAccent:I

.field private final mContext:Landroid/content/Context;

.field private final mControllerCallback:Landroid/media/session/MediaController$Callback;

.field private final mHandler:Landroid/os/Handler;

.field private mLastArtworkSrc:Landroid/graphics/Bitmap;

.field private final mListener:Lcom/android/systemui/dynamicisland/MediaIslandSource$Listener;

.field private final mPauseTimeoutRunnable:Ljava/lang/Runnable;

.field private mRoundedThumb:Landroid/graphics/Bitmap;

.field private final mSessionManager:Landroid/media/session/MediaSessionManager;

.field private final mSessionsListener:Landroid/media/session/MediaSessionManager$OnActiveSessionsChangedListener;


# direct methods
.method public static synthetic $r8$lambda$eY7zqJLKtdKyBEskfsVv4hV0CJQ(Lcom/android/systemui/dynamicisland/MediaIslandSource;Ljava/util/List;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/android/systemui/dynamicisland/MediaIslandSource;->pickBestController(Ljava/util/List;)V

    return-void
.end method

.method static bridge synthetic -$$Nest$fgetmHandler(Lcom/android/systemui/dynamicisland/MediaIslandSource;)Landroid/os/Handler;
    .locals 0

    iget-object p0, p0, Lcom/android/systemui/dynamicisland/MediaIslandSource;->mHandler:Landroid/os/Handler;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmListener(Lcom/android/systemui/dynamicisland/MediaIslandSource;)Lcom/android/systemui/dynamicisland/MediaIslandSource$Listener;
    .locals 0

    iget-object p0, p0, Lcom/android/systemui/dynamicisland/MediaIslandSource;->mListener:Lcom/android/systemui/dynamicisland/MediaIslandSource$Listener;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmPauseTimeoutRunnable(Lcom/android/systemui/dynamicisland/MediaIslandSource;)Ljava/lang/Runnable;
    .locals 0

    iget-object p0, p0, Lcom/android/systemui/dynamicisland/MediaIslandSource;->mPauseTimeoutRunnable:Ljava/lang/Runnable;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$mclearController(Lcom/android/systemui/dynamicisland/MediaIslandSource;)V
    .locals 0

    invoke-direct {p0}, Lcom/android/systemui/dynamicisland/MediaIslandSource;->clearController()V

    return-void
.end method

.method static bridge synthetic -$$Nest$mpublishCurrentState(Lcom/android/systemui/dynamicisland/MediaIslandSource;)V
    .locals 0

    invoke-direct {p0}, Lcom/android/systemui/dynamicisland/MediaIslandSource;->publishCurrentState()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/android/systemui/dynamicisland/MediaIslandSource$Listener;)V
    .locals 2

    .line 71
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/android/systemui/dynamicisland/MediaIslandSource;->mHandler:Landroid/os/Handler;

    .line 40
    const v0, -0xe128a0

    iput v0, p0, Lcom/android/systemui/dynamicisland/MediaIslandSource;->mCachedAccent:I

    .line 42
    new-instance v0, Lcom/android/systemui/dynamicisland/MediaIslandSource$1;

    invoke-direct {v0, p0}, Lcom/android/systemui/dynamicisland/MediaIslandSource$1;-><init>(Lcom/android/systemui/dynamicisland/MediaIslandSource;)V

    iput-object v0, p0, Lcom/android/systemui/dynamicisland/MediaIslandSource;->mPauseTimeoutRunnable:Ljava/lang/Runnable;

    .line 49
    new-instance v0, Lcom/android/systemui/dynamicisland/MediaIslandSource$2;

    invoke-direct {v0, p0}, Lcom/android/systemui/dynamicisland/MediaIslandSource$2;-><init>(Lcom/android/systemui/dynamicisland/MediaIslandSource;)V

    iput-object v0, p0, Lcom/android/systemui/dynamicisland/MediaIslandSource;->mControllerCallback:Landroid/media/session/MediaController$Callback;

    .line 68
    new-instance v0, Lcom/android/systemui/dynamicisland/MediaIslandSource$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0}, Lcom/android/systemui/dynamicisland/MediaIslandSource$$ExternalSyntheticLambda0;-><init>(Lcom/android/systemui/dynamicisland/MediaIslandSource;)V

    iput-object v0, p0, Lcom/android/systemui/dynamicisland/MediaIslandSource;->mSessionsListener:Landroid/media/session/MediaSessionManager$OnActiveSessionsChangedListener;

    .line 72
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lcom/android/systemui/dynamicisland/MediaIslandSource;->mContext:Landroid/content/Context;

    .line 73
    iput-object p2, p0, Lcom/android/systemui/dynamicisland/MediaIslandSource;->mListener:Lcom/android/systemui/dynamicisland/MediaIslandSource$Listener;

    .line 74
    iget-object p1, p0, Lcom/android/systemui/dynamicisland/MediaIslandSource;->mContext:Landroid/content/Context;

    const-string p2, "media_session"

    invoke-virtual {p1, p2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/media/session/MediaSessionManager;

    iput-object p1, p0, Lcom/android/systemui/dynamicisland/MediaIslandSource;->mSessionManager:Landroid/media/session/MediaSessionManager;

    .line 75
    return-void
.end method

.method private clearController()V
    .locals 3

    .line 142
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/MediaIslandSource;->mActiveController:Landroid/media/session/MediaController;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 144
    :try_start_0
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/MediaIslandSource;->mActiveController:Landroid/media/session/MediaController;

    iget-object v2, p0, Lcom/android/systemui/dynamicisland/MediaIslandSource;->mControllerCallback:Landroid/media/session/MediaController$Callback;

    invoke-virtual {v0, v2}, Landroid/media/session/MediaController;->unregisterCallback(Landroid/media/session/MediaController$Callback;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 146
    goto :goto_0

    .line 145
    :catchall_0
    move-exception v0

    .line 147
    :goto_0
    iput-object v1, p0, Lcom/android/systemui/dynamicisland/MediaIslandSource;->mActiveController:Landroid/media/session/MediaController;

    .line 149
    :cond_0
    iput-object v1, p0, Lcom/android/systemui/dynamicisland/MediaIslandSource;->mLastArtworkSrc:Landroid/graphics/Bitmap;

    .line 150
    iput-object v1, p0, Lcom/android/systemui/dynamicisland/MediaIslandSource;->mRoundedThumb:Landroid/graphics/Bitmap;

    .line 151
    return-void
.end method

.method private static isPlayingState(I)Z
    .locals 1

    .line 233
    const/4 v0, 0x3

    if-eq p0, v0, :cond_1

    const/4 v0, 0x6

    if-eq p0, v0, :cond_1

    const/16 v0, 0x8

    if-ne p0, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p0, 0x1

    :goto_1
    return p0
.end method

.method private pickBestController(Ljava/util/List;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/media/session/MediaController;",
            ">;)V"
        }
    .end annotation

    .line 100
    const-string v0, "island:media"

    if-eqz p1, :cond_8

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    goto/16 :goto_4

    .line 107
    :cond_0
    nop

    .line 108
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    const/4 v3, 0x0

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/media/session/MediaController;

    .line 109
    invoke-virtual {v2}, Landroid/media/session/MediaController;->getPlaybackState()Landroid/media/session/PlaybackState;

    move-result-object v4

    .line 110
    if-eqz v4, :cond_1

    invoke-virtual {v4}, Landroid/media/session/PlaybackState;->getState()I

    move-result v4

    invoke-static {v4}, Lcom/android/systemui/dynamicisland/MediaIslandSource;->isPlayingState(I)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 111
    nop

    .line 112
    goto :goto_1

    .line 114
    :cond_1
    goto :goto_0

    .line 108
    :cond_2
    move-object v2, v3

    .line 115
    :goto_1
    if-nez v2, :cond_4

    .line 116
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_2
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_4

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/media/session/MediaController;

    .line 117
    invoke-virtual {v1}, Landroid/media/session/MediaController;->getMetadata()Landroid/media/MediaMetadata;

    move-result-object v4

    .line 118
    if-eqz v4, :cond_3

    .line 119
    nop

    .line 120
    move-object v2, v1

    goto :goto_3

    .line 122
    :cond_3
    goto :goto_2

    .line 124
    :cond_4
    :goto_3
    if-nez v2, :cond_5

    .line 125
    iget-object p1, p0, Lcom/android/systemui/dynamicisland/MediaIslandSource;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/android/systemui/dynamicisland/MediaIslandSource;->mPauseTimeoutRunnable:Ljava/lang/Runnable;

    invoke-virtual {p1, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 126
    invoke-direct {p0}, Lcom/android/systemui/dynamicisland/MediaIslandSource;->clearController()V

    .line 127
    iget-object p1, p0, Lcom/android/systemui/dynamicisland/MediaIslandSource;->mListener:Lcom/android/systemui/dynamicisland/MediaIslandSource$Listener;

    invoke-interface {p1, v0}, Lcom/android/systemui/dynamicisland/MediaIslandSource$Listener;->onItemRemoved(Ljava/lang/String;)V

    .line 128
    return-void

    .line 131
    :cond_5
    invoke-virtual {v2}, Landroid/media/session/MediaController;->getSessionToken()Landroid/media/session/MediaSession$Token;

    move-result-object p1

    .line 132
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/MediaIslandSource;->mActiveController:Landroid/media/session/MediaController;

    if-eqz v0, :cond_6

    iget-object v0, p0, Lcom/android/systemui/dynamicisland/MediaIslandSource;->mActiveController:Landroid/media/session/MediaController;

    invoke-virtual {v0}, Landroid/media/session/MediaController;->getSessionToken()Landroid/media/session/MediaSession$Token;

    move-result-object v3

    .line 133
    :cond_6
    invoke-virtual {p1, v3}, Landroid/media/session/MediaSession$Token;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_7

    .line 134
    invoke-direct {p0}, Lcom/android/systemui/dynamicisland/MediaIslandSource;->clearController()V

    .line 135
    iput-object v2, p0, Lcom/android/systemui/dynamicisland/MediaIslandSource;->mActiveController:Landroid/media/session/MediaController;

    .line 136
    iget-object p1, p0, Lcom/android/systemui/dynamicisland/MediaIslandSource;->mActiveController:Landroid/media/session/MediaController;

    iget-object v0, p0, Lcom/android/systemui/dynamicisland/MediaIslandSource;->mControllerCallback:Landroid/media/session/MediaController$Callback;

    iget-object v1, p0, Lcom/android/systemui/dynamicisland/MediaIslandSource;->mHandler:Landroid/os/Handler;

    invoke-virtual {p1, v0, v1}, Landroid/media/session/MediaController;->registerCallback(Landroid/media/session/MediaController$Callback;Landroid/os/Handler;)V

    .line 138
    :cond_7
    invoke-direct {p0}, Lcom/android/systemui/dynamicisland/MediaIslandSource;->publishCurrentState()V

    .line 139
    return-void

    .line 101
    :cond_8
    :goto_4
    iget-object p1, p0, Lcom/android/systemui/dynamicisland/MediaIslandSource;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/android/systemui/dynamicisland/MediaIslandSource;->mPauseTimeoutRunnable:Ljava/lang/Runnable;

    invoke-virtual {p1, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 102
    invoke-direct {p0}, Lcom/android/systemui/dynamicisland/MediaIslandSource;->clearController()V

    .line 103
    iget-object p1, p0, Lcom/android/systemui/dynamicisland/MediaIslandSource;->mListener:Lcom/android/systemui/dynamicisland/MediaIslandSource$Listener;

    invoke-interface {p1, v0}, Lcom/android/systemui/dynamicisland/MediaIslandSource$Listener;->onItemRemoved(Ljava/lang/String;)V

    .line 104
    return-void
.end method

.method private publishCurrentState()V
    .locals 13

    .line 154
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/MediaIslandSource;->mActiveController:Landroid/media/session/MediaController;

    .line 155
    if-nez v0, :cond_0

    .line 156
    return-void

    .line 158
    :cond_0
    invoke-virtual {v0}, Landroid/media/session/MediaController;->getPlaybackState()Landroid/media/session/PlaybackState;

    move-result-object v1

    .line 159
    invoke-virtual {v0}, Landroid/media/session/MediaController;->getMetadata()Landroid/media/MediaMetadata;

    move-result-object v2

    .line 160
    const/4 v3, 0x0

    if-eqz v1, :cond_1

    invoke-virtual {v1}, Landroid/media/session/PlaybackState;->getState()I

    move-result v4

    goto :goto_0

    :cond_1
    move v4, v3

    .line 161
    :goto_0
    const-string v5, "island:media"

    if-eqz v4, :cond_12

    const/4 v6, 0x1

    if-ne v4, v6, :cond_2

    goto/16 :goto_9

    .line 167
    :cond_2
    const/4 v7, 0x0

    if-eqz v2, :cond_3

    const-string v8, "android.media.metadata.TITLE"

    invoke-virtual {v2, v8}, Landroid/media/MediaMetadata;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    goto :goto_1

    :cond_3
    move-object v8, v7

    .line 168
    :goto_1
    if-eqz v2, :cond_4

    const-string v9, "android.media.metadata.ARTIST"

    invoke-virtual {v2, v9}, Landroid/media/MediaMetadata;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    goto :goto_2

    :cond_4
    move-object v9, v7

    .line 169
    :goto_2
    invoke-static {v9}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v10

    if-eqz v10, :cond_5

    if-eqz v2, :cond_5

    .line 170
    const-string v9, "android.media.metadata.ALBUM_ARTIST"

    invoke-virtual {v2, v9}, Landroid/media/MediaMetadata;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 172
    :cond_5
    invoke-static {v8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v10

    if-eqz v10, :cond_6

    .line 173
    invoke-virtual {v0}, Landroid/media/session/MediaController;->getPackageName()Ljava/lang/String;

    move-result-object v8

    invoke-direct {p0, v8}, Lcom/android/systemui/dynamicisland/MediaIslandSource;->resolveAppName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 176
    :cond_6
    nop

    .line 177
    if-eqz v2, :cond_8

    .line 178
    const-string v10, "android.media.metadata.ALBUM_ART"

    invoke-virtual {v2, v10}, Landroid/media/MediaMetadata;->getBitmap(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v10

    .line 179
    if-nez v10, :cond_7

    .line 180
    const-string v10, "android.media.metadata.ART"

    invoke-virtual {v2, v10}, Landroid/media/MediaMetadata;->getBitmap(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v10

    .line 182
    :cond_7
    if-nez v10, :cond_9

    .line 183
    const-string v10, "android.media.metadata.DISPLAY_ICON"

    invoke-virtual {v2, v10}, Landroid/media/MediaMetadata;->getBitmap(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v10

    goto :goto_3

    .line 177
    :cond_8
    move-object v10, v7

    .line 186
    :cond_9
    :goto_3
    iget-object v11, p0, Lcom/android/systemui/dynamicisland/MediaIslandSource;->mLastArtworkSrc:Landroid/graphics/Bitmap;

    if-eq v10, v11, :cond_b

    .line 187
    iput-object v10, p0, Lcom/android/systemui/dynamicisland/MediaIslandSource;->mLastArtworkSrc:Landroid/graphics/Bitmap;

    .line 188
    const v11, -0xe128a0

    if-eqz v10, :cond_a

    invoke-virtual {v10}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v12

    if-nez v12, :cond_a

    .line 189
    invoke-static {v10, v11}, Lcom/android/systemui/dynamicisland/ColorExtractor;->extractVibrantAccent(Landroid/graphics/Bitmap;I)I

    move-result v7

    iput v7, p0, Lcom/android/systemui/dynamicisland/MediaIslandSource;->mCachedAccent:I

    .line 190
    const/16 v7, 0x90

    const/16 v11, 0x1c

    invoke-static {v10, v7, v11}, Lcom/android/systemui/dynamicisland/ColorExtractor;->createRoundedSquare(Landroid/graphics/Bitmap;II)Landroid/graphics/Bitmap;

    move-result-object v7

    iput-object v7, p0, Lcom/android/systemui/dynamicisland/MediaIslandSource;->mRoundedThumb:Landroid/graphics/Bitmap;

    goto :goto_4

    .line 192
    :cond_a
    iput v11, p0, Lcom/android/systemui/dynamicisland/MediaIslandSource;->mCachedAccent:I

    .line 193
    iput-object v7, p0, Lcom/android/systemui/dynamicisland/MediaIslandSource;->mRoundedThumb:Landroid/graphics/Bitmap;

    .line 197
    :cond_b
    :goto_4
    invoke-static {v4}, Lcom/android/systemui/dynamicisland/MediaIslandSource;->isPlayingState(I)Z

    move-result v4

    .line 198
    iget-object v7, p0, Lcom/android/systemui/dynamicisland/MediaIslandSource;->mHandler:Landroid/os/Handler;

    iget-object v10, p0, Lcom/android/systemui/dynamicisland/MediaIslandSource;->mPauseTimeoutRunnable:Ljava/lang/Runnable;

    invoke-virtual {v7, v10}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 199
    if-nez v4, :cond_c

    .line 200
    iget-object v7, p0, Lcom/android/systemui/dynamicisland/MediaIslandSource;->mHandler:Landroid/os/Handler;

    iget-object v10, p0, Lcom/android/systemui/dynamicisland/MediaIslandSource;->mPauseTimeoutRunnable:Ljava/lang/Runnable;

    const-wide/32 v11, 0xafc8

    invoke-virtual {v7, v10, v11, v12}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 203
    :cond_c
    new-instance v7, Lcom/android/systemui/dynamicisland/IslandItem;

    sget-object v10, Lcom/android/systemui/dynamicisland/IslandItem$Category;->MEDIA:Lcom/android/systemui/dynamicisland/IslandItem$Category;

    invoke-direct {v7, v5, v10}, Lcom/android/systemui/dynamicisland/IslandItem;-><init>(Ljava/lang/String;Lcom/android/systemui/dynamicisland/IslandItem$Category;)V

    .line 204
    if-eqz v8, :cond_d

    goto :goto_5

    :cond_d
    const-string v8, ""

    :goto_5
    iput-object v8, v7, Lcom/android/systemui/dynamicisland/IslandItem;->title:Ljava/lang/String;

    .line 205
    if-eqz v9, :cond_e

    goto :goto_6

    :cond_e
    invoke-virtual {v0}, Landroid/media/session/MediaController;->getPackageName()Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, v5}, Lcom/android/systemui/dynamicisland/MediaIslandSource;->resolveAppName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    :goto_6
    iput-object v9, v7, Lcom/android/systemui/dynamicisland/IslandItem;->subtitle:Ljava/lang/String;

    .line 206
    iget-object v5, p0, Lcom/android/systemui/dynamicisland/MediaIslandSource;->mRoundedThumb:Landroid/graphics/Bitmap;

    iput-object v5, v7, Lcom/android/systemui/dynamicisland/IslandItem;->artwork:Landroid/graphics/Bitmap;

    .line 207
    invoke-virtual {v0}, Landroid/media/session/MediaController;->getPackageName()Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, v5}, Lcom/android/systemui/dynamicisland/MediaIslandSource;->resolveAppIcon(Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object v5

    iput-object v5, v7, Lcom/android/systemui/dynamicisland/IslandItem;->iconDrawable:Landroid/graphics/drawable/Drawable;

    .line 208
    iget v5, p0, Lcom/android/systemui/dynamicisland/MediaIslandSource;->mCachedAccent:I

    iput v5, v7, Lcom/android/systemui/dynamicisland/IslandItem;->accentColor:I

    .line 209
    iput-boolean v6, v7, Lcom/android/systemui/dynamicisland/IslandItem;->showWaveform:Z

    .line 210
    iput-boolean v4, v7, Lcom/android/systemui/dynamicisland/IslandItem;->waveformPlaying:Z

    .line 211
    iput-object v0, v7, Lcom/android/systemui/dynamicisland/IslandItem;->mediaController:Landroid/media/session/MediaController;

    .line 213
    const-wide/16 v4, 0x0

    if-eqz v2, :cond_f

    const-string v8, "android.media.metadata.DURATION"

    invoke-virtual {v2, v8}, Landroid/media/MediaMetadata;->getLong(Ljava/lang/String;)J

    move-result-wide v8

    invoke-static {v4, v5, v8, v9}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v8

    goto :goto_7

    :cond_f
    move-wide v8, v4

    .line 214
    :goto_7
    cmp-long v2, v8, v4

    if-lez v2, :cond_11

    if-eqz v1, :cond_11

    .line 215
    iput-boolean v6, v7, Lcom/android/systemui/dynamicisland/IslandItem;->hasProgress:Z

    .line 216
    iput-wide v8, v7, Lcom/android/systemui/dynamicisland/IslandItem;->progressMax:J

    .line 217
    invoke-virtual {v1}, Landroid/media/session/PlaybackState;->getPosition()J

    move-result-wide v8

    invoke-static {v4, v5, v8, v9}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v8

    iput-wide v8, v7, Lcom/android/systemui/dynamicisland/IslandItem;->progressValue:J

    .line 218
    invoke-virtual {v1}, Landroid/media/session/PlaybackState;->getPlaybackSpeed()F

    move-result v2

    iput v2, v7, Lcom/android/systemui/dynamicisland/IslandItem;->mediaSpeed:F

    .line 219
    invoke-virtual {v1}, Landroid/media/session/PlaybackState;->getLastPositionUpdateTime()J

    move-result-wide v8

    iput-wide v8, v7, Lcom/android/systemui/dynamicisland/IslandItem;->mediaPositionUpdateElapsedMs:J

    .line 220
    invoke-virtual {v1}, Landroid/media/session/PlaybackState;->getActions()J

    move-result-wide v1

    const-wide/16 v8, 0x100

    and-long/2addr v1, v8

    cmp-long v1, v1, v4

    if-eqz v1, :cond_10

    move v3, v6

    :cond_10
    iput-boolean v3, v7, Lcom/android/systemui/dynamicisland/IslandItem;->canSeekMedia:Z

    .line 224
    :cond_11
    :try_start_0
    invoke-virtual {v0}, Landroid/media/session/MediaController;->getSessionActivity()Landroid/app/PendingIntent;

    move-result-object v0

    .line 225
    iput-object v0, v7, Lcom/android/systemui/dynamicisland/IslandItem;->contentIntent:Landroid/app/PendingIntent;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 227
    goto :goto_8

    .line 226
    :catchall_0
    move-exception v0

    .line 229
    :goto_8
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/MediaIslandSource;->mListener:Lcom/android/systemui/dynamicisland/MediaIslandSource$Listener;

    invoke-interface {v0, v7}, Lcom/android/systemui/dynamicisland/MediaIslandSource$Listener;->onItemUpdated(Lcom/android/systemui/dynamicisland/IslandItem;)V

    .line 230
    return-void

    .line 162
    :cond_12
    :goto_9
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/MediaIslandSource;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/android/systemui/dynamicisland/MediaIslandSource;->mPauseTimeoutRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 163
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/MediaIslandSource;->mListener:Lcom/android/systemui/dynamicisland/MediaIslandSource$Listener;

    invoke-interface {v0, v5}, Lcom/android/systemui/dynamicisland/MediaIslandSource$Listener;->onItemRemoved(Ljava/lang/String;)V

    .line 164
    return-void
.end method

.method private resolveAppIcon(Ljava/lang/String;)Landroid/graphics/drawable/Drawable;
    .locals 2

    .line 251
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 252
    return-object v1

    .line 255
    :cond_0
    :try_start_0
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/MediaIslandSource;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/pm/PackageManager;->getApplicationIcon(Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-object p1

    .line 256
    :catchall_0
    move-exception p1

    .line 257
    return-object v1
.end method

.method private resolveAppName(Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    .line 239
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const-string v1, "Media"

    if-eqz v0, :cond_0

    .line 240
    return-object v1

    .line 243
    :cond_0
    :try_start_0
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/MediaIslandSource;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    .line 244
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

    .line 245
    :catchall_0
    move-exception p1

    .line 246
    return-object v1
.end method


# virtual methods
.method public start()V
    .locals 4

    .line 78
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/MediaIslandSource;->mSessionManager:Landroid/media/session/MediaSessionManager;

    if-nez v0, :cond_0

    .line 79
    return-void

    .line 82
    :cond_0
    :try_start_0
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/MediaIslandSource;->mSessionManager:Landroid/media/session/MediaSessionManager;

    iget-object v1, p0, Lcom/android/systemui/dynamicisland/MediaIslandSource;->mSessionsListener:Landroid/media/session/MediaSessionManager$OnActiveSessionsChangedListener;

    iget-object v2, p0, Lcom/android/systemui/dynamicisland/MediaIslandSource;->mHandler:Landroid/os/Handler;

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v3, v2}, Landroid/media/session/MediaSessionManager;->addOnActiveSessionsChangedListener(Landroid/media/session/MediaSessionManager$OnActiveSessionsChangedListener;Landroid/content/ComponentName;Landroid/os/Handler;)V

    .line 83
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/MediaIslandSource;->mSessionManager:Landroid/media/session/MediaSessionManager;

    invoke-virtual {v0, v3}, Landroid/media/session/MediaSessionManager;->getActiveSessions(Landroid/content/ComponentName;)Ljava/util/List;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/systemui/dynamicisland/MediaIslandSource;->pickBestController(Ljava/util/List;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 85
    goto :goto_0

    .line 84
    :catchall_0
    move-exception v0

    .line 86
    :goto_0
    return-void
.end method

.method public stop()V
    .locals 2

    .line 89
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/MediaIslandSource;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/android/systemui/dynamicisland/MediaIslandSource;->mPauseTimeoutRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 90
    invoke-direct {p0}, Lcom/android/systemui/dynamicisland/MediaIslandSource;->clearController()V

    .line 91
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/MediaIslandSource;->mSessionManager:Landroid/media/session/MediaSessionManager;

    if-eqz v0, :cond_0

    .line 93
    :try_start_0
    iget-object v0, p0, Lcom/android/systemui/dynamicisland/MediaIslandSource;->mSessionManager:Landroid/media/session/MediaSessionManager;

    iget-object v1, p0, Lcom/android/systemui/dynamicisland/MediaIslandSource;->mSessionsListener:Landroid/media/session/MediaSessionManager$OnActiveSessionsChangedListener;

    invoke-virtual {v0, v1}, Landroid/media/session/MediaSessionManager;->removeOnActiveSessionsChangedListener(Landroid/media/session/MediaSessionManager$OnActiveSessionsChangedListener;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 95
    goto :goto_0

    .line 94
    :catchall_0
    move-exception v0

    .line 97
    :cond_0
    :goto_0
    return-void
.end method
