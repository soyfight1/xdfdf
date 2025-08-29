.class final Landroidx/window/embedding/EmbeddingAdapter$VendorApiLevel2Impl;
.super Ljava/lang/Object;
.source "EmbeddingAdapter.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/window/embedding/EmbeddingAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "VendorApiLevel2Impl"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\u0008\u0082\u0004\u0018\u00002\u00020\u0001B\u0005\u00a2\u0006\u0002\u0010\u0002J\u000e\u0010\u0003\u001a\u00020\u00042\u0006\u0010\u0005\u001a\u00020\u0006\u00a8\u0006\u0007"
    }
    d2 = {
        "Landroidx/window/embedding/EmbeddingAdapter$VendorApiLevel2Impl;",
        "",
        "(Landroidx/window/embedding/EmbeddingAdapter;)V",
        "translateCompat",
        "Landroidx/window/embedding/SplitInfo;",
        "splitInfo",
        "Landroidx/window/extensions/embedding/SplitInfo;",
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


# instance fields
.field final synthetic this$0:Landroidx/window/embedding/EmbeddingAdapter;


# direct methods
.method public constructor <init>(Landroidx/window/embedding/EmbeddingAdapter;)V
    .locals 0
    .param p1, "this$0"    # Landroidx/window/embedding/EmbeddingAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 319
    iput-object p1, p0, Landroidx/window/embedding/EmbeddingAdapter$VendorApiLevel2Impl;->this$0:Landroidx/window/embedding/EmbeddingAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final translateCompat(Landroidx/window/extensions/embedding/SplitInfo;)Landroidx/window/embedding/SplitInfo;
    .locals 8
    .param p1, "splitInfo"    # Landroidx/window/extensions/embedding/SplitInfo;

    const-string v0, "splitInfo"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 321
    invoke-virtual {p1}, Landroidx/window/extensions/embedding/SplitInfo;->getPrimaryActivityStack()Landroidx/window/extensions/embedding/ActivityStack;

    move-result-object v0

    const-string v1, "splitInfo.primaryActivityStack"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 322
    .local v0, "primaryActivityStack":Landroidx/window/extensions/embedding/ActivityStack;
    new-instance v1, Landroidx/window/embedding/ActivityStack;

    .line 323
    invoke-virtual {v0}, Landroidx/window/extensions/embedding/ActivityStack;->getActivities()Ljava/util/List;

    move-result-object v2

    const-string v3, "primaryActivityStack.activities"

    invoke-static {v2, v3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 324
    invoke-virtual {v0}, Landroidx/window/extensions/embedding/ActivityStack;->isEmpty()Z

    move-result v3

    .line 322
    invoke-direct {v1, v2, v3}, Landroidx/window/embedding/ActivityStack;-><init>(Ljava/util/List;Z)V

    .line 327
    .local v1, "primaryFragment":Landroidx/window/embedding/ActivityStack;
    invoke-virtual {p1}, Landroidx/window/extensions/embedding/SplitInfo;->getSecondaryActivityStack()Landroidx/window/extensions/embedding/ActivityStack;

    move-result-object v2

    const-string v3, "splitInfo.secondaryActivityStack"

    invoke-static {v2, v3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 328
    .local v2, "secondaryActivityStack":Landroidx/window/extensions/embedding/ActivityStack;
    new-instance v3, Landroidx/window/embedding/ActivityStack;

    .line 329
    invoke-virtual {v2}, Landroidx/window/extensions/embedding/ActivityStack;->getActivities()Ljava/util/List;

    move-result-object v4

    const-string v5, "secondaryActivityStack.activities"

    invoke-static {v4, v5}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 330
    invoke-virtual {v2}, Landroidx/window/extensions/embedding/ActivityStack;->isEmpty()Z

    move-result v5

    .line 328
    invoke-direct {v3, v4, v5}, Landroidx/window/embedding/ActivityStack;-><init>(Ljava/util/List;Z)V

    .line 332
    .local v3, "secondaryFragment":Landroidx/window/embedding/ActivityStack;
    new-instance v4, Landroidx/window/embedding/SplitInfo;

    .line 333
    nop

    .line 334
    nop

    .line 335
    iget-object v5, p0, Landroidx/window/embedding/EmbeddingAdapter$VendorApiLevel2Impl;->this$0:Landroidx/window/embedding/EmbeddingAdapter;

    invoke-virtual {p1}, Landroidx/window/extensions/embedding/SplitInfo;->getSplitAttributes()Landroidx/window/extensions/embedding/SplitAttributes;

    move-result-object v6

    const-string v7, "splitInfo.splitAttributes"

    invoke-static {v6, v7}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v5, v6}, Landroidx/window/embedding/EmbeddingAdapter;->translate$window_release(Landroidx/window/extensions/embedding/SplitAttributes;)Landroidx/window/embedding/SplitAttributes;

    move-result-object v5

    .line 336
    sget-object v6, Landroidx/window/embedding/EmbeddingAdapter;->Companion:Landroidx/window/embedding/EmbeddingAdapter$Companion;

    invoke-virtual {v6}, Landroidx/window/embedding/EmbeddingAdapter$Companion;->getINVALID_SPLIT_INFO_TOKEN()Landroid/os/Binder;

    move-result-object v6

    check-cast v6, Landroid/os/IBinder;

    .line 332
    invoke-direct {v4, v1, v3, v5, v6}, Landroidx/window/embedding/SplitInfo;-><init>(Landroidx/window/embedding/ActivityStack;Landroidx/window/embedding/ActivityStack;Landroidx/window/embedding/SplitAttributes;Landroid/os/IBinder;)V

    return-object v4
.end method
