.class Lio/flutter/embedding/engine/systemchannels/RestorationChannel$1;
.super Ljava/lang/Object;
.source "RestorationChannel.java"

# interfaces
.implements Lio/flutter/plugin/common/MethodChannel$Result;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/flutter/embedding/engine/systemchannels/RestorationChannel;->setRestorationData([B)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lio/flutter/embedding/engine/systemchannels/RestorationChannel;

.field final synthetic val$data:[B


# direct methods
.method constructor <init>(Lio/flutter/embedding/engine/systemchannels/RestorationChannel;[B)V
    .locals 0
    .param p1, "this$0"    # Lio/flutter/embedding/engine/systemchannels/RestorationChannel;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 98
    iput-object p1, p0, Lio/flutter/embedding/engine/systemchannels/RestorationChannel$1;->this$0:Lio/flutter/embedding/engine/systemchannels/RestorationChannel;

    iput-object p2, p0, Lio/flutter/embedding/engine/systemchannels/RestorationChannel$1;->val$data:[B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 2
    .param p1, "errorCode"    # Ljava/lang/String;
    .param p2, "errorMessage"    # Ljava/lang/String;
    .param p3, "errorDetails"    # Ljava/lang/Object;

    .line 106
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Error "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " while sending restoration data to framework: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "RestorationChannel"

    invoke-static {v1, v0}, Lio/flutter/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 112
    return-void
.end method

.method public notImplemented()V
    .locals 0

    .line 117
    return-void
.end method

.method public success(Ljava/lang/Object;)V
    .locals 2
    .param p1, "result"    # Ljava/lang/Object;

    .line 101
    iget-object v0, p0, Lio/flutter/embedding/engine/systemchannels/RestorationChannel$1;->this$0:Lio/flutter/embedding/engine/systemchannels/RestorationChannel;

    iget-object v1, p0, Lio/flutter/embedding/engine/systemchannels/RestorationChannel$1;->val$data:[B

    invoke-static {v0, v1}, Lio/flutter/embedding/engine/systemchannels/RestorationChannel;->access$002(Lio/flutter/embedding/engine/systemchannels/RestorationChannel;[B)[B

    .line 102
    return-void
.end method
