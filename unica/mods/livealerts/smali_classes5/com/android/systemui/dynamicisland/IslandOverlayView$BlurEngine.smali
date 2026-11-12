.class final Lcom/android/systemui/dynamicisland/IslandOverlayView$BlurEngine;
.super Ljava/lang/Object;
.source "IslandOverlayView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/systemui/dynamicisland/IslandOverlayView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "BlurEngine"
.end annotation


# static fields
.field private static sBbdSetBlurRadius:Ljava/lang/reflect/Method;

.field private static sBbdSetColor:Ljava/lang/reflect/Method;

.field private static sBbdSetCornerRadius:Ljava/lang/reflect/Method;

.field private static sBuild:Ljava/lang/reflect/Method;

.field private static sBuilderCtor:Ljava/lang/reflect/Constructor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/reflect/Constructor<",
            "*>;"
        }
    .end annotation
.end field

.field private static sCreateBgBlurDrawable:Ljava/lang/reflect/Method;

.field private static sGetViewRootImpl:Ljava/lang/reflect/Method;

.field private static sProbed:Z

.field private static sSemSetBlurInfo:Ljava/lang/reflect/Method;

.field private static sSetBgColor:Ljava/lang/reflect/Method;

.field private static sSetBgCornerRadius:Ljava/lang/reflect/Method;

.field private static sSetColorCurve:Ljava/lang/reflect/Method;

.field private static sSetColorCurvePreset:Ljava/lang/reflect/Method;

.field private static sSetRadius:Ljava/lang/reflect/Method;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 2080
    const/4 v0, 0x0

    sput-boolean v0, Lcom/android/systemui/dynamicisland/IslandOverlayView$BlurEngine;->sProbed:Z

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 2079
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static applyFallbackBlur(Landroid/view/View;Ljava/lang/Object;ZFI)Ljava/lang/Object;
    .locals 3

    .line 2175
    invoke-static {}, Lcom/android/systemui/dynamicisland/IslandOverlayView$BlurEngine;->init()V

    .line 2176
    const/4 v0, 0x0

    if-eqz p0, :cond_9

    sget-object v1, Lcom/android/systemui/dynamicisland/IslandOverlayView$BlurEngine;->sGetViewRootImpl:Ljava/lang/reflect/Method;

    if-eqz v1, :cond_9

    sget-object v1, Lcom/android/systemui/dynamicisland/IslandOverlayView$BlurEngine;->sCreateBgBlurDrawable:Ljava/lang/reflect/Method;

    if-eqz v1, :cond_9

    if-gtz p4, :cond_0

    goto/16 :goto_4

    .line 2180
    :cond_0
    nop

    .line 2181
    if-nez p1, :cond_2

    .line 2182
    :try_start_0
    sget-object p1, Lcom/android/systemui/dynamicisland/IslandOverlayView$BlurEngine;->sGetViewRootImpl:Ljava/lang/reflect/Method;

    const/4 v1, 0x0

    new-array v2, v1, [Ljava/lang/Object;

    invoke-virtual {p1, p0, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    .line 2183
    if-nez p1, :cond_1

    .line 2184
    return-object v0

    .line 2186
    :cond_1
    sget-object v2, Lcom/android/systemui/dynamicisland/IslandOverlayView$BlurEngine;->sCreateBgBlurDrawable:Ljava/lang/reflect/Method;

    new-array v1, v1, [Ljava/lang/Object;

    invoke-virtual {v2, p1, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    .line 2187
    instance-of v1, p1, Landroid/graphics/drawable/Drawable;

    if-eqz v1, :cond_2

    .line 2188
    move-object v1, p1

    check-cast v1, Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    goto :goto_0

    .line 2205
    :catchall_0
    move-exception p0

    goto :goto_3

    .line 2191
    :cond_2
    :goto_0
    if-nez p1, :cond_3

    .line 2192
    return-object v0

    .line 2194
    :cond_3
    sget-object p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$BlurEngine;->sBbdSetBlurRadius:Ljava/lang/reflect/Method;

    if-eqz p0, :cond_5

    .line 2195
    int-to-float p0, p4

    if-eqz p2, :cond_4

    const p4, 0x3edc28f6    # 0.43f

    mul-float/2addr p0, p4

    invoke-static {p0}, Ljava/lang/Math;->round(F)I

    move-result p0

    goto :goto_1

    :cond_4
    const p4, 0x3e851eb8    # 0.26f

    mul-float/2addr p0, p4

    invoke-static {p0}, Ljava/lang/Math;->round(F)I

    move-result p0

    .line 2196
    :goto_1
    sget-object p4, Lcom/android/systemui/dynamicisland/IslandOverlayView$BlurEngine;->sBbdSetBlurRadius:Ljava/lang/reflect/Method;

    const/16 v1, 0xc8

    invoke-static {v1, p0}, Ljava/lang/Math;->min(II)I

    move-result p0

    const/16 v1, 0x8

    invoke-static {v1, p0}, Ljava/lang/Math;->max(II)I

    move-result p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {p4, p1, p0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 2198
    :cond_5
    sget-object p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$BlurEngine;->sBbdSetCornerRadius:Ljava/lang/reflect/Method;

    if-eqz p0, :cond_6

    .line 2199
    sget-object p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$BlurEngine;->sBbdSetCornerRadius:Ljava/lang/reflect/Method;

    const/4 p4, 0x0

    invoke-static {p4, p3}, Ljava/lang/Math;->max(FF)F

    move-result p3

    invoke-static {p3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p3

    filled-new-array {p3}, [Ljava/lang/Object;

    move-result-object p3

    invoke-virtual {p0, p1, p3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 2201
    :cond_6
    sget-object p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$BlurEngine;->sBbdSetColor:Ljava/lang/reflect/Method;

    if-eqz p0, :cond_8

    .line 2202
    sget-object p0, Lcom/android/systemui/dynamicisland/IslandOverlayView$BlurEngine;->sBbdSetColor:Ljava/lang/reflect/Method;

    if-eqz p2, :cond_7

    const p2, 0x4e282c38    # 7.0536755E8f

    goto :goto_2

    :cond_7
    const p2, 0x6a1e222c

    :goto_2
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    filled-new-array {p2}, [Ljava/lang/Object;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2204
    :cond_8
    return-object p1

    .line 2206
    :goto_3
    return-object v0

    .line 2177
    :cond_9
    :goto_4
    return-object v0
.end method

.method static applySemWindowBlur(Landroid/view/View;ZFI)Z
    .locals 10

    .line 2137
    invoke-static {}, Lcom/android/systemui/dynamicisland/IslandOverlayView$BlurEngine;->init()V

    .line 2138
    const/4 v1, 0x0

    .line 2146
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 2138
    if-eqz p0, :cond_9

    sget-object v2, Lcom/android/systemui/dynamicisland/IslandOverlayView$BlurEngine;->sBuilderCtor:Ljava/lang/reflect/Constructor;

    if-eqz v2, :cond_9

    sget-object v2, Lcom/android/systemui/dynamicisland/IslandOverlayView$BlurEngine;->sSemSetBlurInfo:Ljava/lang/reflect/Method;

    if-eqz v2, :cond_9

    sget-object v2, Lcom/android/systemui/dynamicisland/IslandOverlayView$BlurEngine;->sBuild:Ljava/lang/reflect/Method;

    if-nez v2, :cond_0

    goto/16 :goto_3

    .line 2141
    :cond_0
    if-gtz p3, :cond_1

    .line 2142
    invoke-static {p0}, Lcom/android/systemui/dynamicisland/IslandOverlayView$BlurEngine;->clearBlur(Landroid/view/View;)V

    .line 2143
    return v1

    .line 2146
    :cond_1
    :try_start_0
    sget-object v2, Lcom/android/systemui/dynamicisland/IslandOverlayView$BlurEngine;->sBuilderCtor:Ljava/lang/reflect/Constructor;

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 2147
    sget-object v3, Lcom/android/systemui/dynamicisland/IslandOverlayView$BlurEngine;->sSetRadius:Ljava/lang/reflect/Method;

    if-eqz v3, :cond_3

    .line 2148
    if-eqz p1, :cond_2

    :goto_0
    goto :goto_1

    :cond_2
    int-to-float p3, p3

    const v3, 0x3f1c28f6    # 0.61f

    mul-float/2addr p3, v3

    invoke-static {p3}, Ljava/lang/Math;->round(F)I

    move-result p3

    const/16 v3, 0x14

    invoke-static {v3, p3}, Ljava/lang/Math;->max(II)I

    move-result p3

    goto :goto_0

    .line 2149
    :goto_1
    sget-object v3, Lcom/android/systemui/dynamicisland/IslandOverlayView$BlurEngine;->sSetRadius:Ljava/lang/reflect/Method;

    const/16 v4, 0x190

    invoke-static {v4, p3}, Ljava/lang/Math;->min(II)I

    move-result p3

    const/16 v4, 0xa

    invoke-static {v4, p3}, Ljava/lang/Math;->max(II)I

    move-result p3

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    filled-new-array {p3}, [Ljava/lang/Object;

    move-result-object p3

    invoke-virtual {v3, v2, p3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 2151
    :cond_3
    sget-object p3, Lcom/android/systemui/dynamicisland/IslandOverlayView$BlurEngine;->sSetBgCornerRadius:Ljava/lang/reflect/Method;

    const/4 v3, 0x0

    if-eqz p3, :cond_4

    .line 2152
    sget-object p3, Lcom/android/systemui/dynamicisland/IslandOverlayView$BlurEngine;->sSetBgCornerRadius:Ljava/lang/reflect/Method;

    invoke-static {v3, p2}, Ljava/lang/Math;->max(FF)F

    move-result p2

    invoke-static {p2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p2

    filled-new-array {p2}, [Ljava/lang/Object;

    move-result-object p2

    invoke-virtual {p3, v2, p2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 2154
    :cond_4
    sget-object p2, Lcom/android/systemui/dynamicisland/IslandOverlayView$BlurEngine;->sSetColorCurve:Ljava/lang/reflect/Method;

    if-eqz p2, :cond_6

    .line 2155
    const/high16 p2, 0x437f0000    # 255.0f

    if-eqz p1, :cond_5

    .line 2156
    sget-object p1, Lcom/android/systemui/dynamicisland/IslandOverlayView$BlurEngine;->sSetColorCurve:Ljava/lang/reflect/Method;

    const p3, 0x3eb33333    # 0.35f

    invoke-static {p3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v4

    const/high16 p3, 0x41000000    # 8.0f

    invoke-static {p3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v5

    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v6

    invoke-static {p2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v7

    const/high16 p2, 0x41900000    # 18.0f

    invoke-static {p2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v8

    const/high16 p2, 0x43540000    # 212.0f

    invoke-static {p2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v9

    filled-new-array/range {v4 .. v9}, [Ljava/lang/Object;

    move-result-object p2

    invoke-virtual {p1, v2, p2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_2

    .line 2158
    :cond_5
    sget-object p1, Lcom/android/systemui/dynamicisland/IslandOverlayView$BlurEngine;->sSetColorCurve:Ljava/lang/reflect/Method;

    const p3, 0x3e8f5c29    # 0.28f

    invoke-static {p3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v4

    const/high16 p3, 0x40c00000    # 6.0f

    invoke-static {p3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v5

    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v6

    invoke-static {p2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v7

    const/high16 p2, 0x41600000    # 14.0f

    invoke-static {p2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v8

    const/high16 p2, 0x43460000    # 198.0f

    invoke-static {p2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v9

    filled-new-array/range {v4 .. v9}, [Ljava/lang/Object;

    move-result-object p2

    invoke-virtual {p1, v2, p2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_2

    .line 2160
    :cond_6
    sget-object p1, Lcom/android/systemui/dynamicisland/IslandOverlayView$BlurEngine;->sSetColorCurvePreset:Ljava/lang/reflect/Method;

    if-eqz p1, :cond_7

    .line 2161
    sget-object p1, Lcom/android/systemui/dynamicisland/IslandOverlayView$BlurEngine;->sSetColorCurvePreset:Ljava/lang/reflect/Method;

    const/16 p2, 0x6b

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    filled-new-array {p2}, [Ljava/lang/Object;

    move-result-object p2

    invoke-virtual {p1, v2, p2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 2163
    :cond_7
    :goto_2
    sget-object p1, Lcom/android/systemui/dynamicisland/IslandOverlayView$BlurEngine;->sSetBgColor:Ljava/lang/reflect/Method;

    if-eqz p1, :cond_8

    .line 2164
    sget-object p1, Lcom/android/systemui/dynamicisland/IslandOverlayView$BlurEngine;->sSetBgColor:Ljava/lang/reflect/Method;

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object p2

    invoke-virtual {p1, v2, p2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 2166
    :cond_8
    sget-object p1, Lcom/android/systemui/dynamicisland/IslandOverlayView$BlurEngine;->sBuild:Ljava/lang/reflect/Method;

    new-array p2, v1, [Ljava/lang/Object;

    invoke-virtual {p1, v2, p2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    .line 2167
    sget-object p2, Lcom/android/systemui/dynamicisland/IslandOverlayView$BlurEngine;->sSemSetBlurInfo:Ljava/lang/reflect/Method;

    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p2, p0, p1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2168
    const/4 p0, 0x1

    return p0

    .line 2169
    :catchall_0
    move-exception v0

    .line 2170
    return v1

    .line 2139
    :cond_9
    :goto_3
    return v1
.end method

.method static clearBlur(Landroid/view/View;)V
    .locals 2

    .line 2211
    if-nez p0, :cond_0

    .line 2212
    return-void

    .line 2214
    :cond_0
    sget-object v0, Lcom/android/systemui/dynamicisland/IslandOverlayView$BlurEngine;->sSemSetBlurInfo:Ljava/lang/reflect/Method;

    if-eqz v0, :cond_1

    .line 2216
    :try_start_0
    sget-object v0, Lcom/android/systemui/dynamicisland/IslandOverlayView$BlurEngine;->sSemSetBlurInfo:Ljava/lang/reflect/Method;

    const/4 v1, 0x0

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, p0, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2218
    goto :goto_0

    .line 2217
    :catchall_0
    move-exception p0

    .line 2220
    :cond_1
    :goto_0
    return-void
.end method

.method static init()V
    .locals 11

    .line 2097
    sget-boolean v0, Lcom/android/systemui/dynamicisland/IslandOverlayView$BlurEngine;->sProbed:Z

    if-eqz v0, :cond_0

    .line 2098
    return-void

    .line 2100
    :cond_0
    const/4 v0, 0x1

    sput-boolean v0, Lcom/android/systemui/dynamicisland/IslandOverlayView$BlurEngine;->sProbed:Z

    .line 2102
    const/4 v1, 0x0

    const/4 v2, 0x0

    :try_start_0
    const-string v0, "android.view.SemBlurInfo$Builder"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    .line 2103
    const-string v0, "android.view.SemBlurInfo"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    .line 2104
    sget-object v0, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    filled-new-array {v0}, [Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v0

    sput-object v0, Lcom/android/systemui/dynamicisland/IslandOverlayView$BlurEngine;->sBuilderCtor:Ljava/lang/reflect/Constructor;

    .line 2105
    const-string v0, "setRadius"

    sget-object v5, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    filled-new-array {v5}, [Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v3, v0, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    sput-object v0, Lcom/android/systemui/dynamicisland/IslandOverlayView$BlurEngine;->sSetRadius:Ljava/lang/reflect/Method;

    .line 2106
    const-string v0, "setBackgroundCornerRadius"

    sget-object v5, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    filled-new-array {v5}, [Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v3, v0, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    sput-object v0, Lcom/android/systemui/dynamicisland/IslandOverlayView$BlurEngine;->sSetBgCornerRadius:Ljava/lang/reflect/Method;

    .line 2107
    const-string v0, "setBackgroundColor"

    sget-object v5, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    filled-new-array {v5}, [Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v3, v0, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    sput-object v0, Lcom/android/systemui/dynamicisland/IslandOverlayView$BlurEngine;->sSetBgColor:Ljava/lang/reflect/Method;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 2109
    :try_start_1
    const-string v0, "setColorCurve"

    sget-object v5, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    sget-object v6, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    sget-object v7, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    sget-object v8, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    sget-object v9, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    sget-object v10, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    filled-new-array/range {v5 .. v10}, [Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v3, v0, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    sput-object v0, Lcom/android/systemui/dynamicisland/IslandOverlayView$BlurEngine;->sSetColorCurve:Ljava/lang/reflect/Method;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 2112
    goto :goto_0

    .line 2111
    :catchall_0
    move-exception v0

    .line 2114
    :goto_0
    :try_start_2
    const-string v0, "setColorCurvePreset"

    sget-object v5, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    filled-new-array {v5}, [Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v3, v0, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    sput-object v0, Lcom/android/systemui/dynamicisland/IslandOverlayView$BlurEngine;->sSetColorCurvePreset:Ljava/lang/reflect/Method;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 2116
    goto :goto_1

    .line 2115
    :catchall_1
    move-exception v0

    .line 2117
    :goto_1
    :try_start_3
    const-string v0, "build"

    new-array v5, v1, [Ljava/lang/Class;

    invoke-virtual {v3, v0, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    sput-object v0, Lcom/android/systemui/dynamicisland/IslandOverlayView$BlurEngine;->sBuild:Ljava/lang/reflect/Method;

    .line 2118
    const-class v0, Landroid/view/View;

    const-string v3, "semSetBlurInfo"

    filled-new-array {v4}, [Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    sput-object v0, Lcom/android/systemui/dynamicisland/IslandOverlayView$BlurEngine;->sSemSetBlurInfo:Ljava/lang/reflect/Method;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 2122
    goto :goto_2

    .line 2119
    :catchall_2
    move-exception v0

    .line 2120
    sput-object v2, Lcom/android/systemui/dynamicisland/IslandOverlayView$BlurEngine;->sBuilderCtor:Ljava/lang/reflect/Constructor;

    .line 2121
    sput-object v2, Lcom/android/systemui/dynamicisland/IslandOverlayView$BlurEngine;->sSemSetBlurInfo:Ljava/lang/reflect/Method;

    .line 2124
    :goto_2
    :try_start_4
    const-class v0, Landroid/view/View;

    const-string v3, "getViewRootImpl"

    new-array v4, v1, [Ljava/lang/Class;

    invoke-virtual {v0, v3, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    sput-object v0, Lcom/android/systemui/dynamicisland/IslandOverlayView$BlurEngine;->sGetViewRootImpl:Ljava/lang/reflect/Method;

    .line 2125
    const-string v0, "android.view.ViewRootImpl"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 2126
    const-string v3, "createBackgroundBlurDrawable"

    new-array v1, v1, [Ljava/lang/Class;

    invoke-virtual {v0, v3, v1}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    sput-object v0, Lcom/android/systemui/dynamicisland/IslandOverlayView$BlurEngine;->sCreateBgBlurDrawable:Ljava/lang/reflect/Method;

    .line 2127
    const-string v0, "com.android.internal.graphics.drawable.BackgroundBlurDrawable"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 2128
    const-string v1, "setBlurRadius"

    sget-object v3, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    filled-new-array {v3}, [Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v0, v1, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    sput-object v1, Lcom/android/systemui/dynamicisland/IslandOverlayView$BlurEngine;->sBbdSetBlurRadius:Ljava/lang/reflect/Method;

    .line 2129
    const-string v1, "setCornerRadius"

    sget-object v3, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    filled-new-array {v3}, [Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v0, v1, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    sput-object v1, Lcom/android/systemui/dynamicisland/IslandOverlayView$BlurEngine;->sBbdSetCornerRadius:Ljava/lang/reflect/Method;

    .line 2130
    const-string v1, "setColor"

    sget-object v3, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    filled-new-array {v3}, [Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v0, v1, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    sput-object v0, Lcom/android/systemui/dynamicisland/IslandOverlayView$BlurEngine;->sBbdSetColor:Ljava/lang/reflect/Method;
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_3

    .line 2133
    goto :goto_3

    .line 2131
    :catchall_3
    move-exception v0

    .line 2132
    sput-object v2, Lcom/android/systemui/dynamicisland/IslandOverlayView$BlurEngine;->sCreateBgBlurDrawable:Ljava/lang/reflect/Method;

    .line 2134
    :goto_3
    return-void
.end method
