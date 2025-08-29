.class public Lio/flutter/embedding/android/KeyboardManager;
.super Ljava/lang/Object;
.source "KeyboardManager.java"

# interfaces
.implements Lio/flutter/plugin/editing/InputConnectionAdaptor$KeyboardDelegate;
.implements Lio/flutter/embedding/engine/systemchannels/KeyboardChannel$KeyboardMethodHandler;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/flutter/embedding/android/KeyboardManager$ViewDelegate;,
        Lio/flutter/embedding/android/KeyboardManager$Responder;,
        Lio/flutter/embedding/android/KeyboardManager$PerEventCallbackBuilder;,
        Lio/flutter/embedding/android/KeyboardManager$CharacterCombiner;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "KeyboardManager"


# instance fields
.field private final redispatchedEvents:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet<",
            "Landroid/view/KeyEvent;",
            ">;"
        }
    .end annotation
.end field

.field protected final responders:[Lio/flutter/embedding/android/KeyboardManager$Responder;

.field private final viewDelegate:Lio/flutter/embedding/android/KeyboardManager$ViewDelegate;


# direct methods
.method public constructor <init>(Lio/flutter/embedding/android/KeyboardManager$ViewDelegate;)V
    .locals 4
    .param p1, "viewDelegate"    # Lio/flutter/embedding/android/KeyboardManager$ViewDelegate;

    .line 118
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 216
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lio/flutter/embedding/android/KeyboardManager;->redispatchedEvents:Ljava/util/HashSet;

    .line 119
    iput-object p1, p0, Lio/flutter/embedding/android/KeyboardManager;->viewDelegate:Lio/flutter/embedding/android/KeyboardManager$ViewDelegate;

    .line 120
    const/4 v0, 0x2

    new-array v0, v0, [Lio/flutter/embedding/android/KeyboardManager$Responder;

    new-instance v1, Lio/flutter/embedding/android/KeyEmbedderResponder;

    .line 122
    invoke-interface {p1}, Lio/flutter/embedding/android/KeyboardManager$ViewDelegate;->getBinaryMessenger()Lio/flutter/plugin/common/BinaryMessenger;

    move-result-object v2

    invoke-direct {v1, v2}, Lio/flutter/embedding/android/KeyEmbedderResponder;-><init>(Lio/flutter/plugin/common/BinaryMessenger;)V

    const/4 v2, 0x0

    aput-object v1, v0, v2

    new-instance v1, Lio/flutter/embedding/android/KeyChannelResponder;

    new-instance v2, Lio/flutter/embedding/engine/systemchannels/KeyEventChannel;

    .line 123
    invoke-interface {p1}, Lio/flutter/embedding/android/KeyboardManager$ViewDelegate;->getBinaryMessenger()Lio/flutter/plugin/common/BinaryMessenger;

    move-result-object v3

    invoke-direct {v2, v3}, Lio/flutter/embedding/engine/systemchannels/KeyEventChannel;-><init>(Lio/flutter/plugin/common/BinaryMessenger;)V

    invoke-direct {v1, v2}, Lio/flutter/embedding/android/KeyChannelResponder;-><init>(Lio/flutter/embedding/engine/systemchannels/KeyEventChannel;)V

    const/4 v2, 0x1

    aput-object v1, v0, v2

    iput-object v0, p0, Lio/flutter/embedding/android/KeyboardManager;->responders:[Lio/flutter/embedding/android/KeyboardManager$Responder;

    .line 125
    new-instance v0, Lio/flutter/embedding/engine/systemchannels/KeyboardChannel;

    invoke-interface {p1}, Lio/flutter/embedding/android/KeyboardManager$ViewDelegate;->getBinaryMessenger()Lio/flutter/plugin/common/BinaryMessenger;

    move-result-object v1

    invoke-direct {v0, v1}, Lio/flutter/embedding/engine/systemchannels/KeyboardChannel;-><init>(Lio/flutter/plugin/common/BinaryMessenger;)V

    .line 126
    .local v0, "keyboardChannel":Lio/flutter/embedding/engine/systemchannels/KeyboardChannel;
    invoke-virtual {v0, p0}, Lio/flutter/embedding/engine/systemchannels/KeyboardChannel;->setKeyboardMethodHandler(Lio/flutter/embedding/engine/systemchannels/KeyboardChannel$KeyboardMethodHandler;)V

    .line 127
    return-void
.end method

.method static synthetic access$000(Lio/flutter/embedding/android/KeyboardManager;Landroid/view/KeyEvent;)V
    .locals 0
    .param p0, "x0"    # Lio/flutter/embedding/android/KeyboardManager;
    .param p1, "x1"    # Landroid/view/KeyEvent;

    .line 45
    invoke-direct {p0, p1}, Lio/flutter/embedding/android/KeyboardManager;->onUnhandled(Landroid/view/KeyEvent;)V

    return-void
.end method

.method private onUnhandled(Landroid/view/KeyEvent;)V
    .locals 2
    .param p1, "keyEvent"    # Landroid/view/KeyEvent;

    .line 250
    iget-object v0, p0, Lio/flutter/embedding/android/KeyboardManager;->viewDelegate:Lio/flutter/embedding/android/KeyboardManager$ViewDelegate;

    if-eqz v0, :cond_2

    invoke-interface {v0, p1}, Lio/flutter/embedding/android/KeyboardManager$ViewDelegate;->onTextInputKeyEvent(Landroid/view/KeyEvent;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 254
    :cond_0
    iget-object v0, p0, Lio/flutter/embedding/android/KeyboardManager;->redispatchedEvents:Ljava/util/HashSet;

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 255
    iget-object v0, p0, Lio/flutter/embedding/android/KeyboardManager;->viewDelegate:Lio/flutter/embedding/android/KeyboardManager$ViewDelegate;

    invoke-interface {v0, p1}, Lio/flutter/embedding/android/KeyboardManager$ViewDelegate;->redispatch(Landroid/view/KeyEvent;)V

    .line 256
    iget-object v0, p0, Lio/flutter/embedding/android/KeyboardManager;->redispatchedEvents:Ljava/util/HashSet;

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 257
    const-string v0, "KeyboardManager"

    const-string v1, "A redispatched key event was consumed before reaching KeyboardManager"

    invoke-static {v0, v1}, Lio/flutter/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 259
    :cond_1
    return-void

    .line 251
    :cond_2
    :goto_0
    return-void
.end method


# virtual methods
.method public destroy()V
    .locals 3

    .line 239
    iget-object v0, p0, Lio/flutter/embedding/android/KeyboardManager;->redispatchedEvents:Ljava/util/HashSet;

    invoke-virtual {v0}, Ljava/util/HashSet;->size()I

    move-result v0

    .line 240
    .local v0, "remainingRedispatchCount":I
    if-lez v0, :cond_0

    .line 241
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "A KeyboardManager was destroyed with "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 244
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " unhandled redispatch event(s)."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 241
    const-string v2, "KeyboardManager"

    invoke-static {v2, v1}, Lio/flutter/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 247
    :cond_0
    return-void
.end method

.method public getKeyboardState()Ljava/util/Map;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/Long;",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    .line 268
    iget-object v0, p0, Lio/flutter/embedding/android/KeyboardManager;->responders:[Lio/flutter/embedding/android/KeyboardManager$Responder;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    check-cast v0, Lio/flutter/embedding/android/KeyEmbedderResponder;

    .line 269
    .local v0, "embedderResponder":Lio/flutter/embedding/android/KeyEmbedderResponder;
    invoke-virtual {v0}, Lio/flutter/embedding/android/KeyEmbedderResponder;->getPressedState()Ljava/util/Map;

    move-result-object v1

    return-object v1
.end method

.method public handleEvent(Landroid/view/KeyEvent;)Z
    .locals 7
    .param p1, "keyEvent"    # Landroid/view/KeyEvent;

    .line 221
    iget-object v0, p0, Lio/flutter/embedding/android/KeyboardManager;->redispatchedEvents:Ljava/util/HashSet;

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    move-result v0

    .line 222
    .local v0, "isRedispatchedEvent":Z
    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 223
    return v1

    .line 226
    :cond_0
    iget-object v2, p0, Lio/flutter/embedding/android/KeyboardManager;->responders:[Lio/flutter/embedding/android/KeyboardManager$Responder;

    array-length v2, v2

    if-lez v2, :cond_2

    .line 227
    new-instance v2, Lio/flutter/embedding/android/KeyboardManager$PerEventCallbackBuilder;

    invoke-direct {v2, p0, p1}, Lio/flutter/embedding/android/KeyboardManager$PerEventCallbackBuilder;-><init>(Lio/flutter/embedding/android/KeyboardManager;Landroid/view/KeyEvent;)V

    .line 228
    .local v2, "callbackBuilder":Lio/flutter/embedding/android/KeyboardManager$PerEventCallbackBuilder;
    iget-object v3, p0, Lio/flutter/embedding/android/KeyboardManager;->responders:[Lio/flutter/embedding/android/KeyboardManager$Responder;

    array-length v4, v3

    :goto_0
    if-ge v1, v4, :cond_1

    aget-object v5, v3, v1

    .line 229
    .local v5, "primaryResponder":Lio/flutter/embedding/android/KeyboardManager$Responder;
    invoke-virtual {v2}, Lio/flutter/embedding/android/KeyboardManager$PerEventCallbackBuilder;->buildCallback()Lio/flutter/embedding/android/KeyboardManager$Responder$OnKeyEventHandledCallback;

    move-result-object v6

    invoke-interface {v5, p1, v6}, Lio/flutter/embedding/android/KeyboardManager$Responder;->handleEvent(Landroid/view/KeyEvent;Lio/flutter/embedding/android/KeyboardManager$Responder$OnKeyEventHandledCallback;)V

    .line 228
    .end local v5    # "primaryResponder":Lio/flutter/embedding/android/KeyboardManager$Responder;
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 231
    .end local v2    # "callbackBuilder":Lio/flutter/embedding/android/KeyboardManager$PerEventCallbackBuilder;
    :cond_1
    goto :goto_1

    .line 232
    :cond_2
    invoke-direct {p0, p1}, Lio/flutter/embedding/android/KeyboardManager;->onUnhandled(Landroid/view/KeyEvent;)V

    .line 235
    :goto_1
    const/4 v1, 0x1

    return v1
.end method
