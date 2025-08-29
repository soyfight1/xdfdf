.class Lio/flutter/embedding/engine/dart/DartMessenger$BufferedMessageInfo;
.super Ljava/lang/Object;
.source "DartMessenger.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/embedding/engine/dart/DartMessenger;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "BufferedMessageInfo"
.end annotation


# instance fields
.field public final message:Ljava/nio/ByteBuffer;

.field messageData:J

.field replyId:I


# direct methods
.method constructor <init>(Ljava/nio/ByteBuffer;IJ)V
    .locals 0
    .param p1, "message"    # Ljava/nio/ByteBuffer;
    .param p2, "replyId"    # I
    .param p3, "messageData"    # J

    .line 126
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 127
    iput-object p1, p0, Lio/flutter/embedding/engine/dart/DartMessenger$BufferedMessageInfo;->message:Ljava/nio/ByteBuffer;

    .line 128
    iput p2, p0, Lio/flutter/embedding/engine/dart/DartMessenger$BufferedMessageInfo;->replyId:I

    .line 129
    iput-wide p3, p0, Lio/flutter/embedding/engine/dart/DartMessenger$BufferedMessageInfo;->messageData:J

    .line 130
    return-void
.end method
