.class public Lio/flutter/embedding/android/FlutterActivity$NewEngineInGroupIntentBuilder;
.super Ljava/lang/Object;
.source "FlutterActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/embedding/android/FlutterActivity;
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
            "Lio/flutter/embedding/android/FlutterActivity;",
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
            "Lio/flutter/embedding/android/FlutterActivity;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 520
    .local p1, "activityClass":Ljava/lang/Class;, "Ljava/lang/Class<+Lio/flutter/embedding/android/FlutterActivity;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 485
    const-string v0, "main"

    iput-object v0, p0, Lio/flutter/embedding/android/FlutterActivity$NewEngineInGroupIntentBuilder;->dartEntrypoint:Ljava/lang/String;

    .line 486
    const-string v0, "/"

    iput-object v0, p0, Lio/flutter/embedding/android/FlutterActivity$NewEngineInGroupIntentBuilder;->initialRoute:Ljava/lang/String;

    .line 487
    sget-object v0, Lio/flutter/embedding/android/FlutterActivityLaunchConfigs;->DEFAULT_BACKGROUND_MODE:Ljava/lang/String;

    iput-object v0, p0, Lio/flutter/embedding/android/FlutterActivity$NewEngineInGroupIntentBuilder;->backgroundMode:Ljava/lang/String;

    .line 521
    iput-object p1, p0, Lio/flutter/embedding/android/FlutterActivity$NewEngineInGroupIntentBuilder;->activityClass:Ljava/lang/Class;

    .line 522
    iput-object p2, p0, Lio/flutter/embedding/android/FlutterActivity$NewEngineInGroupIntentBuilder;->cachedEngineGroupId:Ljava/lang/String;

    .line 523
    return-void
.end method


# virtual methods
.method public backgroundMode(Lio/flutter/embedding/android/FlutterActivityLaunchConfigs$BackgroundMode;)Lio/flutter/embedding/android/FlutterActivity$NewEngineInGroupIntentBuilder;
    .locals 1
    .param p1, "backgroundMode"    # Lio/flutter/embedding/android/FlutterActivityLaunchConfigs$BackgroundMode;

    .line 572
    invoke-virtual {p1}, Lio/flutter/embedding/android/FlutterActivityLaunchConfigs$BackgroundMode;->name()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lio/flutter/embedding/android/FlutterActivity$NewEngineInGroupIntentBuilder;->backgroundMode:Ljava/lang/String;

    .line 573
    return-object p0
.end method

.method public build(Landroid/content/Context;)Landroid/content/Intent;
    .locals 3
    .param p1, "context"    # Landroid/content/Context;

    .line 585
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lio/flutter/embedding/android/FlutterActivity$NewEngineInGroupIntentBuilder;->activityClass:Ljava/lang/Class;

    invoke-direct {v0, p1, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    iget-object v1, p0, Lio/flutter/embedding/android/FlutterActivity$NewEngineInGroupIntentBuilder;->dartEntrypoint:Ljava/lang/String;

    .line 586
    const-string v2, "dart_entrypoint"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    iget-object v1, p0, Lio/flutter/embedding/android/FlutterActivity$NewEngineInGroupIntentBuilder;->initialRoute:Ljava/lang/String;

    .line 587
    const-string v2, "route"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    iget-object v1, p0, Lio/flutter/embedding/android/FlutterActivity$NewEngineInGroupIntentBuilder;->cachedEngineGroupId:Ljava/lang/String;

    .line 588
    const-string v2, "cached_engine_group_id"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    iget-object v1, p0, Lio/flutter/embedding/android/FlutterActivity$NewEngineInGroupIntentBuilder;->backgroundMode:Ljava/lang/String;

    .line 589
    const-string v2, "background_mode"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    .line 590
    const-string v1, "destroy_engine_with_activity"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    move-result-object v0

    .line 585
    return-object v0
.end method

.method public dartEntrypoint(Ljava/lang/String;)Lio/flutter/embedding/android/FlutterActivity$NewEngineInGroupIntentBuilder;
    .locals 0
    .param p1, "dartEntrypoint"    # Ljava/lang/String;

    .line 534
    iput-object p1, p0, Lio/flutter/embedding/android/FlutterActivity$NewEngineInGroupIntentBuilder;->dartEntrypoint:Ljava/lang/String;

    .line 535
    return-object p0
.end method

.method public initialRoute(Ljava/lang/String;)Lio/flutter/embedding/android/FlutterActivity$NewEngineInGroupIntentBuilder;
    .locals 0
    .param p1, "initialRoute"    # Ljava/lang/String;

    .line 547
    iput-object p1, p0, Lio/flutter/embedding/android/FlutterActivity$NewEngineInGroupIntentBuilder;->initialRoute:Ljava/lang/String;

    .line 548
    return-object p0
.end method
