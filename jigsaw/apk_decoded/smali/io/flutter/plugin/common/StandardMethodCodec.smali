.class public final Lio/flutter/plugin/common/StandardMethodCodec;
.super Ljava/lang/Object;
.source "StandardMethodCodec.java"

# interfaces
.implements Lio/flutter/plugin/common/MethodCodec;


# static fields
.field public static final INSTANCE:Lio/flutter/plugin/common/StandardMethodCodec;


# instance fields
.field private final messageCodec:Lio/flutter/plugin/common/StandardMessageCodec;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 24
    new-instance v0, Lio/flutter/plugin/common/StandardMethodCodec;

    sget-object v1, Lio/flutter/plugin/common/StandardMessageCodec;->INSTANCE:Lio/flutter/plugin/common/StandardMessageCodec;

    invoke-direct {v0, v1}, Lio/flutter/plugin/common/StandardMethodCodec;-><init>(Lio/flutter/plugin/common/StandardMessageCodec;)V

    sput-object v0, Lio/flutter/plugin/common/StandardMethodCodec;->INSTANCE:Lio/flutter/plugin/common/StandardMethodCodec;

    return-void
.end method

.method public constructor <init>(Lio/flutter/plugin/common/StandardMessageCodec;)V
    .locals 0
    .param p1, "messageCodec"    # Lio/flutter/plugin/common/StandardMessageCodec;

    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    iput-object p1, p0, Lio/flutter/plugin/common/StandardMethodCodec;->messageCodec:Lio/flutter/plugin/common/StandardMessageCodec;

    .line 31
    return-void
.end method


# virtual methods
.method public decodeEnvelope(Ljava/nio/ByteBuffer;)Ljava/lang/Object;
    .locals 7
    .param p1, "envelope"    # Ljava/nio/ByteBuffer;

    .line 110
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 111
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->get()B

    move-result v0

    .line 112
    .local v0, "flag":B
    packed-switch v0, :pswitch_data_0

    goto :goto_0

    .line 115
    :pswitch_0
    iget-object v1, p0, Lio/flutter/plugin/common/StandardMethodCodec;->messageCodec:Lio/flutter/plugin/common/StandardMessageCodec;

    invoke-virtual {v1, p1}, Lio/flutter/plugin/common/StandardMessageCodec;->readValue(Ljava/nio/ByteBuffer;)Ljava/lang/Object;

    move-result-object v1

    .line 116
    .local v1, "result":Ljava/lang/Object;
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v2

    if-nez v2, :cond_0

    .line 117
    return-object v1

    .line 123
    .end local v1    # "result":Ljava/lang/Object;
    :cond_0
    :pswitch_1
    iget-object v1, p0, Lio/flutter/plugin/common/StandardMethodCodec;->messageCodec:Lio/flutter/plugin/common/StandardMessageCodec;

    invoke-virtual {v1, p1}, Lio/flutter/plugin/common/StandardMessageCodec;->readValue(Ljava/nio/ByteBuffer;)Ljava/lang/Object;

    move-result-object v1

    .line 124
    .local v1, "code":Ljava/lang/Object;
    iget-object v2, p0, Lio/flutter/plugin/common/StandardMethodCodec;->messageCodec:Lio/flutter/plugin/common/StandardMessageCodec;

    invoke-virtual {v2, p1}, Lio/flutter/plugin/common/StandardMessageCodec;->readValue(Ljava/nio/ByteBuffer;)Ljava/lang/Object;

    move-result-object v2

    .line 125
    .local v2, "message":Ljava/lang/Object;
    iget-object v3, p0, Lio/flutter/plugin/common/StandardMethodCodec;->messageCodec:Lio/flutter/plugin/common/StandardMessageCodec;

    invoke-virtual {v3, p1}, Lio/flutter/plugin/common/StandardMessageCodec;->readValue(Ljava/nio/ByteBuffer;)Ljava/lang/Object;

    move-result-object v3

    .line 126
    .local v3, "details":Ljava/lang/Object;
    instance-of v4, v1, Ljava/lang/String;

    if-eqz v4, :cond_2

    if-eqz v2, :cond_1

    instance-of v4, v2, Ljava/lang/String;

    if-eqz v4, :cond_2

    .line 128
    :cond_1
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v4

    if-nez v4, :cond_2

    .line 129
    new-instance v4, Lio/flutter/plugin/common/FlutterException;

    move-object v5, v1

    check-cast v5, Ljava/lang/String;

    move-object v6, v2

    check-cast v6, Ljava/lang/String;

    invoke-direct {v4, v5, v6, v3}, Lio/flutter/plugin/common/FlutterException;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    throw v4

    .line 133
    .end local v1    # "code":Ljava/lang/Object;
    .end local v2    # "message":Ljava/lang/Object;
    .end local v3    # "details":Ljava/lang/Object;
    :cond_2
    :goto_0
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Envelope corrupted"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public decodeMethodCall(Ljava/nio/ByteBuffer;)Lio/flutter/plugin/common/MethodCall;
    .locals 4
    .param p1, "methodCall"    # Ljava/nio/ByteBuffer;

    .line 47
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 48
    iget-object v0, p0, Lio/flutter/plugin/common/StandardMethodCodec;->messageCodec:Lio/flutter/plugin/common/StandardMessageCodec;

    invoke-virtual {v0, p1}, Lio/flutter/plugin/common/StandardMessageCodec;->readValue(Ljava/nio/ByteBuffer;)Ljava/lang/Object;

    move-result-object v0

    .line 49
    .local v0, "method":Ljava/lang/Object;
    iget-object v1, p0, Lio/flutter/plugin/common/StandardMethodCodec;->messageCodec:Lio/flutter/plugin/common/StandardMessageCodec;

    invoke-virtual {v1, p1}, Lio/flutter/plugin/common/StandardMessageCodec;->readValue(Ljava/nio/ByteBuffer;)Ljava/lang/Object;

    move-result-object v1

    .line 50
    .local v1, "arguments":Ljava/lang/Object;
    instance-of v2, v0, Ljava/lang/String;

    if-eqz v2, :cond_0

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v2

    if-nez v2, :cond_0

    .line 51
    new-instance v2, Lio/flutter/plugin/common/MethodCall;

    move-object v3, v0

    check-cast v3, Ljava/lang/String;

    invoke-direct {v2, v3, v1}, Lio/flutter/plugin/common/MethodCall;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    return-object v2

    .line 53
    :cond_0
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "Method call corrupted"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public encodeErrorEnvelope(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)Ljava/nio/ByteBuffer;
    .locals 5
    .param p1, "errorCode"    # Ljava/lang/String;
    .param p2, "errorMessage"    # Ljava/lang/String;
    .param p3, "errorDetails"    # Ljava/lang/Object;

    .line 71
    new-instance v0, Lio/flutter/plugin/common/StandardMessageCodec$ExposedByteArrayOutputStream;

    invoke-direct {v0}, Lio/flutter/plugin/common/StandardMessageCodec$ExposedByteArrayOutputStream;-><init>()V

    .line 72
    .local v0, "stream":Lio/flutter/plugin/common/StandardMessageCodec$ExposedByteArrayOutputStream;
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lio/flutter/plugin/common/StandardMessageCodec$ExposedByteArrayOutputStream;->write(I)V

    .line 73
    iget-object v1, p0, Lio/flutter/plugin/common/StandardMethodCodec;->messageCodec:Lio/flutter/plugin/common/StandardMessageCodec;

    invoke-virtual {v1, v0, p1}, Lio/flutter/plugin/common/StandardMessageCodec;->writeValue(Ljava/io/ByteArrayOutputStream;Ljava/lang/Object;)V

    .line 74
    iget-object v1, p0, Lio/flutter/plugin/common/StandardMethodCodec;->messageCodec:Lio/flutter/plugin/common/StandardMessageCodec;

    invoke-virtual {v1, v0, p2}, Lio/flutter/plugin/common/StandardMessageCodec;->writeValue(Ljava/io/ByteArrayOutputStream;Ljava/lang/Object;)V

    .line 75
    instance-of v1, p3, Ljava/lang/Throwable;

    if-eqz v1, :cond_0

    .line 76
    iget-object v1, p0, Lio/flutter/plugin/common/StandardMethodCodec;->messageCodec:Lio/flutter/plugin/common/StandardMessageCodec;

    move-object v2, p3

    check-cast v2, Ljava/lang/Throwable;

    invoke-static {v2}, Lio/flutter/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Lio/flutter/plugin/common/StandardMessageCodec;->writeValue(Ljava/io/ByteArrayOutputStream;Ljava/lang/Object;)V

    goto :goto_0

    .line 78
    :cond_0
    iget-object v1, p0, Lio/flutter/plugin/common/StandardMethodCodec;->messageCodec:Lio/flutter/plugin/common/StandardMessageCodec;

    invoke-virtual {v1, v0, p3}, Lio/flutter/plugin/common/StandardMessageCodec;->writeValue(Ljava/io/ByteArrayOutputStream;Ljava/lang/Object;)V

    .line 80
    :goto_0
    invoke-virtual {v0}, Lio/flutter/plugin/common/StandardMessageCodec$ExposedByteArrayOutputStream;->size()I

    move-result v1

    invoke-static {v1}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v1

    .line 81
    .local v1, "buffer":Ljava/nio/ByteBuffer;
    invoke-virtual {v0}, Lio/flutter/plugin/common/StandardMessageCodec$ExposedByteArrayOutputStream;->buffer()[B

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v0}, Lio/flutter/plugin/common/StandardMessageCodec$ExposedByteArrayOutputStream;->size()I

    move-result v4

    invoke-virtual {v1, v2, v3, v4}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 82
    return-object v1
.end method

.method public encodeErrorEnvelopeWithStacktrace(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)Ljava/nio/ByteBuffer;
    .locals 5
    .param p1, "errorCode"    # Ljava/lang/String;
    .param p2, "errorMessage"    # Ljava/lang/String;
    .param p3, "errorDetails"    # Ljava/lang/Object;
    .param p4, "errorStacktrace"    # Ljava/lang/String;

    .line 92
    new-instance v0, Lio/flutter/plugin/common/StandardMessageCodec$ExposedByteArrayOutputStream;

    invoke-direct {v0}, Lio/flutter/plugin/common/StandardMessageCodec$ExposedByteArrayOutputStream;-><init>()V

    .line 93
    .local v0, "stream":Lio/flutter/plugin/common/StandardMessageCodec$ExposedByteArrayOutputStream;
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lio/flutter/plugin/common/StandardMessageCodec$ExposedByteArrayOutputStream;->write(I)V

    .line 94
    iget-object v1, p0, Lio/flutter/plugin/common/StandardMethodCodec;->messageCodec:Lio/flutter/plugin/common/StandardMessageCodec;

    invoke-virtual {v1, v0, p1}, Lio/flutter/plugin/common/StandardMessageCodec;->writeValue(Ljava/io/ByteArrayOutputStream;Ljava/lang/Object;)V

    .line 95
    iget-object v1, p0, Lio/flutter/plugin/common/StandardMethodCodec;->messageCodec:Lio/flutter/plugin/common/StandardMessageCodec;

    invoke-virtual {v1, v0, p2}, Lio/flutter/plugin/common/StandardMessageCodec;->writeValue(Ljava/io/ByteArrayOutputStream;Ljava/lang/Object;)V

    .line 96
    instance-of v1, p3, Ljava/lang/Throwable;

    if-eqz v1, :cond_0

    .line 97
    iget-object v1, p0, Lio/flutter/plugin/common/StandardMethodCodec;->messageCodec:Lio/flutter/plugin/common/StandardMessageCodec;

    move-object v2, p3

    check-cast v2, Ljava/lang/Throwable;

    invoke-static {v2}, Lio/flutter/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Lio/flutter/plugin/common/StandardMessageCodec;->writeValue(Ljava/io/ByteArrayOutputStream;Ljava/lang/Object;)V

    goto :goto_0

    .line 99
    :cond_0
    iget-object v1, p0, Lio/flutter/plugin/common/StandardMethodCodec;->messageCodec:Lio/flutter/plugin/common/StandardMessageCodec;

    invoke-virtual {v1, v0, p3}, Lio/flutter/plugin/common/StandardMessageCodec;->writeValue(Ljava/io/ByteArrayOutputStream;Ljava/lang/Object;)V

    .line 101
    :goto_0
    iget-object v1, p0, Lio/flutter/plugin/common/StandardMethodCodec;->messageCodec:Lio/flutter/plugin/common/StandardMessageCodec;

    invoke-virtual {v1, v0, p4}, Lio/flutter/plugin/common/StandardMessageCodec;->writeValue(Ljava/io/ByteArrayOutputStream;Ljava/lang/Object;)V

    .line 102
    invoke-virtual {v0}, Lio/flutter/plugin/common/StandardMessageCodec$ExposedByteArrayOutputStream;->size()I

    move-result v1

    invoke-static {v1}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v1

    .line 103
    .local v1, "buffer":Ljava/nio/ByteBuffer;
    invoke-virtual {v0}, Lio/flutter/plugin/common/StandardMessageCodec$ExposedByteArrayOutputStream;->buffer()[B

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v0}, Lio/flutter/plugin/common/StandardMessageCodec$ExposedByteArrayOutputStream;->size()I

    move-result v4

    invoke-virtual {v1, v2, v3, v4}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 104
    return-object v1
.end method

.method public encodeMethodCall(Lio/flutter/plugin/common/MethodCall;)Ljava/nio/ByteBuffer;
    .locals 5
    .param p1, "methodCall"    # Lio/flutter/plugin/common/MethodCall;

    .line 36
    new-instance v0, Lio/flutter/plugin/common/StandardMessageCodec$ExposedByteArrayOutputStream;

    invoke-direct {v0}, Lio/flutter/plugin/common/StandardMessageCodec$ExposedByteArrayOutputStream;-><init>()V

    .line 37
    .local v0, "stream":Lio/flutter/plugin/common/StandardMessageCodec$ExposedByteArrayOutputStream;
    iget-object v1, p0, Lio/flutter/plugin/common/StandardMethodCodec;->messageCodec:Lio/flutter/plugin/common/StandardMessageCodec;

    iget-object v2, p1, Lio/flutter/plugin/common/MethodCall;->method:Ljava/lang/String;

    invoke-virtual {v1, v0, v2}, Lio/flutter/plugin/common/StandardMessageCodec;->writeValue(Ljava/io/ByteArrayOutputStream;Ljava/lang/Object;)V

    .line 38
    iget-object v1, p0, Lio/flutter/plugin/common/StandardMethodCodec;->messageCodec:Lio/flutter/plugin/common/StandardMessageCodec;

    iget-object v2, p1, Lio/flutter/plugin/common/MethodCall;->arguments:Ljava/lang/Object;

    invoke-virtual {v1, v0, v2}, Lio/flutter/plugin/common/StandardMessageCodec;->writeValue(Ljava/io/ByteArrayOutputStream;Ljava/lang/Object;)V

    .line 39
    invoke-virtual {v0}, Lio/flutter/plugin/common/StandardMessageCodec$ExposedByteArrayOutputStream;->size()I

    move-result v1

    invoke-static {v1}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v1

    .line 40
    .local v1, "buffer":Ljava/nio/ByteBuffer;
    invoke-virtual {v0}, Lio/flutter/plugin/common/StandardMessageCodec$ExposedByteArrayOutputStream;->buffer()[B

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v0}, Lio/flutter/plugin/common/StandardMessageCodec$ExposedByteArrayOutputStream;->size()I

    move-result v4

    invoke-virtual {v1, v2, v3, v4}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 41
    return-object v1
.end method

.method public encodeSuccessEnvelope(Ljava/lang/Object;)Ljava/nio/ByteBuffer;
    .locals 5
    .param p1, "result"    # Ljava/lang/Object;

    .line 59
    new-instance v0, Lio/flutter/plugin/common/StandardMessageCodec$ExposedByteArrayOutputStream;

    invoke-direct {v0}, Lio/flutter/plugin/common/StandardMessageCodec$ExposedByteArrayOutputStream;-><init>()V

    .line 60
    .local v0, "stream":Lio/flutter/plugin/common/StandardMessageCodec$ExposedByteArrayOutputStream;
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lio/flutter/plugin/common/StandardMessageCodec$ExposedByteArrayOutputStream;->write(I)V

    .line 61
    iget-object v2, p0, Lio/flutter/plugin/common/StandardMethodCodec;->messageCodec:Lio/flutter/plugin/common/StandardMessageCodec;

    invoke-virtual {v2, v0, p1}, Lio/flutter/plugin/common/StandardMessageCodec;->writeValue(Ljava/io/ByteArrayOutputStream;Ljava/lang/Object;)V

    .line 62
    invoke-virtual {v0}, Lio/flutter/plugin/common/StandardMessageCodec$ExposedByteArrayOutputStream;->size()I

    move-result v2

    invoke-static {v2}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v2

    .line 63
    .local v2, "buffer":Ljava/nio/ByteBuffer;
    invoke-virtual {v0}, Lio/flutter/plugin/common/StandardMessageCodec$ExposedByteArrayOutputStream;->buffer()[B

    move-result-object v3

    invoke-virtual {v0}, Lio/flutter/plugin/common/StandardMessageCodec$ExposedByteArrayOutputStream;->size()I

    move-result v4

    invoke-virtual {v2, v3, v1, v4}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 64
    return-object v2
.end method
