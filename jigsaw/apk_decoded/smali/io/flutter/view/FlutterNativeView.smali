.class public Lio/flutter/view/FlutterNativeView;
.super Ljava/lang/Object;
.source "FlutterNativeView.java"

# interfaces
.implements Lio/flutter/plugin/common/BinaryMessenger;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/flutter/view/FlutterNativeView$EngineLifecycleListenerImpl;
    }
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "FlutterNativeView"


# instance fields
.field private applicationIsRunning:Z

.field private final dartExecutor:Lio/flutter/embedding/engine/dart/DartExecutor;

.field private final flutterUiDisplayListener:Lio/flutter/embedding/engine/renderer/FlutterUiDisplayListener;

.field private final mContext:Landroid/content/Context;

.field private final mFlutterJNI:Lio/flutter/embedding/engine/FlutterJNI;

.field private mFlutterView:Lio/flutter/view/FlutterView;

.field private final mPluginRegistry:Lio/flutter/app/FlutterPluginRegistry;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .line 52
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lio/flutter/view/FlutterNativeView;-><init>(Landroid/content/Context;Z)V

    .line 53
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Z)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "isBackgroundView"    # Z

    .line 55
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    new-instance v0, Lio/flutter/view/FlutterNativeView$1;

    invoke-direct {v0, p0}, Lio/flutter/view/FlutterNativeView$1;-><init>(Lio/flutter/view/FlutterNativeView;)V

    iput-object v0, p0, Lio/flutter/view/FlutterNativeView;->flutterUiDisplayListener:Lio/flutter/embedding/engine/renderer/FlutterUiDisplayListener;

    .line 56
    if-eqz p2, :cond_0

    .line 57
    const-string v1, "FlutterNativeView"

    const-string v2, "\'isBackgroundView\' is no longer supported and will be ignored"

    invoke-static {v1, v2}, Lio/flutter/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 59
    :cond_0
    iput-object p1, p0, Lio/flutter/view/FlutterNativeView;->mContext:Landroid/content/Context;

    .line 60
    new-instance v1, Lio/flutter/app/FlutterPluginRegistry;

    invoke-direct {v1, p0, p1}, Lio/flutter/app/FlutterPluginRegistry;-><init>(Lio/flutter/view/FlutterNativeView;Landroid/content/Context;)V

    iput-object v1, p0, Lio/flutter/view/FlutterNativeView;->mPluginRegistry:Lio/flutter/app/FlutterPluginRegistry;

    .line 61
    new-instance v1, Lio/flutter/embedding/engine/FlutterJNI;

    invoke-direct {v1}, Lio/flutter/embedding/engine/FlutterJNI;-><init>()V

    iput-object v1, p0, Lio/flutter/view/FlutterNativeView;->mFlutterJNI:Lio/flutter/embedding/engine/FlutterJNI;

    .line 62
    invoke-virtual {v1, v0}, Lio/flutter/embedding/engine/FlutterJNI;->addIsDisplayingFlutterUiListener(Lio/flutter/embedding/engine/renderer/FlutterUiDisplayListener;)V

    .line 63
    new-instance v0, Lio/flutter/embedding/engine/dart/DartExecutor;

    invoke-virtual {p1}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lio/flutter/embedding/engine/dart/DartExecutor;-><init>(Lio/flutter/embedding/engine/FlutterJNI;Landroid/content/res/AssetManager;)V

    iput-object v0, p0, Lio/flutter/view/FlutterNativeView;->dartExecutor:Lio/flutter/embedding/engine/dart/DartExecutor;

    .line 64
    new-instance v0, Lio/flutter/view/FlutterNativeView$EngineLifecycleListenerImpl;

    const/4 v2, 0x0

    invoke-direct {v0, p0, v2}, Lio/flutter/view/FlutterNativeView$EngineLifecycleListenerImpl;-><init>(Lio/flutter/view/FlutterNativeView;Lio/flutter/view/FlutterNativeView$1;)V

    invoke-virtual {v1, v0}, Lio/flutter/embedding/engine/FlutterJNI;->addEngineLifecycleListener(Lio/flutter/embedding/engine/FlutterEngine$EngineLifecycleListener;)V

    .line 65
    invoke-direct {p0, p0}, Lio/flutter/view/FlutterNativeView;->attach(Lio/flutter/view/FlutterNativeView;)V

    .line 66
    invoke-virtual {p0}, Lio/flutter/view/FlutterNativeView;->assertAttached()V

    .line 67
    return-void
.end method

.method static synthetic access$000(Lio/flutter/view/FlutterNativeView;)Lio/flutter/view/FlutterView;
    .locals 1
    .param p0, "x0"    # Lio/flutter/view/FlutterNativeView;

    .line 25
    iget-object v0, p0, Lio/flutter/view/FlutterNativeView;->mFlutterView:Lio/flutter/view/FlutterView;

    return-object v0
.end method

.method static synthetic access$200(Lio/flutter/view/FlutterNativeView;)Lio/flutter/app/FlutterPluginRegistry;
    .locals 1
    .param p0, "x0"    # Lio/flutter/view/FlutterNativeView;

    .line 25
    iget-object v0, p0, Lio/flutter/view/FlutterNativeView;->mPluginRegistry:Lio/flutter/app/FlutterPluginRegistry;

    return-object v0
.end method

.method private attach(Lio/flutter/view/FlutterNativeView;)V
    .locals 1
    .param p1, "view"    # Lio/flutter/view/FlutterNativeView;

    .line 182
    iget-object v0, p0, Lio/flutter/view/FlutterNativeView;->mFlutterJNI:Lio/flutter/embedding/engine/FlutterJNI;

    invoke-virtual {v0}, Lio/flutter/embedding/engine/FlutterJNI;->attachToNative()V

    .line 183
    iget-object v0, p0, Lio/flutter/view/FlutterNativeView;->dartExecutor:Lio/flutter/embedding/engine/dart/DartExecutor;

    invoke-virtual {v0}, Lio/flutter/embedding/engine/dart/DartExecutor;->onAttachedToJNI()V

    .line 184
    return-void
.end method

.method public static getObservatoryUri()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 129
    invoke-static {}, Lio/flutter/embedding/engine/FlutterJNI;->getVMServiceUri()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getVMServiceUri()Ljava/lang/String;
    .locals 1

    .line 133
    invoke-static {}, Lio/flutter/embedding/engine/FlutterJNI;->getVMServiceUri()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public assertAttached()V
    .locals 2

    .line 103
    invoke-virtual {p0}, Lio/flutter/view/FlutterNativeView;->isAttached()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 104
    return-void

    .line 103
    :cond_0
    new-instance v0, Ljava/lang/AssertionError;

    const-string v1, "Platform view is not attached"

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0
.end method

.method public attachViewAndActivity(Lio/flutter/view/FlutterView;Landroid/app/Activity;)V
    .locals 1
    .param p1, "flutterView"    # Lio/flutter/view/FlutterView;
    .param p2, "activity"    # Landroid/app/Activity;

    .line 94
    iput-object p1, p0, Lio/flutter/view/FlutterNativeView;->mFlutterView:Lio/flutter/view/FlutterView;

    .line 95
    iget-object v0, p0, Lio/flutter/view/FlutterNativeView;->mPluginRegistry:Lio/flutter/app/FlutterPluginRegistry;

    invoke-virtual {v0, p1, p2}, Lio/flutter/app/FlutterPluginRegistry;->attach(Lio/flutter/view/FlutterView;Landroid/app/Activity;)V

    .line 96
    return-void
.end method

.method public destroy()V
    .locals 2

    .line 75
    iget-object v0, p0, Lio/flutter/view/FlutterNativeView;->mPluginRegistry:Lio/flutter/app/FlutterPluginRegistry;

    invoke-virtual {v0}, Lio/flutter/app/FlutterPluginRegistry;->destroy()V

    .line 76
    iget-object v0, p0, Lio/flutter/view/FlutterNativeView;->dartExecutor:Lio/flutter/embedding/engine/dart/DartExecutor;

    invoke-virtual {v0}, Lio/flutter/embedding/engine/dart/DartExecutor;->onDetachedFromJNI()V

    .line 77
    const/4 v0, 0x0

    iput-object v0, p0, Lio/flutter/view/FlutterNativeView;->mFlutterView:Lio/flutter/view/FlutterView;

    .line 78
    iget-object v0, p0, Lio/flutter/view/FlutterNativeView;->mFlutterJNI:Lio/flutter/embedding/engine/FlutterJNI;

    iget-object v1, p0, Lio/flutter/view/FlutterNativeView;->flutterUiDisplayListener:Lio/flutter/embedding/engine/renderer/FlutterUiDisplayListener;

    invoke-virtual {v0, v1}, Lio/flutter/embedding/engine/FlutterJNI;->removeIsDisplayingFlutterUiListener(Lio/flutter/embedding/engine/renderer/FlutterUiDisplayListener;)V

    .line 79
    iget-object v0, p0, Lio/flutter/view/FlutterNativeView;->mFlutterJNI:Lio/flutter/embedding/engine/FlutterJNI;

    invoke-virtual {v0}, Lio/flutter/embedding/engine/FlutterJNI;->detachFromNativeAndReleaseResources()V

    .line 80
    const/4 v0, 0x0

    iput-boolean v0, p0, Lio/flutter/view/FlutterNativeView;->applicationIsRunning:Z

    .line 81
    return-void
.end method

.method public detachFromFlutterView()V
    .locals 1

    .line 70
    iget-object v0, p0, Lio/flutter/view/FlutterNativeView;->mPluginRegistry:Lio/flutter/app/FlutterPluginRegistry;

    invoke-virtual {v0}, Lio/flutter/app/FlutterPluginRegistry;->detach()V

    .line 71
    const/4 v0, 0x0

    iput-object v0, p0, Lio/flutter/view/FlutterNativeView;->mFlutterView:Lio/flutter/view/FlutterView;

    .line 72
    return-void
.end method

.method public disableBufferingIncomingMessages()V
    .locals 0

    .line 175
    return-void
.end method

.method public enableBufferingIncomingMessages()V
    .locals 0

    .line 172
    return-void
.end method

.method public getDartExecutor()Lio/flutter/embedding/engine/dart/DartExecutor;
    .locals 1

    .line 85
    iget-object v0, p0, Lio/flutter/view/FlutterNativeView;->dartExecutor:Lio/flutter/embedding/engine/dart/DartExecutor;

    return-object v0
.end method

.method getFlutterJNI()Lio/flutter/embedding/engine/FlutterJNI;
    .locals 1

    .line 178
    iget-object v0, p0, Lio/flutter/view/FlutterNativeView;->mFlutterJNI:Lio/flutter/embedding/engine/FlutterJNI;

    return-object v0
.end method

.method public getPluginRegistry()Lio/flutter/app/FlutterPluginRegistry;
    .locals 1

    .line 90
    iget-object v0, p0, Lio/flutter/view/FlutterNativeView;->mPluginRegistry:Lio/flutter/app/FlutterPluginRegistry;

    return-object v0
.end method

.method public isApplicationRunning()Z
    .locals 1

    .line 124
    iget-boolean v0, p0, Lio/flutter/view/FlutterNativeView;->applicationIsRunning:Z

    return v0
.end method

.method public isAttached()Z
    .locals 1

    .line 99
    iget-object v0, p0, Lio/flutter/view/FlutterNativeView;->mFlutterJNI:Lio/flutter/embedding/engine/FlutterJNI;

    invoke-virtual {v0}, Lio/flutter/embedding/engine/FlutterJNI;->isAttached()Z

    move-result v0

    return v0
.end method

.method public synthetic makeBackgroundTaskQueue()Lio/flutter/plugin/common/BinaryMessenger$TaskQueue;
    .locals 1

    invoke-static {p0}, Lio/flutter/plugin/common/BinaryMessenger$-CC;->$default$makeBackgroundTaskQueue(Lio/flutter/plugin/common/BinaryMessenger;)Lio/flutter/plugin/common/BinaryMessenger$TaskQueue;

    move-result-object v0

    return-object v0
.end method

.method public makeBackgroundTaskQueue(Lio/flutter/plugin/common/BinaryMessenger$TaskQueueOptions;)Lio/flutter/plugin/common/BinaryMessenger$TaskQueue;
    .locals 1
    .param p1, "options"    # Lio/flutter/plugin/common/BinaryMessenger$TaskQueueOptions;

    .line 139
    iget-object v0, p0, Lio/flutter/view/FlutterNativeView;->dartExecutor:Lio/flutter/embedding/engine/dart/DartExecutor;

    invoke-virtual {v0}, Lio/flutter/embedding/engine/dart/DartExecutor;->getBinaryMessenger()Lio/flutter/plugin/common/BinaryMessenger;

    move-result-object v0

    invoke-interface {v0, p1}, Lio/flutter/plugin/common/BinaryMessenger;->makeBackgroundTaskQueue(Lio/flutter/plugin/common/BinaryMessenger$TaskQueueOptions;)Lio/flutter/plugin/common/BinaryMessenger$TaskQueue;

    move-result-object v0

    return-object v0
.end method

.method public runFromBundle(Lio/flutter/view/FlutterRunArguments;)V
    .locals 7
    .param p1, "args"    # Lio/flutter/view/FlutterRunArguments;

    .line 107
    iget-object v0, p1, Lio/flutter/view/FlutterRunArguments;->entrypoint:Ljava/lang/String;

    if-eqz v0, :cond_1

    .line 110
    invoke-virtual {p0}, Lio/flutter/view/FlutterNativeView;->assertAttached()V

    .line 111
    iget-boolean v0, p0, Lio/flutter/view/FlutterNativeView;->applicationIsRunning:Z

    if-nez v0, :cond_0

    .line 113
    iget-object v1, p0, Lio/flutter/view/FlutterNativeView;->mFlutterJNI:Lio/flutter/embedding/engine/FlutterJNI;

    iget-object v2, p1, Lio/flutter/view/FlutterRunArguments;->bundlePath:Ljava/lang/String;

    iget-object v3, p1, Lio/flutter/view/FlutterRunArguments;->entrypoint:Ljava/lang/String;

    iget-object v4, p1, Lio/flutter/view/FlutterRunArguments;->libraryPath:Ljava/lang/String;

    iget-object v0, p0, Lio/flutter/view/FlutterNativeView;->mContext:Landroid/content/Context;

    .line 117
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v5

    const/4 v6, 0x0

    .line 113
    invoke-virtual/range {v1 .. v6}, Lio/flutter/embedding/engine/FlutterJNI;->runBundleAndSnapshotFromLibrary(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/content/res/AssetManager;Ljava/util/List;)V

    .line 120
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/flutter/view/FlutterNativeView;->applicationIsRunning:Z

    .line 121
    return-void

    .line 112
    :cond_0
    new-instance v0, Ljava/lang/AssertionError;

    const-string v1, "This Flutter engine instance is already running an application"

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0

    .line 108
    :cond_1
    new-instance v0, Ljava/lang/AssertionError;

    const-string v1, "An entrypoint must be specified"

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0
.end method

.method public send(Ljava/lang/String;Ljava/nio/ByteBuffer;)V
    .locals 1
    .param p1, "channel"    # Ljava/lang/String;
    .param p2, "message"    # Ljava/nio/ByteBuffer;

    .line 145
    iget-object v0, p0, Lio/flutter/view/FlutterNativeView;->dartExecutor:Lio/flutter/embedding/engine/dart/DartExecutor;

    invoke-virtual {v0}, Lio/flutter/embedding/engine/dart/DartExecutor;->getBinaryMessenger()Lio/flutter/plugin/common/BinaryMessenger;

    move-result-object v0

    invoke-interface {v0, p1, p2}, Lio/flutter/plugin/common/BinaryMessenger;->send(Ljava/lang/String;Ljava/nio/ByteBuffer;)V

    .line 146
    return-void
.end method

.method public send(Ljava/lang/String;Ljava/nio/ByteBuffer;Lio/flutter/plugin/common/BinaryMessenger$BinaryReply;)V
    .locals 2
    .param p1, "channel"    # Ljava/lang/String;
    .param p2, "message"    # Ljava/nio/ByteBuffer;
    .param p3, "callback"    # Lio/flutter/plugin/common/BinaryMessenger$BinaryReply;

    .line 151
    invoke-virtual {p0}, Lio/flutter/view/FlutterNativeView;->isAttached()Z

    move-result v0

    if-nez v0, :cond_0

    .line 152
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "FlutterView.send called on a detached view, channel="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "FlutterNativeView"

    invoke-static {v1, v0}, Lio/flutter/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 153
    return-void

    .line 156
    :cond_0
    iget-object v0, p0, Lio/flutter/view/FlutterNativeView;->dartExecutor:Lio/flutter/embedding/engine/dart/DartExecutor;

    invoke-virtual {v0}, Lio/flutter/embedding/engine/dart/DartExecutor;->getBinaryMessenger()Lio/flutter/plugin/common/BinaryMessenger;

    move-result-object v0

    invoke-interface {v0, p1, p2, p3}, Lio/flutter/plugin/common/BinaryMessenger;->send(Ljava/lang/String;Ljava/nio/ByteBuffer;Lio/flutter/plugin/common/BinaryMessenger$BinaryReply;)V

    .line 157
    return-void
.end method

.method public setMessageHandler(Ljava/lang/String;Lio/flutter/plugin/common/BinaryMessenger$BinaryMessageHandler;)V
    .locals 1
    .param p1, "channel"    # Ljava/lang/String;
    .param p2, "handler"    # Lio/flutter/plugin/common/BinaryMessenger$BinaryMessageHandler;

    .line 162
    iget-object v0, p0, Lio/flutter/view/FlutterNativeView;->dartExecutor:Lio/flutter/embedding/engine/dart/DartExecutor;

    invoke-virtual {v0}, Lio/flutter/embedding/engine/dart/DartExecutor;->getBinaryMessenger()Lio/flutter/plugin/common/BinaryMessenger;

    move-result-object v0

    invoke-interface {v0, p1, p2}, Lio/flutter/plugin/common/BinaryMessenger;->setMessageHandler(Ljava/lang/String;Lio/flutter/plugin/common/BinaryMessenger$BinaryMessageHandler;)V

    .line 163
    return-void
.end method

.method public setMessageHandler(Ljava/lang/String;Lio/flutter/plugin/common/BinaryMessenger$BinaryMessageHandler;Lio/flutter/plugin/common/BinaryMessenger$TaskQueue;)V
    .locals 1
    .param p1, "channel"    # Ljava/lang/String;
    .param p2, "handler"    # Lio/flutter/plugin/common/BinaryMessenger$BinaryMessageHandler;
    .param p3, "taskQueue"    # Lio/flutter/plugin/common/BinaryMessenger$TaskQueue;

    .line 168
    iget-object v0, p0, Lio/flutter/view/FlutterNativeView;->dartExecutor:Lio/flutter/embedding/engine/dart/DartExecutor;

    invoke-virtual {v0}, Lio/flutter/embedding/engine/dart/DartExecutor;->getBinaryMessenger()Lio/flutter/plugin/common/BinaryMessenger;

    move-result-object v0

    invoke-interface {v0, p1, p2, p3}, Lio/flutter/plugin/common/BinaryMessenger;->setMessageHandler(Ljava/lang/String;Lio/flutter/plugin/common/BinaryMessenger$BinaryMessageHandler;Lio/flutter/plugin/common/BinaryMessenger$TaskQueue;)V

    .line 169
    return-void
.end method
