.class Lio/flutter/embedding/engine/systemchannels/LocalizationChannel$1;
.super Ljava/lang/Object;
.source "LocalizationChannel.java"

# interfaces
.implements Lio/flutter/plugin/common/MethodChannel$MethodCallHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/embedding/engine/systemchannels/LocalizationChannel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lio/flutter/embedding/engine/systemchannels/LocalizationChannel;


# direct methods
.method constructor <init>(Lio/flutter/embedding/engine/systemchannels/LocalizationChannel;)V
    .locals 0
    .param p1, "this$0"    # Lio/flutter/embedding/engine/systemchannels/LocalizationChannel;

    .line 30
    iput-object p1, p0, Lio/flutter/embedding/engine/systemchannels/LocalizationChannel$1;->this$0:Lio/flutter/embedding/engine/systemchannels/LocalizationChannel;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onMethodCall(Lio/flutter/plugin/common/MethodCall;Lio/flutter/plugin/common/MethodChannel$Result;)V
    .locals 6
    .param p1, "call"    # Lio/flutter/plugin/common/MethodCall;
    .param p2, "result"    # Lio/flutter/plugin/common/MethodChannel$Result;

    .line 33
    const-string v0, "locale"

    iget-object v1, p0, Lio/flutter/embedding/engine/systemchannels/LocalizationChannel$1;->this$0:Lio/flutter/embedding/engine/systemchannels/LocalizationChannel;

    invoke-static {v1}, Lio/flutter/embedding/engine/systemchannels/LocalizationChannel;->access$000(Lio/flutter/embedding/engine/systemchannels/LocalizationChannel;)Lio/flutter/embedding/engine/systemchannels/LocalizationChannel$LocalizationMessageHandler;

    move-result-object v1

    if-nez v1, :cond_0

    .line 36
    return-void

    .line 39
    :cond_0
    iget-object v1, p1, Lio/flutter/plugin/common/MethodCall;->method:Ljava/lang/String;

    .line 40
    .local v1, "method":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v2

    packed-switch v2, :pswitch_data_0

    :cond_1
    goto :goto_0

    :pswitch_0
    const-string v2, "Localization.getStringResource"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    const/4 v2, 0x0

    goto :goto_1

    :goto_0
    const/4 v2, -0x1

    :goto_1
    packed-switch v2, :pswitch_data_1

    .line 55
    invoke-interface {p2}, Lio/flutter/plugin/common/MethodChannel$Result;->notImplemented()V

    goto :goto_2

    .line 42
    :pswitch_1
    invoke-virtual {p1}, Lio/flutter/plugin/common/MethodCall;->arguments()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/json/JSONObject;

    .line 44
    .local v2, "arguments":Lorg/json/JSONObject;
    :try_start_0
    const-string v3, "key"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 45
    .local v3, "key":Ljava/lang/String;
    const/4 v4, 0x0

    .line 46
    .local v4, "localeString":Ljava/lang/String;
    invoke-virtual {v2, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 47
    invoke-virtual {v2, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    move-object v4, v0

    .line 49
    :cond_2
    iget-object v0, p0, Lio/flutter/embedding/engine/systemchannels/LocalizationChannel$1;->this$0:Lio/flutter/embedding/engine/systemchannels/LocalizationChannel;

    invoke-static {v0}, Lio/flutter/embedding/engine/systemchannels/LocalizationChannel;->access$000(Lio/flutter/embedding/engine/systemchannels/LocalizationChannel;)Lio/flutter/embedding/engine/systemchannels/LocalizationChannel$LocalizationMessageHandler;

    move-result-object v0

    invoke-interface {v0, v3, v4}, Lio/flutter/embedding/engine/systemchannels/LocalizationChannel$LocalizationMessageHandler;->getStringResource(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-interface {p2, v0}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 52
    .end local v3    # "key":Ljava/lang/String;
    .end local v4    # "localeString":Ljava/lang/String;
    goto :goto_2

    .line 50
    :catch_0
    move-exception v0

    .line 51
    .local v0, "exception":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    const-string v5, "error"

    invoke-interface {p2, v5, v3, v4}, Lio/flutter/plugin/common/MethodChannel$Result;->error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 53
    .end local v0    # "exception":Lorg/json/JSONException;
    nop

    .line 58
    .end local v2    # "arguments":Lorg/json/JSONObject;
    :goto_2
    return-void

    :pswitch_data_0
    .packed-switch -0xf776bc0
        :pswitch_0
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x0
        :pswitch_1
    .end packed-switch
.end method
