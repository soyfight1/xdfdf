.class Lio/flutter/embedding/engine/systemchannels/AccessibilityChannel$1;
.super Ljava/lang/Object;
.source "AccessibilityChannel.java"

# interfaces
.implements Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/embedding/engine/systemchannels/AccessibilityChannel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler<",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lio/flutter/embedding/engine/systemchannels/AccessibilityChannel;


# direct methods
.method constructor <init>(Lio/flutter/embedding/engine/systemchannels/AccessibilityChannel;)V
    .locals 0
    .param p1, "this$0"    # Lio/flutter/embedding/engine/systemchannels/AccessibilityChannel;

    .line 28
    iput-object p1, p0, Lio/flutter/embedding/engine/systemchannels/AccessibilityChannel$1;->this$0:Lio/flutter/embedding/engine/systemchannels/AccessibilityChannel;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onMessage(Ljava/lang/Object;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V
    .locals 7
    .param p1, "message"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Lio/flutter/plugin/common/BasicMessageChannel$Reply<",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 34
    .local p2, "reply":Lio/flutter/plugin/common/BasicMessageChannel$Reply;, "Lio/flutter/plugin/common/BasicMessageChannel$Reply<Ljava/lang/Object;>;"
    iget-object v0, p0, Lio/flutter/embedding/engine/systemchannels/AccessibilityChannel$1;->this$0:Lio/flutter/embedding/engine/systemchannels/AccessibilityChannel;

    invoke-static {v0}, Lio/flutter/embedding/engine/systemchannels/AccessibilityChannel;->access$000(Lio/flutter/embedding/engine/systemchannels/AccessibilityChannel;)Lio/flutter/embedding/engine/systemchannels/AccessibilityChannel$AccessibilityMessageHandler;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 35
    invoke-interface {p2, v1}, Lio/flutter/plugin/common/BasicMessageChannel$Reply;->reply(Ljava/lang/Object;)V

    .line 36
    return-void

    .line 40
    :cond_0
    move-object v0, p1

    check-cast v0, Ljava/util/HashMap;

    .line 41
    .local v0, "annotatedEvent":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v2, "type"

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 43
    .local v2, "type":Ljava/lang/String;
    const-string v3, "data"

    invoke-virtual {v0, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/HashMap;

    .line 45
    .local v3, "data":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Received "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " message."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const-string v5, "AccessibilityChannel"

    invoke-static {v5, v4}, Lio/flutter/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 46
    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v4

    sparse-switch v4, :sswitch_data_0

    :cond_1
    goto :goto_0

    :sswitch_0
    const-string v4, "longPress"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    const/4 v4, 0x2

    goto :goto_1

    :sswitch_1
    const-string v4, "focus"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    const/4 v4, 0x3

    goto :goto_1

    :sswitch_2
    const-string v4, "tap"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    const/4 v4, 0x1

    goto :goto_1

    :sswitch_3
    const-string v4, "announce"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    const/4 v4, 0x0

    goto :goto_1

    :sswitch_4
    const-string v4, "tooltip"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    const/4 v4, 0x4

    goto :goto_1

    :goto_0
    const/4 v4, -0x1

    :goto_1
    const-string v5, "message"

    const-string v6, "nodeId"

    packed-switch v4, :pswitch_data_0

    goto :goto_2

    .line 79
    :pswitch_0
    invoke-virtual {v3, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 80
    .local v4, "tooltipMessage":Ljava/lang/String;
    if-eqz v4, :cond_2

    .line 81
    iget-object v5, p0, Lio/flutter/embedding/engine/systemchannels/AccessibilityChannel$1;->this$0:Lio/flutter/embedding/engine/systemchannels/AccessibilityChannel;

    invoke-static {v5}, Lio/flutter/embedding/engine/systemchannels/AccessibilityChannel;->access$000(Lio/flutter/embedding/engine/systemchannels/AccessibilityChannel;)Lio/flutter/embedding/engine/systemchannels/AccessibilityChannel$AccessibilityMessageHandler;

    move-result-object v5

    invoke-interface {v5, v4}, Lio/flutter/embedding/engine/systemchannels/AccessibilityChannel$AccessibilityMessageHandler;->onTooltip(Ljava/lang/String;)V

    goto :goto_2

    .line 71
    .end local v4    # "tooltipMessage":Ljava/lang/String;
    :pswitch_1
    invoke-virtual {v0, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    .line 72
    .local v4, "nodeId":Ljava/lang/Integer;
    if-eqz v4, :cond_2

    .line 73
    iget-object v5, p0, Lio/flutter/embedding/engine/systemchannels/AccessibilityChannel$1;->this$0:Lio/flutter/embedding/engine/systemchannels/AccessibilityChannel;

    invoke-static {v5}, Lio/flutter/embedding/engine/systemchannels/AccessibilityChannel;->access$000(Lio/flutter/embedding/engine/systemchannels/AccessibilityChannel;)Lio/flutter/embedding/engine/systemchannels/AccessibilityChannel$AccessibilityMessageHandler;

    move-result-object v5

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v6

    invoke-interface {v5, v6}, Lio/flutter/embedding/engine/systemchannels/AccessibilityChannel$AccessibilityMessageHandler;->onFocus(I)V

    goto :goto_2

    .line 63
    .end local v4    # "nodeId":Ljava/lang/Integer;
    :pswitch_2
    invoke-virtual {v0, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    .line 64
    .restart local v4    # "nodeId":Ljava/lang/Integer;
    if-eqz v4, :cond_2

    .line 65
    iget-object v5, p0, Lio/flutter/embedding/engine/systemchannels/AccessibilityChannel$1;->this$0:Lio/flutter/embedding/engine/systemchannels/AccessibilityChannel;

    invoke-static {v5}, Lio/flutter/embedding/engine/systemchannels/AccessibilityChannel;->access$000(Lio/flutter/embedding/engine/systemchannels/AccessibilityChannel;)Lio/flutter/embedding/engine/systemchannels/AccessibilityChannel$AccessibilityMessageHandler;

    move-result-object v5

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v6

    invoke-interface {v5, v6}, Lio/flutter/embedding/engine/systemchannels/AccessibilityChannel$AccessibilityMessageHandler;->onLongPress(I)V

    goto :goto_2

    .line 55
    .end local v4    # "nodeId":Ljava/lang/Integer;
    :pswitch_3
    invoke-virtual {v0, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    .line 56
    .restart local v4    # "nodeId":Ljava/lang/Integer;
    if-eqz v4, :cond_2

    .line 57
    iget-object v5, p0, Lio/flutter/embedding/engine/systemchannels/AccessibilityChannel$1;->this$0:Lio/flutter/embedding/engine/systemchannels/AccessibilityChannel;

    invoke-static {v5}, Lio/flutter/embedding/engine/systemchannels/AccessibilityChannel;->access$000(Lio/flutter/embedding/engine/systemchannels/AccessibilityChannel;)Lio/flutter/embedding/engine/systemchannels/AccessibilityChannel$AccessibilityMessageHandler;

    move-result-object v5

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v6

    invoke-interface {v5, v6}, Lio/flutter/embedding/engine/systemchannels/AccessibilityChannel$AccessibilityMessageHandler;->onTap(I)V

    goto :goto_2

    .line 48
    .end local v4    # "nodeId":Ljava/lang/Integer;
    :pswitch_4
    invoke-virtual {v3, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 49
    .local v4, "announceMessage":Ljava/lang/String;
    if-eqz v4, :cond_2

    .line 50
    iget-object v5, p0, Lio/flutter/embedding/engine/systemchannels/AccessibilityChannel$1;->this$0:Lio/flutter/embedding/engine/systemchannels/AccessibilityChannel;

    invoke-static {v5}, Lio/flutter/embedding/engine/systemchannels/AccessibilityChannel;->access$000(Lio/flutter/embedding/engine/systemchannels/AccessibilityChannel;)Lio/flutter/embedding/engine/systemchannels/AccessibilityChannel$AccessibilityMessageHandler;

    move-result-object v5

    invoke-interface {v5, v4}, Lio/flutter/embedding/engine/systemchannels/AccessibilityChannel$AccessibilityMessageHandler;->announce(Ljava/lang/String;)V

    .line 86
    .end local v4    # "announceMessage":Ljava/lang/String;
    :cond_2
    :goto_2
    invoke-interface {p2, v1}, Lio/flutter/plugin/common/BasicMessageChannel$Reply;->reply(Ljava/lang/Object;)V

    .line 87
    return-void

    :sswitch_data_0
    .sparse-switch
        -0x43f42ffd -> :sswitch_4
        -0x26b86b97 -> :sswitch_3
        0x1bfa3 -> :sswitch_2
        0x5d154d8 -> :sswitch_1
        0x6ce9b27 -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
