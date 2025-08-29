.class Lio/flutter/embedding/engine/systemchannels/RestorationChannel$2;
.super Ljava/lang/Object;
.source "RestorationChannel.java"

# interfaces
.implements Lio/flutter/plugin/common/MethodChannel$MethodCallHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/embedding/engine/systemchannels/RestorationChannel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lio/flutter/embedding/engine/systemchannels/RestorationChannel;


# direct methods
.method constructor <init>(Lio/flutter/embedding/engine/systemchannels/RestorationChannel;)V
    .locals 0
    .param p1, "this$0"    # Lio/flutter/embedding/engine/systemchannels/RestorationChannel;

    .line 136
    iput-object p1, p0, Lio/flutter/embedding/engine/systemchannels/RestorationChannel$2;->this$0:Lio/flutter/embedding/engine/systemchannels/RestorationChannel;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onMethodCall(Lio/flutter/plugin/common/MethodCall;Lio/flutter/plugin/common/MethodChannel$Result;)V
    .locals 4
    .param p1, "call"    # Lio/flutter/plugin/common/MethodCall;
    .param p2, "result"    # Lio/flutter/plugin/common/MethodChannel$Result;

    .line 139
    iget-object v0, p1, Lio/flutter/plugin/common/MethodCall;->method:Ljava/lang/String;

    .line 140
    .local v0, "method":Ljava/lang/String;
    iget-object v1, p1, Lio/flutter/plugin/common/MethodCall;->arguments:Ljava/lang/Object;

    .line 141
    .local v1, "args":Ljava/lang/Object;
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v2

    const/4 v3, 0x1

    sparse-switch v2, :sswitch_data_0

    :cond_0
    goto :goto_0

    :sswitch_0
    const-string v2, "put"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v2, 0x0

    goto :goto_1

    :sswitch_1
    const-string v2, "get"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v2, 0x1

    goto :goto_1

    :goto_0
    const/4 v2, -0x1

    :goto_1
    packed-switch v2, :pswitch_data_0

    .line 159
    invoke-interface {p2}, Lio/flutter/plugin/common/MethodChannel$Result;->notImplemented()V

    goto :goto_3

    .line 147
    :pswitch_0
    iget-object v2, p0, Lio/flutter/embedding/engine/systemchannels/RestorationChannel$2;->this$0:Lio/flutter/embedding/engine/systemchannels/RestorationChannel;

    invoke-static {v2, v3}, Lio/flutter/embedding/engine/systemchannels/RestorationChannel;->access$102(Lio/flutter/embedding/engine/systemchannels/RestorationChannel;Z)Z

    .line 148
    iget-object v2, p0, Lio/flutter/embedding/engine/systemchannels/RestorationChannel$2;->this$0:Lio/flutter/embedding/engine/systemchannels/RestorationChannel;

    invoke-static {v2}, Lio/flutter/embedding/engine/systemchannels/RestorationChannel;->access$200(Lio/flutter/embedding/engine/systemchannels/RestorationChannel;)Z

    move-result v2

    if-nez v2, :cond_2

    iget-object v2, p0, Lio/flutter/embedding/engine/systemchannels/RestorationChannel$2;->this$0:Lio/flutter/embedding/engine/systemchannels/RestorationChannel;

    iget-boolean v2, v2, Lio/flutter/embedding/engine/systemchannels/RestorationChannel;->waitForRestorationData:Z

    if-nez v2, :cond_1

    goto :goto_2

    .line 155
    :cond_1
    iget-object v2, p0, Lio/flutter/embedding/engine/systemchannels/RestorationChannel$2;->this$0:Lio/flutter/embedding/engine/systemchannels/RestorationChannel;

    invoke-static {v2, p2}, Lio/flutter/embedding/engine/systemchannels/RestorationChannel;->access$402(Lio/flutter/embedding/engine/systemchannels/RestorationChannel;Lio/flutter/plugin/common/MethodChannel$Result;)Lio/flutter/plugin/common/MethodChannel$Result;

    .line 157
    goto :goto_3

    .line 149
    :cond_2
    :goto_2
    iget-object v2, p0, Lio/flutter/embedding/engine/systemchannels/RestorationChannel$2;->this$0:Lio/flutter/embedding/engine/systemchannels/RestorationChannel;

    invoke-static {v2}, Lio/flutter/embedding/engine/systemchannels/RestorationChannel;->access$000(Lio/flutter/embedding/engine/systemchannels/RestorationChannel;)[B

    move-result-object v3

    invoke-static {v2, v3}, Lio/flutter/embedding/engine/systemchannels/RestorationChannel;->access$300(Lio/flutter/embedding/engine/systemchannels/RestorationChannel;[B)Ljava/util/Map;

    move-result-object v2

    invoke-interface {p2, v2}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V

    goto :goto_3

    .line 143
    :pswitch_1
    iget-object v2, p0, Lio/flutter/embedding/engine/systemchannels/RestorationChannel$2;->this$0:Lio/flutter/embedding/engine/systemchannels/RestorationChannel;

    move-object v3, v1

    check-cast v3, [B

    invoke-static {v2, v3}, Lio/flutter/embedding/engine/systemchannels/RestorationChannel;->access$002(Lio/flutter/embedding/engine/systemchannels/RestorationChannel;[B)[B

    .line 144
    const/4 v2, 0x0

    invoke-interface {p2, v2}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V

    .line 145
    nop

    .line 162
    :goto_3
    return-void

    nop

    :sswitch_data_0
    .sparse-switch
        0x18f56 -> :sswitch_1
        0x1b30f -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
