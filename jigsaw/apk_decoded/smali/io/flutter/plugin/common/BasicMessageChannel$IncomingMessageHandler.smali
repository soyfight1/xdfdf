.class final Lio/flutter/plugin/common/BasicMessageChannel$IncomingMessageHandler;
.super Ljava/lang/Object;
.source "BasicMessageChannel.java"

# interfaces
.implements Lio/flutter/plugin/common/BinaryMessenger$BinaryMessageHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/plugin/common/BasicMessageChannel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "IncomingMessageHandler"
.end annotation


# instance fields
.field private final handler:Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler<",
            "TT;>;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lio/flutter/plugin/common/BasicMessageChannel;


# direct methods
.method private constructor <init>(Lio/flutter/plugin/common/BasicMessageChannel;Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler<",
            "TT;>;)V"
        }
    .end annotation

    .line 254
    .local p0, "this":Lio/flutter/plugin/common/BasicMessageChannel$IncomingMessageHandler;, "Lio/flutter/plugin/common/BasicMessageChannel<TT;>.IncomingMessageHandler;"
    .local p2, "handler":Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;, "Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler<TT;>;"
    iput-object p1, p0, Lio/flutter/plugin/common/BasicMessageChannel$IncomingMessageHandler;->this$0:Lio/flutter/plugin/common/BasicMessageChannel;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 255
    iput-object p2, p0, Lio/flutter/plugin/common/BasicMessageChannel$IncomingMessageHandler;->handler:Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;

    .line 256
    return-void
.end method

.method synthetic constructor <init>(Lio/flutter/plugin/common/BasicMessageChannel;Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;Lio/flutter/plugin/common/BasicMessageChannel$1;)V
    .locals 0
    .param p1, "x0"    # Lio/flutter/plugin/common/BasicMessageChannel;
    .param p2, "x1"    # Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;
    .param p3, "x2"    # Lio/flutter/plugin/common/BasicMessageChannel$1;

    .line 251
    .local p0, "this":Lio/flutter/plugin/common/BasicMessageChannel$IncomingMessageHandler;, "Lio/flutter/plugin/common/BasicMessageChannel<TT;>.IncomingMessageHandler;"
    invoke-direct {p0, p1, p2}, Lio/flutter/plugin/common/BasicMessageChannel$IncomingMessageHandler;-><init>(Lio/flutter/plugin/common/BasicMessageChannel;Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    return-void
.end method


# virtual methods
.method public onMessage(Ljava/nio/ByteBuffer;Lio/flutter/plugin/common/BinaryMessenger$BinaryReply;)V
    .locals 3
    .param p1, "message"    # Ljava/nio/ByteBuffer;
    .param p2, "callback"    # Lio/flutter/plugin/common/BinaryMessenger$BinaryReply;

    .line 261
    .local p0, "this":Lio/flutter/plugin/common/BasicMessageChannel$IncomingMessageHandler;, "Lio/flutter/plugin/common/BasicMessageChannel<TT;>.IncomingMessageHandler;"
    :try_start_0
    iget-object v0, p0, Lio/flutter/plugin/common/BasicMessageChannel$IncomingMessageHandler;->handler:Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;

    iget-object v1, p0, Lio/flutter/plugin/common/BasicMessageChannel$IncomingMessageHandler;->this$0:Lio/flutter/plugin/common/BasicMessageChannel;

    .line 262
    invoke-static {v1}, Lio/flutter/plugin/common/BasicMessageChannel;->access$200(Lio/flutter/plugin/common/BasicMessageChannel;)Lio/flutter/plugin/common/MessageCodec;

    move-result-object v1

    invoke-interface {v1, p1}, Lio/flutter/plugin/common/MessageCodec;->decodeMessage(Ljava/nio/ByteBuffer;)Ljava/lang/Object;

    move-result-object v1

    new-instance v2, Lio/flutter/plugin/common/BasicMessageChannel$IncomingMessageHandler$1;

    invoke-direct {v2, p0, p2}, Lio/flutter/plugin/common/BasicMessageChannel$IncomingMessageHandler$1;-><init>(Lio/flutter/plugin/common/BasicMessageChannel$IncomingMessageHandler;Lio/flutter/plugin/common/BinaryMessenger$BinaryReply;)V

    .line 261
    invoke-interface {v0, v1, v2}, Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;->onMessage(Ljava/lang/Object;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 272
    goto :goto_0

    .line 269
    :catch_0
    move-exception v0

    .line 270
    .local v0, "e":Ljava/lang/RuntimeException;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "BasicMessageChannel#"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lio/flutter/plugin/common/BasicMessageChannel$IncomingMessageHandler;->this$0:Lio/flutter/plugin/common/BasicMessageChannel;

    invoke-static {v2}, Lio/flutter/plugin/common/BasicMessageChannel;->access$300(Lio/flutter/plugin/common/BasicMessageChannel;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "Failed to handle message"

    invoke-static {v1, v2, v0}, Lio/flutter/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 271
    const/4 v1, 0x0

    invoke-interface {p2, v1}, Lio/flutter/plugin/common/BinaryMessenger$BinaryReply;->reply(Ljava/nio/ByteBuffer;)V

    .line 273
    .end local v0    # "e":Ljava/lang/RuntimeException;
    :goto_0
    return-void
.end method
