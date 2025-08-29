.class public Lio/flutter/plugin/editing/InputConnectionAdaptor;
.super Landroid/view/inputmethod/BaseInputConnection;
.source "InputConnectionAdaptor.java"

# interfaces
.implements Lio/flutter/plugin/editing/ListenableEditingState$EditingStateWatcher;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/flutter/plugin/editing/InputConnectionAdaptor$KeyboardDelegate;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "InputConnectionAdaptor"


# instance fields
.field private batchEditNestDepth:I

.field private flutterTextUtils:Lio/flutter/plugin/editing/FlutterTextUtils;

.field private final keyboardDelegate:Lio/flutter/plugin/editing/InputConnectionAdaptor$KeyboardDelegate;

.field private final mClient:I

.field private mCursorAnchorInfoBuilder:Landroid/view/inputmethod/CursorAnchorInfo$Builder;

.field private final mEditable:Lio/flutter/plugin/editing/ListenableEditingState;

.field private final mEditorInfo:Landroid/view/inputmethod/EditorInfo;

.field private mExtractRequest:Landroid/view/inputmethod/ExtractedTextRequest;

.field private mExtractedText:Landroid/view/inputmethod/ExtractedText;

.field private final mFlutterView:Landroid/view/View;

.field private mImm:Landroid/view/inputmethod/InputMethodManager;

.field private final mLayout:Landroid/text/Layout;

.field private mMonitorCursorUpdate:Z

.field private final textInputChannel:Lio/flutter/embedding/engine/systemchannels/TextInputChannel;


# direct methods
.method public constructor <init>(Landroid/view/View;ILio/flutter/embedding/engine/systemchannels/TextInputChannel;Lio/flutter/plugin/editing/InputConnectionAdaptor$KeyboardDelegate;Lio/flutter/plugin/editing/ListenableEditingState;Landroid/view/inputmethod/EditorInfo;)V
    .locals 8
    .param p1, "view"    # Landroid/view/View;
    .param p2, "client"    # I
    .param p3, "textInputChannel"    # Lio/flutter/embedding/engine/systemchannels/TextInputChannel;
    .param p4, "keyboardDelegate"    # Lio/flutter/plugin/editing/InputConnectionAdaptor$KeyboardDelegate;
    .param p5, "editable"    # Lio/flutter/plugin/editing/ListenableEditingState;
    .param p6, "editorInfo"    # Landroid/view/inputmethod/EditorInfo;

    .line 106
    new-instance v7, Lio/flutter/embedding/engine/FlutterJNI;

    invoke-direct {v7}, Lio/flutter/embedding/engine/FlutterJNI;-><init>()V

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    move-object v6, p6

    invoke-direct/range {v0 .. v7}, Lio/flutter/plugin/editing/InputConnectionAdaptor;-><init>(Landroid/view/View;ILio/flutter/embedding/engine/systemchannels/TextInputChannel;Lio/flutter/plugin/editing/InputConnectionAdaptor$KeyboardDelegate;Lio/flutter/plugin/editing/ListenableEditingState;Landroid/view/inputmethod/EditorInfo;Lio/flutter/embedding/engine/FlutterJNI;)V

    .line 107
    return-void
.end method

.method public constructor <init>(Landroid/view/View;ILio/flutter/embedding/engine/systemchannels/TextInputChannel;Lio/flutter/plugin/editing/InputConnectionAdaptor$KeyboardDelegate;Lio/flutter/plugin/editing/ListenableEditingState;Landroid/view/inputmethod/EditorInfo;Lio/flutter/embedding/engine/FlutterJNI;)V
    .locals 17
    .param p1, "view"    # Landroid/view/View;
    .param p2, "client"    # I
    .param p3, "textInputChannel"    # Lio/flutter/embedding/engine/systemchannels/TextInputChannel;
    .param p4, "keyboardDelegate"    # Lio/flutter/plugin/editing/InputConnectionAdaptor$KeyboardDelegate;
    .param p5, "editable"    # Lio/flutter/plugin/editing/ListenableEditingState;
    .param p6, "editorInfo"    # Landroid/view/inputmethod/EditorInfo;
    .param p7, "flutterJNI"    # Lio/flutter/embedding/engine/FlutterJNI;

    .line 76
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v10, p5

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Landroid/view/inputmethod/BaseInputConnection;-><init>(Landroid/view/View;Z)V

    .line 58
    const/4 v2, 0x0

    iput-boolean v2, v0, Lio/flutter/plugin/editing/InputConnectionAdaptor;->mMonitorCursorUpdate:Z

    .line 60
    new-instance v3, Landroid/view/inputmethod/ExtractedText;

    invoke-direct {v3}, Landroid/view/inputmethod/ExtractedText;-><init>()V

    iput-object v3, v0, Lio/flutter/plugin/editing/InputConnectionAdaptor;->mExtractedText:Landroid/view/inputmethod/ExtractedText;

    .line 65
    iput v2, v0, Lio/flutter/plugin/editing/InputConnectionAdaptor;->batchEditNestDepth:I

    .line 77
    iput-object v1, v0, Lio/flutter/plugin/editing/InputConnectionAdaptor;->mFlutterView:Landroid/view/View;

    .line 78
    move/from16 v11, p2

    iput v11, v0, Lio/flutter/plugin/editing/InputConnectionAdaptor;->mClient:I

    .line 79
    move-object/from16 v12, p3

    iput-object v12, v0, Lio/flutter/plugin/editing/InputConnectionAdaptor;->textInputChannel:Lio/flutter/embedding/engine/systemchannels/TextInputChannel;

    .line 80
    iput-object v10, v0, Lio/flutter/plugin/editing/InputConnectionAdaptor;->mEditable:Lio/flutter/plugin/editing/ListenableEditingState;

    .line 81
    invoke-virtual {v10, v0}, Lio/flutter/plugin/editing/ListenableEditingState;->addEditingStateListener(Lio/flutter/plugin/editing/ListenableEditingState$EditingStateWatcher;)V

    .line 82
    move-object/from16 v13, p6

    iput-object v13, v0, Lio/flutter/plugin/editing/InputConnectionAdaptor;->mEditorInfo:Landroid/view/inputmethod/EditorInfo;

    .line 83
    move-object/from16 v14, p4

    iput-object v14, v0, Lio/flutter/plugin/editing/InputConnectionAdaptor;->keyboardDelegate:Lio/flutter/plugin/editing/InputConnectionAdaptor$KeyboardDelegate;

    .line 84
    new-instance v2, Lio/flutter/plugin/editing/FlutterTextUtils;

    move-object/from16 v15, p7

    invoke-direct {v2, v15}, Lio/flutter/plugin/editing/FlutterTextUtils;-><init>(Lio/flutter/embedding/engine/FlutterJNI;)V

    iput-object v2, v0, Lio/flutter/plugin/editing/InputConnectionAdaptor;->flutterTextUtils:Lio/flutter/plugin/editing/FlutterTextUtils;

    .line 87
    new-instance v9, Landroid/text/DynamicLayout;

    new-instance v4, Landroid/text/TextPaint;

    invoke-direct {v4}, Landroid/text/TextPaint;-><init>()V

    const v5, 0x7fffffff

    sget-object v6, Landroid/text/Layout$Alignment;->ALIGN_NORMAL:Landroid/text/Layout$Alignment;

    const/high16 v7, 0x3f800000    # 1.0f

    const/4 v8, 0x0

    const/16 v16, 0x0

    move-object v2, v9

    move-object/from16 v3, p5

    move-object v1, v9

    move/from16 v9, v16

    invoke-direct/range {v2 .. v9}, Landroid/text/DynamicLayout;-><init>(Ljava/lang/CharSequence;Landroid/text/TextPaint;ILandroid/text/Layout$Alignment;FFZ)V

    iput-object v1, v0, Lio/flutter/plugin/editing/InputConnectionAdaptor;->mLayout:Landroid/text/Layout;

    .line 96
    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    const-string v2, "input_method"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/inputmethod/InputMethodManager;

    iput-object v1, v0, Lio/flutter/plugin/editing/InputConnectionAdaptor;->mImm:Landroid/view/inputmethod/InputMethodManager;

    .line 97
    return-void
.end method

.method private static clampIndexToEditable(ILandroid/text/Editable;)I
    .locals 3
    .param p0, "index"    # I
    .param p1, "editable"    # Landroid/text/Editable;

    .line 268
    invoke-interface {p1}, Landroid/text/Editable;->length()I

    move-result v0

    invoke-static {v0, p0}, Ljava/lang/Math;->min(II)I

    move-result v0

    const/4 v1, 0x0

    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 269
    .local v0, "clamped":I
    if-eq v0, p0, :cond_0

    .line 270
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Text selection index was clamped ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "->"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ") to remain in bounds. This may not be your fault, as some keyboards may select outside of bounds."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "flutter"

    invoke-static {v2, v1}, Lio/flutter/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 278
    :cond_0
    return v0
.end method

.method private doPerformContextMenuAction(I)Z
    .locals 9
    .param p1, "id"    # I

    .line 391
    const v0, 0x102001f

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-ne p1, v0, :cond_0

    .line 392
    iget-object v0, p0, Lio/flutter/plugin/editing/InputConnectionAdaptor;->mEditable:Lio/flutter/plugin/editing/ListenableEditingState;

    invoke-virtual {v0}, Lio/flutter/plugin/editing/ListenableEditingState;->length()I

    move-result v0

    invoke-virtual {p0, v2, v0}, Lio/flutter/plugin/editing/InputConnectionAdaptor;->setSelection(II)Z

    .line 393
    return v1

    .line 394
    :cond_0
    const v0, 0x1020020

    const-string v3, "text label?"

    const-string v4, "clipboard"

    if-ne p1, v0, :cond_2

    .line 395
    iget-object v0, p0, Lio/flutter/plugin/editing/InputConnectionAdaptor;->mEditable:Lio/flutter/plugin/editing/ListenableEditingState;

    invoke-static {v0}, Landroid/text/Selection;->getSelectionStart(Ljava/lang/CharSequence;)I

    move-result v0

    .line 396
    .local v0, "selStart":I
    iget-object v2, p0, Lio/flutter/plugin/editing/InputConnectionAdaptor;->mEditable:Lio/flutter/plugin/editing/ListenableEditingState;

    invoke-static {v2}, Landroid/text/Selection;->getSelectionEnd(Ljava/lang/CharSequence;)I

    move-result v2

    .line 397
    .local v2, "selEnd":I
    if-eq v0, v2, :cond_1

    .line 398
    invoke-static {v0, v2}, Ljava/lang/Math;->min(II)I

    move-result v5

    .line 399
    .local v5, "selMin":I
    invoke-static {v0, v2}, Ljava/lang/Math;->max(II)I

    move-result v6

    .line 400
    .local v6, "selMax":I
    iget-object v7, p0, Lio/flutter/plugin/editing/InputConnectionAdaptor;->mEditable:Lio/flutter/plugin/editing/ListenableEditingState;

    invoke-virtual {v7, v5, v6}, Lio/flutter/plugin/editing/ListenableEditingState;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object v7

    .line 401
    .local v7, "textToCut":Ljava/lang/CharSequence;
    iget-object v8, p0, Lio/flutter/plugin/editing/InputConnectionAdaptor;->mFlutterView:Landroid/view/View;

    .line 403
    invoke-virtual {v8}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v8

    invoke-virtual {v8, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/content/ClipboardManager;

    .line 404
    .local v4, "clipboard":Landroid/content/ClipboardManager;
    invoke-static {v3, v7}, Landroid/content/ClipData;->newPlainText(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Landroid/content/ClipData;

    move-result-object v3

    .line 405
    .local v3, "clip":Landroid/content/ClipData;
    invoke-virtual {v4, v3}, Landroid/content/ClipboardManager;->setPrimaryClip(Landroid/content/ClipData;)V

    .line 406
    iget-object v8, p0, Lio/flutter/plugin/editing/InputConnectionAdaptor;->mEditable:Lio/flutter/plugin/editing/ListenableEditingState;

    invoke-virtual {v8, v5, v6}, Lio/flutter/plugin/editing/ListenableEditingState;->delete(II)Landroid/text/SpannableStringBuilder;

    .line 407
    invoke-virtual {p0, v5, v5}, Lio/flutter/plugin/editing/InputConnectionAdaptor;->setSelection(II)Z

    .line 409
    .end local v3    # "clip":Landroid/content/ClipData;
    .end local v4    # "clipboard":Landroid/content/ClipboardManager;
    .end local v5    # "selMin":I
    .end local v6    # "selMax":I
    .end local v7    # "textToCut":Ljava/lang/CharSequence;
    :cond_1
    return v1

    .line 410
    .end local v0    # "selStart":I
    .end local v2    # "selEnd":I
    :cond_2
    const v0, 0x1020021

    if-ne p1, v0, :cond_4

    .line 411
    iget-object v0, p0, Lio/flutter/plugin/editing/InputConnectionAdaptor;->mEditable:Lio/flutter/plugin/editing/ListenableEditingState;

    invoke-static {v0}, Landroid/text/Selection;->getSelectionStart(Ljava/lang/CharSequence;)I

    move-result v0

    .line 412
    .restart local v0    # "selStart":I
    iget-object v2, p0, Lio/flutter/plugin/editing/InputConnectionAdaptor;->mEditable:Lio/flutter/plugin/editing/ListenableEditingState;

    invoke-static {v2}, Landroid/text/Selection;->getSelectionEnd(Ljava/lang/CharSequence;)I

    move-result v2

    .line 413
    .restart local v2    # "selEnd":I
    if-eq v0, v2, :cond_3

    .line 414
    iget-object v5, p0, Lio/flutter/plugin/editing/InputConnectionAdaptor;->mEditable:Lio/flutter/plugin/editing/ListenableEditingState;

    .line 415
    invoke-static {v0, v2}, Ljava/lang/Math;->min(II)I

    move-result v6

    invoke-static {v0, v2}, Ljava/lang/Math;->max(II)I

    move-result v7

    invoke-virtual {v5, v6, v7}, Lio/flutter/plugin/editing/ListenableEditingState;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object v5

    .line 416
    .local v5, "textToCopy":Ljava/lang/CharSequence;
    iget-object v6, p0, Lio/flutter/plugin/editing/InputConnectionAdaptor;->mFlutterView:Landroid/view/View;

    .line 418
    invoke-virtual {v6}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v6

    invoke-virtual {v6, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/content/ClipboardManager;

    .line 419
    .restart local v4    # "clipboard":Landroid/content/ClipboardManager;
    invoke-static {v3, v5}, Landroid/content/ClipData;->newPlainText(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Landroid/content/ClipData;

    move-result-object v3

    invoke-virtual {v4, v3}, Landroid/content/ClipboardManager;->setPrimaryClip(Landroid/content/ClipData;)V

    .line 421
    .end local v4    # "clipboard":Landroid/content/ClipboardManager;
    .end local v5    # "textToCopy":Ljava/lang/CharSequence;
    :cond_3
    return v1

    .line 422
    .end local v0    # "selStart":I
    .end local v2    # "selEnd":I
    :cond_4
    const v0, 0x1020022

    if-ne p1, v0, :cond_7

    .line 423
    iget-object v0, p0, Lio/flutter/plugin/editing/InputConnectionAdaptor;->mFlutterView:Landroid/view/View;

    .line 424
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/ClipboardManager;

    .line 425
    .local v0, "clipboard":Landroid/content/ClipboardManager;
    invoke-virtual {v0}, Landroid/content/ClipboardManager;->getPrimaryClip()Landroid/content/ClipData;

    move-result-object v3

    .line 426
    .restart local v3    # "clip":Landroid/content/ClipData;
    if-eqz v3, :cond_6

    .line 427
    invoke-virtual {v3, v2}, Landroid/content/ClipData;->getItemAt(I)Landroid/content/ClipData$Item;

    move-result-object v4

    iget-object v5, p0, Lio/flutter/plugin/editing/InputConnectionAdaptor;->mFlutterView:Landroid/view/View;

    invoke-virtual {v5}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/content/ClipData$Item;->coerceToText(Landroid/content/Context;)Ljava/lang/CharSequence;

    move-result-object v4

    .line 428
    .local v4, "textToPaste":Ljava/lang/CharSequence;
    iget-object v5, p0, Lio/flutter/plugin/editing/InputConnectionAdaptor;->mEditable:Lio/flutter/plugin/editing/ListenableEditingState;

    invoke-static {v5}, Landroid/text/Selection;->getSelectionStart(Ljava/lang/CharSequence;)I

    move-result v5

    invoke-static {v2, v5}, Ljava/lang/Math;->max(II)I

    move-result v5

    .line 429
    .local v5, "selStart":I
    iget-object v6, p0, Lio/flutter/plugin/editing/InputConnectionAdaptor;->mEditable:Lio/flutter/plugin/editing/ListenableEditingState;

    invoke-static {v6}, Landroid/text/Selection;->getSelectionEnd(Ljava/lang/CharSequence;)I

    move-result v6

    invoke-static {v2, v6}, Ljava/lang/Math;->max(II)I

    move-result v2

    .line 430
    .restart local v2    # "selEnd":I
    invoke-static {v5, v2}, Ljava/lang/Math;->min(II)I

    move-result v6

    .line 431
    .local v6, "selMin":I
    invoke-static {v5, v2}, Ljava/lang/Math;->max(II)I

    move-result v7

    .line 432
    .local v7, "selMax":I
    if-eq v6, v7, :cond_5

    iget-object v8, p0, Lio/flutter/plugin/editing/InputConnectionAdaptor;->mEditable:Lio/flutter/plugin/editing/ListenableEditingState;

    invoke-virtual {v8, v6, v7}, Lio/flutter/plugin/editing/ListenableEditingState;->delete(II)Landroid/text/SpannableStringBuilder;

    .line 433
    :cond_5
    iget-object v8, p0, Lio/flutter/plugin/editing/InputConnectionAdaptor;->mEditable:Lio/flutter/plugin/editing/ListenableEditingState;

    invoke-virtual {v8, v6, v4}, Lio/flutter/plugin/editing/ListenableEditingState;->insert(ILjava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 434
    invoke-interface {v4}, Ljava/lang/CharSequence;->length()I

    move-result v8

    add-int/2addr v8, v6

    .line 435
    .local v8, "newSelStart":I
    invoke-virtual {p0, v8, v8}, Lio/flutter/plugin/editing/InputConnectionAdaptor;->setSelection(II)Z

    .line 437
    .end local v2    # "selEnd":I
    .end local v4    # "textToPaste":Ljava/lang/CharSequence;
    .end local v5    # "selStart":I
    .end local v6    # "selMin":I
    .end local v7    # "selMax":I
    .end local v8    # "newSelStart":I
    :cond_6
    return v1

    .line 439
    .end local v0    # "clipboard":Landroid/content/ClipboardManager;
    .end local v3    # "clip":Landroid/content/ClipData;
    :cond_7
    return v2
.end method

.method private getCursorAnchorInfo()Landroid/view/inputmethod/CursorAnchorInfo;
    .locals 5

    .line 123
    iget-object v0, p0, Lio/flutter/plugin/editing/InputConnectionAdaptor;->mCursorAnchorInfoBuilder:Landroid/view/inputmethod/CursorAnchorInfo$Builder;

    if-nez v0, :cond_0

    .line 124
    new-instance v0, Landroid/view/inputmethod/CursorAnchorInfo$Builder;

    invoke-direct {v0}, Landroid/view/inputmethod/CursorAnchorInfo$Builder;-><init>()V

    iput-object v0, p0, Lio/flutter/plugin/editing/InputConnectionAdaptor;->mCursorAnchorInfoBuilder:Landroid/view/inputmethod/CursorAnchorInfo$Builder;

    goto :goto_0

    .line 126
    :cond_0
    invoke-virtual {v0}, Landroid/view/inputmethod/CursorAnchorInfo$Builder;->reset()V

    .line 129
    :goto_0
    iget-object v0, p0, Lio/flutter/plugin/editing/InputConnectionAdaptor;->mCursorAnchorInfoBuilder:Landroid/view/inputmethod/CursorAnchorInfo$Builder;

    iget-object v1, p0, Lio/flutter/plugin/editing/InputConnectionAdaptor;->mEditable:Lio/flutter/plugin/editing/ListenableEditingState;

    .line 130
    invoke-virtual {v1}, Lio/flutter/plugin/editing/ListenableEditingState;->getSelectionStart()I

    move-result v1

    iget-object v2, p0, Lio/flutter/plugin/editing/InputConnectionAdaptor;->mEditable:Lio/flutter/plugin/editing/ListenableEditingState;

    invoke-virtual {v2}, Lio/flutter/plugin/editing/ListenableEditingState;->getSelectionEnd()I

    move-result v2

    .line 129
    invoke-virtual {v0, v1, v2}, Landroid/view/inputmethod/CursorAnchorInfo$Builder;->setSelectionRange(II)Landroid/view/inputmethod/CursorAnchorInfo$Builder;

    .line 131
    iget-object v0, p0, Lio/flutter/plugin/editing/InputConnectionAdaptor;->mEditable:Lio/flutter/plugin/editing/ListenableEditingState;

    invoke-virtual {v0}, Lio/flutter/plugin/editing/ListenableEditingState;->getComposingStart()I

    move-result v0

    .line 132
    .local v0, "composingStart":I
    iget-object v1, p0, Lio/flutter/plugin/editing/InputConnectionAdaptor;->mEditable:Lio/flutter/plugin/editing/ListenableEditingState;

    invoke-virtual {v1}, Lio/flutter/plugin/editing/ListenableEditingState;->getComposingEnd()I

    move-result v1

    .line 133
    .local v1, "composingEnd":I
    if-ltz v0, :cond_1

    if-le v1, v0, :cond_1

    .line 134
    iget-object v2, p0, Lio/flutter/plugin/editing/InputConnectionAdaptor;->mCursorAnchorInfoBuilder:Landroid/view/inputmethod/CursorAnchorInfo$Builder;

    iget-object v3, p0, Lio/flutter/plugin/editing/InputConnectionAdaptor;->mEditable:Lio/flutter/plugin/editing/ListenableEditingState;

    .line 135
    invoke-virtual {v3}, Lio/flutter/plugin/editing/ListenableEditingState;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3, v0, v1}, Ljava/lang/String;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object v3

    .line 134
    invoke-virtual {v2, v0, v3}, Landroid/view/inputmethod/CursorAnchorInfo$Builder;->setComposingText(ILjava/lang/CharSequence;)Landroid/view/inputmethod/CursorAnchorInfo$Builder;

    goto :goto_1

    .line 137
    :cond_1
    iget-object v2, p0, Lio/flutter/plugin/editing/InputConnectionAdaptor;->mCursorAnchorInfoBuilder:Landroid/view/inputmethod/CursorAnchorInfo$Builder;

    const/4 v3, -0x1

    const-string v4, ""

    invoke-virtual {v2, v3, v4}, Landroid/view/inputmethod/CursorAnchorInfo$Builder;->setComposingText(ILjava/lang/CharSequence;)Landroid/view/inputmethod/CursorAnchorInfo$Builder;

    .line 139
    :goto_1
    iget-object v2, p0, Lio/flutter/plugin/editing/InputConnectionAdaptor;->mCursorAnchorInfoBuilder:Landroid/view/inputmethod/CursorAnchorInfo$Builder;

    invoke-virtual {v2}, Landroid/view/inputmethod/CursorAnchorInfo$Builder;->build()Landroid/view/inputmethod/CursorAnchorInfo;

    move-result-object v2

    return-object v2
.end method

.method private getExtractedText(Landroid/view/inputmethod/ExtractedTextRequest;)Landroid/view/inputmethod/ExtractedText;
    .locals 2
    .param p1, "request"    # Landroid/view/inputmethod/ExtractedTextRequest;

    .line 110
    iget-object v0, p0, Lio/flutter/plugin/editing/InputConnectionAdaptor;->mExtractedText:Landroid/view/inputmethod/ExtractedText;

    const/4 v1, 0x0

    iput v1, v0, Landroid/view/inputmethod/ExtractedText;->startOffset:I

    .line 111
    iget-object v0, p0, Lio/flutter/plugin/editing/InputConnectionAdaptor;->mExtractedText:Landroid/view/inputmethod/ExtractedText;

    const/4 v1, -0x1

    iput v1, v0, Landroid/view/inputmethod/ExtractedText;->partialStartOffset:I

    .line 112
    iget-object v0, p0, Lio/flutter/plugin/editing/InputConnectionAdaptor;->mExtractedText:Landroid/view/inputmethod/ExtractedText;

    iput v1, v0, Landroid/view/inputmethod/ExtractedText;->partialEndOffset:I

    .line 113
    iget-object v0, p0, Lio/flutter/plugin/editing/InputConnectionAdaptor;->mExtractedText:Landroid/view/inputmethod/ExtractedText;

    iget-object v1, p0, Lio/flutter/plugin/editing/InputConnectionAdaptor;->mEditable:Lio/flutter/plugin/editing/ListenableEditingState;

    invoke-virtual {v1}, Lio/flutter/plugin/editing/ListenableEditingState;->getSelectionStart()I

    move-result v1

    iput v1, v0, Landroid/view/inputmethod/ExtractedText;->selectionStart:I

    .line 114
    iget-object v0, p0, Lio/flutter/plugin/editing/InputConnectionAdaptor;->mExtractedText:Landroid/view/inputmethod/ExtractedText;

    iget-object v1, p0, Lio/flutter/plugin/editing/InputConnectionAdaptor;->mEditable:Lio/flutter/plugin/editing/ListenableEditingState;

    invoke-virtual {v1}, Lio/flutter/plugin/editing/ListenableEditingState;->getSelectionEnd()I

    move-result v1

    iput v1, v0, Landroid/view/inputmethod/ExtractedText;->selectionEnd:I

    .line 115
    iget-object v0, p0, Lio/flutter/plugin/editing/InputConnectionAdaptor;->mExtractedText:Landroid/view/inputmethod/ExtractedText;

    .line 116
    if-eqz p1, :cond_1

    iget v1, p1, Landroid/view/inputmethod/ExtractedTextRequest;->flags:I

    and-int/lit8 v1, v1, 0x1

    if-nez v1, :cond_0

    goto :goto_0

    .line 118
    :cond_0
    iget-object v1, p0, Lio/flutter/plugin/editing/InputConnectionAdaptor;->mEditable:Lio/flutter/plugin/editing/ListenableEditingState;

    goto :goto_1

    .line 117
    :cond_1
    :goto_0
    iget-object v1, p0, Lio/flutter/plugin/editing/InputConnectionAdaptor;->mEditable:Lio/flutter/plugin/editing/ListenableEditingState;

    invoke-virtual {v1}, Lio/flutter/plugin/editing/ListenableEditingState;->toString()Ljava/lang/String;

    move-result-object v1

    .line 118
    :goto_1
    iput-object v1, v0, Landroid/view/inputmethod/ExtractedText;->text:Ljava/lang/CharSequence;

    .line 119
    iget-object v0, p0, Lio/flutter/plugin/editing/InputConnectionAdaptor;->mExtractedText:Landroid/view/inputmethod/ExtractedText;

    return-object v0
.end method

.method private handleHorizontalMovement(ZZ)Z
    .locals 5
    .param p1, "isLeft"    # Z
    .param p2, "isShiftPressed"    # Z

    .line 329
    iget-object v0, p0, Lio/flutter/plugin/editing/InputConnectionAdaptor;->mEditable:Lio/flutter/plugin/editing/ListenableEditingState;

    invoke-static {v0}, Landroid/text/Selection;->getSelectionStart(Ljava/lang/CharSequence;)I

    move-result v0

    .line 330
    .local v0, "selStart":I
    iget-object v1, p0, Lio/flutter/plugin/editing/InputConnectionAdaptor;->mEditable:Lio/flutter/plugin/editing/ListenableEditingState;

    invoke-static {v1}, Landroid/text/Selection;->getSelectionEnd(Ljava/lang/CharSequence;)I

    move-result v1

    .line 332
    .local v1, "selEnd":I
    const/4 v2, 0x0

    if-ltz v0, :cond_4

    if-gez v1, :cond_0

    goto :goto_2

    .line 337
    :cond_0
    if-eqz p1, :cond_1

    .line 338
    iget-object v3, p0, Lio/flutter/plugin/editing/InputConnectionAdaptor;->flutterTextUtils:Lio/flutter/plugin/editing/FlutterTextUtils;

    iget-object v4, p0, Lio/flutter/plugin/editing/InputConnectionAdaptor;->mEditable:Lio/flutter/plugin/editing/ListenableEditingState;

    invoke-virtual {v3, v4, v1}, Lio/flutter/plugin/editing/FlutterTextUtils;->getOffsetBefore(Ljava/lang/CharSequence;I)I

    move-result v3

    invoke-static {v3, v2}, Ljava/lang/Math;->max(II)I

    move-result v3

    goto :goto_0

    .line 339
    :cond_1
    iget-object v3, p0, Lio/flutter/plugin/editing/InputConnectionAdaptor;->flutterTextUtils:Lio/flutter/plugin/editing/FlutterTextUtils;

    iget-object v4, p0, Lio/flutter/plugin/editing/InputConnectionAdaptor;->mEditable:Lio/flutter/plugin/editing/ListenableEditingState;

    invoke-virtual {v3, v4, v1}, Lio/flutter/plugin/editing/FlutterTextUtils;->getOffsetAfter(Ljava/lang/CharSequence;I)I

    move-result v3

    iget-object v4, p0, Lio/flutter/plugin/editing/InputConnectionAdaptor;->mEditable:Lio/flutter/plugin/editing/ListenableEditingState;

    invoke-virtual {v4}, Lio/flutter/plugin/editing/ListenableEditingState;->length()I

    move-result v4

    invoke-static {v3, v4}, Ljava/lang/Math;->min(II)I

    move-result v3

    :goto_0
    nop

    .line 341
    .local v3, "newSelectionEnd":I
    const/4 v4, 0x1

    if-ne v0, v1, :cond_2

    if-nez p2, :cond_2

    const/4 v2, 0x1

    .line 343
    .local v2, "shouldCollapse":Z
    :cond_2
    if-eqz v2, :cond_3

    .line 344
    invoke-virtual {p0, v3, v3}, Lio/flutter/plugin/editing/InputConnectionAdaptor;->setSelection(II)Z

    goto :goto_1

    .line 346
    :cond_3
    invoke-virtual {p0, v0, v3}, Lio/flutter/plugin/editing/InputConnectionAdaptor;->setSelection(II)Z

    .line 348
    :goto_1
    return v4

    .line 333
    .end local v2    # "shouldCollapse":Z
    .end local v3    # "newSelectionEnd":I
    :cond_4
    :goto_2
    return v2
.end method

.method private handleVerticalMovement(ZZ)Z
    .locals 6
    .param p1, "isUp"    # Z
    .param p2, "isShiftPressed"    # Z

    .line 352
    iget-object v0, p0, Lio/flutter/plugin/editing/InputConnectionAdaptor;->mEditable:Lio/flutter/plugin/editing/ListenableEditingState;

    invoke-static {v0}, Landroid/text/Selection;->getSelectionStart(Ljava/lang/CharSequence;)I

    move-result v0

    .line 353
    .local v0, "selStart":I
    iget-object v1, p0, Lio/flutter/plugin/editing/InputConnectionAdaptor;->mEditable:Lio/flutter/plugin/editing/ListenableEditingState;

    invoke-static {v1}, Landroid/text/Selection;->getSelectionEnd(Ljava/lang/CharSequence;)I

    move-result v1

    .line 355
    .local v1, "selEnd":I
    const/4 v2, 0x0

    if-ltz v0, :cond_5

    if-gez v1, :cond_0

    goto :goto_3

    .line 359
    :cond_0
    const/4 v3, 0x1

    if-ne v0, v1, :cond_1

    if-nez p2, :cond_1

    const/4 v2, 0x1

    .line 361
    .local v2, "shouldCollapse":Z
    :cond_1
    invoke-virtual {p0}, Lio/flutter/plugin/editing/InputConnectionAdaptor;->beginBatchEdit()Z

    .line 362
    if-eqz v2, :cond_3

    .line 363
    if-eqz p1, :cond_2

    .line 364
    iget-object v4, p0, Lio/flutter/plugin/editing/InputConnectionAdaptor;->mEditable:Lio/flutter/plugin/editing/ListenableEditingState;

    iget-object v5, p0, Lio/flutter/plugin/editing/InputConnectionAdaptor;->mLayout:Landroid/text/Layout;

    invoke-static {v4, v5}, Landroid/text/Selection;->moveUp(Landroid/text/Spannable;Landroid/text/Layout;)Z

    goto :goto_0

    .line 366
    :cond_2
    iget-object v4, p0, Lio/flutter/plugin/editing/InputConnectionAdaptor;->mEditable:Lio/flutter/plugin/editing/ListenableEditingState;

    iget-object v5, p0, Lio/flutter/plugin/editing/InputConnectionAdaptor;->mLayout:Landroid/text/Layout;

    invoke-static {v4, v5}, Landroid/text/Selection;->moveDown(Landroid/text/Spannable;Landroid/text/Layout;)Z

    .line 368
    :goto_0
    iget-object v4, p0, Lio/flutter/plugin/editing/InputConnectionAdaptor;->mEditable:Lio/flutter/plugin/editing/ListenableEditingState;

    invoke-static {v4}, Landroid/text/Selection;->getSelectionStart(Ljava/lang/CharSequence;)I

    move-result v4

    .line 369
    .local v4, "newSelection":I
    invoke-virtual {p0, v4, v4}, Lio/flutter/plugin/editing/InputConnectionAdaptor;->setSelection(II)Z

    .line 370
    .end local v4    # "newSelection":I
    goto :goto_2

    .line 371
    :cond_3
    if-eqz p1, :cond_4

    .line 372
    iget-object v4, p0, Lio/flutter/plugin/editing/InputConnectionAdaptor;->mEditable:Lio/flutter/plugin/editing/ListenableEditingState;

    iget-object v5, p0, Lio/flutter/plugin/editing/InputConnectionAdaptor;->mLayout:Landroid/text/Layout;

    invoke-static {v4, v5}, Landroid/text/Selection;->extendUp(Landroid/text/Spannable;Landroid/text/Layout;)Z

    goto :goto_1

    .line 374
    :cond_4
    iget-object v4, p0, Lio/flutter/plugin/editing/InputConnectionAdaptor;->mEditable:Lio/flutter/plugin/editing/ListenableEditingState;

    iget-object v5, p0, Lio/flutter/plugin/editing/InputConnectionAdaptor;->mLayout:Landroid/text/Layout;

    invoke-static {v4, v5}, Landroid/text/Selection;->extendDown(Landroid/text/Spannable;Landroid/text/Layout;)Z

    .line 376
    :goto_1
    iget-object v4, p0, Lio/flutter/plugin/editing/InputConnectionAdaptor;->mEditable:Lio/flutter/plugin/editing/ListenableEditingState;

    invoke-static {v4}, Landroid/text/Selection;->getSelectionStart(Ljava/lang/CharSequence;)I

    move-result v4

    iget-object v5, p0, Lio/flutter/plugin/editing/InputConnectionAdaptor;->mEditable:Lio/flutter/plugin/editing/ListenableEditingState;

    invoke-static {v5}, Landroid/text/Selection;->getSelectionEnd(Ljava/lang/CharSequence;)I

    move-result v5

    invoke-virtual {p0, v4, v5}, Lio/flutter/plugin/editing/InputConnectionAdaptor;->setSelection(II)Z

    .line 378
    :goto_2
    invoke-virtual {p0}, Lio/flutter/plugin/editing/InputConnectionAdaptor;->endBatchEdit()Z

    .line 379
    return v3

    .line 356
    .end local v2    # "shouldCollapse":Z
    :cond_5
    :goto_3
    return v2
.end method

.method private readStreamFully(Ljava/io/InputStream;I)[B
    .locals 4
    .param p1, "is"    # Ljava/io/InputStream;
    .param p2, "blocksize"    # I

    .line 534
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 536
    .local v0, "baos":Ljava/io/ByteArrayOutputStream;
    new-array v1, p2, [B

    .line 538
    .local v1, "buffer":[B
    :goto_0
    const/4 v2, -0x1

    .line 540
    .local v2, "len":I
    :try_start_0
    invoke-virtual {p1, v1}, Ljava/io/InputStream;->read([B)I

    move-result v3
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move v2, v3

    .line 542
    goto :goto_1

    .line 541
    :catch_0
    move-exception v3

    .line 543
    :goto_1
    const/4 v3, -0x1

    if-ne v2, v3, :cond_0

    .line 546
    .end local v2    # "len":I
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v2

    return-object v2

    .line 544
    .restart local v2    # "len":I
    :cond_0
    const/4 v3, 0x0

    invoke-virtual {v0, v1, v3, v2}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    .line 545
    .end local v2    # "len":I
    goto :goto_0
.end method


# virtual methods
.method public beginBatchEdit()Z
    .locals 1

    .line 149
    iget-object v0, p0, Lio/flutter/plugin/editing/InputConnectionAdaptor;->mEditable:Lio/flutter/plugin/editing/ListenableEditingState;

    invoke-virtual {v0}, Lio/flutter/plugin/editing/ListenableEditingState;->beginBatchEdit()V

    .line 150
    iget v0, p0, Lio/flutter/plugin/editing/InputConnectionAdaptor;->batchEditNestDepth:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lio/flutter/plugin/editing/InputConnectionAdaptor;->batchEditNestDepth:I

    .line 151
    invoke-super {p0}, Landroid/view/inputmethod/BaseInputConnection;->beginBatchEdit()Z

    move-result v0

    return v0
.end method

.method public clearMetaKeyStates(I)Z
    .locals 1
    .param p1, "states"    # I

    .line 244
    invoke-super {p0, p1}, Landroid/view/inputmethod/BaseInputConnection;->clearMetaKeyStates(I)Z

    move-result v0

    .line 245
    .local v0, "result":Z
    return v0
.end method

.method public closeConnection()V
    .locals 1

    .line 250
    invoke-super {p0}, Landroid/view/inputmethod/BaseInputConnection;->closeConnection()V

    .line 251
    iget-object v0, p0, Lio/flutter/plugin/editing/InputConnectionAdaptor;->mEditable:Lio/flutter/plugin/editing/ListenableEditingState;

    invoke-virtual {v0, p0}, Lio/flutter/plugin/editing/ListenableEditingState;->removeEditingStateListener(Lio/flutter/plugin/editing/ListenableEditingState$EditingStateWatcher;)V

    .line 252
    :goto_0
    iget v0, p0, Lio/flutter/plugin/editing/InputConnectionAdaptor;->batchEditNestDepth:I

    if-lez v0, :cond_0

    .line 253
    invoke-virtual {p0}, Lio/flutter/plugin/editing/InputConnectionAdaptor;->endBatchEdit()Z

    .line 252
    iget v0, p0, Lio/flutter/plugin/editing/InputConnectionAdaptor;->batchEditNestDepth:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lio/flutter/plugin/editing/InputConnectionAdaptor;->batchEditNestDepth:I

    goto :goto_0

    .line 255
    :cond_0
    return-void
.end method

.method public commitContent(Landroid/view/inputmethod/InputContentInfo;ILandroid/os/Bundle;)Z
    .locals 8
    .param p1, "inputContentInfo"    # Landroid/view/inputmethod/InputContentInfo;
    .param p2, "flags"    # I
    .param p3, "opts"    # Landroid/os/Bundle;

    .line 485
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x19

    const/4 v2, 0x0

    if-lt v0, v1, :cond_2

    and-int/lit8 v0, p2, 0x1

    if-eqz v0, :cond_2

    .line 488
    :try_start_0
    invoke-virtual {p1}, Landroid/view/inputmethod/InputContentInfo;->requestPermission()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 491
    nop

    .line 496
    invoke-virtual {p1}, Landroid/view/inputmethod/InputContentInfo;->getDescription()Landroid/content/ClipDescription;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/ClipDescription;->getMimeTypeCount()I

    move-result v0

    if-lez v0, :cond_1

    .line 497
    invoke-virtual {p1}, Landroid/view/inputmethod/InputContentInfo;->requestPermission()V

    .line 499
    invoke-virtual {p1}, Landroid/view/inputmethod/InputContentInfo;->getContentUri()Landroid/net/Uri;

    move-result-object v0

    .line 500
    .local v0, "uri":Landroid/net/Uri;
    invoke-virtual {p1}, Landroid/view/inputmethod/InputContentInfo;->getDescription()Landroid/content/ClipDescription;

    move-result-object v1

    invoke-virtual {v1, v2}, Landroid/content/ClipDescription;->getMimeType(I)Ljava/lang/String;

    move-result-object v1

    .line 501
    .local v1, "mimeType":Ljava/lang/String;
    iget-object v3, p0, Lio/flutter/plugin/editing/InputConnectionAdaptor;->mFlutterView:Landroid/view/View;

    invoke-virtual {v3}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    .line 503
    .local v3, "context":Landroid/content/Context;
    if-eqz v0, :cond_0

    .line 507
    :try_start_1
    invoke-virtual {v3}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    invoke-virtual {v4, v0}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object v4
    :try_end_1
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_0

    .line 511
    .local v4, "is":Ljava/io/InputStream;
    nop

    .line 513
    if-eqz v4, :cond_0

    .line 514
    const/high16 v2, 0x10000

    invoke-direct {p0, v4, v2}, Lio/flutter/plugin/editing/InputConnectionAdaptor;->readStreamFully(Ljava/io/InputStream;I)[B

    move-result-object v2

    .line 516
    .local v2, "data":[B
    new-instance v5, Ljava/util/HashMap;

    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    .line 517
    .local v5, "obj":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v6, "mimeType"

    invoke-interface {v5, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 518
    const-string v6, "data"

    invoke-interface {v5, v6, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 519
    const-string v6, "uri"

    invoke-virtual {v0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v5, v6, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 522
    iget-object v6, p0, Lio/flutter/plugin/editing/InputConnectionAdaptor;->textInputChannel:Lio/flutter/embedding/engine/systemchannels/TextInputChannel;

    iget v7, p0, Lio/flutter/plugin/editing/InputConnectionAdaptor;->mClient:I

    invoke-virtual {v6, v7, v5}, Lio/flutter/embedding/engine/systemchannels/TextInputChannel;->commitContent(ILjava/util/Map;)V

    .line 523
    invoke-virtual {p1}, Landroid/view/inputmethod/InputContentInfo;->releasePermission()V

    .line 524
    const/4 v6, 0x1

    return v6

    .line 508
    .end local v2    # "data":[B
    .end local v4    # "is":Ljava/io/InputStream;
    .end local v5    # "obj":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    :catch_0
    move-exception v4

    .line 509
    .local v4, "ex":Ljava/io/FileNotFoundException;
    invoke-virtual {p1}, Landroid/view/inputmethod/InputContentInfo;->releasePermission()V

    .line 510
    return v2

    .line 528
    .end local v4    # "ex":Ljava/io/FileNotFoundException;
    :cond_0
    invoke-virtual {p1}, Landroid/view/inputmethod/InputContentInfo;->releasePermission()V

    .line 530
    .end local v0    # "uri":Landroid/net/Uri;
    .end local v1    # "mimeType":Ljava/lang/String;
    .end local v3    # "context":Landroid/content/Context;
    :cond_1
    return v2

    .line 489
    :catch_1
    move-exception v0

    .line 490
    .local v0, "e":Ljava/lang/Exception;
    return v2

    .line 493
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_2
    return v2
.end method

.method public commitText(Ljava/lang/CharSequence;I)Z
    .locals 1
    .param p1, "text"    # Ljava/lang/CharSequence;
    .param p2, "newCursorPosition"    # I

    .line 164
    invoke-super {p0, p1, p2}, Landroid/view/inputmethod/BaseInputConnection;->commitText(Ljava/lang/CharSequence;I)Z

    move-result v0

    .line 165
    .local v0, "result":Z
    return v0
.end method

.method public deleteSurroundingText(II)Z
    .locals 2
    .param p1, "beforeLength"    # I
    .param p2, "afterLength"    # I

    .line 170
    iget-object v0, p0, Lio/flutter/plugin/editing/InputConnectionAdaptor;->mEditable:Lio/flutter/plugin/editing/ListenableEditingState;

    invoke-virtual {v0}, Lio/flutter/plugin/editing/ListenableEditingState;->getSelectionStart()I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 171
    const/4 v0, 0x1

    return v0

    .line 174
    :cond_0
    invoke-super {p0, p1, p2}, Landroid/view/inputmethod/BaseInputConnection;->deleteSurroundingText(II)Z

    move-result v0

    .line 175
    .local v0, "result":Z
    return v0
.end method

.method public deleteSurroundingTextInCodePoints(II)Z
    .locals 1
    .param p1, "beforeLength"    # I
    .param p2, "afterLength"    # I

    .line 180
    invoke-super {p0, p1, p2}, Landroid/view/inputmethod/BaseInputConnection;->deleteSurroundingTextInCodePoints(II)Z

    move-result v0

    .line 181
    .local v0, "result":Z
    return v0
.end method

.method public didChangeEditingState(ZZZ)V
    .locals 6
    .param p1, "textChanged"    # Z
    .param p2, "selectionChanged"    # Z
    .param p3, "composingRegionChanged"    # Z

    .line 561
    iget-object v0, p0, Lio/flutter/plugin/editing/InputConnectionAdaptor;->mImm:Landroid/view/inputmethod/InputMethodManager;

    iget-object v1, p0, Lio/flutter/plugin/editing/InputConnectionAdaptor;->mFlutterView:Landroid/view/View;

    iget-object v2, p0, Lio/flutter/plugin/editing/InputConnectionAdaptor;->mEditable:Lio/flutter/plugin/editing/ListenableEditingState;

    .line 563
    invoke-virtual {v2}, Lio/flutter/plugin/editing/ListenableEditingState;->getSelectionStart()I

    move-result v2

    iget-object v3, p0, Lio/flutter/plugin/editing/InputConnectionAdaptor;->mEditable:Lio/flutter/plugin/editing/ListenableEditingState;

    .line 564
    invoke-virtual {v3}, Lio/flutter/plugin/editing/ListenableEditingState;->getSelectionEnd()I

    move-result v3

    iget-object v4, p0, Lio/flutter/plugin/editing/InputConnectionAdaptor;->mEditable:Lio/flutter/plugin/editing/ListenableEditingState;

    .line 565
    invoke-virtual {v4}, Lio/flutter/plugin/editing/ListenableEditingState;->getComposingStart()I

    move-result v4

    iget-object v5, p0, Lio/flutter/plugin/editing/InputConnectionAdaptor;->mEditable:Lio/flutter/plugin/editing/ListenableEditingState;

    .line 566
    invoke-virtual {v5}, Lio/flutter/plugin/editing/ListenableEditingState;->getComposingEnd()I

    move-result v5

    .line 561
    invoke-virtual/range {v0 .. v5}, Landroid/view/inputmethod/InputMethodManager;->updateSelection(Landroid/view/View;IIII)V

    .line 568
    iget-object v0, p0, Lio/flutter/plugin/editing/InputConnectionAdaptor;->mExtractRequest:Landroid/view/inputmethod/ExtractedTextRequest;

    if-eqz v0, :cond_0

    .line 569
    iget-object v1, p0, Lio/flutter/plugin/editing/InputConnectionAdaptor;->mImm:Landroid/view/inputmethod/InputMethodManager;

    iget-object v2, p0, Lio/flutter/plugin/editing/InputConnectionAdaptor;->mFlutterView:Landroid/view/View;

    iget v0, v0, Landroid/view/inputmethod/ExtractedTextRequest;->token:I

    iget-object v3, p0, Lio/flutter/plugin/editing/InputConnectionAdaptor;->mExtractRequest:Landroid/view/inputmethod/ExtractedTextRequest;

    .line 570
    invoke-direct {p0, v3}, Lio/flutter/plugin/editing/InputConnectionAdaptor;->getExtractedText(Landroid/view/inputmethod/ExtractedTextRequest;)Landroid/view/inputmethod/ExtractedText;

    move-result-object v3

    .line 569
    invoke-virtual {v1, v2, v0, v3}, Landroid/view/inputmethod/InputMethodManager;->updateExtractedText(Landroid/view/View;ILandroid/view/inputmethod/ExtractedText;)V

    .line 572
    :cond_0
    iget-boolean v0, p0, Lio/flutter/plugin/editing/InputConnectionAdaptor;->mMonitorCursorUpdate:Z

    if-eqz v0, :cond_1

    .line 573
    invoke-direct {p0}, Lio/flutter/plugin/editing/InputConnectionAdaptor;->getCursorAnchorInfo()Landroid/view/inputmethod/CursorAnchorInfo;

    move-result-object v0

    .line 574
    .local v0, "info":Landroid/view/inputmethod/CursorAnchorInfo;
    iget-object v1, p0, Lio/flutter/plugin/editing/InputConnectionAdaptor;->mImm:Landroid/view/inputmethod/InputMethodManager;

    iget-object v2, p0, Lio/flutter/plugin/editing/InputConnectionAdaptor;->mFlutterView:Landroid/view/View;

    invoke-virtual {v1, v2, v0}, Landroid/view/inputmethod/InputMethodManager;->updateCursorAnchorInfo(Landroid/view/View;Landroid/view/inputmethod/CursorAnchorInfo;)V

    .line 576
    .end local v0    # "info":Landroid/view/inputmethod/CursorAnchorInfo;
    :cond_1
    return-void
.end method

.method public endBatchEdit()Z
    .locals 2

    .line 156
    invoke-super {p0}, Landroid/view/inputmethod/BaseInputConnection;->endBatchEdit()Z

    move-result v0

    .line 157
    .local v0, "result":Z
    iget v1, p0, Lio/flutter/plugin/editing/InputConnectionAdaptor;->batchEditNestDepth:I

    add-int/lit8 v1, v1, -0x1

    iput v1, p0, Lio/flutter/plugin/editing/InputConnectionAdaptor;->batchEditNestDepth:I

    .line 158
    iget-object v1, p0, Lio/flutter/plugin/editing/InputConnectionAdaptor;->mEditable:Lio/flutter/plugin/editing/ListenableEditingState;

    invoke-virtual {v1}, Lio/flutter/plugin/editing/ListenableEditingState;->endBatchEdit()V

    .line 159
    return v0
.end method

.method public finishComposingText()Z
    .locals 1

    .line 205
    invoke-super {p0}, Landroid/view/inputmethod/BaseInputConnection;->finishComposingText()Z

    move-result v0

    .line 206
    .local v0, "result":Z
    return v0
.end method

.method public getEditable()Landroid/text/Editable;
    .locals 1

    .line 144
    iget-object v0, p0, Lio/flutter/plugin/editing/InputConnectionAdaptor;->mEditable:Lio/flutter/plugin/editing/ListenableEditingState;

    return-object v0
.end method

.method public getExtractedText(Landroid/view/inputmethod/ExtractedTextRequest;I)Landroid/view/inputmethod/ExtractedText;
    .locals 4
    .param p1, "request"    # Landroid/view/inputmethod/ExtractedTextRequest;
    .param p2, "flags"    # I

    .line 216
    and-int/lit8 v0, p2, 0x1

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 217
    .local v0, "textMonitor":Z
    :goto_0
    iget-object v3, p0, Lio/flutter/plugin/editing/InputConnectionAdaptor;->mExtractRequest:Landroid/view/inputmethod/ExtractedTextRequest;

    if-nez v3, :cond_1

    const/4 v1, 0x1

    :cond_1
    if-ne v0, v1, :cond_3

    .line 218
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "The input method toggled text monitoring "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    if-eqz v0, :cond_2

    const-string v2, "on"

    goto :goto_1

    :cond_2
    const-string v2, "off"

    :goto_1
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "InputConnectionAdaptor"

    invoke-static {v2, v1}, Lio/flutter/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 222
    :cond_3
    if-eqz v0, :cond_4

    move-object v1, p1

    goto :goto_2

    :cond_4
    const/4 v1, 0x0

    :goto_2
    iput-object v1, p0, Lio/flutter/plugin/editing/InputConnectionAdaptor;->mExtractRequest:Landroid/view/inputmethod/ExtractedTextRequest;

    .line 223
    invoke-direct {p0, p1}, Lio/flutter/plugin/editing/InputConnectionAdaptor;->getExtractedText(Landroid/view/inputmethod/ExtractedTextRequest;)Landroid/view/inputmethod/ExtractedText;

    move-result-object v1

    return-object v1
.end method

.method public handleKeyEvent(Landroid/view/KeyEvent;)Z
    .locals 8
    .param p1, "event"    # Landroid/view/KeyEvent;

    .line 290
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_9

    .line 291
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v0

    const/16 v2, 0x15

    const/4 v3, 0x1

    if-ne v0, v2, :cond_0

    .line 292
    invoke-virtual {p1}, Landroid/view/KeyEvent;->isShiftPressed()Z

    move-result v0

    invoke-direct {p0, v3, v0}, Lio/flutter/plugin/editing/InputConnectionAdaptor;->handleHorizontalMovement(ZZ)Z

    move-result v0

    return v0

    .line 293
    :cond_0
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v0

    const/16 v2, 0x16

    if-ne v0, v2, :cond_1

    .line 294
    invoke-virtual {p1}, Landroid/view/KeyEvent;->isShiftPressed()Z

    move-result v0

    invoke-direct {p0, v1, v0}, Lio/flutter/plugin/editing/InputConnectionAdaptor;->handleHorizontalMovement(ZZ)Z

    move-result v0

    return v0

    .line 295
    :cond_1
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v0

    const/16 v2, 0x13

    if-ne v0, v2, :cond_2

    .line 296
    invoke-virtual {p1}, Landroid/view/KeyEvent;->isShiftPressed()Z

    move-result v0

    invoke-direct {p0, v3, v0}, Lio/flutter/plugin/editing/InputConnectionAdaptor;->handleVerticalMovement(ZZ)Z

    move-result v0

    return v0

    .line 297
    :cond_2
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v0

    const/16 v2, 0x14

    if-ne v0, v2, :cond_3

    .line 298
    invoke-virtual {p1}, Landroid/view/KeyEvent;->isShiftPressed()Z

    move-result v0

    invoke-direct {p0, v1, v0}, Lio/flutter/plugin/editing/InputConnectionAdaptor;->handleVerticalMovement(ZZ)Z

    move-result v0

    return v0

    .line 301
    :cond_3
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v0

    const/16 v2, 0x42

    if-eq v0, v2, :cond_4

    .line 302
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v0

    const/16 v2, 0xa0

    if-ne v0, v2, :cond_5

    :cond_4
    iget-object v0, p0, Lio/flutter/plugin/editing/InputConnectionAdaptor;->mEditorInfo:Landroid/view/inputmethod/EditorInfo;

    iget v0, v0, Landroid/view/inputmethod/EditorInfo;->inputType:I

    const/high16 v2, 0x20000

    and-int/2addr v0, v2

    if-nez v0, :cond_5

    .line 304
    iget-object v0, p0, Lio/flutter/plugin/editing/InputConnectionAdaptor;->mEditorInfo:Landroid/view/inputmethod/EditorInfo;

    iget v0, v0, Landroid/view/inputmethod/EditorInfo;->imeOptions:I

    and-int/lit16 v0, v0, 0xff

    invoke-virtual {p0, v0}, Lio/flutter/plugin/editing/InputConnectionAdaptor;->performEditorAction(I)Z

    .line 305
    return v3

    .line 308
    :cond_5
    iget-object v0, p0, Lio/flutter/plugin/editing/InputConnectionAdaptor;->mEditable:Lio/flutter/plugin/editing/ListenableEditingState;

    invoke-static {v0}, Landroid/text/Selection;->getSelectionStart(Ljava/lang/CharSequence;)I

    move-result v0

    .line 309
    .local v0, "selStart":I
    iget-object v2, p0, Lio/flutter/plugin/editing/InputConnectionAdaptor;->mEditable:Lio/flutter/plugin/editing/ListenableEditingState;

    invoke-static {v2}, Landroid/text/Selection;->getSelectionEnd(Ljava/lang/CharSequence;)I

    move-result v2

    .line 310
    .local v2, "selEnd":I
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getUnicodeChar()I

    move-result v4

    .line 311
    .local v4, "character":I
    if-ltz v0, :cond_8

    if-ltz v2, :cond_8

    if-nez v4, :cond_6

    goto :goto_0

    .line 315
    :cond_6
    invoke-static {v0, v2}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 316
    .local v1, "selMin":I
    invoke-static {v0, v2}, Ljava/lang/Math;->max(II)I

    move-result v5

    .line 317
    .local v5, "selMax":I
    invoke-virtual {p0}, Lio/flutter/plugin/editing/InputConnectionAdaptor;->beginBatchEdit()Z

    .line 318
    if-eq v1, v5, :cond_7

    iget-object v6, p0, Lio/flutter/plugin/editing/InputConnectionAdaptor;->mEditable:Lio/flutter/plugin/editing/ListenableEditingState;

    invoke-virtual {v6, v1, v5}, Lio/flutter/plugin/editing/ListenableEditingState;->delete(II)Landroid/text/SpannableStringBuilder;

    .line 319
    :cond_7
    iget-object v6, p0, Lio/flutter/plugin/editing/InputConnectionAdaptor;->mEditable:Lio/flutter/plugin/editing/ListenableEditingState;

    int-to-char v7, v4

    invoke-static {v7}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v1, v7}, Lio/flutter/plugin/editing/ListenableEditingState;->insert(ILjava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 320
    add-int/lit8 v6, v1, 0x1

    add-int/lit8 v7, v1, 0x1

    invoke-virtual {p0, v6, v7}, Lio/flutter/plugin/editing/InputConnectionAdaptor;->setSelection(II)Z

    .line 321
    invoke-virtual {p0}, Lio/flutter/plugin/editing/InputConnectionAdaptor;->endBatchEdit()Z

    .line 322
    return v3

    .line 312
    .end local v1    # "selMin":I
    .end local v5    # "selMax":I
    :cond_8
    :goto_0
    return v1

    .line 325
    .end local v0    # "selStart":I
    .end local v2    # "selEnd":I
    .end local v4    # "character":I
    :cond_9
    return v1
.end method

.method public performContextMenuAction(I)Z
    .locals 1
    .param p1, "id"    # I

    .line 384
    invoke-virtual {p0}, Lio/flutter/plugin/editing/InputConnectionAdaptor;->beginBatchEdit()Z

    .line 385
    invoke-direct {p0, p1}, Lio/flutter/plugin/editing/InputConnectionAdaptor;->doPerformContextMenuAction(I)Z

    move-result v0

    .line 386
    .local v0, "result":Z
    invoke-virtual {p0}, Lio/flutter/plugin/editing/InputConnectionAdaptor;->endBatchEdit()Z

    .line 387
    return v0
.end method

.method public performEditorAction(I)Z
    .locals 2
    .param p1, "actionCode"    # I

    .line 450
    packed-switch p1, :pswitch_data_0

    .line 474
    :pswitch_0
    iget-object v0, p0, Lio/flutter/plugin/editing/InputConnectionAdaptor;->textInputChannel:Lio/flutter/embedding/engine/systemchannels/TextInputChannel;

    iget v1, p0, Lio/flutter/plugin/editing/InputConnectionAdaptor;->mClient:I

    invoke-virtual {v0, v1}, Lio/flutter/embedding/engine/systemchannels/TextInputChannel;->done(I)V

    goto :goto_0

    .line 470
    :pswitch_1
    iget-object v0, p0, Lio/flutter/plugin/editing/InputConnectionAdaptor;->textInputChannel:Lio/flutter/embedding/engine/systemchannels/TextInputChannel;

    iget v1, p0, Lio/flutter/plugin/editing/InputConnectionAdaptor;->mClient:I

    invoke-virtual {v0, v1}, Lio/flutter/embedding/engine/systemchannels/TextInputChannel;->previous(I)V

    .line 471
    goto :goto_0

    .line 467
    :pswitch_2
    iget-object v0, p0, Lio/flutter/plugin/editing/InputConnectionAdaptor;->textInputChannel:Lio/flutter/embedding/engine/systemchannels/TextInputChannel;

    iget v1, p0, Lio/flutter/plugin/editing/InputConnectionAdaptor;->mClient:I

    invoke-virtual {v0, v1}, Lio/flutter/embedding/engine/systemchannels/TextInputChannel;->next(I)V

    .line 468
    goto :goto_0

    .line 464
    :pswitch_3
    iget-object v0, p0, Lio/flutter/plugin/editing/InputConnectionAdaptor;->textInputChannel:Lio/flutter/embedding/engine/systemchannels/TextInputChannel;

    iget v1, p0, Lio/flutter/plugin/editing/InputConnectionAdaptor;->mClient:I

    invoke-virtual {v0, v1}, Lio/flutter/embedding/engine/systemchannels/TextInputChannel;->send(I)V

    .line 465
    goto :goto_0

    .line 461
    :pswitch_4
    iget-object v0, p0, Lio/flutter/plugin/editing/InputConnectionAdaptor;->textInputChannel:Lio/flutter/embedding/engine/systemchannels/TextInputChannel;

    iget v1, p0, Lio/flutter/plugin/editing/InputConnectionAdaptor;->mClient:I

    invoke-virtual {v0, v1}, Lio/flutter/embedding/engine/systemchannels/TextInputChannel;->search(I)V

    .line 462
    goto :goto_0

    .line 458
    :pswitch_5
    iget-object v0, p0, Lio/flutter/plugin/editing/InputConnectionAdaptor;->textInputChannel:Lio/flutter/embedding/engine/systemchannels/TextInputChannel;

    iget v1, p0, Lio/flutter/plugin/editing/InputConnectionAdaptor;->mClient:I

    invoke-virtual {v0, v1}, Lio/flutter/embedding/engine/systemchannels/TextInputChannel;->go(I)V

    .line 459
    goto :goto_0

    .line 452
    :pswitch_6
    iget-object v0, p0, Lio/flutter/plugin/editing/InputConnectionAdaptor;->textInputChannel:Lio/flutter/embedding/engine/systemchannels/TextInputChannel;

    iget v1, p0, Lio/flutter/plugin/editing/InputConnectionAdaptor;->mClient:I

    invoke-virtual {v0, v1}, Lio/flutter/embedding/engine/systemchannels/TextInputChannel;->newline(I)V

    .line 453
    goto :goto_0

    .line 455
    :pswitch_7
    iget-object v0, p0, Lio/flutter/plugin/editing/InputConnectionAdaptor;->textInputChannel:Lio/flutter/embedding/engine/systemchannels/TextInputChannel;

    iget v1, p0, Lio/flutter/plugin/editing/InputConnectionAdaptor;->mClient:I

    invoke-virtual {v0, v1}, Lio/flutter/embedding/engine/systemchannels/TextInputChannel;->unspecifiedAction(I)V

    .line 456
    nop

    .line 477
    :goto_0
    const/4 v0, 0x1

    return v0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public performPrivateCommand(Ljava/lang/String;Landroid/os/Bundle;)Z
    .locals 2
    .param p1, "action"    # Ljava/lang/String;
    .param p2, "data"    # Landroid/os/Bundle;

    .line 444
    iget-object v0, p0, Lio/flutter/plugin/editing/InputConnectionAdaptor;->textInputChannel:Lio/flutter/embedding/engine/systemchannels/TextInputChannel;

    iget v1, p0, Lio/flutter/plugin/editing/InputConnectionAdaptor;->mClient:I

    invoke-virtual {v0, v1, p1, p2}, Lio/flutter/embedding/engine/systemchannels/TextInputChannel;->performPrivateCommand(ILjava/lang/String;Landroid/os/Bundle;)V

    .line 445
    const/4 v0, 0x1

    return v0
.end method

.method public requestCursorUpdates(I)Z
    .locals 4
    .param p1, "cursorUpdateMode"    # I

    .line 228
    and-int/lit8 v0, p1, 0x1

    if-eqz v0, :cond_0

    .line 229
    iget-object v0, p0, Lio/flutter/plugin/editing/InputConnectionAdaptor;->mImm:Landroid/view/inputmethod/InputMethodManager;

    iget-object v1, p0, Lio/flutter/plugin/editing/InputConnectionAdaptor;->mFlutterView:Landroid/view/View;

    invoke-direct {p0}, Lio/flutter/plugin/editing/InputConnectionAdaptor;->getCursorAnchorInfo()Landroid/view/inputmethod/CursorAnchorInfo;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/view/inputmethod/InputMethodManager;->updateCursorAnchorInfo(Landroid/view/View;Landroid/view/inputmethod/CursorAnchorInfo;)V

    .line 232
    :cond_0
    and-int/lit8 v0, p1, 0x2

    const/4 v1, 0x1

    if-eqz v0, :cond_1

    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    .line 233
    .local v0, "updated":Z
    :goto_0
    iget-boolean v2, p0, Lio/flutter/plugin/editing/InputConnectionAdaptor;->mMonitorCursorUpdate:Z

    if-eq v0, v2, :cond_3

    .line 234
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "The input method toggled cursor monitoring "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    if-eqz v0, :cond_2

    const-string v3, "on"

    goto :goto_1

    :cond_2
    const-string v3, "off"

    :goto_1
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "InputConnectionAdaptor"

    invoke-static {v3, v2}, Lio/flutter/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 238
    :cond_3
    iput-boolean v0, p0, Lio/flutter/plugin/editing/InputConnectionAdaptor;->mMonitorCursorUpdate:Z

    .line 239
    return v1
.end method

.method public sendKeyEvent(Landroid/view/KeyEvent;)Z
    .locals 1
    .param p1, "event"    # Landroid/view/KeyEvent;

    .line 286
    iget-object v0, p0, Lio/flutter/plugin/editing/InputConnectionAdaptor;->keyboardDelegate:Lio/flutter/plugin/editing/InputConnectionAdaptor$KeyboardDelegate;

    invoke-interface {v0, p1}, Lio/flutter/plugin/editing/InputConnectionAdaptor$KeyboardDelegate;->handleEvent(Landroid/view/KeyEvent;)Z

    move-result v0

    return v0
.end method

.method public setComposingRegion(II)Z
    .locals 1
    .param p1, "start"    # I
    .param p2, "end"    # I

    .line 186
    invoke-super {p0, p1, p2}, Landroid/view/inputmethod/BaseInputConnection;->setComposingRegion(II)Z

    move-result v0

    .line 187
    .local v0, "result":Z
    return v0
.end method

.method public setComposingText(Ljava/lang/CharSequence;I)Z
    .locals 1
    .param p1, "text"    # Ljava/lang/CharSequence;
    .param p2, "newCursorPosition"    # I

    .line 193
    invoke-virtual {p0}, Lio/flutter/plugin/editing/InputConnectionAdaptor;->beginBatchEdit()Z

    .line 194
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v0

    if-nez v0, :cond_0

    .line 195
    invoke-super {p0, p1, p2}, Landroid/view/inputmethod/BaseInputConnection;->commitText(Ljava/lang/CharSequence;I)Z

    move-result v0

    .local v0, "result":Z
    goto :goto_0

    .line 197
    .end local v0    # "result":Z
    :cond_0
    invoke-super {p0, p1, p2}, Landroid/view/inputmethod/BaseInputConnection;->setComposingText(Ljava/lang/CharSequence;I)Z

    move-result v0

    .line 199
    .restart local v0    # "result":Z
    :goto_0
    invoke-virtual {p0}, Lio/flutter/plugin/editing/InputConnectionAdaptor;->endBatchEdit()Z

    .line 200
    return v0
.end method

.method public setSelection(II)Z
    .locals 1
    .param p1, "start"    # I
    .param p2, "end"    # I

    .line 259
    invoke-virtual {p0}, Lio/flutter/plugin/editing/InputConnectionAdaptor;->beginBatchEdit()Z

    .line 260
    invoke-super {p0, p1, p2}, Landroid/view/inputmethod/BaseInputConnection;->setSelection(II)Z

    move-result v0

    .line 261
    .local v0, "result":Z
    invoke-virtual {p0}, Lio/flutter/plugin/editing/InputConnectionAdaptor;->endBatchEdit()Z

    .line 262
    return v0
.end method
