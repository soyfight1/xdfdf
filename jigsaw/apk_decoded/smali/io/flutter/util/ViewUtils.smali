.class public final Lio/flutter/util/ViewUtils;
.super Ljava/lang/Object;
.source "ViewUtils.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/flutter/util/ViewUtils$DisplayUpdater;,
        Lio/flutter/util/ViewUtils$ViewVisitor;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static calculateMaximumDisplayMetrics(Landroid/content/Context;Lio/flutter/util/ViewUtils$DisplayUpdater;)V
    .locals 5
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "updater"    # Lio/flutter/util/ViewUtils$DisplayUpdater;

    .line 29
    invoke-static {p0}, Lio/flutter/util/ViewUtils;->getActivity(Landroid/content/Context;)Landroid/app/Activity;

    move-result-object v0

    .line 30
    .local v0, "activity":Landroid/app/Activity;
    if-eqz v0, :cond_0

    .line 32
    invoke-static {}, Landroidx/window/layout/WindowMetricsCalculator$-CC;->getOrCreate()Landroidx/window/layout/WindowMetricsCalculator;

    move-result-object v1

    invoke-interface {v1, v0}, Landroidx/window/layout/WindowMetricsCalculator;->computeMaximumWindowMetrics(Landroid/app/Activity;)Landroidx/window/layout/WindowMetrics;

    move-result-object v1

    .line 33
    .local v1, "metrics":Landroidx/window/layout/WindowMetrics;
    invoke-virtual {v1}, Landroidx/window/layout/WindowMetrics;->getBounds()Landroid/graphics/Rect;

    move-result-object v2

    invoke-virtual {v2}, Landroid/graphics/Rect;->width()I

    move-result v2

    int-to-float v2, v2

    .line 34
    .local v2, "width":F
    invoke-virtual {v1}, Landroidx/window/layout/WindowMetrics;->getBounds()Landroid/graphics/Rect;

    move-result-object v3

    invoke-virtual {v3}, Landroid/graphics/Rect;->height()I

    move-result v3

    int-to-float v3, v3

    .line 35
    .local v3, "height":F
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v4

    iget v4, v4, Landroid/util/DisplayMetrics;->density:F

    .line 36
    .local v4, "density":F
    invoke-interface {p1, v2, v3, v4}, Lio/flutter/util/ViewUtils$DisplayUpdater;->updateDisplayMetrics(FFF)V

    .line 38
    .end local v1    # "metrics":Landroidx/window/layout/WindowMetrics;
    .end local v2    # "width":F
    .end local v3    # "height":F
    .end local v4    # "density":F
    :cond_0
    return-void
.end method

.method public static childHasFocus(Landroid/view/View;)Z
    .locals 1
    .param p0, "root"    # Landroid/view/View;

    .line 68
    new-instance v0, Lio/flutter/util/ViewUtils$$ExternalSyntheticLambda0;

    invoke-direct {v0}, Lio/flutter/util/ViewUtils$$ExternalSyntheticLambda0;-><init>()V

    invoke-static {p0, v0}, Lio/flutter/util/ViewUtils;->traverseHierarchy(Landroid/view/View;Lio/flutter/util/ViewUtils$ViewVisitor;)Z

    move-result v0

    return v0
.end method

.method public static getActivity(Landroid/content/Context;)Landroid/app/Activity;
    .locals 2
    .param p0, "context"    # Landroid/content/Context;

    .line 48
    const/4 v0, 0x0

    if-nez p0, :cond_0

    .line 49
    return-object v0

    .line 51
    :cond_0
    instance-of v1, p0, Landroid/app/Activity;

    if-eqz v1, :cond_1

    .line 52
    move-object v0, p0

    check-cast v0, Landroid/app/Activity;

    return-object v0

    .line 54
    :cond_1
    instance-of v1, p0, Landroid/content/ContextWrapper;

    if-eqz v1, :cond_2

    .line 56
    move-object v0, p0

    check-cast v0, Landroid/content/ContextWrapper;

    invoke-virtual {v0}, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lio/flutter/util/ViewUtils;->getActivity(Landroid/content/Context;)Landroid/app/Activity;

    move-result-object v0

    return-object v0

    .line 58
    :cond_2
    return-object v0
.end method

.method public static hasChildViewOfType(Landroid/view/View;[Ljava/lang/Class;)Z
    .locals 1
    .param p0, "root"    # Landroid/view/View;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            "[",
            "Ljava/lang/Class<",
            "+",
            "Landroid/view/View;",
            ">;)Z"
        }
    .end annotation

    .line 79
    .local p1, "viewTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<+Landroid/view/View;>;"
    new-instance v0, Lio/flutter/util/ViewUtils$$ExternalSyntheticLambda1;

    invoke-direct {v0, p1}, Lio/flutter/util/ViewUtils$$ExternalSyntheticLambda1;-><init>([Ljava/lang/Class;)V

    invoke-static {p0, v0}, Lio/flutter/util/ViewUtils;->traverseHierarchy(Landroid/view/View;Lio/flutter/util/ViewUtils$ViewVisitor;)Z

    move-result v0

    return v0
.end method

.method static synthetic lambda$childHasFocus$0(Landroid/view/View;)Z
    .locals 1
    .param p0, "view"    # Landroid/view/View;

    .line 68
    invoke-virtual {p0}, Landroid/view/View;->hasFocus()Z

    move-result v0

    return v0
.end method

.method static synthetic lambda$hasChildViewOfType$1([Ljava/lang/Class;Landroid/view/View;)Z
    .locals 3
    .param p0, "viewTypes"    # [Ljava/lang/Class;
    .param p1, "view"    # Landroid/view/View;

    .line 82
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v1, p0

    if-ge v0, v1, :cond_1

    .line 83
    aget-object v1, p0, v0

    .line 84
    .local v1, "viewType":Ljava/lang/Class;, "Ljava/lang/Class<+Landroid/view/View;>;"
    invoke-virtual {v1, p1}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 85
    const/4 v2, 0x1

    return v2

    .line 82
    .end local v1    # "viewType":Ljava/lang/Class;, "Ljava/lang/Class<+Landroid/view/View;>;"
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 88
    .end local v0    # "i":I
    :cond_1
    const/4 v0, 0x0

    return v0
.end method

.method public static traverseHierarchy(Landroid/view/View;Lio/flutter/util/ViewUtils$ViewVisitor;)Z
    .locals 5
    .param p0, "root"    # Landroid/view/View;
    .param p1, "visitor"    # Lio/flutter/util/ViewUtils$ViewVisitor;

    .line 110
    const/4 v0, 0x0

    if-nez p0, :cond_0

    .line 111
    return v0

    .line 113
    :cond_0
    invoke-interface {p1, p0}, Lio/flutter/util/ViewUtils$ViewVisitor;->run(Landroid/view/View;)Z

    move-result v1

    const/4 v2, 0x1

    if-eqz v1, :cond_1

    .line 114
    return v2

    .line 116
    :cond_1
    instance-of v1, p0, Landroid/view/ViewGroup;

    if-eqz v1, :cond_3

    .line 117
    move-object v1, p0

    check-cast v1, Landroid/view/ViewGroup;

    .line 118
    .local v1, "viewGroup":Landroid/view/ViewGroup;
    const/4 v3, 0x0

    .local v3, "idx":I
    :goto_0
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v4

    if-ge v3, v4, :cond_3

    .line 119
    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    invoke-static {v4, p1}, Lio/flutter/util/ViewUtils;->traverseHierarchy(Landroid/view/View;Lio/flutter/util/ViewUtils$ViewVisitor;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 120
    return v2

    .line 118
    :cond_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 124
    .end local v1    # "viewGroup":Landroid/view/ViewGroup;
    .end local v3    # "idx":I
    :cond_3
    return v0
.end method
