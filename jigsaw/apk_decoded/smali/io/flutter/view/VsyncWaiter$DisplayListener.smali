.class Lio/flutter/view/VsyncWaiter$DisplayListener;
.super Ljava/lang/Object;
.source "VsyncWaiter.java"

# interfaces
.implements Landroid/hardware/display/DisplayManager$DisplayListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/view/VsyncWaiter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "DisplayListener"
.end annotation


# instance fields
.field private displayManager:Landroid/hardware/display/DisplayManager;

.field final synthetic this$0:Lio/flutter/view/VsyncWaiter;


# direct methods
.method constructor <init>(Lio/flutter/view/VsyncWaiter;Landroid/hardware/display/DisplayManager;)V
    .locals 0
    .param p1, "this$0"    # Lio/flutter/view/VsyncWaiter;
    .param p2, "displayManager"    # Landroid/hardware/display/DisplayManager;

    .line 17
    iput-object p1, p0, Lio/flutter/view/VsyncWaiter$DisplayListener;->this$0:Lio/flutter/view/VsyncWaiter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    iput-object p2, p0, Lio/flutter/view/VsyncWaiter$DisplayListener;->displayManager:Landroid/hardware/display/DisplayManager;

    .line 19
    return-void
.end method


# virtual methods
.method public onDisplayAdded(I)V
    .locals 0
    .param p1, "displayId"    # I

    .line 28
    return-void
.end method

.method public onDisplayChanged(I)V
    .locals 7
    .param p1, "displayId"    # I

    .line 35
    if-nez p1, :cond_0

    .line 36
    iget-object v0, p0, Lio/flutter/view/VsyncWaiter$DisplayListener;->displayManager:Landroid/hardware/display/DisplayManager;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/hardware/display/DisplayManager;->getDisplay(I)Landroid/view/Display;

    move-result-object v0

    .line 37
    .local v0, "primaryDisplay":Landroid/view/Display;
    invoke-virtual {v0}, Landroid/view/Display;->getRefreshRate()F

    move-result v1

    .line 38
    .local v1, "fps":F
    iget-object v2, p0, Lio/flutter/view/VsyncWaiter$DisplayListener;->this$0:Lio/flutter/view/VsyncWaiter;

    const-wide v3, 0x41cdcd6500000000L    # 1.0E9

    float-to-double v5, v1

    div-double/2addr v3, v5

    double-to-long v3, v3

    invoke-static {v2, v3, v4}, Lio/flutter/view/VsyncWaiter;->access$002(Lio/flutter/view/VsyncWaiter;J)J

    .line 39
    iget-object v2, p0, Lio/flutter/view/VsyncWaiter$DisplayListener;->this$0:Lio/flutter/view/VsyncWaiter;

    invoke-static {v2}, Lio/flutter/view/VsyncWaiter;->access$100(Lio/flutter/view/VsyncWaiter;)Lio/flutter/embedding/engine/FlutterJNI;

    move-result-object v2

    invoke-virtual {v2, v1}, Lio/flutter/embedding/engine/FlutterJNI;->setRefreshRateFPS(F)V

    .line 41
    .end local v0    # "primaryDisplay":Landroid/view/Display;
    .end local v1    # "fps":F
    :cond_0
    return-void
.end method

.method public onDisplayRemoved(I)V
    .locals 0
    .param p1, "displayId"    # I

    .line 31
    return-void
.end method

.method register()V
    .locals 2

    .line 24
    iget-object v0, p0, Lio/flutter/view/VsyncWaiter$DisplayListener;->displayManager:Landroid/hardware/display/DisplayManager;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Landroid/hardware/display/DisplayManager;->registerDisplayListener(Landroid/hardware/display/DisplayManager$DisplayListener;Landroid/os/Handler;)V

    .line 25
    return-void
.end method
