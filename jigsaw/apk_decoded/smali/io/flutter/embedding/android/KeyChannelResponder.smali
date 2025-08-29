.class public Lio/flutter/embedding/android/KeyChannelResponder;
.super Ljava/lang/Object;
.source "KeyChannelResponder.java"

# interfaces
.implements Lio/flutter/embedding/android/KeyboardManager$Responder;


# static fields
.field private static final TAG:Ljava/lang/String; = "KeyChannelResponder"


# instance fields
.field private final characterCombiner:Lio/flutter/embedding/android/KeyboardManager$CharacterCombiner;

.field private final keyEventChannel:Lio/flutter/embedding/engine/systemchannels/KeyEventChannel;


# direct methods
.method public constructor <init>(Lio/flutter/embedding/engine/systemchannels/KeyEventChannel;)V
    .locals 1
    .param p1, "keyEventChannel"    # Lio/flutter/embedding/engine/systemchannels/KeyEventChannel;

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    new-instance v0, Lio/flutter/embedding/android/KeyboardManager$CharacterCombiner;

    invoke-direct {v0}, Lio/flutter/embedding/android/KeyboardManager$CharacterCombiner;-><init>()V

    iput-object v0, p0, Lio/flutter/embedding/android/KeyChannelResponder;->characterCombiner:Lio/flutter/embedding/android/KeyboardManager$CharacterCombiner;

    .line 27
    iput-object p1, p0, Lio/flutter/embedding/android/KeyChannelResponder;->keyEventChannel:Lio/flutter/embedding/engine/systemchannels/KeyEventChannel;

    .line 28
    return-void
.end method

.method static synthetic lambda$handleEvent$0(Lio/flutter/embedding/android/KeyboardManager$Responder$OnKeyEventHandledCallback;Z)V
    .locals 0
    .param p0, "onKeyEventHandledCallback"    # Lio/flutter/embedding/android/KeyboardManager$Responder$OnKeyEventHandledCallback;
    .param p1, "isEventHandled"    # Z

    .line 51
    invoke-interface {p0, p1}, Lio/flutter/embedding/android/KeyboardManager$Responder$OnKeyEventHandledCallback;->onKeyEventHandled(Z)V

    return-void
.end method


# virtual methods
.method public handleEvent(Landroid/view/KeyEvent;Lio/flutter/embedding/android/KeyboardManager$Responder$OnKeyEventHandledCallback;)V
    .locals 6
    .param p1, "keyEvent"    # Landroid/view/KeyEvent;
    .param p2, "onKeyEventHandledCallback"    # Lio/flutter/embedding/android/KeyboardManager$Responder$OnKeyEventHandledCallback;

    .line 33
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I

    move-result v0

    .line 34
    .local v0, "action":I
    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_0

    if-eq v0, v2, :cond_0

    .line 38
    invoke-interface {p2, v1}, Lio/flutter/embedding/android/KeyboardManager$Responder$OnKeyEventHandledCallback;->onKeyEventHandled(Z)V

    .line 39
    return-void

    .line 42
    :cond_0
    iget-object v3, p0, Lio/flutter/embedding/android/KeyChannelResponder;->characterCombiner:Lio/flutter/embedding/android/KeyboardManager$CharacterCombiner;

    .line 43
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getUnicodeChar()I

    move-result v4

    invoke-virtual {v3, v4}, Lio/flutter/embedding/android/KeyboardManager$CharacterCombiner;->applyCombiningCharacterToBaseCharacter(I)Ljava/lang/Character;

    move-result-object v3

    .line 44
    .local v3, "complexCharacter":Ljava/lang/Character;
    new-instance v4, Lio/flutter/embedding/engine/systemchannels/KeyEventChannel$FlutterKeyEvent;

    invoke-direct {v4, p1, v3}, Lio/flutter/embedding/engine/systemchannels/KeyEventChannel$FlutterKeyEvent;-><init>(Landroid/view/KeyEvent;Ljava/lang/Character;)V

    .line 47
    .local v4, "flutterEvent":Lio/flutter/embedding/engine/systemchannels/KeyEventChannel$FlutterKeyEvent;
    if-eqz v0, :cond_1

    const/4 v1, 0x1

    .line 48
    .local v1, "isKeyUp":Z
    :cond_1
    iget-object v2, p0, Lio/flutter/embedding/android/KeyChannelResponder;->keyEventChannel:Lio/flutter/embedding/engine/systemchannels/KeyEventChannel;

    new-instance v5, Lio/flutter/embedding/android/KeyChannelResponder$$ExternalSyntheticLambda0;

    invoke-direct {v5, p2}, Lio/flutter/embedding/android/KeyChannelResponder$$ExternalSyntheticLambda0;-><init>(Lio/flutter/embedding/android/KeyboardManager$Responder$OnKeyEventHandledCallback;)V

    invoke-virtual {v2, v4, v1, v5}, Lio/flutter/embedding/engine/systemchannels/KeyEventChannel;->sendFlutterKeyEvent(Lio/flutter/embedding/engine/systemchannels/KeyEventChannel$FlutterKeyEvent;ZLio/flutter/embedding/engine/systemchannels/KeyEventChannel$EventResponseHandler;)V

    .line 52
    return-void
.end method
