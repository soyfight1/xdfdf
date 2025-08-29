.class public Lio/flutter/embedding/android/FlutterFragmentActivity$NewEngineInGroupIntentBuilder;
.super Ljava/lang/Object;
.source "FlutterFragmentActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/embedding/android/FlutterFragmentActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "NewEngineInGroupIntentBuilder"
.end annotation


# instance fields
.field private final activityClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "+",
            "Lio/flutter/embedding/android/FlutterFragmentActivity;",
            ">;"
        }
    .end annotation
.end field

.field private backgroundMode:Ljava/lang/String;

.field private final cachedEngineGroupId:Ljava/lang/String;

.field private dartEntrypoint:Ljava/lang/String;

.field private initialRoute:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/Class;Ljava/lang/String;)V
    .locals 1
    .param p2, "engineGroupId"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "+",
            "Lio/flutter/embedding/android/FlutterFragmentActivity;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 305
    .local p1, "activityClass":Ljava/lang/Class;, "Ljava/lang/Class<+Lio/flutter/embedding/android/FlutterFragmentActivity;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 284
    const-string v0, "main"

    iput-object v0, p0, Lio/flutter/embedding/android/FlutterFragmentActivity$NewEngineInGroupIntentBuilder;->dartEntrypoint:Ljava/lang/String;

    .line 285
    const-string v0, "/"

    iput-object v0, p0, Lio/flutter/embedding/android/FlutterFragmentActivity$NewEngineInGroupIntentBuilder;->initialRoute:Ljava/lang/String;

    .line 286
    sget-object v0, Lio/flutter/embedding/android/FlutterActivityLaunchConfigs;->DEFAULT_BACKGROUND_MODE:Ljava/lang/String;

    iput-object v0, p0, Lio/flutter/embedding/android/FlutterFragmentActivity$NewEngineInGroupIntentBuilder;->backgroundMode:Ljava/lang/String;

    .line 306
    iput-object p1, p0, Lio/flutter/embedding/android/FlutterFragmentActivity$NewEngineInGroupIntentBuilder;->activityClass:Ljava/lang/Class;

    .line 307
    iput-object p2, p0, Lio/flutter/embedding/android/FlutterFragmentActivity$NewEngineInGroupIntentBuilder;->cachedEngineGroupId:Ljava/lang/String;

    .line 308
    return-void
.end method


# virtual methods
.method public backgroundMode(Lio/flutter/embedding/android/FlutterActivityLaunchConfigs$BackgroundMode;)Lio/flutter/embedding/android/FlutterFragmentActivity$NewEngineInGroupIntentBuilder;
    .locals 1
    .param p1, "backgroundMode"    # Lio/flutter/embedding/android/FlutterActivityLaunchConfigs$BackgroundMode;

    .line 351
    invoke-virtual {p1}, Lio/flutter/embedding/android/FlutterActivityLaunchConfigs$BackgroundMode;->name()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lio/flutter/embedding/android/FlutterFragmentActivity$NewEngineInGroupIntentBuilder;->backgroundMode:Ljava/lang/String;

    .line 352
    return-object p0
.end method

.method public build(Landroid/content/Context;)Landroid/content/Intent;
    .locals 3
    .param p1, "context"    # Landroid/content/Context;

    .line 361
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lio/flutter/embedding/android/FlutterFragmentActivity$NewEngineInGroupIntentBuilder;->activityClass:Ljava/lang/Class;

    invoke-direct {v0, p1, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    iget-object v1, p0, Lio/flutter/embedding/android/FlutterFragmentActivity$NewEngineInGroupIntentBuilder;->dartEntrypoint:Ljava/lang/String;

    .line 362
    const-string v2, "dart_entrypoint"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    iget-object v1, p0, Lio/flutter/embedding/android/FlutterFragmentActivity$NewEngineInGroupIntentBuilder;->initialRoute:Ljava/lang/String;

    .line 363
    const-string v2, "route"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    iget-object v1, p0, Lio/flutter/embedding/android/FlutterFragmentActivity$NewEngineInGroupIntentBuilder;->cachedEngineGroupId:Ljava/lang/String;

    .line 364
    const-string v2, "cached_engine_group_id"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    iget-object v1, p0, Lio/flutter/embedding/android/FlutterFragmentActivity$NewEngineInGroupIntentBuilder;->backgroundMode:Ljava/lang/String;

    .line 365
    const-string v2, "background_mode"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    .line 366
    const-string v1, "destroy_engine_with_activity"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    move-result-object v0

    .line 361
    return-object v0
.end method

.method public dartEntrypoint(Ljava/lang/String;)Lio/flutter/embedding/android/FlutterFragmentActivity$NewEngineInGroupIntentBuilder;
    .locals 0
    .param p1, "dartEntrypoint"    # Ljava/lang/String;

    .line 319
    iput-object p1, p0, Lio/flutter/embedding/android/FlutterFragmentActivity$NewEngineInGroupIntentBuilder;->dartEntrypoint:Ljava/lang/String;

    .line 320
    return-object p0
.end method

.method public initialRoute(Ljava/lang/String;)Lio/flutter/embedding/android/FlutterFragmentActivity$NewEngineInGroupIntentBuilder;
    .locals 0
    .param p1, "initialRoute"    # Ljava/lang/String;

    .line 329
    iput-object p1, p0, Lio/flutter/embedding/android/FlutterFragmentActivity$NewEngineInGroupIntentBuilder;->initialRoute:Ljava/lang/String;

    .line 330
    return-object p0
.end method
