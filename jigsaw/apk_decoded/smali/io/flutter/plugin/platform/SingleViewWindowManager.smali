.class abstract Lio/flutter/plugin/platform/SingleViewWindowManager;
.super Ljava/lang/Object;
.source "SingleViewWindowManager.java"

# interfaces
.implements Landroid/view/WindowManager;


# static fields
.field private static final TAG:Ljava/lang/String; = "PlatformViewsController"


# instance fields
.field final delegate:Landroid/view/WindowManager;

.field fakeWindowRootView:Lio/flutter/plugin/platform/SingleViewFakeWindowViewGroup;


# direct methods
.method constructor <init>(Landroid/view/WindowManager;Lio/flutter/plugin/platform/SingleViewFakeWindowViewGroup;)V
    .locals 0
    .param p1, "delegate"    # Landroid/view/WindowManager;
    .param p2, "fakeWindowViewGroup"    # Lio/flutter/plugin/platform/SingleViewFakeWindowViewGroup;

    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    iput-object p1, p0, Lio/flutter/plugin/platform/SingleViewWindowManager;->delegate:Landroid/view/WindowManager;

    .line 44
    iput-object p2, p0, Lio/flutter/plugin/platform/SingleViewWindowManager;->fakeWindowRootView:Lio/flutter/plugin/platform/SingleViewFakeWindowViewGroup;

    .line 45
    return-void
.end method


# virtual methods
.method public addCrossWindowBlurEnabledListener(Ljava/util/concurrent/Executor;Ljava/util/function/Consumer;)V
    .locals 1
    .param p1, "executor"    # Ljava/util/concurrent/Executor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/Executor;",
            "Ljava/util/function/Consumer<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 120
    .local p2, "listener":Ljava/util/function/Consumer;, "Ljava/util/function/Consumer<Ljava/lang/Boolean;>;"
    iget-object v0, p0, Lio/flutter/plugin/platform/SingleViewWindowManager;->delegate:Landroid/view/WindowManager;

    invoke-interface {v0, p1, p2}, Landroid/view/WindowManager;->addCrossWindowBlurEnabledListener(Ljava/util/concurrent/Executor;Ljava/util/function/Consumer;)V

    .line 121
    return-void
.end method

.method public addCrossWindowBlurEnabledListener(Ljava/util/function/Consumer;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/function/Consumer<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 113
    .local p1, "listener":Ljava/util/function/Consumer;, "Ljava/util/function/Consumer<Ljava/lang/Boolean;>;"
    iget-object v0, p0, Lio/flutter/plugin/platform/SingleViewWindowManager;->delegate:Landroid/view/WindowManager;

    invoke-interface {v0, p1}, Landroid/view/WindowManager;->addCrossWindowBlurEnabledListener(Ljava/util/function/Consumer;)V

    .line 114
    return-void
.end method

.method public addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
    .locals 2
    .param p1, "view"    # Landroid/view/View;
    .param p2, "params"    # Landroid/view/ViewGroup$LayoutParams;

    .line 65
    iget-object v0, p0, Lio/flutter/plugin/platform/SingleViewWindowManager;->fakeWindowRootView:Lio/flutter/plugin/platform/SingleViewFakeWindowViewGroup;

    if-nez v0, :cond_0

    .line 66
    const-string v0, "PlatformViewsController"

    const-string v1, "Embedded view called addView while detached from presentation"

    invoke-static {v0, v1}, Lio/flutter/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 67
    return-void

    .line 69
    :cond_0
    invoke-virtual {v0, p1, p2}, Lio/flutter/plugin/platform/SingleViewFakeWindowViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 70
    return-void
.end method

.method public getCurrentWindowMetrics()Landroid/view/WindowMetrics;
    .locals 1

    .line 94
    iget-object v0, p0, Lio/flutter/plugin/platform/SingleViewWindowManager;->delegate:Landroid/view/WindowManager;

    invoke-interface {v0}, Landroid/view/WindowManager;->getCurrentWindowMetrics()Landroid/view/WindowMetrics;

    move-result-object v0

    return-object v0
.end method

.method public getDefaultDisplay()Landroid/view/Display;
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 50
    iget-object v0, p0, Lio/flutter/plugin/platform/SingleViewWindowManager;->delegate:Landroid/view/WindowManager;

    invoke-interface {v0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v0

    return-object v0
.end method

.method public getMaximumWindowMetrics()Landroid/view/WindowMetrics;
    .locals 1

    .line 101
    iget-object v0, p0, Lio/flutter/plugin/platform/SingleViewWindowManager;->delegate:Landroid/view/WindowManager;

    invoke-interface {v0}, Landroid/view/WindowManager;->getMaximumWindowMetrics()Landroid/view/WindowMetrics;

    move-result-object v0

    return-object v0
.end method

.method public isCrossWindowBlurEnabled()Z
    .locals 1

    .line 107
    iget-object v0, p0, Lio/flutter/plugin/platform/SingleViewWindowManager;->delegate:Landroid/view/WindowManager;

    invoke-interface {v0}, Landroid/view/WindowManager;->isCrossWindowBlurEnabled()Z

    move-result v0

    return v0
.end method

.method public removeCrossWindowBlurEnabledListener(Ljava/util/function/Consumer;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/function/Consumer<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 126
    .local p1, "listener":Ljava/util/function/Consumer;, "Ljava/util/function/Consumer<Ljava/lang/Boolean;>;"
    iget-object v0, p0, Lio/flutter/plugin/platform/SingleViewWindowManager;->delegate:Landroid/view/WindowManager;

    invoke-interface {v0, p1}, Landroid/view/WindowManager;->removeCrossWindowBlurEnabledListener(Ljava/util/function/Consumer;)V

    .line 127
    return-void
.end method

.method public removeView(Landroid/view/View;)V
    .locals 2
    .param p1, "view"    # Landroid/view/View;

    .line 83
    iget-object v0, p0, Lio/flutter/plugin/platform/SingleViewWindowManager;->fakeWindowRootView:Lio/flutter/plugin/platform/SingleViewFakeWindowViewGroup;

    if-nez v0, :cond_0

    .line 84
    const-string v0, "PlatformViewsController"

    const-string v1, "Embedded view called removeView while detached from presentation"

    invoke-static {v0, v1}, Lio/flutter/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 85
    return-void

    .line 87
    :cond_0
    invoke-virtual {v0, p1}, Lio/flutter/plugin/platform/SingleViewFakeWindowViewGroup;->removeView(Landroid/view/View;)V

    .line 88
    return-void
.end method

.method public removeViewImmediate(Landroid/view/View;)V
    .locals 2
    .param p1, "view"    # Landroid/view/View;

    .line 55
    iget-object v0, p0, Lio/flutter/plugin/platform/SingleViewWindowManager;->fakeWindowRootView:Lio/flutter/plugin/platform/SingleViewFakeWindowViewGroup;

    if-nez v0, :cond_0

    .line 56
    const-string v0, "PlatformViewsController"

    const-string v1, "Embedded view called removeViewImmediate while detached from presentation"

    invoke-static {v0, v1}, Lio/flutter/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 57
    return-void

    .line 59
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->clearAnimation()V

    .line 60
    iget-object v0, p0, Lio/flutter/plugin/platform/SingleViewWindowManager;->fakeWindowRootView:Lio/flutter/plugin/platform/SingleViewFakeWindowViewGroup;

    invoke-virtual {v0, p1}, Lio/flutter/plugin/platform/SingleViewFakeWindowViewGroup;->removeView(Landroid/view/View;)V

    .line 61
    return-void
.end method

.method public updateViewLayout(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
    .locals 2
    .param p1, "view"    # Landroid/view/View;
    .param p2, "params"    # Landroid/view/ViewGroup$LayoutParams;

    .line 74
    iget-object v0, p0, Lio/flutter/plugin/platform/SingleViewWindowManager;->fakeWindowRootView:Lio/flutter/plugin/platform/SingleViewFakeWindowViewGroup;

    if-nez v0, :cond_0

    .line 75
    const-string v0, "PlatformViewsController"

    const-string v1, "Embedded view called updateViewLayout while detached from presentation"

    invoke-static {v0, v1}, Lio/flutter/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 76
    return-void

    .line 78
    :cond_0
    invoke-virtual {v0, p1, p2}, Lio/flutter/plugin/platform/SingleViewFakeWindowViewGroup;->updateViewLayout(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 79
    return-void
.end method
