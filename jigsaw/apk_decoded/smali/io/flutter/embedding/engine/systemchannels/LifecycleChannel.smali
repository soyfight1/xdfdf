.class public Lio/flutter/embedding/engine/systemchannels/LifecycleChannel;
.super Ljava/lang/Object;
.source "LifecycleChannel.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/flutter/embedding/engine/systemchannels/LifecycleChannel$AppLifecycleState;
    }
.end annotation


# static fields
.field private static final CHANNEL_NAME:Ljava/lang/String; = "flutter/lifecycle"

.field private static final TAG:Ljava/lang/String; = "LifecycleChannel"


# instance fields
.field private final channel:Lio/flutter/plugin/common/BasicMessageChannel;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/flutter/plugin/common/BasicMessageChannel<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private lastAndroidState:Lio/flutter/embedding/engine/systemchannels/LifecycleChannel$AppLifecycleState;

.field private lastFlutterState:Lio/flutter/embedding/engine/systemchannels/LifecycleChannel$AppLifecycleState;

.field private lastFocus:Z


# direct methods
.method public constructor <init>(Lio/flutter/embedding/engine/dart/DartExecutor;)V
    .locals 3
    .param p1, "dartExecutor"    # Lio/flutter/embedding/engine/dart/DartExecutor;

    .line 46
    new-instance v0, Lio/flutter/plugin/common/BasicMessageChannel;

    const-string v1, "flutter/lifecycle"

    sget-object v2, Lio/flutter/plugin/common/StringCodec;->INSTANCE:Lio/flutter/plugin/common/StringCodec;

    invoke-direct {v0, p1, v1, v2}, Lio/flutter/plugin/common/BasicMessageChannel;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;Lio/flutter/plugin/common/MessageCodec;)V

    invoke-direct {p0, v0}, Lio/flutter/embedding/engine/systemchannels/LifecycleChannel;-><init>(Lio/flutter/plugin/common/BasicMessageChannel;)V

    .line 47
    return-void
.end method

.method public constructor <init>(Lio/flutter/plugin/common/BasicMessageChannel;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/flutter/plugin/common/BasicMessageChannel<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 50
    .local p1, "channel":Lio/flutter/plugin/common/BasicMessageChannel;, "Lio/flutter/plugin/common/BasicMessageChannel<Ljava/lang/String;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    const/4 v0, 0x0

    iput-object v0, p0, Lio/flutter/embedding/engine/systemchannels/LifecycleChannel;->lastAndroidState:Lio/flutter/embedding/engine/systemchannels/LifecycleChannel$AppLifecycleState;

    .line 40
    iput-object v0, p0, Lio/flutter/embedding/engine/systemchannels/LifecycleChannel;->lastFlutterState:Lio/flutter/embedding/engine/systemchannels/LifecycleChannel$AppLifecycleState;

    .line 41
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/flutter/embedding/engine/systemchannels/LifecycleChannel;->lastFocus:Z

    .line 51
    iput-object p1, p0, Lio/flutter/embedding/engine/systemchannels/LifecycleChannel;->channel:Lio/flutter/plugin/common/BasicMessageChannel;

    .line 52
    return-void
.end method

.method private sendState(Lio/flutter/embedding/engine/systemchannels/LifecycleChannel$AppLifecycleState;Z)V
    .locals 4
    .param p1, "state"    # Lio/flutter/embedding/engine/systemchannels/LifecycleChannel$AppLifecycleState;
    .param p2, "hasFocus"    # Z

    .line 70
    iget-object v0, p0, Lio/flutter/embedding/engine/systemchannels/LifecycleChannel;->lastAndroidState:Lio/flutter/embedding/engine/systemchannels/LifecycleChannel$AppLifecycleState;

    if-ne v0, p1, :cond_0

    iget-boolean v1, p0, Lio/flutter/embedding/engine/systemchannels/LifecycleChannel;->lastFocus:Z

    if-ne p2, v1, :cond_0

    .line 72
    return-void

    .line 74
    :cond_0
    if-nez p1, :cond_1

    if-nez v0, :cond_1

    .line 79
    iput-boolean p2, p0, Lio/flutter/embedding/engine/systemchannels/LifecycleChannel;->lastFocus:Z

    .line 80
    return-void

    .line 82
    :cond_1
    const/4 v0, 0x0

    .line 83
    .local v0, "newState":Lio/flutter/embedding/engine/systemchannels/LifecycleChannel$AppLifecycleState;
    sget-object v1, Lio/flutter/embedding/engine/systemchannels/LifecycleChannel$1;->$SwitchMap$io$flutter$embedding$engine$systemchannels$LifecycleChannel$AppLifecycleState:[I

    invoke-virtual {p1}, Lio/flutter/embedding/engine/systemchannels/LifecycleChannel$AppLifecycleState;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_0

    goto :goto_1

    .line 95
    :pswitch_0
    move-object v0, p1

    goto :goto_1

    .line 89
    :pswitch_1
    if-eqz p2, :cond_2

    sget-object v1, Lio/flutter/embedding/engine/systemchannels/LifecycleChannel$AppLifecycleState;->RESUMED:Lio/flutter/embedding/engine/systemchannels/LifecycleChannel$AppLifecycleState;

    goto :goto_0

    :cond_2
    sget-object v1, Lio/flutter/embedding/engine/systemchannels/LifecycleChannel$AppLifecycleState;->INACTIVE:Lio/flutter/embedding/engine/systemchannels/LifecycleChannel$AppLifecycleState;

    :goto_0
    move-object v0, v1

    .line 90
    nop

    .line 100
    :goto_1
    iput-object p1, p0, Lio/flutter/embedding/engine/systemchannels/LifecycleChannel;->lastAndroidState:Lio/flutter/embedding/engine/systemchannels/LifecycleChannel$AppLifecycleState;

    .line 101
    iput-boolean p2, p0, Lio/flutter/embedding/engine/systemchannels/LifecycleChannel;->lastFocus:Z

    .line 102
    iget-object v1, p0, Lio/flutter/embedding/engine/systemchannels/LifecycleChannel;->lastFlutterState:Lio/flutter/embedding/engine/systemchannels/LifecycleChannel$AppLifecycleState;

    if-ne v0, v1, :cond_3

    .line 104
    return-void

    .line 106
    :cond_3
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "AppLifecycleState."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Lio/flutter/embedding/engine/systemchannels/LifecycleChannel$AppLifecycleState;->name()Ljava/lang/String;

    move-result-object v2

    sget-object v3, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v2, v3}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 107
    .local v1, "message":Ljava/lang/String;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Sending "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " message."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "LifecycleChannel"

    invoke-static {v3, v2}, Lio/flutter/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 108
    iget-object v2, p0, Lio/flutter/embedding/engine/systemchannels/LifecycleChannel;->channel:Lio/flutter/plugin/common/BasicMessageChannel;

    invoke-virtual {v2, v1}, Lio/flutter/plugin/common/BasicMessageChannel;->send(Ljava/lang/Object;)V

    .line 109
    iput-object v0, p0, Lio/flutter/embedding/engine/systemchannels/LifecycleChannel;->lastFlutterState:Lio/flutter/embedding/engine/systemchannels/LifecycleChannel$AppLifecycleState;

    .line 110
    return-void

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method public aWindowIsFocused()V
    .locals 2

    .line 115
    iget-object v0, p0, Lio/flutter/embedding/engine/systemchannels/LifecycleChannel;->lastAndroidState:Lio/flutter/embedding/engine/systemchannels/LifecycleChannel$AppLifecycleState;

    const/4 v1, 0x1

    invoke-direct {p0, v0, v1}, Lio/flutter/embedding/engine/systemchannels/LifecycleChannel;->sendState(Lio/flutter/embedding/engine/systemchannels/LifecycleChannel$AppLifecycleState;Z)V

    .line 116
    return-void
.end method

.method public appIsDetached()V
    .locals 2

    .line 136
    sget-object v0, Lio/flutter/embedding/engine/systemchannels/LifecycleChannel$AppLifecycleState;->DETACHED:Lio/flutter/embedding/engine/systemchannels/LifecycleChannel$AppLifecycleState;

    iget-boolean v1, p0, Lio/flutter/embedding/engine/systemchannels/LifecycleChannel;->lastFocus:Z

    invoke-direct {p0, v0, v1}, Lio/flutter/embedding/engine/systemchannels/LifecycleChannel;->sendState(Lio/flutter/embedding/engine/systemchannels/LifecycleChannel$AppLifecycleState;Z)V

    .line 137
    return-void
.end method

.method public appIsInactive()V
    .locals 2

    .line 128
    sget-object v0, Lio/flutter/embedding/engine/systemchannels/LifecycleChannel$AppLifecycleState;->INACTIVE:Lio/flutter/embedding/engine/systemchannels/LifecycleChannel$AppLifecycleState;

    iget-boolean v1, p0, Lio/flutter/embedding/engine/systemchannels/LifecycleChannel;->lastFocus:Z

    invoke-direct {p0, v0, v1}, Lio/flutter/embedding/engine/systemchannels/LifecycleChannel;->sendState(Lio/flutter/embedding/engine/systemchannels/LifecycleChannel$AppLifecycleState;Z)V

    .line 129
    return-void
.end method

.method public appIsPaused()V
    .locals 2

    .line 132
    sget-object v0, Lio/flutter/embedding/engine/systemchannels/LifecycleChannel$AppLifecycleState;->PAUSED:Lio/flutter/embedding/engine/systemchannels/LifecycleChannel$AppLifecycleState;

    iget-boolean v1, p0, Lio/flutter/embedding/engine/systemchannels/LifecycleChannel;->lastFocus:Z

    invoke-direct {p0, v0, v1}, Lio/flutter/embedding/engine/systemchannels/LifecycleChannel;->sendState(Lio/flutter/embedding/engine/systemchannels/LifecycleChannel$AppLifecycleState;Z)V

    .line 133
    return-void
.end method

.method public appIsResumed()V
    .locals 2

    .line 124
    sget-object v0, Lio/flutter/embedding/engine/systemchannels/LifecycleChannel$AppLifecycleState;->RESUMED:Lio/flutter/embedding/engine/systemchannels/LifecycleChannel$AppLifecycleState;

    iget-boolean v1, p0, Lio/flutter/embedding/engine/systemchannels/LifecycleChannel;->lastFocus:Z

    invoke-direct {p0, v0, v1}, Lio/flutter/embedding/engine/systemchannels/LifecycleChannel;->sendState(Lio/flutter/embedding/engine/systemchannels/LifecycleChannel$AppLifecycleState;Z)V

    .line 125
    return-void
.end method

.method public noWindowsAreFocused()V
    .locals 2

    .line 120
    iget-object v0, p0, Lio/flutter/embedding/engine/systemchannels/LifecycleChannel;->lastAndroidState:Lio/flutter/embedding/engine/systemchannels/LifecycleChannel$AppLifecycleState;

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lio/flutter/embedding/engine/systemchannels/LifecycleChannel;->sendState(Lio/flutter/embedding/engine/systemchannels/LifecycleChannel$AppLifecycleState;Z)V

    .line 121
    return-void
.end method
