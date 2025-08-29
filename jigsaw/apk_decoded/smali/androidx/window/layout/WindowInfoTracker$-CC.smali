.class public final synthetic Landroidx/window/layout/WindowInfoTracker$-CC;
.super Ljava/lang/Object;
.source "WindowInfoTracker.kt"


# direct methods
.method public static $default$windowLayoutInfo(Landroidx/window/layout/WindowInfoTracker;Landroid/content/Context;)Lkotlinx/coroutines/flow/Flow;
    .locals 3
    .param p0, "_this"    # Landroidx/window/layout/WindowInfoTracker;
    .param p1, "context"    # Landroid/content/Context;

    .line 0
    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 70
    nop

    .line 69
    instance-of v0, p1, Landroid/app/Activity;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    move-object v0, p1

    check-cast v0, Landroid/app/Activity;

    goto :goto_0

    :cond_0
    move-object v0, v1

    .line 70
    :goto_0
    if-eqz v0, :cond_1

    .line 69
    nop

    .line 70
    nop

    .line 169
    .local v0, "activity":Landroid/app/Activity;
    const/4 v1, 0x0

    .line 70
    .local v1, "$i$a$-let-WindowInfoTracker$windowLayoutInfo$windowLayoutInfoFlow$1":I
    invoke-interface {p0, v0}, Landroidx/window/layout/WindowInfoTracker;->windowLayoutInfo(Landroid/app/Activity;)Lkotlinx/coroutines/flow/Flow;

    move-result-object v1

    .line 69
    .end local v0    # "activity":Landroid/app/Activity;
    .end local v1    # "$i$a$-let-WindowInfoTracker$windowLayoutInfo$windowLayoutInfoFlow$1":I
    :cond_1
    move-object v0, v1

    .line 71
    .local v0, "windowLayoutInfoFlow":Lkotlinx/coroutines/flow/Flow;
    if-eqz v0, :cond_2

    return-object v0

    .line 72
    :cond_2
    new-instance v1, Lkotlin/NotImplementedError;

    .line 73
    nop

    .line 72
    const-string v2, "Must override windowLayoutInfo(context) and provide an implementation."

    invoke-direct {v1, v2}, Lkotlin/NotImplementedError;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method static constructor <clinit>()V
    .locals 1

    sget-object v0, Landroidx/window/layout/WindowInfoTracker;->Companion:Landroidx/window/layout/WindowInfoTracker$Companion;

    return-void
.end method

.method public static getOrCreate(Landroid/content/Context;)Landroidx/window/layout/WindowInfoTracker;
    .locals 1
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 0
    sget-object v0, Landroidx/window/layout/WindowInfoTracker;->Companion:Landroidx/window/layout/WindowInfoTracker$Companion;

    invoke-virtual {v0, p0}, Landroidx/window/layout/WindowInfoTracker$Companion;->getOrCreate(Landroid/content/Context;)Landroidx/window/layout/WindowInfoTracker;

    move-result-object v0

    return-object v0
.end method

.method public static overrideDecorator(Landroidx/window/layout/WindowInfoTrackerDecorator;)V
    .locals 1
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 0
    sget-object v0, Landroidx/window/layout/WindowInfoTracker;->Companion:Landroidx/window/layout/WindowInfoTracker$Companion;

    invoke-virtual {v0, p0}, Landroidx/window/layout/WindowInfoTracker$Companion;->overrideDecorator(Landroidx/window/layout/WindowInfoTrackerDecorator;)V

    return-void
.end method

.method public static reset()V
    .locals 1
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 0
    sget-object v0, Landroidx/window/layout/WindowInfoTracker;->Companion:Landroidx/window/layout/WindowInfoTracker$Companion;

    invoke-virtual {v0}, Landroidx/window/layout/WindowInfoTracker$Companion;->reset()V

    return-void
.end method
