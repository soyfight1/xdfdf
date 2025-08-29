.class Lio/flutter/view/VsyncWaiter$FrameCallback;
.super Ljava/lang/Object;
.source "VsyncWaiter.java"

# interfaces
.implements Landroid/view/Choreographer$FrameCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/view/VsyncWaiter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "FrameCallback"
.end annotation


# instance fields
.field private cookie:J

.field final synthetic this$0:Lio/flutter/view/VsyncWaiter;


# direct methods
.method constructor <init>(Lio/flutter/view/VsyncWaiter;J)V
    .locals 0
    .param p2, "cookie"    # J

    .line 90
    iput-object p1, p0, Lio/flutter/view/VsyncWaiter$FrameCallback;->this$0:Lio/flutter/view/VsyncWaiter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 91
    iput-wide p2, p0, Lio/flutter/view/VsyncWaiter$FrameCallback;->cookie:J

    .line 92
    return-void
.end method

.method static synthetic access$302(Lio/flutter/view/VsyncWaiter$FrameCallback;J)J
    .locals 0
    .param p0, "x0"    # Lio/flutter/view/VsyncWaiter$FrameCallback;
    .param p1, "x1"    # J

    .line 86
    iput-wide p1, p0, Lio/flutter/view/VsyncWaiter$FrameCallback;->cookie:J

    return-wide p1
.end method


# virtual methods
.method public doFrame(J)V
    .locals 9
    .param p1, "frameTimeNanos"    # J

    .line 96
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v0

    sub-long/2addr v0, p1

    .line 97
    .local v0, "delay":J
    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-gez v4, :cond_0

    .line 98
    const-wide/16 v0, 0x0

    .line 100
    :cond_0
    iget-object v2, p0, Lio/flutter/view/VsyncWaiter$FrameCallback;->this$0:Lio/flutter/view/VsyncWaiter;

    invoke-static {v2}, Lio/flutter/view/VsyncWaiter;->access$100(Lio/flutter/view/VsyncWaiter;)Lio/flutter/embedding/engine/FlutterJNI;

    move-result-object v2

    iget-object v3, p0, Lio/flutter/view/VsyncWaiter$FrameCallback;->this$0:Lio/flutter/view/VsyncWaiter;

    invoke-static {v3}, Lio/flutter/view/VsyncWaiter;->access$000(Lio/flutter/view/VsyncWaiter;)J

    move-result-wide v5

    iget-wide v7, p0, Lio/flutter/view/VsyncWaiter$FrameCallback;->cookie:J

    move-wide v3, v0

    invoke-virtual/range {v2 .. v8}, Lio/flutter/embedding/engine/FlutterJNI;->onVsync(JJJ)V

    .line 101
    iget-object v2, p0, Lio/flutter/view/VsyncWaiter$FrameCallback;->this$0:Lio/flutter/view/VsyncWaiter;

    invoke-static {v2, p0}, Lio/flutter/view/VsyncWaiter;->access$202(Lio/flutter/view/VsyncWaiter;Lio/flutter/view/VsyncWaiter$FrameCallback;)Lio/flutter/view/VsyncWaiter$FrameCallback;

    .line 102
    return-void
.end method
