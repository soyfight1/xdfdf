.class public Lio/flutter/embedding/engine/FlutterEngineGroup$Options;
.super Ljava/lang/Object;
.source "FlutterEngineGroup.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/embedding/engine/FlutterEngineGroup;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Options"
.end annotation


# instance fields
.field private automaticallyRegisterPlugins:Z

.field private context:Landroid/content/Context;

.field private dartEntrypoint:Lio/flutter/embedding/engine/dart/DartExecutor$DartEntrypoint;

.field private dartEntrypointArgs:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private initialRoute:Ljava/lang/String;

.field private platformViewsController:Lio/flutter/plugin/platform/PlatformViewsController;

.field private waitForRestorationData:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .line 227
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 224
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/flutter/embedding/engine/FlutterEngineGroup$Options;->automaticallyRegisterPlugins:Z

    .line 225
    const/4 v0, 0x0

    iput-boolean v0, p0, Lio/flutter/embedding/engine/FlutterEngineGroup$Options;->waitForRestorationData:Z

    .line 228
    iput-object p1, p0, Lio/flutter/embedding/engine/FlutterEngineGroup$Options;->context:Landroid/content/Context;

    .line 229
    return-void
.end method


# virtual methods
.method public getAutomaticallyRegisterPlugins()Z
    .locals 1

    .line 267
    iget-boolean v0, p0, Lio/flutter/embedding/engine/FlutterEngineGroup$Options;->automaticallyRegisterPlugins:Z

    return v0
.end method

.method public getContext()Landroid/content/Context;
    .locals 1

    .line 232
    iget-object v0, p0, Lio/flutter/embedding/engine/FlutterEngineGroup$Options;->context:Landroid/content/Context;

    return-object v0
.end method

.method public getDartEntrypoint()Lio/flutter/embedding/engine/dart/DartExecutor$DartEntrypoint;
    .locals 1

    .line 241
    iget-object v0, p0, Lio/flutter/embedding/engine/FlutterEngineGroup$Options;->dartEntrypoint:Lio/flutter/embedding/engine/dart/DartExecutor$DartEntrypoint;

    return-object v0
.end method

.method public getDartEntrypointArgs()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 254
    iget-object v0, p0, Lio/flutter/embedding/engine/FlutterEngineGroup$Options;->dartEntrypointArgs:Ljava/util/List;

    return-object v0
.end method

.method public getInitialRoute()Ljava/lang/String;
    .locals 1

    .line 249
    iget-object v0, p0, Lio/flutter/embedding/engine/FlutterEngineGroup$Options;->initialRoute:Ljava/lang/String;

    return-object v0
.end method

.method public getPlatformViewsController()Lio/flutter/plugin/platform/PlatformViewsController;
    .locals 1

    .line 259
    iget-object v0, p0, Lio/flutter/embedding/engine/FlutterEngineGroup$Options;->platformViewsController:Lio/flutter/plugin/platform/PlatformViewsController;

    return-object v0
.end method

.method public getWaitForRestorationData()Z
    .locals 1

    .line 276
    iget-boolean v0, p0, Lio/flutter/embedding/engine/FlutterEngineGroup$Options;->waitForRestorationData:Z

    return v0
.end method

.method public setAutomaticallyRegisterPlugins(Z)Lio/flutter/embedding/engine/FlutterEngineGroup$Options;
    .locals 0
    .param p1, "automaticallyRegisterPlugins"    # Z

    .line 331
    iput-boolean p1, p0, Lio/flutter/embedding/engine/FlutterEngineGroup$Options;->automaticallyRegisterPlugins:Z

    .line 332
    return-object p0
.end method

.method public setDartEntrypoint(Lio/flutter/embedding/engine/dart/DartExecutor$DartEntrypoint;)Lio/flutter/embedding/engine/FlutterEngineGroup$Options;
    .locals 0
    .param p1, "dartEntrypoint"    # Lio/flutter/embedding/engine/dart/DartExecutor$DartEntrypoint;

    .line 287
    iput-object p1, p0, Lio/flutter/embedding/engine/FlutterEngineGroup$Options;->dartEntrypoint:Lio/flutter/embedding/engine/dart/DartExecutor$DartEntrypoint;

    .line 288
    return-object p0
.end method

.method public setDartEntrypointArgs(Ljava/util/List;)Lio/flutter/embedding/engine/FlutterEngineGroup$Options;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Lio/flutter/embedding/engine/FlutterEngineGroup$Options;"
        }
    .end annotation

    .line 308
    .local p1, "dartEntrypointArgs":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    iput-object p1, p0, Lio/flutter/embedding/engine/FlutterEngineGroup$Options;->dartEntrypointArgs:Ljava/util/List;

    .line 309
    return-object p0
.end method

.method public setInitialRoute(Ljava/lang/String;)Lio/flutter/embedding/engine/FlutterEngineGroup$Options;
    .locals 0
    .param p1, "initialRoute"    # Ljava/lang/String;

    .line 298
    iput-object p1, p0, Lio/flutter/embedding/engine/FlutterEngineGroup$Options;->initialRoute:Ljava/lang/String;

    .line 299
    return-object p0
.end method

.method public setPlatformViewsController(Lio/flutter/plugin/platform/PlatformViewsController;)Lio/flutter/embedding/engine/FlutterEngineGroup$Options;
    .locals 0
    .param p1, "platformViewsController"    # Lio/flutter/plugin/platform/PlatformViewsController;

    .line 319
    iput-object p1, p0, Lio/flutter/embedding/engine/FlutterEngineGroup$Options;->platformViewsController:Lio/flutter/plugin/platform/PlatformViewsController;

    .line 320
    return-object p0
.end method

.method public setWaitForRestorationData(Z)Lio/flutter/embedding/engine/FlutterEngineGroup$Options;
    .locals 0
    .param p1, "waitForRestorationData"    # Z

    .line 344
    iput-boolean p1, p0, Lio/flutter/embedding/engine/FlutterEngineGroup$Options;->waitForRestorationData:Z

    .line 345
    return-object p0
.end method
