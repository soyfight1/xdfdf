.class public Lio/flutter/plugin/platform/PlatformViewWrapper;
.super Landroid/widget/FrameLayout;
.source "PlatformViewWrapper.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "PlatformViewWrapper"


# instance fields
.field private activeFocusListener:Landroid/view/ViewTreeObserver$OnGlobalFocusChangeListener;

.field private left:I

.field private prevLeft:I

.field private prevTop:I

.field private renderTarget:Lio/flutter/plugin/platform/PlatformViewRenderTarget;

.field private top:I

.field private touchProcessor:Lio/flutter/embedding/android/AndroidTouchProcessor;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .line 57
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 58
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lio/flutter/plugin/platform/PlatformViewWrapper;->setWillNotDraw(Z)V

    .line 59
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lio/flutter/plugin/platform/PlatformViewRenderTarget;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "renderTarget"    # Lio/flutter/plugin/platform/PlatformViewRenderTarget;

    .line 63
    invoke-direct {p0, p1}, Lio/flutter/plugin/platform/PlatformViewWrapper;-><init>(Landroid/content/Context;)V

    .line 64
    iput-object p2, p0, Lio/flutter/plugin/platform/PlatformViewWrapper;->renderTarget:Lio/flutter/plugin/platform/PlatformViewRenderTarget;

    .line 66
    invoke-interface {p2}, Lio/flutter/plugin/platform/PlatformViewRenderTarget;->getSurface()Landroid/view/Surface;

    move-result-object v0

    .line 67
    .local v0, "surface":Landroid/view/Surface;
    if-eqz v0, :cond_0

    sget-boolean v1, Lio/flutter/embedding/engine/renderer/FlutterRenderer;->debugDisableSurfaceClear:Z

    if-nez v1, :cond_0

    .line 68
    invoke-virtual {v0}, Landroid/view/Surface;->lockHardwareCanvas()Landroid/graphics/Canvas;

    move-result-object v1

    .line 70
    .local v1, "canvas":Landroid/graphics/Canvas;
    :try_start_0
    sget-object v2, Landroid/graphics/PorterDuff$Mode;->CLEAR:Landroid/graphics/PorterDuff$Mode;

    const/4 v3, 0x0

    invoke-virtual {v1, v3, v2}, Landroid/graphics/Canvas;->drawColor(ILandroid/graphics/PorterDuff$Mode;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 72
    invoke-virtual {v0, v1}, Landroid/view/Surface;->unlockCanvasAndPost(Landroid/graphics/Canvas;)V

    .line 73
    goto :goto_0

    .line 72
    :catchall_0
    move-exception v2

    invoke-virtual {v0, v1}, Landroid/view/Surface;->unlockCanvasAndPost(Landroid/graphics/Canvas;)V

    .line 73
    throw v2

    .line 75
    .end local v1    # "canvas":Landroid/graphics/Canvas;
    :cond_0
    :goto_0
    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .locals 4
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .line 163
    iget-object v0, p0, Lio/flutter/plugin/platform/PlatformViewWrapper;->renderTarget:Lio/flutter/plugin/platform/PlatformViewRenderTarget;

    const-string v1, "PlatformViewWrapper"

    if-nez v0, :cond_0

    .line 164
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->draw(Landroid/graphics/Canvas;)V

    .line 165
    const-string v0, "Platform view cannot be composed without a RenderTarget."

    invoke-static {v1, v0}, Lio/flutter/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 166
    return-void

    .line 169
    :cond_0
    invoke-interface {v0}, Lio/flutter/plugin/platform/PlatformViewRenderTarget;->getSurface()Landroid/view/Surface;

    move-result-object v0

    .line 170
    .local v0, "targetSurface":Landroid/view/Surface;
    invoke-virtual {v0}, Landroid/view/Surface;->isValid()Z

    move-result v2

    if-nez v2, :cond_1

    .line 171
    const-string v2, "Platform view cannot be composed without a valid RenderTarget surface."

    invoke-static {v1, v2}, Lio/flutter/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 172
    return-void

    .line 175
    :cond_1
    invoke-virtual {v0}, Landroid/view/Surface;->lockHardwareCanvas()Landroid/graphics/Canvas;

    move-result-object v1

    .line 176
    .local v1, "targetCanvas":Landroid/graphics/Canvas;
    if-nez v1, :cond_2

    .line 178
    invoke-virtual {p0}, Lio/flutter/plugin/platform/PlatformViewWrapper;->invalidate()V

    .line 179
    return-void

    .line 185
    :cond_2
    :try_start_0
    sget-object v2, Landroid/graphics/PorterDuff$Mode;->CLEAR:Landroid/graphics/PorterDuff$Mode;

    const/4 v3, 0x0

    invoke-virtual {v1, v3, v2}, Landroid/graphics/Canvas;->drawColor(ILandroid/graphics/PorterDuff$Mode;)V

    .line 187
    invoke-super {p0, v1}, Landroid/widget/FrameLayout;->draw(Landroid/graphics/Canvas;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 189
    iget-object v2, p0, Lio/flutter/plugin/platform/PlatformViewWrapper;->renderTarget:Lio/flutter/plugin/platform/PlatformViewRenderTarget;

    invoke-interface {v2}, Lio/flutter/plugin/platform/PlatformViewRenderTarget;->scheduleFrame()V

    .line 190
    invoke-virtual {v0, v1}, Landroid/view/Surface;->unlockCanvasAndPost(Landroid/graphics/Canvas;)V

    .line 191
    nop

    .line 192
    return-void

    .line 189
    :catchall_0
    move-exception v2

    iget-object v3, p0, Lio/flutter/plugin/platform/PlatformViewWrapper;->renderTarget:Lio/flutter/plugin/platform/PlatformViewRenderTarget;

    invoke-interface {v3}, Lio/flutter/plugin/platform/PlatformViewRenderTarget;->scheduleFrame()V

    .line 190
    invoke-virtual {v0, v1}, Landroid/view/Surface;->unlockCanvasAndPost(Landroid/graphics/Canvas;)V

    .line 191
    throw v2
.end method

.method public getActiveFocusListener()Landroid/view/ViewTreeObserver$OnGlobalFocusChangeListener;
    .locals 1

    .line 224
    iget-object v0, p0, Lio/flutter/plugin/platform/PlatformViewWrapper;->activeFocusListener:Landroid/view/ViewTreeObserver$OnGlobalFocusChangeListener;

    return-object v0
.end method

.method public getRenderTargetHeight()I
    .locals 1

    .line 112
    iget-object v0, p0, Lio/flutter/plugin/platform/PlatformViewWrapper;->renderTarget:Lio/flutter/plugin/platform/PlatformViewRenderTarget;

    if-eqz v0, :cond_0

    .line 113
    invoke-interface {v0}, Lio/flutter/plugin/platform/PlatformViewRenderTarget;->getHeight()I

    move-result v0

    return v0

    .line 115
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public getRenderTargetWidth()I
    .locals 1

    .line 105
    iget-object v0, p0, Lio/flutter/plugin/platform/PlatformViewWrapper;->renderTarget:Lio/flutter/plugin/platform/PlatformViewRenderTarget;

    if-eqz v0, :cond_0

    .line 106
    invoke-interface {v0}, Lio/flutter/plugin/platform/PlatformViewRenderTarget;->getWidth()I

    move-result v0

    return v0

    .line 108
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public invalidateChildInParent([ILandroid/graphics/Rect;)Landroid/view/ViewParent;
    .locals 1
    .param p1, "location"    # [I
    .param p2, "dirty"    # Landroid/graphics/Rect;

    .line 156
    invoke-virtual {p0}, Lio/flutter/plugin/platform/PlatformViewWrapper;->invalidate()V

    .line 157
    invoke-super {p0, p1, p2}, Landroid/widget/FrameLayout;->invalidateChildInParent([ILandroid/graphics/Rect;)Landroid/view/ViewParent;

    move-result-object v0

    return-object v0
.end method

.method public onDescendantInvalidated(Landroid/view/View;Landroid/view/View;)V
    .locals 0
    .param p1, "child"    # Landroid/view/View;
    .param p2, "target"    # Landroid/view/View;

    .line 150
    invoke-super {p0, p1, p2}, Landroid/widget/FrameLayout;->onDescendantInvalidated(Landroid/view/View;Landroid/view/View;)V

    .line 151
    invoke-virtual {p0}, Lio/flutter/plugin/platform/PlatformViewWrapper;->invalidate()V

    .line 152
    return-void
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1
    .param p1, "event"    # Landroid/view/MotionEvent;

    .line 128
    const/4 v0, 0x1

    return v0
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 3
    .param p1, "event"    # Landroid/view/MotionEvent;

    .line 197
    iget-object v0, p0, Lio/flutter/plugin/platform/PlatformViewWrapper;->touchProcessor:Lio/flutter/embedding/android/AndroidTouchProcessor;

    if-nez v0, :cond_0

    .line 198
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    return v0

    .line 200
    :cond_0
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    .line 201
    .local v0, "screenMatrix":Landroid/graphics/Matrix;
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    .line 216
    :pswitch_0
    iget v1, p0, Lio/flutter/plugin/platform/PlatformViewWrapper;->left:I

    int-to-float v1, v1

    iget v2, p0, Lio/flutter/plugin/platform/PlatformViewWrapper;->top:I

    int-to-float v2, v2

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    goto :goto_0

    .line 210
    :pswitch_1
    iget v1, p0, Lio/flutter/plugin/platform/PlatformViewWrapper;->prevLeft:I

    int-to-float v1, v1

    iget v2, p0, Lio/flutter/plugin/platform/PlatformViewWrapper;->prevTop:I

    int-to-float v2, v2

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 211
    iget v1, p0, Lio/flutter/plugin/platform/PlatformViewWrapper;->left:I

    iput v1, p0, Lio/flutter/plugin/platform/PlatformViewWrapper;->prevLeft:I

    .line 212
    iget v1, p0, Lio/flutter/plugin/platform/PlatformViewWrapper;->top:I

    iput v1, p0, Lio/flutter/plugin/platform/PlatformViewWrapper;->prevTop:I

    .line 213
    goto :goto_0

    .line 203
    :pswitch_2
    iget v1, p0, Lio/flutter/plugin/platform/PlatformViewWrapper;->left:I

    iput v1, p0, Lio/flutter/plugin/platform/PlatformViewWrapper;->prevLeft:I

    .line 204
    iget v2, p0, Lio/flutter/plugin/platform/PlatformViewWrapper;->top:I

    iput v2, p0, Lio/flutter/plugin/platform/PlatformViewWrapper;->prevTop:I

    .line 205
    int-to-float v1, v1

    int-to-float v2, v2

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 206
    nop

    .line 219
    :goto_0
    iget-object v1, p0, Lio/flutter/plugin/platform/PlatformViewWrapper;->touchProcessor:Lio/flutter/embedding/android/AndroidTouchProcessor;

    invoke-virtual {v1, p1, v0}, Lio/flutter/embedding/android/AndroidTouchProcessor;->onTouchEvent(Landroid/view/MotionEvent;Landroid/graphics/Matrix;)Z

    move-result v1

    return v1

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public release()V
    .locals 1

    .line 120
    iget-object v0, p0, Lio/flutter/plugin/platform/PlatformViewWrapper;->renderTarget:Lio/flutter/plugin/platform/PlatformViewRenderTarget;

    if-eqz v0, :cond_0

    .line 121
    invoke-interface {v0}, Lio/flutter/plugin/platform/PlatformViewRenderTarget;->release()V

    .line 122
    const/4 v0, 0x0

    iput-object v0, p0, Lio/flutter/plugin/platform/PlatformViewWrapper;->renderTarget:Lio/flutter/plugin/platform/PlatformViewRenderTarget;

    .line 124
    :cond_0
    return-void
.end method

.method public requestSendAccessibilityEvent(Landroid/view/View;Landroid/view/accessibility/AccessibilityEvent;)Z
    .locals 4
    .param p1, "child"    # Landroid/view/View;
    .param p2, "event"    # Landroid/view/accessibility/AccessibilityEvent;

    .line 133
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lio/flutter/plugin/platform/PlatformViewWrapper;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 134
    .local v1, "embeddedView":Landroid/view/View;
    if-eqz v1, :cond_0

    .line 135
    invoke-virtual {v1}, Landroid/view/View;->getImportantForAccessibility()I

    move-result v2

    const/4 v3, 0x4

    if-ne v2, v3, :cond_0

    .line 137
    return v0

    .line 143
    :cond_0
    invoke-super {p0, p1, p2}, Landroid/widget/FrameLayout;->requestSendAccessibilityEvent(Landroid/view/View;Landroid/view/accessibility/AccessibilityEvent;)Z

    move-result v0

    return v0
.end method

.method public resizeRenderTarget(II)V
    .locals 1
    .param p1, "width"    # I
    .param p2, "height"    # I

    .line 99
    iget-object v0, p0, Lio/flutter/plugin/platform/PlatformViewWrapper;->renderTarget:Lio/flutter/plugin/platform/PlatformViewRenderTarget;

    if-eqz v0, :cond_0

    .line 100
    invoke-interface {v0, p1, p2}, Lio/flutter/plugin/platform/PlatformViewRenderTarget;->resize(II)V

    .line 102
    :cond_0
    return-void
.end method

.method public setLayoutParams(Landroid/widget/FrameLayout$LayoutParams;)V
    .locals 1
    .param p1, "params"    # Landroid/widget/FrameLayout$LayoutParams;

    .line 92
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 94
    iget v0, p1, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    iput v0, p0, Lio/flutter/plugin/platform/PlatformViewWrapper;->left:I

    .line 95
    iget v0, p1, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    iput v0, p0, Lio/flutter/plugin/platform/PlatformViewWrapper;->top:I

    .line 96
    return-void
.end method

.method public setOnDescendantFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V
    .locals 2
    .param p1, "userFocusListener"    # Landroid/view/View$OnFocusChangeListener;

    .line 228
    invoke-virtual {p0}, Lio/flutter/plugin/platform/PlatformViewWrapper;->unsetOnDescendantFocusChangeListener()V

    .line 229
    invoke-virtual {p0}, Lio/flutter/plugin/platform/PlatformViewWrapper;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    .line 230
    .local v0, "observer":Landroid/view/ViewTreeObserver;
    invoke-virtual {v0}, Landroid/view/ViewTreeObserver;->isAlive()Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lio/flutter/plugin/platform/PlatformViewWrapper;->activeFocusListener:Landroid/view/ViewTreeObserver$OnGlobalFocusChangeListener;

    if-nez v1, :cond_0

    .line 231
    new-instance v1, Lio/flutter/plugin/platform/PlatformViewWrapper$1;

    invoke-direct {v1, p0, p1}, Lio/flutter/plugin/platform/PlatformViewWrapper$1;-><init>(Lio/flutter/plugin/platform/PlatformViewWrapper;Landroid/view/View$OnFocusChangeListener;)V

    iput-object v1, p0, Lio/flutter/plugin/platform/PlatformViewWrapper;->activeFocusListener:Landroid/view/ViewTreeObserver$OnGlobalFocusChangeListener;

    .line 239
    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->addOnGlobalFocusChangeListener(Landroid/view/ViewTreeObserver$OnGlobalFocusChangeListener;)V

    .line 241
    :cond_0
    return-void
.end method

.method public setTouchProcessor(Lio/flutter/embedding/android/AndroidTouchProcessor;)V
    .locals 0
    .param p1, "newTouchProcessor"    # Lio/flutter/embedding/android/AndroidTouchProcessor;

    .line 83
    iput-object p1, p0, Lio/flutter/plugin/platform/PlatformViewWrapper;->touchProcessor:Lio/flutter/embedding/android/AndroidTouchProcessor;

    .line 84
    return-void
.end method

.method public unsetOnDescendantFocusChangeListener()V
    .locals 3

    .line 244
    invoke-virtual {p0}, Lio/flutter/plugin/platform/PlatformViewWrapper;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    .line 245
    .local v0, "observer":Landroid/view/ViewTreeObserver;
    invoke-virtual {v0}, Landroid/view/ViewTreeObserver;->isAlive()Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lio/flutter/plugin/platform/PlatformViewWrapper;->activeFocusListener:Landroid/view/ViewTreeObserver$OnGlobalFocusChangeListener;

    if-eqz v1, :cond_0

    .line 246
    iget-object v1, p0, Lio/flutter/plugin/platform/PlatformViewWrapper;->activeFocusListener:Landroid/view/ViewTreeObserver$OnGlobalFocusChangeListener;

    .line 247
    .local v1, "currFocusListener":Landroid/view/ViewTreeObserver$OnGlobalFocusChangeListener;
    const/4 v2, 0x0

    iput-object v2, p0, Lio/flutter/plugin/platform/PlatformViewWrapper;->activeFocusListener:Landroid/view/ViewTreeObserver$OnGlobalFocusChangeListener;

    .line 248
    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->removeOnGlobalFocusChangeListener(Landroid/view/ViewTreeObserver$OnGlobalFocusChangeListener;)V

    .line 250
    .end local v1    # "currFocusListener":Landroid/view/ViewTreeObserver$OnGlobalFocusChangeListener;
    :cond_0
    return-void
.end method
