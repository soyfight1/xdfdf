.class public final Lcom/example/menascyber/MainActivity;
.super Lio/flutter/embedding/android/FlutterActivity;
.source "MainActivity.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\u0018\u00002\u00020\u0001B\u0005\u00a2\u0006\u0002\u0010\u0002J\u0010\u0010\u0005\u001a\u00020\u00062\u0006\u0010\u0007\u001a\u00020\u0008H\u0016R\u000e\u0010\u0003\u001a\u00020\u0004X\u0082D\u00a2\u0006\u0002\n\u0000\u00a8\u0006\t"
    }
    d2 = {
        "Lcom/example/menascyber/MainActivity;",
        "Lio/flutter/embedding/android/FlutterActivity;",
        "()V",
        "CHANNEL",
        "",
        "configureFlutterEngine",
        "",
        "flutterEngine",
        "Lio/flutter/embedding/engine/FlutterEngine;",
        "app_debug"
    }
    k = 0x1
    mv = {
        0x1,
        0x8,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field private final CHANNEL:Ljava/lang/String;


# direct methods
.method public static synthetic $r8$lambda$8fGaDbP7FQlgl1A4AZ98nxGZ8uo(Lio/flutter/plugin/common/MethodCall;Lio/flutter/plugin/common/MethodChannel$Result;)V
    .locals 0

    invoke-static {p0, p1}, Lcom/example/menascyber/MainActivity;->configureFlutterEngine$lambda$0(Lio/flutter/plugin/common/MethodCall;Lio/flutter/plugin/common/MethodChannel$Result;)V

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 7
    invoke-direct {p0}, Lio/flutter/embedding/android/FlutterActivity;-><init>()V

    .line 10
    const-string v0, "parttwo"

    iput-object v0, p0, Lcom/example/menascyber/MainActivity;->CHANNEL:Ljava/lang/String;

    .line 7
    return-void
.end method

.method private static final configureFlutterEngine$lambda$0(Lio/flutter/plugin/common/MethodCall;Lio/flutter/plugin/common/MethodChannel$Result;)V
    .locals 2
    .param p0, "call"    # Lio/flutter/plugin/common/MethodCall;
    .param p1, "result"    # Lio/flutter/plugin/common/MethodChannel$Result;

    const-string v0, "call"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "result"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 17
    iget-object v0, p0, Lio/flutter/plugin/common/MethodCall;->method:Ljava/lang/String;

    const-string v1, "parttwo"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 18
    invoke-static {}, Lcom/example/menascyber/MainActivityKt;->access$get_parttwo()Ljava/util/Map;

    move-result-object v0

    .line 19
    .local v0, "response":Ljava/util/Map;
    invoke-interface {p1, v0}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V

    .end local v0    # "response":Ljava/util/Map;
    goto :goto_0

    .line 21
    :cond_0
    invoke-interface {p1}, Lio/flutter/plugin/common/MethodChannel$Result;->notImplemented()V

    .line 24
    :goto_0
    return-void
.end method


# virtual methods
.method public configureFlutterEngine(Lio/flutter/embedding/engine/FlutterEngine;)V
    .locals 3
    .param p1, "flutterEngine"    # Lio/flutter/embedding/engine/FlutterEngine;

    const-string v0, "flutterEngine"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 12
    invoke-super {p0, p1}, Lio/flutter/embedding/android/FlutterActivity;->configureFlutterEngine(Lio/flutter/embedding/engine/FlutterEngine;)V

    .line 15
    new-instance v0, Lio/flutter/plugin/common/MethodChannel;

    invoke-virtual {p1}, Lio/flutter/embedding/engine/FlutterEngine;->getDartExecutor()Lio/flutter/embedding/engine/dart/DartExecutor;

    move-result-object v1

    invoke-virtual {v1}, Lio/flutter/embedding/engine/dart/DartExecutor;->getBinaryMessenger()Lio/flutter/plugin/common/BinaryMessenger;

    move-result-object v1

    iget-object v2, p0, Lcom/example/menascyber/MainActivity;->CHANNEL:Ljava/lang/String;

    invoke-direct {v0, v1, v2}, Lio/flutter/plugin/common/MethodChannel;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;)V

    new-instance v1, Lcom/example/menascyber/MainActivity$$ExternalSyntheticLambda0;

    invoke-direct {v1}, Lcom/example/menascyber/MainActivity$$ExternalSyntheticLambda0;-><init>()V

    invoke-virtual {v0, v1}, Lio/flutter/plugin/common/MethodChannel;->setMethodCallHandler(Lio/flutter/plugin/common/MethodChannel$MethodCallHandler;)V

    .line 30
    return-void
.end method
