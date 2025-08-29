.class final Lio/flutter/plugin/common/MethodChannel$IncomingResultHandler;
.super Ljava/lang/Object;
.source "MethodChannel.java"

# interfaces
.implements Lio/flutter/plugin/common/BinaryMessenger$BinaryReply;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/plugin/common/MethodChannel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "IncomingResultHandler"
.end annotation


# instance fields
.field private final callback:Lio/flutter/plugin/common/MethodChannel$Result;

.field final synthetic this$0:Lio/flutter/plugin/common/MethodChannel;


# direct methods
.method constructor <init>(Lio/flutter/plugin/common/MethodChannel;Lio/flutter/plugin/common/MethodChannel$Result;)V
    .locals 0
    .param p2, "callback"    # Lio/flutter/plugin/common/MethodChannel$Result;

    .line 232
    iput-object p1, p0, Lio/flutter/plugin/common/MethodChannel$IncomingResultHandler;->this$0:Lio/flutter/plugin/common/MethodChannel;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 233
    iput-object p2, p0, Lio/flutter/plugin/common/MethodChannel$IncomingResultHandler;->callback:Lio/flutter/plugin/common/MethodChannel$Result;

    .line 234
    return-void
.end method


# virtual methods
.method public reply(Ljava/nio/ByteBuffer;)V
    .locals 5
    .param p1, "reply"    # Ljava/nio/ByteBuffer;

    .line 240
    if-nez p1, :cond_0

    .line 241
    :try_start_0
    iget-object v0, p0, Lio/flutter/plugin/common/MethodChannel$IncomingResultHandler;->callback:Lio/flutter/plugin/common/MethodChannel$Result;

    invoke-interface {v0}, Lio/flutter/plugin/common/MethodChannel$Result;->notImplemented()V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 244
    :cond_0
    :try_start_1
    iget-object v0, p0, Lio/flutter/plugin/common/MethodChannel$IncomingResultHandler;->callback:Lio/flutter/plugin/common/MethodChannel$Result;

    iget-object v1, p0, Lio/flutter/plugin/common/MethodChannel$IncomingResultHandler;->this$0:Lio/flutter/plugin/common/MethodChannel;

    invoke-static {v1}, Lio/flutter/plugin/common/MethodChannel;->access$000(Lio/flutter/plugin/common/MethodChannel;)Lio/flutter/plugin/common/MethodCodec;

    move-result-object v1

    invoke-interface {v1, p1}, Lio/flutter/plugin/common/MethodCodec;->decodeEnvelope(Ljava/nio/ByteBuffer;)Ljava/lang/Object;

    move-result-object v1

    invoke-interface {v0, v1}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V
    :try_end_1
    .catch Lio/flutter/plugin/common/FlutterException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_0

    .line 247
    goto :goto_0

    .line 249
    :catch_0
    move-exception v0

    goto :goto_1

    .line 245
    :catch_1
    move-exception v0

    .line 246
    .local v0, "e":Lio/flutter/plugin/common/FlutterException;
    :try_start_2
    iget-object v1, p0, Lio/flutter/plugin/common/MethodChannel$IncomingResultHandler;->callback:Lio/flutter/plugin/common/MethodChannel$Result;

    iget-object v2, v0, Lio/flutter/plugin/common/FlutterException;->code:Ljava/lang/String;

    invoke-virtual {v0}, Lio/flutter/plugin/common/FlutterException;->getMessage()Ljava/lang/String;

    move-result-object v3

    iget-object v4, v0, Lio/flutter/plugin/common/FlutterException;->details:Ljava/lang/Object;

    invoke-interface {v1, v2, v3, v4}, Lio/flutter/plugin/common/MethodChannel$Result;->error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_2
    .catch Ljava/lang/RuntimeException; {:try_start_2 .. :try_end_2} :catch_0

    .line 251
    .end local v0    # "e":Lio/flutter/plugin/common/FlutterException;
    :goto_0
    goto :goto_2

    .line 250
    .local v0, "e":Ljava/lang/RuntimeException;
    :goto_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "MethodChannel#"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lio/flutter/plugin/common/MethodChannel$IncomingResultHandler;->this$0:Lio/flutter/plugin/common/MethodChannel;

    invoke-static {v2}, Lio/flutter/plugin/common/MethodChannel;->access$100(Lio/flutter/plugin/common/MethodChannel;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "Failed to handle method call result"

    invoke-static {v1, v2, v0}, Lio/flutter/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 252
    .end local v0    # "e":Ljava/lang/RuntimeException;
    :goto_2
    return-void
.end method
