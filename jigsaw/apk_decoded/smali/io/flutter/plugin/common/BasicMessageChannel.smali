.class public final Lio/flutter/plugin/common/BasicMessageChannel;
.super Ljava/lang/Object;
.source "BasicMessageChannel.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/flutter/plugin/common/BasicMessageChannel$Reply;,
        Lio/flutter/plugin/common/BasicMessageChannel$IncomingReplyHandler;,
        Lio/flutter/plugin/common/BasicMessageChannel$IncomingMessageHandler;,
        Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# static fields
.field public static final CHANNEL_BUFFERS_CHANNEL:Ljava/lang/String; = "dev.flutter/channel-buffers"

.field private static final TAG:Ljava/lang/String; = "BasicMessageChannel#"


# instance fields
.field private final codec:Lio/flutter/plugin/common/MessageCodec;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/flutter/plugin/common/MessageCodec<",
            "TT;>;"
        }
    .end annotation
.end field

.field private final messenger:Lio/flutter/plugin/common/BinaryMessenger;

.field private final name:Ljava/lang/String;

.field private final taskQueue:Lio/flutter/plugin/common/BinaryMessenger$TaskQueue;


# direct methods
.method public constructor <init>(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;Lio/flutter/plugin/common/MessageCodec;)V
    .locals 1
    .param p1, "messenger"    # Lio/flutter/plugin/common/BinaryMessenger;
    .param p2, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/flutter/plugin/common/BinaryMessenger;",
            "Ljava/lang/String;",
            "Lio/flutter/plugin/common/MessageCodec<",
            "TT;>;)V"
        }
    .end annotation

    .line 50
    .local p0, "this":Lio/flutter/plugin/common/BasicMessageChannel;, "Lio/flutter/plugin/common/BasicMessageChannel<TT;>;"
    .local p3, "codec":Lio/flutter/plugin/common/MessageCodec;, "Lio/flutter/plugin/common/MessageCodec<TT;>;"
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Lio/flutter/plugin/common/BasicMessageChannel;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;Lio/flutter/plugin/common/MessageCodec;Lio/flutter/plugin/common/BinaryMessenger$TaskQueue;)V

    .line 51
    return-void
.end method

.method public constructor <init>(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;Lio/flutter/plugin/common/MessageCodec;Lio/flutter/plugin/common/BinaryMessenger$TaskQueue;)V
    .locals 2
    .param p1, "messenger"    # Lio/flutter/plugin/common/BinaryMessenger;
    .param p2, "name"    # Ljava/lang/String;
    .param p4, "taskQueue"    # Lio/flutter/plugin/common/BinaryMessenger$TaskQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/flutter/plugin/common/BinaryMessenger;",
            "Ljava/lang/String;",
            "Lio/flutter/plugin/common/MessageCodec<",
            "TT;>;",
            "Lio/flutter/plugin/common/BinaryMessenger$TaskQueue;",
            ")V"
        }
    .end annotation

    .line 68
    .local p0, "this":Lio/flutter/plugin/common/BasicMessageChannel;, "Lio/flutter/plugin/common/BasicMessageChannel<TT;>;"
    .local p3, "codec":Lio/flutter/plugin/common/MessageCodec;, "Lio/flutter/plugin/common/MessageCodec<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 70
    const-string v0, "BasicMessageChannel#"

    if-nez p1, :cond_0

    .line 71
    const-string v1, "Parameter messenger must not be null."

    invoke-static {v0, v1}, Lio/flutter/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 73
    :cond_0
    if-nez p2, :cond_1

    .line 74
    const-string v1, "Parameter name must not be null."

    invoke-static {v0, v1}, Lio/flutter/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 76
    :cond_1
    if-nez p3, :cond_2

    .line 77
    const-string v1, "Parameter codec must not be null."

    invoke-static {v0, v1}, Lio/flutter/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 80
    :cond_2
    iput-object p1, p0, Lio/flutter/plugin/common/BasicMessageChannel;->messenger:Lio/flutter/plugin/common/BinaryMessenger;

    .line 81
    iput-object p2, p0, Lio/flutter/plugin/common/BasicMessageChannel;->name:Ljava/lang/String;

    .line 82
    iput-object p3, p0, Lio/flutter/plugin/common/BasicMessageChannel;->codec:Lio/flutter/plugin/common/MessageCodec;

    .line 83
    iput-object p4, p0, Lio/flutter/plugin/common/BasicMessageChannel;->taskQueue:Lio/flutter/plugin/common/BinaryMessenger$TaskQueue;

    .line 84
    return-void
.end method

.method static synthetic access$200(Lio/flutter/plugin/common/BasicMessageChannel;)Lio/flutter/plugin/common/MessageCodec;
    .locals 1
    .param p0, "x0"    # Lio/flutter/plugin/common/BasicMessageChannel;

    .line 31
    iget-object v0, p0, Lio/flutter/plugin/common/BasicMessageChannel;->codec:Lio/flutter/plugin/common/MessageCodec;

    return-object v0
.end method

.method static synthetic access$300(Lio/flutter/plugin/common/BasicMessageChannel;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lio/flutter/plugin/common/BasicMessageChannel;

    .line 31
    iget-object v0, p0, Lio/flutter/plugin/common/BasicMessageChannel;->name:Ljava/lang/String;

    return-object v0
.end method

.method private static packetFromEncodedMessage(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;
    .locals 2
    .param p0, "message"    # Ljava/nio/ByteBuffer;

    .line 156
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 157
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v0

    new-array v0, v0, [B

    .line 158
    .local v0, "bytes":[B
    invoke-virtual {p0, v0}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 162
    array-length v1, v0

    invoke-static {v1}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v1

    .line 163
    .local v1, "packet":Ljava/nio/ByteBuffer;
    invoke-virtual {v1, v0}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 165
    return-object v1
.end method

.method public static resizeChannelBuffer(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;I)V
    .locals 6
    .param p0, "messenger"    # Lio/flutter/plugin/common/BinaryMessenger;
    .param p1, "channel"    # Ljava/lang/String;
    .param p2, "newSize"    # I

    .line 175
    sget-object v0, Lio/flutter/plugin/common/StandardMethodCodec;->INSTANCE:Lio/flutter/plugin/common/StandardMethodCodec;

    .line 176
    .local v0, "codec":Lio/flutter/plugin/common/StandardMethodCodec;
    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    const/4 v2, 0x1

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    .line 177
    .local v1, "arguments":[Ljava/lang/Object;
    new-instance v2, Lio/flutter/plugin/common/MethodCall;

    const-string v3, "resize"

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Lio/flutter/plugin/common/MethodCall;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    .line 178
    .local v2, "methodCall":Lio/flutter/plugin/common/MethodCall;
    invoke-virtual {v0, v2}, Lio/flutter/plugin/common/StandardMethodCodec;->encodeMethodCall(Lio/flutter/plugin/common/MethodCall;)Ljava/nio/ByteBuffer;

    move-result-object v3

    .line 179
    .local v3, "message":Ljava/nio/ByteBuffer;
    invoke-static {v3}, Lio/flutter/plugin/common/BasicMessageChannel;->packetFromEncodedMessage(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    move-result-object v4

    .line 180
    .local v4, "packet":Ljava/nio/ByteBuffer;
    const-string v5, "dev.flutter/channel-buffers"

    invoke-interface {p0, v5, v4}, Lio/flutter/plugin/common/BinaryMessenger;->send(Ljava/lang/String;Ljava/nio/ByteBuffer;)V

    .line 181
    return-void
.end method

.method public static setWarnsOnChannelOverflow(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;Z)V
    .locals 6
    .param p0, "messenger"    # Lio/flutter/plugin/common/BinaryMessenger;
    .param p1, "channel"    # Ljava/lang/String;
    .param p2, "warns"    # Z

    .line 190
    sget-object v0, Lio/flutter/plugin/common/StandardMethodCodec;->INSTANCE:Lio/flutter/plugin/common/StandardMethodCodec;

    .line 191
    .local v0, "codec":Lio/flutter/plugin/common/StandardMethodCodec;
    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    xor-int/lit8 v2, p2, 0x1

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    const/4 v3, 0x1

    aput-object v2, v1, v3

    .line 192
    .local v1, "arguments":[Ljava/lang/Object;
    new-instance v2, Lio/flutter/plugin/common/MethodCall;

    const-string v3, "overflow"

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Lio/flutter/plugin/common/MethodCall;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    .line 193
    .local v2, "methodCall":Lio/flutter/plugin/common/MethodCall;
    invoke-virtual {v0, v2}, Lio/flutter/plugin/common/StandardMethodCodec;->encodeMethodCall(Lio/flutter/plugin/common/MethodCall;)Ljava/nio/ByteBuffer;

    move-result-object v3

    .line 194
    .local v3, "message":Ljava/nio/ByteBuffer;
    invoke-static {v3}, Lio/flutter/plugin/common/BasicMessageChannel;->packetFromEncodedMessage(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    move-result-object v4

    .line 195
    .local v4, "packet":Ljava/nio/ByteBuffer;
    const-string v5, "dev.flutter/channel-buffers"

    invoke-interface {p0, v5, v4}, Lio/flutter/plugin/common/BinaryMessenger;->send(Ljava/lang/String;Ljava/nio/ByteBuffer;)V

    .line 196
    return-void
.end method


# virtual methods
.method public resizeChannelBuffer(I)V
    .locals 2
    .param p1, "newSize"    # I

    .line 142
    .local p0, "this":Lio/flutter/plugin/common/BasicMessageChannel;, "Lio/flutter/plugin/common/BasicMessageChannel<TT;>;"
    iget-object v0, p0, Lio/flutter/plugin/common/BasicMessageChannel;->messenger:Lio/flutter/plugin/common/BinaryMessenger;

    iget-object v1, p0, Lio/flutter/plugin/common/BasicMessageChannel;->name:Ljava/lang/String;

    invoke-static {v0, v1, p1}, Lio/flutter/plugin/common/BasicMessageChannel;->resizeChannelBuffer(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;I)V

    .line 143
    return-void
.end method

.method public send(Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 92
    .local p0, "this":Lio/flutter/plugin/common/BasicMessageChannel;, "Lio/flutter/plugin/common/BasicMessageChannel<TT;>;"
    .local p1, "message":Ljava/lang/Object;, "TT;"
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lio/flutter/plugin/common/BasicMessageChannel;->send(Ljava/lang/Object;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V

    .line 93
    return-void
.end method

.method public send(Ljava/lang/Object;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Lio/flutter/plugin/common/BasicMessageChannel$Reply<",
            "TT;>;)V"
        }
    .end annotation

    .line 105
    .local p0, "this":Lio/flutter/plugin/common/BasicMessageChannel;, "Lio/flutter/plugin/common/BasicMessageChannel<TT;>;"
    .local p1, "message":Ljava/lang/Object;, "TT;"
    .local p2, "callback":Lio/flutter/plugin/common/BasicMessageChannel$Reply;, "Lio/flutter/plugin/common/BasicMessageChannel$Reply<TT;>;"
    iget-object v0, p0, Lio/flutter/plugin/common/BasicMessageChannel;->messenger:Lio/flutter/plugin/common/BinaryMessenger;

    iget-object v1, p0, Lio/flutter/plugin/common/BasicMessageChannel;->name:Ljava/lang/String;

    iget-object v2, p0, Lio/flutter/plugin/common/BasicMessageChannel;->codec:Lio/flutter/plugin/common/MessageCodec;

    .line 107
    invoke-interface {v2, p1}, Lio/flutter/plugin/common/MessageCodec;->encodeMessage(Ljava/lang/Object;)Ljava/nio/ByteBuffer;

    move-result-object v2

    .line 108
    const/4 v3, 0x0

    if-nez p2, :cond_0

    goto :goto_0

    :cond_0
    new-instance v4, Lio/flutter/plugin/common/BasicMessageChannel$IncomingReplyHandler;

    invoke-direct {v4, p0, p2, v3}, Lio/flutter/plugin/common/BasicMessageChannel$IncomingReplyHandler;-><init>(Lio/flutter/plugin/common/BasicMessageChannel;Lio/flutter/plugin/common/BasicMessageChannel$Reply;Lio/flutter/plugin/common/BasicMessageChannel$1;)V

    move-object v3, v4

    .line 105
    :goto_0
    invoke-interface {v0, v1, v2, v3}, Lio/flutter/plugin/common/BinaryMessenger;->send(Ljava/lang/String;Ljava/nio/ByteBuffer;Lio/flutter/plugin/common/BinaryMessenger$BinaryReply;)V

    .line 109
    return-void
.end method

.method public setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler<",
            "TT;>;)V"
        }
    .end annotation

    .line 127
    .local p0, "this":Lio/flutter/plugin/common/BasicMessageChannel;, "Lio/flutter/plugin/common/BasicMessageChannel<TT;>;"
    .local p1, "handler":Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;, "Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler<TT;>;"
    iget-object v0, p0, Lio/flutter/plugin/common/BasicMessageChannel;->taskQueue:Lio/flutter/plugin/common/BinaryMessenger$TaskQueue;

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    .line 128
    iget-object v0, p0, Lio/flutter/plugin/common/BasicMessageChannel;->messenger:Lio/flutter/plugin/common/BinaryMessenger;

    iget-object v2, p0, Lio/flutter/plugin/common/BasicMessageChannel;->name:Ljava/lang/String;

    .line 129
    if-nez p1, :cond_0

    goto :goto_0

    :cond_0
    new-instance v3, Lio/flutter/plugin/common/BasicMessageChannel$IncomingMessageHandler;

    invoke-direct {v3, p0, p1, v1}, Lio/flutter/plugin/common/BasicMessageChannel$IncomingMessageHandler;-><init>(Lio/flutter/plugin/common/BasicMessageChannel;Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;Lio/flutter/plugin/common/BasicMessageChannel$1;)V

    move-object v1, v3

    :goto_0
    iget-object v3, p0, Lio/flutter/plugin/common/BasicMessageChannel;->taskQueue:Lio/flutter/plugin/common/BinaryMessenger$TaskQueue;

    .line 128
    invoke-interface {v0, v2, v1, v3}, Lio/flutter/plugin/common/BinaryMessenger;->setMessageHandler(Ljava/lang/String;Lio/flutter/plugin/common/BinaryMessenger$BinaryMessageHandler;Lio/flutter/plugin/common/BinaryMessenger$TaskQueue;)V

    goto :goto_2

    .line 131
    :cond_1
    iget-object v0, p0, Lio/flutter/plugin/common/BasicMessageChannel;->messenger:Lio/flutter/plugin/common/BinaryMessenger;

    iget-object v2, p0, Lio/flutter/plugin/common/BasicMessageChannel;->name:Ljava/lang/String;

    .line 132
    if-nez p1, :cond_2

    goto :goto_1

    :cond_2
    new-instance v3, Lio/flutter/plugin/common/BasicMessageChannel$IncomingMessageHandler;

    invoke-direct {v3, p0, p1, v1}, Lio/flutter/plugin/common/BasicMessageChannel$IncomingMessageHandler;-><init>(Lio/flutter/plugin/common/BasicMessageChannel;Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;Lio/flutter/plugin/common/BasicMessageChannel$1;)V

    move-object v1, v3

    .line 131
    :goto_1
    invoke-interface {v0, v2, v1}, Lio/flutter/plugin/common/BinaryMessenger;->setMessageHandler(Ljava/lang/String;Lio/flutter/plugin/common/BinaryMessenger$BinaryMessageHandler;)V

    .line 134
    :goto_2
    return-void
.end method

.method public setWarnsOnChannelOverflow(Z)V
    .locals 2
    .param p1, "warns"    # Z

    .line 151
    .local p0, "this":Lio/flutter/plugin/common/BasicMessageChannel;, "Lio/flutter/plugin/common/BasicMessageChannel<TT;>;"
    iget-object v0, p0, Lio/flutter/plugin/common/BasicMessageChannel;->messenger:Lio/flutter/plugin/common/BinaryMessenger;

    iget-object v1, p0, Lio/flutter/plugin/common/BasicMessageChannel;->name:Ljava/lang/String;

    invoke-static {v0, v1, p1}, Lio/flutter/plugin/common/BasicMessageChannel;->setWarnsOnChannelOverflow(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;Z)V

    .line 152
    return-void
.end method
