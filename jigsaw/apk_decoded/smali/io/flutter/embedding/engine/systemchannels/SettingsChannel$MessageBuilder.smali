.class public Lio/flutter/embedding/engine/systemchannels/SettingsChannel$MessageBuilder;
.super Ljava/lang/Object;
.source "SettingsChannel.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/embedding/engine/systemchannels/SettingsChannel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "MessageBuilder"
.end annotation


# instance fields
.field private final channel:Lio/flutter/plugin/common/BasicMessageChannel;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/flutter/plugin/common/BasicMessageChannel<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private displayMetrics:Landroid/util/DisplayMetrics;

.field private message:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lio/flutter/plugin/common/BasicMessageChannel;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/flutter/plugin/common/BasicMessageChannel<",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 63
    .local p1, "channel":Lio/flutter/plugin/common/BasicMessageChannel;, "Lio/flutter/plugin/common/BasicMessageChannel<Ljava/lang/Object;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 60
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lio/flutter/embedding/engine/systemchannels/SettingsChannel$MessageBuilder;->message:Ljava/util/Map;

    .line 64
    iput-object p1, p0, Lio/flutter/embedding/engine/systemchannels/SettingsChannel$MessageBuilder;->channel:Lio/flutter/plugin/common/BasicMessageChannel;

    .line 65
    return-void
.end method


# virtual methods
.method public send()V
    .locals 6

    .line 105
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Sending message: \ntextScaleFactor: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lio/flutter/embedding/engine/systemchannels/SettingsChannel$MessageBuilder;->message:Ljava/util/Map;

    .line 109
    const-string v2, "textScaleFactor"

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\nalwaysUse24HourFormat: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lio/flutter/embedding/engine/systemchannels/SettingsChannel$MessageBuilder;->message:Ljava/util/Map;

    .line 112
    const-string v2, "alwaysUse24HourFormat"

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\nplatformBrightness: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lio/flutter/embedding/engine/systemchannels/SettingsChannel$MessageBuilder;->message:Ljava/util/Map;

    .line 115
    const-string v2, "platformBrightness"

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 105
    const-string v1, "SettingsChannel"

    invoke-static {v1, v0}, Lio/flutter/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 116
    iget-object v0, p0, Lio/flutter/embedding/engine/systemchannels/SettingsChannel$MessageBuilder;->displayMetrics:Landroid/util/DisplayMetrics;

    .line 117
    .local v0, "metrics":Landroid/util/DisplayMetrics;
    invoke-static {}, Lio/flutter/embedding/engine/systemchannels/SettingsChannel;->hasNonlinearTextScalingSupport()Z

    move-result v1

    if-eqz v1, :cond_1

    if-nez v0, :cond_0

    goto :goto_0

    .line 121
    :cond_0
    new-instance v1, Lio/flutter/embedding/engine/systemchannels/SettingsChannel$ConfigurationQueue$SentConfiguration;

    invoke-direct {v1, v0}, Lio/flutter/embedding/engine/systemchannels/SettingsChannel$ConfigurationQueue$SentConfiguration;-><init>(Landroid/util/DisplayMetrics;)V

    .line 124
    .local v1, "sentConfiguration":Lio/flutter/embedding/engine/systemchannels/SettingsChannel$ConfigurationQueue$SentConfiguration;
    invoke-static {}, Lio/flutter/embedding/engine/systemchannels/SettingsChannel;->access$100()Lio/flutter/embedding/engine/systemchannels/SettingsChannel$ConfigurationQueue;

    move-result-object v2

    invoke-virtual {v2, v1}, Lio/flutter/embedding/engine/systemchannels/SettingsChannel$ConfigurationQueue;->enqueueConfiguration(Lio/flutter/embedding/engine/systemchannels/SettingsChannel$ConfigurationQueue$SentConfiguration;)Lio/flutter/plugin/common/BasicMessageChannel$Reply;

    move-result-object v2

    .line 125
    .local v2, "deleteCallback":Lio/flutter/plugin/common/BasicMessageChannel$Reply;
    iget-object v3, p0, Lio/flutter/embedding/engine/systemchannels/SettingsChannel$MessageBuilder;->message:Ljava/util/Map;

    iget v4, v1, Lio/flutter/embedding/engine/systemchannels/SettingsChannel$ConfigurationQueue$SentConfiguration;->generationNumber:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const-string v5, "configurationId"

    invoke-interface {v3, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 126
    iget-object v3, p0, Lio/flutter/embedding/engine/systemchannels/SettingsChannel$MessageBuilder;->channel:Lio/flutter/plugin/common/BasicMessageChannel;

    iget-object v4, p0, Lio/flutter/embedding/engine/systemchannels/SettingsChannel$MessageBuilder;->message:Ljava/util/Map;

    invoke-virtual {v3, v4, v2}, Lio/flutter/plugin/common/BasicMessageChannel;->send(Ljava/lang/Object;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V

    .line 127
    return-void

    .line 118
    .end local v1    # "sentConfiguration":Lio/flutter/embedding/engine/systemchannels/SettingsChannel$ConfigurationQueue$SentConfiguration;
    .end local v2    # "deleteCallback":Lio/flutter/plugin/common/BasicMessageChannel$Reply;
    :cond_1
    :goto_0
    iget-object v1, p0, Lio/flutter/embedding/engine/systemchannels/SettingsChannel$MessageBuilder;->channel:Lio/flutter/plugin/common/BasicMessageChannel;

    iget-object v2, p0, Lio/flutter/embedding/engine/systemchannels/SettingsChannel$MessageBuilder;->message:Ljava/util/Map;

    invoke-virtual {v1, v2}, Lio/flutter/plugin/common/BasicMessageChannel;->send(Ljava/lang/Object;)V

    .line 119
    return-void
.end method

.method public setBrieflyShowPassword(Z)Lio/flutter/embedding/engine/systemchannels/SettingsChannel$MessageBuilder;
    .locals 3
    .param p1, "brieflyShowPassword"    # Z

    .line 88
    iget-object v0, p0, Lio/flutter/embedding/engine/systemchannels/SettingsChannel$MessageBuilder;->message:Ljava/util/Map;

    const-string v1, "brieflyShowPassword"

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 89
    return-object p0
.end method

.method public setDisplayMetrics(Landroid/util/DisplayMetrics;)Lio/flutter/embedding/engine/systemchannels/SettingsChannel$MessageBuilder;
    .locals 0
    .param p1, "displayMetrics"    # Landroid/util/DisplayMetrics;

    .line 69
    iput-object p1, p0, Lio/flutter/embedding/engine/systemchannels/SettingsChannel$MessageBuilder;->displayMetrics:Landroid/util/DisplayMetrics;

    .line 70
    return-object p0
.end method

.method public setNativeSpellCheckServiceDefined(Z)Lio/flutter/embedding/engine/systemchannels/SettingsChannel$MessageBuilder;
    .locals 3
    .param p1, "nativeSpellCheckServiceDefined"    # Z

    .line 82
    iget-object v0, p0, Lio/flutter/embedding/engine/systemchannels/SettingsChannel$MessageBuilder;->message:Ljava/util/Map;

    const-string v1, "nativeSpellCheckServiceDefined"

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 83
    return-object p0
.end method

.method public setPlatformBrightness(Lio/flutter/embedding/engine/systemchannels/SettingsChannel$PlatformBrightness;)Lio/flutter/embedding/engine/systemchannels/SettingsChannel$MessageBuilder;
    .locals 3
    .param p1, "brightness"    # Lio/flutter/embedding/engine/systemchannels/SettingsChannel$PlatformBrightness;

    .line 100
    iget-object v0, p0, Lio/flutter/embedding/engine/systemchannels/SettingsChannel$MessageBuilder;->message:Ljava/util/Map;

    const-string v1, "platformBrightness"

    iget-object v2, p1, Lio/flutter/embedding/engine/systemchannels/SettingsChannel$PlatformBrightness;->name:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 101
    return-object p0
.end method

.method public setTextScaleFactor(F)Lio/flutter/embedding/engine/systemchannels/SettingsChannel$MessageBuilder;
    .locals 3
    .param p1, "textScaleFactor"    # F

    .line 75
    iget-object v0, p0, Lio/flutter/embedding/engine/systemchannels/SettingsChannel$MessageBuilder;->message:Ljava/util/Map;

    const-string v1, "textScaleFactor"

    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 76
    return-object p0
.end method

.method public setUse24HourFormat(Z)Lio/flutter/embedding/engine/systemchannels/SettingsChannel$MessageBuilder;
    .locals 3
    .param p1, "use24HourFormat"    # Z

    .line 94
    iget-object v0, p0, Lio/flutter/embedding/engine/systemchannels/SettingsChannel$MessageBuilder;->message:Ljava/util/Map;

    const-string v1, "alwaysUse24HourFormat"

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 95
    return-object p0
.end method
