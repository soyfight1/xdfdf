.class public Lio/flutter/view/VsyncWaiter;
.super Ljava/lang/Object;
.source "VsyncWaiter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/flutter/view/VsyncWaiter$FrameCallback;,
        Lio/flutter/view/VsyncWaiter$DisplayListener;
    }
.end annotation


# static fields
.field private static instance:Lio/flutter/view/VsyncWaiter;

.field private static listener:Lio/flutter/view/VsyncWaiter$DisplayListener;


# instance fields
.field private final asyncWaitForVsyncDelegate:Lio/flutter/embedding/engine/FlutterJNI$AsyncWaitForVsyncDelegate;

.field private flutterJNI:Lio/flutter/embedding/engine/FlutterJNI;

.field private frameCallback:Lio/flutter/view/VsyncWaiter$FrameCallback;

.field private refreshPeriodNanos:J


# direct methods
.method private constructor <init>(Lio/flutter/embedding/engine/FlutterJNI;)V
    .locals 3
    .param p1, "flutterJNI"    # Lio/flutter/embedding/engine/FlutterJNI;

    .line 124
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 46
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lio/flutter/view/VsyncWaiter;->refreshPeriodNanos:J

    .line 48
    new-instance v0, Lio/flutter/view/VsyncWaiter$FrameCallback;

    const-wide/16 v1, 0x0

    invoke-direct {v0, p0, v1, v2}, Lio/flutter/view/VsyncWaiter$FrameCallback;-><init>(Lio/flutter/view/VsyncWaiter;J)V

    iput-object v0, p0, Lio/flutter/view/VsyncWaiter;->frameCallback:Lio/flutter/view/VsyncWaiter$FrameCallback;

    .line 105
    new-instance v0, Lio/flutter/view/VsyncWaiter$1;

    invoke-direct {v0, p0}, Lio/flutter/view/VsyncWaiter$1;-><init>(Lio/flutter/view/VsyncWaiter;)V

    iput-object v0, p0, Lio/flutter/view/VsyncWaiter;->asyncWaitForVsyncDelegate:Lio/flutter/embedding/engine/FlutterJNI$AsyncWaitForVsyncDelegate;

    .line 125
    iput-object p1, p0, Lio/flutter/view/VsyncWaiter;->flutterJNI:Lio/flutter/embedding/engine/FlutterJNI;

    .line 126
    return-void
.end method

.method static synthetic access$000(Lio/flutter/view/VsyncWaiter;)J
    .locals 2
    .param p0, "x0"    # Lio/flutter/view/VsyncWaiter;

    .line 15
    iget-wide v0, p0, Lio/flutter/view/VsyncWaiter;->refreshPeriodNanos:J

    return-wide v0
.end method

.method static synthetic access$002(Lio/flutter/view/VsyncWaiter;J)J
    .locals 0
    .param p0, "x0"    # Lio/flutter/view/VsyncWaiter;
    .param p1, "x1"    # J

    .line 15
    iput-wide p1, p0, Lio/flutter/view/VsyncWaiter;->refreshPeriodNanos:J

    return-wide p1
.end method

.method static synthetic access$100(Lio/flutter/view/VsyncWaiter;)Lio/flutter/embedding/engine/FlutterJNI;
    .locals 1
    .param p0, "x0"    # Lio/flutter/view/VsyncWaiter;

    .line 15
    iget-object v0, p0, Lio/flutter/view/VsyncWaiter;->flutterJNI:Lio/flutter/embedding/engine/FlutterJNI;

    return-object v0
.end method

.method static synthetic access$200(Lio/flutter/view/VsyncWaiter;)Lio/flutter/view/VsyncWaiter$FrameCallback;
    .locals 1
    .param p0, "x0"    # Lio/flutter/view/VsyncWaiter;

    .line 15
    iget-object v0, p0, Lio/flutter/view/VsyncWaiter;->frameCallback:Lio/flutter/view/VsyncWaiter$FrameCallback;

    return-object v0
.end method

.method static synthetic access$202(Lio/flutter/view/VsyncWaiter;Lio/flutter/view/VsyncWaiter$FrameCallback;)Lio/flutter/view/VsyncWaiter$FrameCallback;
    .locals 0
    .param p0, "x0"    # Lio/flutter/view/VsyncWaiter;
    .param p1, "x1"    # Lio/flutter/view/VsyncWaiter$FrameCallback;

    .line 15
    iput-object p1, p0, Lio/flutter/view/VsyncWaiter;->frameCallback:Lio/flutter/view/VsyncWaiter$FrameCallback;

    return-object p1
.end method

.method public static getInstance(FLio/flutter/embedding/engine/FlutterJNI;)Lio/flutter/view/VsyncWaiter;
    .locals 5
    .param p0, "fps"    # F
    .param p1, "flutterJNI"    # Lio/flutter/embedding/engine/FlutterJNI;

    .line 52
    sget-object v0, Lio/flutter/view/VsyncWaiter;->instance:Lio/flutter/view/VsyncWaiter;

    if-nez v0, :cond_0

    .line 53
    new-instance v0, Lio/flutter/view/VsyncWaiter;

    invoke-direct {v0, p1}, Lio/flutter/view/VsyncWaiter;-><init>(Lio/flutter/embedding/engine/FlutterJNI;)V

    sput-object v0, Lio/flutter/view/VsyncWaiter;->instance:Lio/flutter/view/VsyncWaiter;

    .line 55
    :cond_0
    invoke-virtual {p1, p0}, Lio/flutter/embedding/engine/FlutterJNI;->setRefreshRateFPS(F)V

    .line 56
    sget-object v0, Lio/flutter/view/VsyncWaiter;->instance:Lio/flutter/view/VsyncWaiter;

    const-wide v1, 0x41cdcd6500000000L    # 1.0E9

    float-to-double v3, p0

    div-double/2addr v1, v3

    double-to-long v1, v1

    iput-wide v1, v0, Lio/flutter/view/VsyncWaiter;->refreshPeriodNanos:J

    .line 57
    return-object v0
.end method

.method public static getInstance(Landroid/hardware/display/DisplayManager;Lio/flutter/embedding/engine/FlutterJNI;)Lio/flutter/view/VsyncWaiter;
    .locals 7
    .param p0, "displayManager"    # Landroid/hardware/display/DisplayManager;
    .param p1, "flutterJNI"    # Lio/flutter/embedding/engine/FlutterJNI;

    .line 63
    sget-object v0, Lio/flutter/view/VsyncWaiter;->instance:Lio/flutter/view/VsyncWaiter;

    if-nez v0, :cond_0

    .line 64
    new-instance v0, Lio/flutter/view/VsyncWaiter;

    invoke-direct {v0, p1}, Lio/flutter/view/VsyncWaiter;-><init>(Lio/flutter/embedding/engine/FlutterJNI;)V

    sput-object v0, Lio/flutter/view/VsyncWaiter;->instance:Lio/flutter/view/VsyncWaiter;

    .line 66
    :cond_0
    sget-object v0, Lio/flutter/view/VsyncWaiter;->listener:Lio/flutter/view/VsyncWaiter$DisplayListener;

    if-nez v0, :cond_1

    .line 67
    new-instance v0, Lio/flutter/view/VsyncWaiter$DisplayListener;

    sget-object v1, Lio/flutter/view/VsyncWaiter;->instance:Lio/flutter/view/VsyncWaiter;

    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-direct {v0, v1, p0}, Lio/flutter/view/VsyncWaiter$DisplayListener;-><init>(Lio/flutter/view/VsyncWaiter;Landroid/hardware/display/DisplayManager;)V

    sput-object v0, Lio/flutter/view/VsyncWaiter;->listener:Lio/flutter/view/VsyncWaiter$DisplayListener;

    .line 68
    invoke-virtual {v0}, Lio/flutter/view/VsyncWaiter$DisplayListener;->register()V

    .line 70
    :cond_1
    sget-object v0, Lio/flutter/view/VsyncWaiter;->instance:Lio/flutter/view/VsyncWaiter;

    iget-wide v0, v0, Lio/flutter/view/VsyncWaiter;->refreshPeriodNanos:J

    const-wide/16 v2, -0x1

    cmp-long v4, v0, v2

    if-nez v4, :cond_2

    .line 71
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/hardware/display/DisplayManager;->getDisplay(I)Landroid/view/Display;

    move-result-object v0

    .line 72
    .local v0, "primaryDisplay":Landroid/view/Display;
    invoke-virtual {v0}, Landroid/view/Display;->getRefreshRate()F

    move-result v1

    .line 73
    .local v1, "fps":F
    sget-object v2, Lio/flutter/view/VsyncWaiter;->instance:Lio/flutter/view/VsyncWaiter;

    const-wide v3, 0x41cdcd6500000000L    # 1.0E9

    float-to-double v5, v1

    div-double/2addr v3, v5

    double-to-long v3, v3

    iput-wide v3, v2, Lio/flutter/view/VsyncWaiter;->refreshPeriodNanos:J

    .line 74
    invoke-virtual {p1, v1}, Lio/flutter/embedding/engine/FlutterJNI;->setRefreshRateFPS(F)V

    .line 76
    .end local v0    # "primaryDisplay":Landroid/view/Display;
    .end local v1    # "fps":F
    :cond_2
    sget-object v0, Lio/flutter/view/VsyncWaiter;->instance:Lio/flutter/view/VsyncWaiter;

    return-object v0
.end method

.method public static reset()V
    .locals 1

    .line 82
    const/4 v0, 0x0

    sput-object v0, Lio/flutter/view/VsyncWaiter;->instance:Lio/flutter/view/VsyncWaiter;

    .line 83
    sput-object v0, Lio/flutter/view/VsyncWaiter;->listener:Lio/flutter/view/VsyncWaiter$DisplayListener;

    .line 84
    return-void
.end method


# virtual methods
.method public init()V
    .locals 2

    .line 129
    iget-object v0, p0, Lio/flutter/view/VsyncWaiter;->flutterJNI:Lio/flutter/embedding/engine/FlutterJNI;

    iget-object v1, p0, Lio/flutter/view/VsyncWaiter;->asyncWaitForVsyncDelegate:Lio/flutter/embedding/engine/FlutterJNI$AsyncWaitForVsyncDelegate;

    invoke-virtual {v0, v1}, Lio/flutter/embedding/engine/FlutterJNI;->setAsyncWaitForVsyncDelegate(Lio/flutter/embedding/engine/FlutterJNI$AsyncWaitForVsyncDelegate;)V

    .line 130
    return-void
.end method
