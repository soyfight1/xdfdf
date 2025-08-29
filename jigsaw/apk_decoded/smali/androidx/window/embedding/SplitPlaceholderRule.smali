.class public final Landroidx/window/embedding/SplitPlaceholderRule;
.super Landroidx/window/embedding/SplitRule;
.source "SplitPlaceholderRule.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/window/embedding/SplitPlaceholderRule$Builder;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000L\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\"\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\n\n\u0002\u0010\u0000\n\u0002\u0008\u0007\u0018\u00002\u00020\u0001:\u0001&Bu\u0008\u0010\u0012\n\u0008\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003\u0012\u000c\u0010\u0004\u001a\u0008\u0012\u0004\u0012\u00020\u00060\u0005\u0012\u0006\u0010\u0007\u001a\u00020\u0008\u0012\u0006\u0010\t\u001a\u00020\n\u0012\u0008\u0008\u0002\u0010\u000b\u001a\u00020\u000c\u0012\u0008\u0008\u0003\u0010\r\u001a\u00020\u000e\u0012\u0008\u0008\u0003\u0010\u000f\u001a\u00020\u000e\u0012\u0008\u0008\u0003\u0010\u0010\u001a\u00020\u000e\u0012\u0008\u0008\u0002\u0010\u0011\u001a\u00020\u0012\u0012\u0008\u0008\u0002\u0010\u0013\u001a\u00020\u0012\u0012\u0006\u0010\u0014\u001a\u00020\u0015\u00a2\u0006\u0002\u0010\u0016J\u0013\u0010\u001e\u001a\u00020\n2\u0008\u0010\u001f\u001a\u0004\u0018\u00010 H\u0096\u0002J\u0008\u0010!\u001a\u00020\u000eH\u0016J\u0016\u0010\"\u001a\u00020\u00002\u0006\u0010#\u001a\u00020\u0006H\u0080\u0002\u00a2\u0006\u0002\u0008$J\u0008\u0010%\u001a\u00020\u0003H\u0016R\u0017\u0010\u0004\u001a\u0008\u0012\u0004\u0012\u00020\u00060\u0005\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0017\u0010\u0018R\u0011\u0010\u000b\u001a\u00020\u000c\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0019\u0010\u001aR\u0011\u0010\t\u001a\u00020\n\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\t\u0010\u001bR\u0011\u0010\u0007\u001a\u00020\u0008\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u001c\u0010\u001d\u00a8\u0006\'"
    }
    d2 = {
        "Landroidx/window/embedding/SplitPlaceholderRule;",
        "Landroidx/window/embedding/SplitRule;",
        "tag",
        "",
        "filters",
        "",
        "Landroidx/window/embedding/ActivityFilter;",
        "placeholderIntent",
        "Landroid/content/Intent;",
        "isSticky",
        "",
        "finishPrimaryWithPlaceholder",
        "Landroidx/window/embedding/SplitRule$FinishBehavior;",
        "minWidthDp",
        "",
        "minHeightDp",
        "minSmallestWidthDp",
        "maxAspectRatioInPortrait",
        "Landroidx/window/embedding/EmbeddingAspectRatio;",
        "maxAspectRatioInLandscape",
        "defaultSplitAttributes",
        "Landroidx/window/embedding/SplitAttributes;",
        "(Ljava/lang/String;Ljava/util/Set;Landroid/content/Intent;ZLandroidx/window/embedding/SplitRule$FinishBehavior;IIILandroidx/window/embedding/EmbeddingAspectRatio;Landroidx/window/embedding/EmbeddingAspectRatio;Landroidx/window/embedding/SplitAttributes;)V",
        "getFilters",
        "()Ljava/util/Set;",
        "getFinishPrimaryWithPlaceholder",
        "()Landroidx/window/embedding/SplitRule$FinishBehavior;",
        "()Z",
        "getPlaceholderIntent",
        "()Landroid/content/Intent;",
        "equals",
        "other",
        "",
        "hashCode",
        "plus",
        "filter",
        "plus$window_release",
        "toString",
        "Builder",
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
.field private final filters:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Landroidx/window/embedding/ActivityFilter;",
            ">;"
        }
    .end annotation
.end field

.field private final finishPrimaryWithPlaceholder:Landroidx/window/embedding/SplitRule$FinishBehavior;

.field private final isSticky:Z

.field private final placeholderIntent:Landroid/content/Intent;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/util/Set;Landroid/content/Intent;ZLandroidx/window/embedding/SplitRule$FinishBehavior;IIILandroidx/window/embedding/EmbeddingAspectRatio;Landroidx/window/embedding/EmbeddingAspectRatio;Landroidx/window/embedding/SplitAttributes;)V
    .locals 15
    .param p1, "tag"    # Ljava/lang/String;
    .param p2, "filters"    # Ljava/util/Set;
    .param p3, "placeholderIntent"    # Landroid/content/Intent;
    .param p4, "isSticky"    # Z
    .param p5, "finishPrimaryWithPlaceholder"    # Landroidx/window/embedding/SplitRule$FinishBehavior;
    .param p6, "minWidthDp"    # I
    .param p7, "minHeightDp"    # I
    .param p8, "minSmallestWidthDp"    # I
    .param p9, "maxAspectRatioInPortrait"    # Landroidx/window/embedding/EmbeddingAspectRatio;
    .param p10, "maxAspectRatioInLandscape"    # Landroidx/window/embedding/EmbeddingAspectRatio;
    .param p11, "defaultSplitAttributes"    # Landroidx/window/embedding/SplitAttributes;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Set<",
            "Landroidx/window/embedding/ActivityFilter;",
            ">;",
            "Landroid/content/Intent;",
            "Z",
            "Landroidx/window/embedding/SplitRule$FinishBehavior;",
            "III",
            "Landroidx/window/embedding/EmbeddingAspectRatio;",
            "Landroidx/window/embedding/EmbeddingAspectRatio;",
            "Landroidx/window/embedding/SplitAttributes;",
            ")V"
        }
    .end annotation

    move-object v8, p0

    move-object/from16 v9, p2

    move-object/from16 v10, p3

    move-object/from16 v11, p5

    const-string v0, "filters"

    invoke-static {v9, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "placeholderIntent"

    invoke-static {v10, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "finishPrimaryWithPlaceholder"

    invoke-static {v11, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "maxAspectRatioInPortrait"

    move-object/from16 v12, p9

    invoke-static {v12, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "maxAspectRatioInLandscape"

    move-object/from16 v13, p10

    invoke-static {v13, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "defaultSplitAttributes"

    move-object/from16 v14, p11

    invoke-static {v14, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 87
    nop

    .line 88
    nop

    .line 87
    move-object v0, p0

    move-object/from16 v1, p1

    move/from16 v2, p6

    move/from16 v3, p7

    move/from16 v4, p8

    move-object/from16 v5, p9

    move-object/from16 v6, p10

    move-object/from16 v7, p11

    invoke-direct/range {v0 .. v7}, Landroidx/window/embedding/SplitRule;-><init>(Ljava/lang/String;IIILandroidx/window/embedding/EmbeddingAspectRatio;Landroidx/window/embedding/EmbeddingAspectRatio;Landroidx/window/embedding/SplitAttributes;)V

    .line 89
    sget-object v0, Landroidx/window/embedding/SplitRule$FinishBehavior;->NEVER:Landroidx/window/embedding/SplitRule$FinishBehavior;

    invoke-static {v11, v0}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    .line 90
    xor-int/lit8 v0, v0, 0x1

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    .line 89
    const-string v2, "NEVER is not a valid configuration for SplitPlaceholderRule. Please use FINISH_ALWAYS or FINISH_ADJACENT instead or refer to the current API."

    invoke-static {v0, v2, v1}, Landroidx/core/util/Preconditions;->checkArgument(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 92
    move-object v0, v9

    check-cast v0, Ljava/lang/Iterable;

    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->toSet(Ljava/lang/Iterable;)Ljava/util/Set;

    move-result-object v0

    iput-object v0, v8, Landroidx/window/embedding/SplitPlaceholderRule;->filters:Ljava/util/Set;

    .line 93
    iput-object v10, v8, Landroidx/window/embedding/SplitPlaceholderRule;->placeholderIntent:Landroid/content/Intent;

    .line 94
    move/from16 v0, p4

    iput-boolean v0, v8, Landroidx/window/embedding/SplitPlaceholderRule;->isSticky:Z

    .line 95
    iput-object v11, v8, Landroidx/window/embedding/SplitPlaceholderRule;->finishPrimaryWithPlaceholder:Landroidx/window/embedding/SplitRule$FinishBehavior;

    .line 96
    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/String;Ljava/util/Set;Landroid/content/Intent;ZLandroidx/window/embedding/SplitRule$FinishBehavior;IIILandroidx/window/embedding/EmbeddingAspectRatio;Landroidx/window/embedding/EmbeddingAspectRatio;Landroidx/window/embedding/SplitAttributes;ILkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 14

    .line 75
    move/from16 v0, p12

    and-int/lit8 v1, v0, 0x1

    if-eqz v1, :cond_0

    .line 76
    const/4 v1, 0x0

    move-object v3, v1

    goto :goto_0

    .line 75
    :cond_0
    move-object v3, p1

    :goto_0
    and-int/lit8 v1, v0, 0x10

    if-eqz v1, :cond_1

    .line 80
    sget-object v1, Landroidx/window/embedding/SplitRule$FinishBehavior;->ALWAYS:Landroidx/window/embedding/SplitRule$FinishBehavior;

    move-object v7, v1

    goto :goto_1

    .line 75
    :cond_1
    move-object/from16 v7, p5

    :goto_1
    and-int/lit8 v1, v0, 0x20

    const/16 v2, 0x258

    if-eqz v1, :cond_2

    .line 81
    const/16 v8, 0x258

    goto :goto_2

    .line 75
    :cond_2
    move/from16 v8, p6

    :goto_2
    and-int/lit8 v1, v0, 0x40

    if-eqz v1, :cond_3

    .line 82
    const/16 v9, 0x258

    goto :goto_3

    .line 75
    :cond_3
    move/from16 v9, p7

    :goto_3
    and-int/lit16 v1, v0, 0x80

    if-eqz v1, :cond_4

    .line 83
    const/16 v10, 0x258

    goto :goto_4

    .line 75
    :cond_4
    move/from16 v10, p8

    :goto_4
    and-int/lit16 v1, v0, 0x100

    if-eqz v1, :cond_5

    .line 84
    sget-object v1, Landroidx/window/embedding/SplitRule;->SPLIT_MAX_ASPECT_RATIO_PORTRAIT_DEFAULT:Landroidx/window/embedding/EmbeddingAspectRatio;

    move-object v11, v1

    goto :goto_5

    .line 75
    :cond_5
    move-object/from16 v11, p9

    :goto_5
    and-int/lit16 v0, v0, 0x200

    if-eqz v0, :cond_6

    .line 85
    sget-object v0, Landroidx/window/embedding/SplitRule;->SPLIT_MAX_ASPECT_RATIO_LANDSCAPE_DEFAULT:Landroidx/window/embedding/EmbeddingAspectRatio;

    move-object v12, v0

    goto :goto_6

    .line 75
    :cond_6
    move-object/from16 v12, p10

    :goto_6
    move-object v2, p0

    move-object/from16 v4, p2

    move-object/from16 v5, p3

    move/from16 v6, p4

    move-object/from16 v13, p11

    invoke-direct/range {v2 .. v13}, Landroidx/window/embedding/SplitPlaceholderRule;-><init>(Ljava/lang/String;Ljava/util/Set;Landroid/content/Intent;ZLandroidx/window/embedding/SplitRule$FinishBehavior;IIILandroidx/window/embedding/EmbeddingAspectRatio;Landroidx/window/embedding/EmbeddingAspectRatio;Landroidx/window/embedding/SplitAttributes;)V

    .line 96
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4
    .param p1, "other"    # Ljava/lang/Object;

    .line 307
    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    .line 308
    :cond_0
    instance-of v1, p1, Landroidx/window/embedding/SplitPlaceholderRule;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    .line 309
    :cond_1
    invoke-super {p0, p1}, Landroidx/window/embedding/SplitRule;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    return v2

    .line 311
    :cond_2
    iget-object v1, p0, Landroidx/window/embedding/SplitPlaceholderRule;->placeholderIntent:Landroid/content/Intent;

    move-object v3, p1

    check-cast v3, Landroidx/window/embedding/SplitPlaceholderRule;

    iget-object v3, v3, Landroidx/window/embedding/SplitPlaceholderRule;->placeholderIntent:Landroid/content/Intent;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3

    return v2

    .line 312
    :cond_3
    iget-boolean v1, p0, Landroidx/window/embedding/SplitPlaceholderRule;->isSticky:Z

    move-object v3, p1

    check-cast v3, Landroidx/window/embedding/SplitPlaceholderRule;

    iget-boolean v3, v3, Landroidx/window/embedding/SplitPlaceholderRule;->isSticky:Z

    if-eq v1, v3, :cond_4

    return v2

    .line 313
    :cond_4
    iget-object v1, p0, Landroidx/window/embedding/SplitPlaceholderRule;->finishPrimaryWithPlaceholder:Landroidx/window/embedding/SplitRule$FinishBehavior;

    move-object v3, p1

    check-cast v3, Landroidx/window/embedding/SplitPlaceholderRule;

    iget-object v3, v3, Landroidx/window/embedding/SplitPlaceholderRule;->finishPrimaryWithPlaceholder:Landroidx/window/embedding/SplitRule$FinishBehavior;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_5

    return v2

    .line 314
    :cond_5
    iget-object v1, p0, Landroidx/window/embedding/SplitPlaceholderRule;->filters:Ljava/util/Set;

    move-object v3, p1

    check-cast v3, Landroidx/window/embedding/SplitPlaceholderRule;

    iget-object v3, v3, Landroidx/window/embedding/SplitPlaceholderRule;->filters:Ljava/util/Set;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_6

    return v2

    .line 316
    :cond_6
    return v0
.end method

.method public final getFilters()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Landroidx/window/embedding/ActivityFilter;",
            ">;"
        }
    .end annotation

    .line 51
    iget-object v0, p0, Landroidx/window/embedding/SplitPlaceholderRule;->filters:Ljava/util/Set;

    return-object v0
.end method

.method public final getFinishPrimaryWithPlaceholder()Landroidx/window/embedding/SplitRule$FinishBehavior;
    .locals 1

    .line 73
    iget-object v0, p0, Landroidx/window/embedding/SplitPlaceholderRule;->finishPrimaryWithPlaceholder:Landroidx/window/embedding/SplitRule$FinishBehavior;

    return-object v0
.end method

.method public final getPlaceholderIntent()Landroid/content/Intent;
    .locals 1

    .line 56
    iget-object v0, p0, Landroidx/window/embedding/SplitPlaceholderRule;->placeholderIntent:Landroid/content/Intent;

    return-object v0
.end method

.method public hashCode()I
    .locals 3

    .line 320
    invoke-super {p0}, Landroidx/window/embedding/SplitRule;->hashCode()I

    move-result v0

    .line 321
    .local v0, "result":I
    mul-int/lit8 v1, v0, 0x1f

    iget-object v2, p0, Landroidx/window/embedding/SplitPlaceholderRule;->placeholderIntent:Landroid/content/Intent;

    invoke-virtual {v2}, Landroid/content/Intent;->hashCode()I

    move-result v2

    add-int/2addr v1, v2

    .line 322
    .end local v0    # "result":I
    .local v1, "result":I
    mul-int/lit8 v0, v1, 0x1f

    iget-boolean v2, p0, Landroidx/window/embedding/SplitPlaceholderRule;->isSticky:Z

    invoke-static {v2}, Landroidx/window/embedding/ActivityRule$$ExternalSyntheticBackport0;->m(Z)I

    move-result v2

    add-int/2addr v0, v2

    .line 323
    .end local v1    # "result":I
    .restart local v0    # "result":I
    mul-int/lit8 v1, v0, 0x1f

    iget-object v2, p0, Landroidx/window/embedding/SplitPlaceholderRule;->finishPrimaryWithPlaceholder:Landroidx/window/embedding/SplitRule$FinishBehavior;

    invoke-virtual {v2}, Landroidx/window/embedding/SplitRule$FinishBehavior;->hashCode()I

    move-result v2

    add-int/2addr v1, v2

    .line 324
    .end local v0    # "result":I
    .restart local v1    # "result":I
    mul-int/lit8 v0, v1, 0x1f

    iget-object v2, p0, Landroidx/window/embedding/SplitPlaceholderRule;->filters:Ljava/util/Set;

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    add-int/2addr v0, v2

    .line 325
    .end local v1    # "result":I
    .restart local v0    # "result":I
    return v0
.end method

.method public final isSticky()Z
    .locals 1

    .line 62
    iget-boolean v0, p0, Landroidx/window/embedding/SplitPlaceholderRule;->isSticky:Z

    return v0
.end method

.method public final plus$window_release(Landroidx/window/embedding/ActivityFilter;)Landroidx/window/embedding/SplitPlaceholderRule;
    .locals 4
    .param p1, "filter"    # Landroidx/window/embedding/ActivityFilter;

    const-string v0, "filter"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 290
    new-instance v0, Ljava/util/LinkedHashSet;

    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    check-cast v0, Ljava/util/Set;

    .line 291
    .local v0, "newSet":Ljava/util/Set;
    iget-object v1, p0, Landroidx/window/embedding/SplitPlaceholderRule;->filters:Ljava/util/Set;

    check-cast v1, Ljava/util/Collection;

    invoke-interface {v0, v1}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 292
    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 293
    new-instance v1, Landroidx/window/embedding/SplitPlaceholderRule$Builder;

    move-object v2, v0

    check-cast v2, Ljava/lang/Iterable;

    invoke-static {v2}, Lkotlin/collections/CollectionsKt;->toSet(Ljava/lang/Iterable;)Ljava/util/Set;

    move-result-object v2

    iget-object v3, p0, Landroidx/window/embedding/SplitPlaceholderRule;->placeholderIntent:Landroid/content/Intent;

    invoke-direct {v1, v2, v3}, Landroidx/window/embedding/SplitPlaceholderRule$Builder;-><init>(Ljava/util/Set;Landroid/content/Intent;)V

    .line 294
    invoke-virtual {p0}, Landroidx/window/embedding/SplitPlaceholderRule;->getTag()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroidx/window/embedding/SplitPlaceholderRule$Builder;->setTag(Ljava/lang/String;)Landroidx/window/embedding/SplitPlaceholderRule$Builder;

    move-result-object v1

    .line 295
    invoke-virtual {p0}, Landroidx/window/embedding/SplitPlaceholderRule;->getMinWidthDp()I

    move-result v2

    invoke-virtual {v1, v2}, Landroidx/window/embedding/SplitPlaceholderRule$Builder;->setMinWidthDp(I)Landroidx/window/embedding/SplitPlaceholderRule$Builder;

    move-result-object v1

    .line 296
    invoke-virtual {p0}, Landroidx/window/embedding/SplitPlaceholderRule;->getMinHeightDp()I

    move-result v2

    invoke-virtual {v1, v2}, Landroidx/window/embedding/SplitPlaceholderRule$Builder;->setMinHeightDp(I)Landroidx/window/embedding/SplitPlaceholderRule$Builder;

    move-result-object v1

    .line 297
    invoke-virtual {p0}, Landroidx/window/embedding/SplitPlaceholderRule;->getMinSmallestWidthDp()I

    move-result v2

    invoke-virtual {v1, v2}, Landroidx/window/embedding/SplitPlaceholderRule$Builder;->setMinSmallestWidthDp(I)Landroidx/window/embedding/SplitPlaceholderRule$Builder;

    move-result-object v1

    .line 298
    invoke-virtual {p0}, Landroidx/window/embedding/SplitPlaceholderRule;->getMaxAspectRatioInPortrait()Landroidx/window/embedding/EmbeddingAspectRatio;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroidx/window/embedding/SplitPlaceholderRule$Builder;->setMaxAspectRatioInPortrait(Landroidx/window/embedding/EmbeddingAspectRatio;)Landroidx/window/embedding/SplitPlaceholderRule$Builder;

    move-result-object v1

    .line 299
    invoke-virtual {p0}, Landroidx/window/embedding/SplitPlaceholderRule;->getMaxAspectRatioInLandscape()Landroidx/window/embedding/EmbeddingAspectRatio;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroidx/window/embedding/SplitPlaceholderRule$Builder;->setMaxAspectRatioInLandscape(Landroidx/window/embedding/EmbeddingAspectRatio;)Landroidx/window/embedding/SplitPlaceholderRule$Builder;

    move-result-object v1

    .line 300
    iget-boolean v2, p0, Landroidx/window/embedding/SplitPlaceholderRule;->isSticky:Z

    invoke-virtual {v1, v2}, Landroidx/window/embedding/SplitPlaceholderRule$Builder;->setSticky(Z)Landroidx/window/embedding/SplitPlaceholderRule$Builder;

    move-result-object v1

    .line 301
    iget-object v2, p0, Landroidx/window/embedding/SplitPlaceholderRule;->finishPrimaryWithPlaceholder:Landroidx/window/embedding/SplitRule$FinishBehavior;

    invoke-virtual {v1, v2}, Landroidx/window/embedding/SplitPlaceholderRule$Builder;->setFinishPrimaryWithPlaceholder(Landroidx/window/embedding/SplitRule$FinishBehavior;)Landroidx/window/embedding/SplitPlaceholderRule$Builder;

    move-result-object v1

    .line 302
    invoke-virtual {p0}, Landroidx/window/embedding/SplitPlaceholderRule;->getDefaultSplitAttributes()Landroidx/window/embedding/SplitAttributes;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroidx/window/embedding/SplitPlaceholderRule$Builder;->setDefaultSplitAttributes(Landroidx/window/embedding/SplitAttributes;)Landroidx/window/embedding/SplitPlaceholderRule$Builder;

    move-result-object v1

    .line 303
    invoke-virtual {v1}, Landroidx/window/embedding/SplitPlaceholderRule$Builder;->build()Landroidx/window/embedding/SplitPlaceholderRule;

    move-result-object v1

    .line 293
    return-object v1
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 329
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "SplitPlaceholderRule{tag="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 330
    invoke-virtual {p0}, Landroidx/window/embedding/SplitPlaceholderRule;->getTag()Ljava/lang/String;

    move-result-object v2

    .line 329
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 331
    nop

    .line 329
    const-string v2, ", defaultSplitAttributes="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 331
    invoke-virtual {p0}, Landroidx/window/embedding/SplitPlaceholderRule;->getDefaultSplitAttributes()Landroidx/window/embedding/SplitAttributes;

    move-result-object v2

    .line 329
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 332
    nop

    .line 329
    const-string v2, ", minWidthDp="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 332
    invoke-virtual {p0}, Landroidx/window/embedding/SplitPlaceholderRule;->getMinWidthDp()I

    move-result v2

    .line 329
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 333
    nop

    .line 329
    const-string v2, ", minHeightDp="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 333
    invoke-virtual {p0}, Landroidx/window/embedding/SplitPlaceholderRule;->getMinHeightDp()I

    move-result v2

    .line 329
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 334
    nop

    .line 329
    const-string v2, ", minSmallestWidthDp="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 334
    invoke-virtual {p0}, Landroidx/window/embedding/SplitPlaceholderRule;->getMinSmallestWidthDp()I

    move-result v2

    .line 329
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 335
    nop

    .line 329
    const-string v2, ", maxAspectRatioInPortrait="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 335
    invoke-virtual {p0}, Landroidx/window/embedding/SplitPlaceholderRule;->getMaxAspectRatioInPortrait()Landroidx/window/embedding/EmbeddingAspectRatio;

    move-result-object v2

    .line 329
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 336
    nop

    .line 329
    const-string v2, ", maxAspectRatioInLandscape="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 336
    invoke-virtual {p0}, Landroidx/window/embedding/SplitPlaceholderRule;->getMaxAspectRatioInLandscape()Landroidx/window/embedding/EmbeddingAspectRatio;

    move-result-object v2

    .line 329
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 337
    nop

    .line 329
    const-string v2, ", placeholderIntent="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 337
    iget-object v2, p0, Landroidx/window/embedding/SplitPlaceholderRule;->placeholderIntent:Landroid/content/Intent;

    .line 329
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 338
    nop

    .line 329
    const-string v2, ", isSticky="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 338
    iget-boolean v2, p0, Landroidx/window/embedding/SplitPlaceholderRule;->isSticky:Z

    .line 329
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 339
    nop

    .line 329
    const-string v2, ", finishPrimaryWithPlaceholder="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 339
    iget-object v2, p0, Landroidx/window/embedding/SplitPlaceholderRule;->finishPrimaryWithPlaceholder:Landroidx/window/embedding/SplitRule$FinishBehavior;

    .line 329
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 340
    nop

    .line 329
    const-string v2, ", filters="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 340
    iget-object v2, p0, Landroidx/window/embedding/SplitPlaceholderRule;->filters:Ljava/util/Set;

    .line 329
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const/16 v2, 0x7d

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 341
    return-object v0
.end method
