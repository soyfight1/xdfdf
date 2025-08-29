.class Lio/flutter/embedding/engine/systemchannels/NavigationChannel$1;
.super Ljava/lang/Object;
.source "NavigationChannel.java"

# interfaces
.implements Lio/flutter/plugin/common/MethodChannel$MethodCallHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/embedding/engine/systemchannels/NavigationChannel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lio/flutter/embedding/engine/systemchannels/NavigationChannel;


# direct methods
.method constructor <init>(Lio/flutter/embedding/engine/systemchannels/NavigationChannel;)V
    .locals 0
    .param p1, "this$0"    # Lio/flutter/embedding/engine/systemchannels/NavigationChannel;

    .line 31
    iput-object p1, p0, Lio/flutter/embedding/engine/systemchannels/NavigationChannel$1;->this$0:Lio/flutter/embedding/engine/systemchannels/NavigationChannel;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onMethodCall(Lio/flutter/plugin/common/MethodCall;Lio/flutter/plugin/common/MethodChannel$Result;)V
    .locals 1
    .param p1, "call"    # Lio/flutter/plugin/common/MethodCall;
    .param p2, "result"    # Lio/flutter/plugin/common/MethodChannel$Result;

    .line 34
    const/4 v0, 0x0

    invoke-interface {p2, v0}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V

    .line 35
    return-void
.end method
