.class public final Landroidx/window/area/utils/DeviceUtils;
.super Ljava/lang/Object;
.source "DeviceUtils.kt"


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nDeviceUtils.kt\nKotlin\n*S Kotlin\n*F\n+ 1 DeviceUtils.kt\nandroidx/window/area/utils/DeviceUtils\n+ 2 _Collections.kt\nkotlin/collections/CollectionsKt___CollectionsKt\n*L\n1#1,53:1\n1747#2,3:54\n288#2,2:57\n*S KotlinDebug\n*F\n+ 1 DeviceUtils.kt\nandroidx/window/area/utils/DeviceUtils\n*L\n40#1:54,3\n47#1:57,2\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000,\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0003\n\u0002\u0010\u000b\n\u0002\u0008\u0002\u0008\u00c1\u0002\u0018\u00002\u00020\u0001B\u0007\u0008\u0002\u00a2\u0006\u0002\u0010\u0002J\u001f\u0010\u0006\u001a\u0004\u0018\u00010\u00072\u0006\u0010\u0008\u001a\u00020\t2\u0006\u0010\n\u001a\u00020\tH\u0000\u00a2\u0006\u0002\u0008\u000bJ\u001d\u0010\u000c\u001a\u00020\r2\u0006\u0010\u0008\u001a\u00020\t2\u0006\u0010\n\u001a\u00020\tH\u0000\u00a2\u0006\u0002\u0008\u000eR\u0014\u0010\u0003\u001a\u0008\u0012\u0004\u0012\u00020\u00050\u0004X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u000f"
    }
    d2 = {
        "Landroidx/window/area/utils/DeviceUtils;",
        "",
        "()V",
        "deviceList",
        "",
        "Landroidx/window/area/utils/DeviceMetrics;",
        "getRearDisplayMetrics",
        "Landroid/util/DisplayMetrics;",
        "manufacturer",
        "",
        "model",
        "getRearDisplayMetrics$window_release",
        "hasDeviceMetrics",
        "",
        "hasDeviceMetrics$window_release",
        "window_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x8,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final INSTANCE:Landroidx/window/area/utils/DeviceUtils;

.field private static final deviceList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroidx/window/area/utils/DeviceMetrics;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 4

    new-instance v0, Landroidx/window/area/utils/DeviceUtils;

    invoke-direct {v0}, Landroidx/window/area/utils/DeviceUtils;-><init>()V

    sput-object v0, Landroidx/window/area/utils/DeviceUtils;->INSTANCE:Landroidx/window/area/utils/DeviceUtils;

    .line 31
    nop

    .line 32
    new-instance v0, Landroid/util/DisplayMetrics;

    invoke-direct {v0}, Landroid/util/DisplayMetrics;-><init>()V

    move-object v1, v0

    .local v1, "$this$deviceList_u24lambda_u240":Landroid/util/DisplayMetrics;
    const/4 v2, 0x0

    .line 33
    .local v2, "$i$a$-apply-DeviceUtils$deviceList$1":I
    const/16 v3, 0x438

    iput v3, v1, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 34
    const/16 v3, 0x82c

    iput v3, v1, Landroid/util/DisplayMetrics;->heightPixels:I

    .line 35
    const/high16 v3, 0x40280000    # 2.625f

    iput v3, v1, Landroid/util/DisplayMetrics;->density:F

    .line 36
    const/16 v3, 0x1a4

    iput v3, v1, Landroid/util/DisplayMetrics;->densityDpi:I

    .end local v1    # "$this$deviceList_u24lambda_u240":Landroid/util/DisplayMetrics;
    .end local v2    # "$i$a$-apply-DeviceUtils$deviceList$1":I
    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 32
    nop

    .line 31
    new-instance v1, Landroidx/window/area/utils/DeviceMetrics;

    const-string v2, "google"

    const-string v3, "pixel fold"

    invoke-direct {v1, v2, v3, v0}, Landroidx/window/area/utils/DeviceMetrics;-><init>(Ljava/lang/String;Ljava/lang/String;Landroid/util/DisplayMetrics;)V

    invoke-static {v1}, Lkotlin/collections/CollectionsKt;->listOf(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Landroidx/window/area/utils/DeviceUtils;->deviceList:Ljava/util/List;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final getRearDisplayMetrics$window_release(Ljava/lang/String;Ljava/lang/String;)Landroid/util/DisplayMetrics;
    .locals 11
    .param p1, "manufacturer"    # Ljava/lang/String;
    .param p2, "model"    # Ljava/lang/String;

    const-string v0, "manufacturer"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "model"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 50
    nop

    .line 47
    sget-object v0, Landroidx/window/area/utils/DeviceUtils;->deviceList:Ljava/util/List;

    check-cast v0, Ljava/lang/Iterable;

    .local v0, "$this$firstOrNull$iv":Ljava/lang/Iterable;
    const/4 v1, 0x0

    .line 57
    .local v1, "$i$f$firstOrNull":I
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    const/4 v4, 0x0

    if-eqz v3, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    .local v3, "element$iv":Ljava/lang/Object;
    move-object v5, v3

    check-cast v5, Landroidx/window/area/utils/DeviceMetrics;

    .local v5, "it":Landroidx/window/area/utils/DeviceMetrics;
    const/4 v6, 0x0

    .line 48
    .local v6, "$i$a$-firstOrNull-DeviceUtils$getRearDisplayMetrics$1":I
    invoke-virtual {v5}, Landroidx/window/area/utils/DeviceMetrics;->getManufacturer()Ljava/lang/String;

    move-result-object v7

    sget-object v8, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v9, "US"

    invoke-static {v8, v9}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {p1, v8}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v8

    const-string v10, "this as java.lang.String).toLowerCase(locale)"

    invoke-static {v8, v10}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-static {v7, v8}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 49
    invoke-virtual {v5}, Landroidx/window/area/utils/DeviceMetrics;->getModel()Ljava/lang/String;

    move-result-object v7

    sget-object v8, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-static {v8, v9}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {p2, v8}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v8

    invoke-static {v8, v10}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-static {v7, v8}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_1

    const/4 v7, 0x1

    goto :goto_0

    :cond_1
    const/4 v7, 0x0

    .line 48
    :goto_0
    nop

    .line 57
    .end local v5    # "it":Landroidx/window/area/utils/DeviceMetrics;
    .end local v6    # "$i$a$-firstOrNull-DeviceUtils$getRearDisplayMetrics$1":I
    if-eqz v7, :cond_0

    goto :goto_1

    .line 58
    .end local v3    # "element$iv":Ljava/lang/Object;
    :cond_2
    move-object v3, v4

    .line 47
    .end local v0    # "$this$firstOrNull$iv":Ljava/lang/Iterable;
    .end local v1    # "$i$f$firstOrNull":I
    :goto_1
    check-cast v3, Landroidx/window/area/utils/DeviceMetrics;

    .line 50
    if-eqz v3, :cond_3

    .line 47
    nop

    .line 50
    invoke-virtual {v3}, Landroidx/window/area/utils/DeviceMetrics;->getRearDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v4

    .line 47
    :cond_3
    return-object v4
.end method

.method public final hasDeviceMetrics$window_release(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 12
    .param p1, "manufacturer"    # Ljava/lang/String;
    .param p2, "model"    # Ljava/lang/String;

    const-string v0, "manufacturer"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "model"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 40
    sget-object v0, Landroidx/window/area/utils/DeviceUtils;->deviceList:Ljava/util/List;

    check-cast v0, Ljava/lang/Iterable;

    .local v0, "$this$any$iv":Ljava/lang/Iterable;
    const/4 v1, 0x0

    .line 54
    .local v1, "$i$f$any":I
    instance-of v2, v0, Ljava/util/Collection;

    const/4 v3, 0x0

    if-eqz v2, :cond_0

    move-object v2, v0

    check-cast v2, Ljava/util/Collection;

    invoke-interface {v2}, Ljava/util/Collection;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_0

    goto :goto_1

    .line 55
    :cond_0
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_3

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    .local v4, "element$iv":Ljava/lang/Object;
    move-object v5, v4

    check-cast v5, Landroidx/window/area/utils/DeviceMetrics;

    .local v5, "it":Landroidx/window/area/utils/DeviceMetrics;
    const/4 v6, 0x0

    .line 41
    .local v6, "$i$a$-any-DeviceUtils$hasDeviceMetrics$1":I
    invoke-virtual {v5}, Landroidx/window/area/utils/DeviceMetrics;->getManufacturer()Ljava/lang/String;

    move-result-object v7

    sget-object v8, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v9, "US"

    invoke-static {v8, v9}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {p1, v8}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v8

    const-string v10, "this as java.lang.String).toLowerCase(locale)"

    invoke-static {v8, v10}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-static {v7, v8}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v7

    const/4 v8, 0x1

    if-eqz v7, :cond_2

    .line 42
    invoke-virtual {v5}, Landroidx/window/area/utils/DeviceMetrics;->getModel()Ljava/lang/String;

    move-result-object v7

    sget-object v11, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-static {v11, v9}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {p2, v11}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v9

    invoke-static {v9, v10}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-static {v7, v9}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_2

    const/4 v7, 0x1

    goto :goto_0

    :cond_2
    const/4 v7, 0x0

    .line 41
    :goto_0
    nop

    .line 55
    .end local v5    # "it":Landroidx/window/area/utils/DeviceMetrics;
    .end local v6    # "$i$a$-any-DeviceUtils$hasDeviceMetrics$1":I
    if-eqz v7, :cond_1

    const/4 v3, 0x1

    goto :goto_1

    .line 56
    .end local v4    # "element$iv":Ljava/lang/Object;
    :cond_3
    nop

    .line 40
    .end local v0    # "$this$any$iv":Ljava/lang/Iterable;
    .end local v1    # "$i$f$any":I
    :goto_1
    return v3
.end method
