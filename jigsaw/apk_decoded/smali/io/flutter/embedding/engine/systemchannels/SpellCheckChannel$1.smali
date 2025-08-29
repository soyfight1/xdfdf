.class Lio/flutter/embedding/engine/systemchannels/SpellCheckChannel$1;
.super Ljava/lang/Object;
.source "SpellCheckChannel.java"

# interfaces
.implements Lio/flutter/plugin/common/MethodChannel$MethodCallHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/embedding/engine/systemchannels/SpellCheckChannel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lio/flutter/embedding/engine/systemchannels/SpellCheckChannel;


# direct methods
.method constructor <init>(Lio/flutter/embedding/engine/systemchannels/SpellCheckChannel;)V
    .locals 0
    .param p1, "this$0"    # Lio/flutter/embedding/engine/systemchannels/SpellCheckChannel;

    .line 45
    iput-object p1, p0, Lio/flutter/embedding/engine/systemchannels/SpellCheckChannel$1;->this$0:Lio/flutter/embedding/engine/systemchannels/SpellCheckChannel;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onMethodCall(Lio/flutter/plugin/common/MethodCall;Lio/flutter/plugin/common/MethodChannel$Result;)V
    .locals 6
    .param p1, "call"    # Lio/flutter/plugin/common/MethodCall;
    .param p2, "result"    # Lio/flutter/plugin/common/MethodChannel$Result;

    .line 48
    iget-object v0, p0, Lio/flutter/embedding/engine/systemchannels/SpellCheckChannel$1;->this$0:Lio/flutter/embedding/engine/systemchannels/SpellCheckChannel;

    invoke-static {v0}, Lio/flutter/embedding/engine/systemchannels/SpellCheckChannel;->access$000(Lio/flutter/embedding/engine/systemchannels/SpellCheckChannel;)Lio/flutter/embedding/engine/systemchannels/SpellCheckChannel$SpellCheckMethodHandler;

    move-result-object v0

    const-string v1, "SpellCheckChannel"

    if-nez v0, :cond_0

    .line 49
    const-string v0, "No SpellCheckeMethodHandler registered, call not forwarded to spell check API."

    invoke-static {v1, v0}, Lio/flutter/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 52
    return-void

    .line 54
    :cond_0
    iget-object v0, p1, Lio/flutter/plugin/common/MethodCall;->method:Ljava/lang/String;

    .line 55
    .local v0, "method":Ljava/lang/String;
    iget-object v2, p1, Lio/flutter/plugin/common/MethodCall;->arguments:Ljava/lang/Object;

    .line 56
    .local v2, "args":Ljava/lang/Object;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Received \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\' message."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3}, Lio/flutter/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 57
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v1

    const/4 v3, 0x0

    packed-switch v1, :pswitch_data_0

    :cond_1
    goto :goto_0

    :pswitch_0
    const-string v1, "SpellCheck.initiateSpellCheck"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 v1, 0x0

    goto :goto_1

    :goto_0
    const/4 v1, -0x1

    :goto_1
    packed-switch v1, :pswitch_data_1

    .line 69
    invoke-interface {p2}, Lio/flutter/plugin/common/MethodChannel$Result;->notImplemented()V

    goto :goto_2

    .line 60
    :pswitch_1
    :try_start_0
    move-object v1, v2

    check-cast v1, Ljava/util/ArrayList;

    .line 61
    .local v1, "argumentList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 62
    .local v3, "locale":Ljava/lang/String;
    const/4 v4, 0x1

    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 63
    .local v4, "text":Ljava/lang/String;
    iget-object v5, p0, Lio/flutter/embedding/engine/systemchannels/SpellCheckChannel$1;->this$0:Lio/flutter/embedding/engine/systemchannels/SpellCheckChannel;

    invoke-static {v5}, Lio/flutter/embedding/engine/systemchannels/SpellCheckChannel;->access$000(Lio/flutter/embedding/engine/systemchannels/SpellCheckChannel;)Lio/flutter/embedding/engine/systemchannels/SpellCheckChannel$SpellCheckMethodHandler;

    move-result-object v5

    invoke-interface {v5, v3, v4, p2}, Lio/flutter/embedding/engine/systemchannels/SpellCheckChannel$SpellCheckMethodHandler;->initiateSpellCheck(Ljava/lang/String;Ljava/lang/String;Lio/flutter/plugin/common/MethodChannel$Result;)V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 66
    .end local v1    # "argumentList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v3    # "locale":Ljava/lang/String;
    .end local v4    # "text":Ljava/lang/String;
    goto :goto_2

    .line 64
    :catch_0
    move-exception v1

    .line 65
    .local v1, "exception":Ljava/lang/IllegalStateException;
    invoke-virtual {v1}, Ljava/lang/IllegalStateException;->getMessage()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    const-string v5, "error"

    invoke-interface {p2, v5, v3, v4}, Lio/flutter/plugin/common/MethodChannel$Result;->error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 67
    .end local v1    # "exception":Ljava/lang/IllegalStateException;
    nop

    .line 72
    :goto_2
    return-void

    :pswitch_data_0
    .packed-switch -0x6891f3f9
        :pswitch_0
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x0
        :pswitch_1
    .end packed-switch
.end method
