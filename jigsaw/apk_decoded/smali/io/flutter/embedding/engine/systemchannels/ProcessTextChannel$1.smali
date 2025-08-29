.class Lio/flutter/embedding/engine/systemchannels/ProcessTextChannel$1;
.super Ljava/lang/Object;
.source "ProcessTextChannel.java"

# interfaces
.implements Lio/flutter/plugin/common/MethodChannel$MethodCallHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/embedding/engine/systemchannels/ProcessTextChannel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lio/flutter/embedding/engine/systemchannels/ProcessTextChannel;


# direct methods
.method constructor <init>(Lio/flutter/embedding/engine/systemchannels/ProcessTextChannel;)V
    .locals 0
    .param p1, "this$0"    # Lio/flutter/embedding/engine/systemchannels/ProcessTextChannel;

    .line 52
    iput-object p1, p0, Lio/flutter/embedding/engine/systemchannels/ProcessTextChannel$1;->this$0:Lio/flutter/embedding/engine/systemchannels/ProcessTextChannel;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onMethodCall(Lio/flutter/plugin/common/MethodCall;Lio/flutter/plugin/common/MethodChannel$Result;)V
    .locals 9
    .param p1, "call"    # Lio/flutter/plugin/common/MethodCall;
    .param p2, "result"    # Lio/flutter/plugin/common/MethodChannel$Result;

    .line 55
    iget-object v0, p0, Lio/flutter/embedding/engine/systemchannels/ProcessTextChannel$1;->this$0:Lio/flutter/embedding/engine/systemchannels/ProcessTextChannel;

    invoke-static {v0}, Lio/flutter/embedding/engine/systemchannels/ProcessTextChannel;->access$000(Lio/flutter/embedding/engine/systemchannels/ProcessTextChannel;)Lio/flutter/embedding/engine/systemchannels/ProcessTextChannel$ProcessTextMethodHandler;

    move-result-object v0

    if-nez v0, :cond_0

    .line 56
    return-void

    .line 58
    :cond_0
    iget-object v0, p1, Lio/flutter/plugin/common/MethodCall;->method:Ljava/lang/String;

    .line 59
    .local v0, "method":Ljava/lang/String;
    iget-object v1, p1, Lio/flutter/plugin/common/MethodCall;->arguments:Ljava/lang/Object;

    .line 60
    .local v1, "args":Ljava/lang/Object;
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v2

    const/4 v3, 0x0

    const/4 v4, 0x1

    sparse-switch v2, :sswitch_data_0

    :cond_1
    goto :goto_0

    :sswitch_0
    const-string v2, "ProcessText.queryTextActions"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    const/4 v2, 0x0

    goto :goto_1

    :sswitch_1
    const-string v2, "ProcessText.processTextAction"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    const/4 v2, 0x1

    goto :goto_1

    :goto_0
    const/4 v2, -0x1

    :goto_1
    const/4 v5, 0x0

    const-string v6, "error"

    packed-switch v2, :pswitch_data_0

    .line 81
    invoke-interface {p2}, Lio/flutter/plugin/common/MethodChannel$Result;->notImplemented()V

    goto :goto_2

    .line 71
    :pswitch_0
    :try_start_0
    move-object v2, v1

    check-cast v2, Ljava/util/ArrayList;

    .line 72
    .local v2, "argumentList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 73
    .local v3, "id":Ljava/lang/String;
    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 74
    .local v4, "text":Ljava/lang/String;
    const/4 v7, 0x2

    invoke-virtual {v2, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Boolean;

    invoke-virtual {v7}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v7

    .line 75
    .local v7, "readOnly":Z
    iget-object v8, p0, Lio/flutter/embedding/engine/systemchannels/ProcessTextChannel$1;->this$0:Lio/flutter/embedding/engine/systemchannels/ProcessTextChannel;

    invoke-static {v8}, Lio/flutter/embedding/engine/systemchannels/ProcessTextChannel;->access$000(Lio/flutter/embedding/engine/systemchannels/ProcessTextChannel;)Lio/flutter/embedding/engine/systemchannels/ProcessTextChannel$ProcessTextMethodHandler;

    move-result-object v8

    invoke-interface {v8, v3, v4, v7, p2}, Lio/flutter/embedding/engine/systemchannels/ProcessTextChannel$ProcessTextMethodHandler;->processTextAction(Ljava/lang/String;Ljava/lang/String;ZLio/flutter/plugin/common/MethodChannel$Result;)V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 78
    .end local v2    # "argumentList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .end local v3    # "id":Ljava/lang/String;
    .end local v4    # "text":Ljava/lang/String;
    .end local v7    # "readOnly":Z
    goto :goto_2

    .line 76
    :catch_0
    move-exception v2

    .line 77
    .local v2, "exception":Ljava/lang/IllegalStateException;
    invoke-virtual {v2}, Ljava/lang/IllegalStateException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-interface {p2, v6, v3, v5}, Lio/flutter/plugin/common/MethodChannel$Result;->error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 79
    .end local v2    # "exception":Ljava/lang/IllegalStateException;
    goto :goto_2

    .line 63
    :pswitch_1
    :try_start_1
    iget-object v2, p0, Lio/flutter/embedding/engine/systemchannels/ProcessTextChannel$1;->this$0:Lio/flutter/embedding/engine/systemchannels/ProcessTextChannel;

    invoke-static {v2}, Lio/flutter/embedding/engine/systemchannels/ProcessTextChannel;->access$000(Lio/flutter/embedding/engine/systemchannels/ProcessTextChannel;)Lio/flutter/embedding/engine/systemchannels/ProcessTextChannel$ProcessTextMethodHandler;

    move-result-object v2

    invoke-interface {v2}, Lio/flutter/embedding/engine/systemchannels/ProcessTextChannel$ProcessTextMethodHandler;->queryTextActions()Ljava/util/Map;

    move-result-object v2

    .line 64
    .local v2, "actions":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {p2, v2}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V
    :try_end_1
    .catch Ljava/lang/IllegalStateException; {:try_start_1 .. :try_end_1} :catch_1

    .line 67
    .end local v2    # "actions":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    goto :goto_2

    .line 65
    :catch_1
    move-exception v2

    .line 66
    .local v2, "exception":Ljava/lang/IllegalStateException;
    invoke-virtual {v2}, Ljava/lang/IllegalStateException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-interface {p2, v6, v3, v5}, Lio/flutter/plugin/common/MethodChannel$Result;->error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 68
    .end local v2    # "exception":Ljava/lang/IllegalStateException;
    nop

    .line 84
    :goto_2
    return-void

    nop

    :sswitch_data_0
    .sparse-switch
        -0x2240a7c0 -> :sswitch_1
        -0x1b966f46 -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
