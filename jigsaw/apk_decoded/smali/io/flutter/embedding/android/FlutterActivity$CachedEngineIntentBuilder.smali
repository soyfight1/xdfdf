.class public Lio/flutter/embedding/android/FlutterActivity$CachedEngineIntentBuilder;
.super Ljava/lang/Object;
.source "FlutterActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/embedding/android/FlutterActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "CachedEngineIntentBuilder"
.end annotation


# instance fields
.field private final activityClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "+",
            "Lio/flutter/embedding/android/FlutterActivity;",
            ">;"
        }
    .end annotation
.end field

.field private backgroundMode:Ljava/lang/String;

.field private final cachedEngineId:Ljava/lang/String;

.field private destroyEngineWithActivity:Z


# direct methods
.method public constructor <init>(Ljava/lang/Class;Ljava/lang/String;)V
    .locals 1
    .param p2, "engineId"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "+",
            "Lio/flutter/embedding/android/FlutterActivity;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 391
    .local p1, "activityClass":Ljava/lang/Class;, "Ljava/lang/Class<+Lio/flutter/embedding/android/FlutterActivity;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 373
    const/4 v0, 0x0

    iput-boolean v0, p0, Lio/flutter/embedding/android/FlutterActivity$CachedEngineIntentBuilder;->destroyEngineWithActivity:Z

    .line 374
    sget-object v0, Lio/flutter/embedding/android/FlutterActivityLaunchConfigs;->DEFAULT_BACKGROUND_MODE:Ljava/lang/String;

    iput-object v0, p0, Lio/flutter/embedding/android/FlutterActivity$CachedEngineIntentBuilder;->backgroundMode:Ljava/lang/String;

    .line 392
    iput-object p1, p0, Lio/flutter/embedding/android/FlutterActivity$CachedEngineIntentBuilder;->activityClass:Ljava/lang/Class;

    .line 393
    iput-object p2, p0, Lio/flutter/embedding/android/FlutterActivity$CachedEngineIntentBuilder;->cachedEngineId:Ljava/lang/String;

    .line 394
    return-void
.end method


# virtual methods
.method public backgroundMode(Lio/flutter/embedding/android/FlutterActivityLaunchConfigs$BackgroundMode;)Lio/flutter/embedding/android/FlutterActivity$CachedEngineIntentBuilder;
    .locals 1
    .param p1, "backgroundMode"    # Lio/flutter/embedding/android/FlutterActivityLaunchConfigs$BackgroundMode;

    .line 431
    invoke-virtual {p1}, Lio/flutter/embedding/android/FlutterActivityLaunchConfigs$BackgroundMode;->name()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lio/flutter/embedding/android/FlutterActivity$CachedEngineIntentBuilder;->backgroundMode:Ljava/lang/String;

    .line 432
    return-object p0
.end method

.method public build(Landroid/content/Context;)Landroid/content/Intent;
    .locals 3
    .param p1, "context"    # Landroid/content/Context;

    .line 444
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lio/flutter/embedding/android/FlutterActivity$CachedEngineIntentBuilder;->activityClass:Ljava/lang/Class;

    invoke-direct {v0, p1, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    iget-object v1, p0, Lio/flutter/embedding/android/FlutterActivity$CachedEngineIntentBuilder;->cachedEngineId:Ljava/lang/String;

    .line 445
    const-string v2, "cached_engine_id"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    iget-boolean v1, p0, Lio/flutter/embedding/android/FlutterActivity$CachedEngineIntentBuilder;->destroyEngineWithActivity:Z

    .line 446
    const-string v2, "destroy_engine_with_activity"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    move-result-object v0

    iget-object v1, p0, Lio/flutter/embedding/android/FlutterActivity$CachedEngineIntentBuilder;->backgroundMode:Ljava/lang/String;

    .line 447
    const-string v2, "background_mode"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    .line 444
    return-object v0
.end method

.method public destroyEngineWithActivity(Z)Lio/flutter/embedding/android/FlutterActivity$CachedEngineIntentBuilder;
    .locals 0
    .param p1, "destroyEngineWithActivity"    # Z

    .line 406
    iput-boolean p1, p0, Lio/flutter/embedding/android/FlutterActivity$CachedEngineIntentBuilder;->destroyEngineWithActivity:Z

    .line 407
    return-object p0
.end method
