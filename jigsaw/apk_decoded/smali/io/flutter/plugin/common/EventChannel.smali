.class public final Lio/flutter/plugin/common/EventChannel;
.super Ljava/lang/Object;
.source "EventChannel.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/flutter/plugin/common/EventChannel$IncomingStreamRequestHandler;,
        Lio/flutter/plugin/common/EventChannel$StreamHandler;,
        Lio/flutter/plugin/common/EventChannel$EventSink;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "EventChannel#"


# instance fields
.field private final codec:Lio/flutter/plugin/common/MethodCodec;

.field private final messenger:Lio/flutter/plugin/common/BinaryMessenger;

.field private final name:Ljava/lang/String;

.field private final taskQueue:Lio/flutter/plugin/common/BinaryMessenger$TaskQueue;


# direct methods
.method public constructor <init>(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;)V
    .locals 1
    .param p1, "messenger"    # Lio/flutter/plugin/common/BinaryMessenger;
    .param p2, "name"    # Ljava/lang/String;

    .line 48
    sget-object v0, Lio/flutter/plugin/common/StandardMethodCodec;->INSTANCE:Lio/flutter/plugin/common/StandardMethodCodec;

    invoke-direct {p0, p1, p2, v0}, Lio/flutter/plugin/common/EventChannel;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;Lio/flutter/plugin/common/MethodCodec;)V

    .line 49
    return-void
.end method

.method public constructor <init>(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;Lio/flutter/plugin/common/MethodCodec;)V
    .locals 1
    .param p1, "messenger"    # Lio/flutter/plugin/common/BinaryMessenger;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "codec"    # Lio/flutter/plugin/common/MethodCodec;

    .line 60
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Lio/flutter/plugin/common/EventChannel;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;Lio/flutter/plugin/common/MethodCodec;Lio/flutter/plugin/common/BinaryMessenger$TaskQueue;)V

    .line 61
    return-void
.end method

.method public constructor <init>(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;Lio/flutter/plugin/common/MethodCodec;Lio/flutter/plugin/common/BinaryMessenger$TaskQueue;)V
    .locals 2
    .param p1, "messenger"    # Lio/flutter/plugin/common/BinaryMessenger;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "codec"    # Lio/flutter/plugin/common/MethodCodec;
    .param p4, "taskQueue"    # Lio/flutter/plugin/common/BinaryMessenger$TaskQueue;

    .line 78
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 80
    const-string v0, "EventChannel#"

    if-nez p1, :cond_0

    .line 81
    const-string v1, "Parameter messenger must not be null."

    invoke-static {v0, v1}, Lio/flutter/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 83
    :cond_0
    if-nez p2, :cond_1

    .line 84
    const-string v1, "Parameter name must not be null."

    invoke-static {v0, v1}, Lio/flutter/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 86
    :cond_1
    if-nez p3, :cond_2

    .line 87
    const-string v1, "Parameter codec must not be null."

    invoke-static {v0, v1}, Lio/flutter/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 90
    :cond_2
    iput-object p1, p0, Lio/flutter/plugin/common/EventChannel;->messenger:Lio/flutter/plugin/common/BinaryMessenger;

    .line 91
    iput-object p2, p0, Lio/flutter/plugin/common/EventChannel;->name:Ljava/lang/String;

    .line 92
    iput-object p3, p0, Lio/flutter/plugin/common/EventChannel;->codec:Lio/flutter/plugin/common/MethodCodec;

    .line 93
    iput-object p4, p0, Lio/flutter/plugin/common/EventChannel;->taskQueue:Lio/flutter/plugin/common/BinaryMessenger$TaskQueue;

    .line 94
    return-void
.end method

.method static synthetic access$000(Lio/flutter/plugin/common/EventChannel;)Lio/flutter/plugin/common/MethodCodec;
    .locals 1
    .param p0, "x0"    # Lio/flutter/plugin/common/EventChannel;

    .line 32
    iget-object v0, p0, Lio/flutter/plugin/common/EventChannel;->codec:Lio/flutter/plugin/common/MethodCodec;

    return-object v0
.end method

.method static synthetic access$200(Lio/flutter/plugin/common/EventChannel;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lio/flutter/plugin/common/EventChannel;

    .line 32
    iget-object v0, p0, Lio/flutter/plugin/common/EventChannel;->name:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$400(Lio/flutter/plugin/common/EventChannel;)Lio/flutter/plugin/common/BinaryMessenger;
    .locals 1
    .param p0, "x0"    # Lio/flutter/plugin/common/EventChannel;

    .line 32
    iget-object v0, p0, Lio/flutter/plugin/common/EventChannel;->messenger:Lio/flutter/plugin/common/BinaryMessenger;

    return-object v0
.end method


# virtual methods
.method public setStreamHandler(Lio/flutter/plugin/common/EventChannel$StreamHandler;)V
    .locals 4
    .param p1, "handler"    # Lio/flutter/plugin/common/EventChannel$StreamHandler;

    .line 111
    iget-object v0, p0, Lio/flutter/plugin/common/EventChannel;->taskQueue:Lio/flutter/plugin/common/BinaryMessenger$TaskQueue;

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    .line 112
    iget-object v0, p0, Lio/flutter/plugin/common/EventChannel;->messenger:Lio/flutter/plugin/common/BinaryMessenger;

    iget-object v2, p0, Lio/flutter/plugin/common/EventChannel;->name:Ljava/lang/String;

    .line 113
    if-nez p1, :cond_0

    goto :goto_0

    :cond_0
    new-instance v1, Lio/flutter/plugin/common/EventChannel$IncomingStreamRequestHandler;

    invoke-direct {v1, p0, p1}, Lio/flutter/plugin/common/EventChannel$IncomingStreamRequestHandler;-><init>(Lio/flutter/plugin/common/EventChannel;Lio/flutter/plugin/common/EventChannel$StreamHandler;)V

    :goto_0
    iget-object v3, p0, Lio/flutter/plugin/common/EventChannel;->taskQueue:Lio/flutter/plugin/common/BinaryMessenger$TaskQueue;

    .line 112
    invoke-interface {v0, v2, v1, v3}, Lio/flutter/plugin/common/BinaryMessenger;->setMessageHandler(Ljava/lang/String;Lio/flutter/plugin/common/BinaryMessenger$BinaryMessageHandler;Lio/flutter/plugin/common/BinaryMessenger$TaskQueue;)V

    goto :goto_2

    .line 115
    :cond_1
    iget-object v0, p0, Lio/flutter/plugin/common/EventChannel;->messenger:Lio/flutter/plugin/common/BinaryMessenger;

    iget-object v2, p0, Lio/flutter/plugin/common/EventChannel;->name:Ljava/lang/String;

    .line 116
    if-nez p1, :cond_2

    goto :goto_1

    :cond_2
    new-instance v1, Lio/flutter/plugin/common/EventChannel$IncomingStreamRequestHandler;

    invoke-direct {v1, p0, p1}, Lio/flutter/plugin/common/EventChannel$IncomingStreamRequestHandler;-><init>(Lio/flutter/plugin/common/EventChannel;Lio/flutter/plugin/common/EventChannel$StreamHandler;)V

    .line 115
    :goto_1
    invoke-interface {v0, v2, v1}, Lio/flutter/plugin/common/BinaryMessenger;->setMessageHandler(Ljava/lang/String;Lio/flutter/plugin/common/BinaryMessenger$BinaryMessageHandler;)V

    .line 118
    :goto_2
    return-void
.end method
