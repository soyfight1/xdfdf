.class public Lio/flutter/embedding/android/FlutterFragmentActivity$NewEngineIntentBuilder;
.super Ljava/lang/Object;
.source "FlutterFragmentActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/embedding/android/FlutterFragmentActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "NewEngineIntentBuilder"
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


# direct methods
.method public constructor <init>(Ljava/lang/Class;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "+",
            "Lio/flutter/embedding/android/FlutterFragmentActivity;",
            ">;)V"
        }
    .end annotation

    .line 111
    .local p1, "activityClass":Ljava/lang/Class;, "Ljava/lang/Class<+Lio/flutter/embedding/android/FlutterFragmentActivity;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 96
    const-string v0, "/"

    iput-object v0, p0, Lio/flutter/embedding/android/FlutterFragmentActivity$NewEngineIntentBuilder;->initialRoute:Ljava/lang/String;

    .line 97
    sget-object v0, Lio/flutter/embedding/android/FlutterActivityLaunchConfigs;->DEFAULT_BACKGROUND_MODE:Ljava/lang/String;

    iput-object v0, p0, Lio/flutter/embedding/android/FlutterFragmentActivity$NewEngineIntentBuilder;->backgroundMode:Ljava/lang/String;

    .line 112
    iput-object p1, p0, Lio/flutter/embedding/android/FlutterFragmentActivity$NewEngineIntentBuilder;->activityClass:Ljava/lang/Class;

    .line 113
    return-void
.end method


# virtual methods
.method public backgroundMode(Lio/flutter/embedding/android/FlutterActivityLaunchConfigs$BackgroundMode;)Lio/flutter/embedding/android/FlutterFragmentActivity$NewEngineIntentBuilder;
    .locals 1
    .param p1, "backgroundMode"    # Lio/flutter/embedding/android/FlutterActivityLaunchConfigs$BackgroundMode;

    .line 143
    invoke-virtual {p1}, Lio/flutter/embedding/android/FlutterActivityLaunchConfigs$BackgroundMode;->name()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lio/flutter/embedding/android/FlutterFragmentActivity$NewEngineIntentBuilder;->backgroundMode:Ljava/lang/String;

    .line 144
    return-object p0
.end method

.method public build(Landroid/content/Context;)Landroid/content/Intent;
    .locals 3
    .param p1, "context"    # Landroid/content/Context;

    .line 168
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lio/flutter/embedding/android/FlutterFragmentActivity$NewEngineIntentBuilder;->activityClass:Ljava/lang/Class;

    invoke-direct {v0, p1, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    iget-object v1, p0, Lio/flutter/embedding/android/FlutterFragmentActivity$NewEngineIntentBuilder;->initialRoute:Ljava/lang/String;

    .line 170
    const-string v2, "route"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    iget-object v1, p0, Lio/flutter/embedding/android/FlutterFragmentActivity$NewEngineIntentBuilder;->backgroundMode:Ljava/lang/String;

    .line 171
    const-string v2, "background_mode"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    .line 172
    const-string v1, "destroy_engine_with_activity"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    move-result-object v0

    .line 173
    .local v0, "intent":Landroid/content/Intent;
    iget-object v1, p0, Lio/flutter/embedding/android/FlutterFragmentActivity$NewEngineIntentBuilder;->dartEntrypointArgs:Ljava/util/List;

    if-eqz v1, :cond_0

    .line 174
    new-instance v1, Ljava/util/ArrayList;

    iget-object v2, p0, Lio/flutter/embedding/android/FlutterFragmentActivity$NewEngineIntentBuilder;->dartEntrypointArgs:Ljava/util/List;

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    const-string v2, "dart_entrypoint_args"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 176
    :cond_0
    return-object v0
.end method

.method public dartEntrypointArgs(Ljava/util/List;)Lio/flutter/embedding/android/FlutterFragmentActivity$NewEngineIntentBuilder;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Lio/flutter/embedding/android/FlutterFragmentActivity$NewEngineIntentBuilder;"
        }
    .end annotation

    .line 158
    .local p1, "dartEntrypointArgs":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    iput-object p1, p0, Lio/flutter/embedding/android/FlutterFragmentActivity$NewEngineIntentBuilder;->dartEntrypointArgs:Ljava/util/List;

    .line 159
    return-object p0
.end method

.method public initialRoute(Ljava/lang/String;)Lio/flutter/embedding/android/FlutterFragmentActivity$NewEngineIntentBuilder;
    .locals 0
    .param p1, "initialRoute"    # Ljava/lang/String;

    .line 121
    iput-object p1, p0, Lio/flutter/embedding/android/FlutterFragmentActivity$NewEngineIntentBuilder;->initialRoute:Ljava/lang/String;

    .line 122
    return-object p0
.end method
