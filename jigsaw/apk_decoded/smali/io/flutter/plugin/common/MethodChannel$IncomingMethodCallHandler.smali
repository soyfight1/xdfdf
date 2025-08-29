.class final Lio/flutter/plugin/common/MethodChannel$IncomingMethodCallHandler;
.super Ljava/lang/Object;
.source "MethodChannel.java"

# interfaces
.implements Lio/flutter/plugin/common/BinaryMessenger$BinaryMessageHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/plugin/common/MethodChannel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "IncomingMethodCallHandler"
.end annotation


# instance fields
.field private final handler:Lio/flutter/plugin/common/MethodChannel$MethodCallHandler;

.field final synthetic this$0:Lio/flutter/plugin/common/MethodChannel;


# direct methods
.method constructor <init>(Lio/flutter/plugin/common/MethodChannel;Lio/flutter/plugin/common/MethodChannel$MethodCallHandler;)V
    .locals 0
    .param p2, "handler"    # Lio/flutter/plugin/common/MethodChannel$MethodCallHandler;

    .line 258
    iput-object p1, p0, Lio/flutter/plugin/common/MethodChannel$IncomingMethodCallHandler;->this$0:Lio/flutter/plugin/common/MethodChannel;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 259
    iput-object p2, p0, Lio/flutter/plugin/common/MethodChannel$IncomingMethodCallHandler;->handler:Lio/flutter/plugin/common/MethodChannel$MethodCallHandler;

    .line 260
    return-void
.end method


# virtual methods
.method public onMessage(Ljava/nio/ByteBuffer;Lio/flutter/plugin/common/BinaryMessenger$BinaryReply;)V
    .locals 7
    .param p1, "message"    # Ljava/nio/ByteBuffer;
    .param p2, "reply"    # Lio/flutter/plugin/common/BinaryMessenger$BinaryReply;

    .line 265
    iget-object v0, p0, Lio/flutter/plugin/common/MethodChannel$IncomingMethodCallHandler;->this$0:Lio/flutter/plugin/common/MethodChannel;

    invoke-static {v0}, Lio/flutter/plugin/common/MethodChannel;->access$000(Lio/flutter/plugin/common/MethodChannel;)Lio/flutter/plugin/common/MethodCodec;

    move-result-object v0

    invoke-interface {v0, p1}, Lio/flutter/plugin/common/MethodCodec;->decodeMethodCall(Ljava/nio/ByteBuffer;)Lio/flutter/plugin/common/MethodCall;

    move-result-object v0

    .line 267
    .local v0, "call":Lio/flutter/plugin/common/MethodCall;
    :try_start_0
    iget-object v1, p0, Lio/flutter/plugin/common/MethodChannel$IncomingMethodCallHandler;->handler:Lio/flutter/plugin/common/MethodChannel$MethodCallHandler;

    new-instance v2, Lio/flutter/plugin/common/MethodChannel$IncomingMethodCallHandler$1;

    invoke-direct {v2, p0, p2}, Lio/flutter/plugin/common/MethodChannel$IncomingMethodCallHandler$1;-><init>(Lio/flutter/plugin/common/MethodChannel$IncomingMethodCallHandler;Lio/flutter/plugin/common/BinaryMessenger$BinaryReply;)V

    invoke-interface {v1, v0, v2}, Lio/flutter/plugin/common/MethodChannel$MethodCallHandler;->onMethodCall(Lio/flutter/plugin/common/MethodCall;Lio/flutter/plugin/common/MethodChannel$Result;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 290
    goto :goto_0

    .line 285
    :catch_0
    move-exception v1

    .line 286
    .local v1, "e":Ljava/lang/RuntimeException;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "MethodChannel#"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lio/flutter/plugin/common/MethodChannel$IncomingMethodCallHandler;->this$0:Lio/flutter/plugin/common/MethodChannel;

    invoke-static {v3}, Lio/flutter/plugin/common/MethodChannel;->access$100(Lio/flutter/plugin/common/MethodChannel;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "Failed to handle method call"

    invoke-static {v2, v3, v1}, Lio/flutter/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 287
    iget-object v2, p0, Lio/flutter/plugin/common/MethodChannel$IncomingMethodCallHandler;->this$0:Lio/flutter/plugin/common/MethodChannel;

    .line 288
    invoke-static {v2}, Lio/flutter/plugin/common/MethodChannel;->access$000(Lio/flutter/plugin/common/MethodChannel;)Lio/flutter/plugin/common/MethodCodec;

    move-result-object v2

    .line 289
    invoke-virtual {v1}, Ljava/lang/RuntimeException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1}, Lio/flutter/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v4

    .line 288
    const-string v5, "error"

    const/4 v6, 0x0

    invoke-interface {v2, v5, v3, v6, v4}, Lio/flutter/plugin/common/MethodCodec;->encodeErrorEnvelopeWithStacktrace(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)Ljava/nio/ByteBuffer;

    move-result-object v2

    .line 287
    invoke-interface {p2, v2}, Lio/flutter/plugin/common/BinaryMessenger$BinaryReply;->reply(Ljava/nio/ByteBuffer;)V

    .line 291
    .end local v1    # "e":Ljava/lang/RuntimeException;
    :goto_0
    return-void
.end method
