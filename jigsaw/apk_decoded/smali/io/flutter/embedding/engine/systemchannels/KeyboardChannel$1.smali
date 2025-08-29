.class Lio/flutter/embedding/engine/systemchannels/KeyboardChannel$1;
.super Ljava/lang/Object;
.source "KeyboardChannel.java"

# interfaces
.implements Lio/flutter/plugin/common/MethodChannel$MethodCallHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/embedding/engine/systemchannels/KeyboardChannel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field pressedState:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Long;",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lio/flutter/embedding/engine/systemchannels/KeyboardChannel;


# direct methods
.method constructor <init>(Lio/flutter/embedding/engine/systemchannels/KeyboardChannel;)V
    .locals 1
    .param p1, "this$0"    # Lio/flutter/embedding/engine/systemchannels/KeyboardChannel;

    .line 27
    iput-object p1, p0, Lio/flutter/embedding/engine/systemchannels/KeyboardChannel$1;->this$0:Lio/flutter/embedding/engine/systemchannels/KeyboardChannel;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lio/flutter/embedding/engine/systemchannels/KeyboardChannel$1;->pressedState:Ljava/util/Map;

    return-void
.end method


# virtual methods
.method public onMethodCall(Lio/flutter/plugin/common/MethodCall;Lio/flutter/plugin/common/MethodChannel$Result;)V
    .locals 4
    .param p1, "call"    # Lio/flutter/plugin/common/MethodCall;
    .param p2, "result"    # Lio/flutter/plugin/common/MethodChannel$Result;

    .line 32
    iget-object v0, p0, Lio/flutter/embedding/engine/systemchannels/KeyboardChannel$1;->this$0:Lio/flutter/embedding/engine/systemchannels/KeyboardChannel;

    invoke-static {v0}, Lio/flutter/embedding/engine/systemchannels/KeyboardChannel;->access$000(Lio/flutter/embedding/engine/systemchannels/KeyboardChannel;)Lio/flutter/embedding/engine/systemchannels/KeyboardChannel$KeyboardMethodHandler;

    move-result-object v0

    if-nez v0, :cond_0

    .line 35
    iget-object v0, p0, Lio/flutter/embedding/engine/systemchannels/KeyboardChannel$1;->pressedState:Ljava/util/Map;

    invoke-interface {p2, v0}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V

    goto :goto_3

    .line 37
    :cond_0
    iget-object v0, p1, Lio/flutter/plugin/common/MethodCall;->method:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    :cond_1
    goto :goto_0

    :pswitch_0
    const-string v1, "getKeyboardState"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x0

    goto :goto_1

    :goto_0
    const/4 v0, -0x1

    :goto_1
    packed-switch v0, :pswitch_data_1

    .line 47
    invoke-interface {p2}, Lio/flutter/plugin/common/MethodChannel$Result;->notImplemented()V

    goto :goto_3

    .line 40
    :pswitch_1
    :try_start_0
    iget-object v0, p0, Lio/flutter/embedding/engine/systemchannels/KeyboardChannel$1;->this$0:Lio/flutter/embedding/engine/systemchannels/KeyboardChannel;

    invoke-static {v0}, Lio/flutter/embedding/engine/systemchannels/KeyboardChannel;->access$000(Lio/flutter/embedding/engine/systemchannels/KeyboardChannel;)Lio/flutter/embedding/engine/systemchannels/KeyboardChannel$KeyboardMethodHandler;

    move-result-object v0

    invoke-interface {v0}, Lio/flutter/embedding/engine/systemchannels/KeyboardChannel$KeyboardMethodHandler;->getKeyboardState()Ljava/util/Map;

    move-result-object v0

    iput-object v0, p0, Lio/flutter/embedding/engine/systemchannels/KeyboardChannel$1;->pressedState:Ljava/util/Map;
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 43
    goto :goto_2

    .line 41
    :catch_0
    move-exception v0

    .line 42
    .local v0, "exception":Ljava/lang/IllegalStateException;
    invoke-virtual {v0}, Ljava/lang/IllegalStateException;->getMessage()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    const-string v3, "error"

    invoke-interface {p2, v3, v1, v2}, Lio/flutter/plugin/common/MethodChannel$Result;->error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 44
    .end local v0    # "exception":Ljava/lang/IllegalStateException;
    :goto_2
    iget-object v0, p0, Lio/flutter/embedding/engine/systemchannels/KeyboardChannel$1;->pressedState:Ljava/util/Map;

    invoke-interface {p2, v0}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V

    .line 45
    nop

    .line 51
    :goto_3
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x3f607534
        :pswitch_0
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x0
        :pswitch_1
    .end packed-switch
.end method
