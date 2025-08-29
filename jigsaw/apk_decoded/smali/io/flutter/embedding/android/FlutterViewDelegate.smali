.class public Lio/flutter/embedding/android/FlutterViewDelegate;
.super Ljava/lang/Object;
.source "FlutterViewDelegate.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getCaptionBarInsets(Landroid/content/Context;)Ljava/util/List;
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/List<",
            "Landroid/graphics/Rect;",
            ">;"
        }
    .end annotation

    .line 48
    invoke-virtual {p0, p1}, Lio/flutter/embedding/android/FlutterViewDelegate;->getWindowInsets(Landroid/content/Context;)Landroid/view/WindowInsets;

    move-result-object v0

    .line 49
    .local v0, "insets":Landroid/view/WindowInsets;
    if-nez v0, :cond_0

    .line 50
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v1

    return-object v1

    .line 52
    :cond_0
    invoke-static {}, Landroid/view/WindowInsets$Type;->captionBar()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/view/WindowInsets;->getBoundingRects(I)Ljava/util/List;

    move-result-object v1

    return-object v1
.end method

.method public getWindowInsets(Landroid/content/Context;)Landroid/view/WindowInsets;
    .locals 3
    .param p1, "context"    # Landroid/content/Context;

    .line 35
    invoke-static {p1}, Lio/flutter/util/ViewUtils;->getActivity(Landroid/content/Context;)Landroid/app/Activity;

    move-result-object v0

    .line 36
    .local v0, "activity":Landroid/app/Activity;
    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 37
    return-object v1

    .line 39
    :cond_0
    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v2

    .line 40
    .local v2, "window":Landroid/view/Window;
    if-nez v2, :cond_1

    .line 41
    return-object v1

    .line 43
    :cond_1
    invoke-virtual {v2}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->getRootWindowInsets()Landroid/view/WindowInsets;

    move-result-object v1

    return-object v1
.end method

.method public growViewportMetricsToCaptionBar(Landroid/content/Context;Lio/flutter/embedding/engine/renderer/FlutterRenderer$ViewportMetrics;)V
    .locals 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "viewportMetrics"    # Lio/flutter/embedding/engine/renderer/FlutterRenderer$ViewportMetrics;

    .line 58
    invoke-virtual {p0, p1}, Lio/flutter/embedding/android/FlutterViewDelegate;->getCaptionBarInsets(Landroid/content/Context;)Ljava/util/List;

    move-result-object v0

    .line 59
    .local v0, "boundingRects":Ljava/util/List;, "Ljava/util/List<Landroid/graphics/Rect;>;"
    iget v1, p2, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ViewportMetrics;->viewPaddingTop:I

    .line 60
    .local v1, "viewPaddingTop":I
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/graphics/Rect;

    .line 61
    .local v3, "rect":Landroid/graphics/Rect;
    iget v4, v3, Landroid/graphics/Rect;->bottom:I

    invoke-static {v1, v4}, Ljava/lang/Math;->max(II)I

    move-result v1

    .line 62
    .end local v3    # "rect":Landroid/graphics/Rect;
    goto :goto_0

    .line 69
    :cond_0
    iput v1, p2, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ViewportMetrics;->viewPaddingTop:I

    .line 70
    return-void
.end method
