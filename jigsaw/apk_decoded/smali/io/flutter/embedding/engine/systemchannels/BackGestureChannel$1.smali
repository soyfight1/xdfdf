.class Lio/flutter/embedding/engine/systemchannels/BackGestureChannel$1;
.super Ljava/lang/Object;
.source "BackGestureChannel.java"

# interfaces
.implements Lio/flutter/plugin/common/MethodChannel$MethodCallHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/embedding/engine/systemchannels/BackGestureChannel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lio/flutter/embedding/engine/systemchannels/BackGestureChannel;


# direct methods
.method constructor <init>(Lio/flutter/embedding/engine/systemchannels/BackGestureChannel;)V
    .locals 0
    .param p1, "this$0"    # Lio/flutter/embedding/engine/systemchannels/BackGestureChannel;

    .line 49
    iput-object p1, p0, Lio/flutter/embedding/engine/systemchannels/BackGestureChannel$1;->this$0:Lio/flutter/embedding/engine/systemchannels/BackGestureChannel;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onMethodCall(Lio/flutter/plugin/common/MethodCall;Lio/flutter/plugin/common/MethodChannel$Result;)V
    .locals 1
    .param p1, "call"    # Lio/flutter/plugin/common/MethodCall;
    .param p2, "result"    # Lio/flutter/plugin/common/MethodChannel$Result;

    .line 52
    const/4 v0, 0x0

    invoke-interface {p2, v0}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V

    .line 53
    return-void
.end method
