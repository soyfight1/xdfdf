.class public Lio/flutter/embedding/android/FlutterSurfaceView;
.super Landroid/view/SurfaceView;
.source "FlutterSurfaceView.java"

# interfaces
.implements Lio/flutter/embedding/engine/renderer/RenderSurface;


# static fields
.field private static final TAG:Ljava/lang/String; = "FlutterSurfaceView"


# instance fields
.field private flutterRenderer:Lio/flutter/embedding/engine/renderer/FlutterRenderer;

.field private final flutterUiDisplayListener:Lio/flutter/embedding/engine/renderer/FlutterUiDisplayListener;

.field private isPaused:Z

.field private isSurfaceAvailableForRendering:Z

.field private final renderTransparently:Z

.field private final surfaceCallback:Landroid/view/SurfaceHolder$Callback;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .line 104
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, v1}, Lio/flutter/embedding/android/FlutterSurfaceView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;Z)V

    .line 105
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .line 117
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lio/flutter/embedding/android/FlutterSurfaceView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;Z)V

    .line 118
    return-void
.end method

.method private constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;Z)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "renderTransparently"    # Z

    .line 122
    invoke-direct {p0, p1, p2}, Landroid/view/SurfaceView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 40
    const/4 v0, 0x0

    iput-boolean v0, p0, Lio/flutter/embedding/android/FlutterSurfaceView;->isSurfaceAvailableForRendering:Z

    .line 41
    iput-boolean v0, p0, Lio/flutter/embedding/android/FlutterSurfaceView;->isPaused:Z

    .line 51
    new-instance v0, Lio/flutter/embedding/android/FlutterSurfaceView$1;

    invoke-direct {v0, p0}, Lio/flutter/embedding/android/FlutterSurfaceView$1;-><init>(Lio/flutter/embedding/android/FlutterSurfaceView;)V

    iput-object v0, p0, Lio/flutter/embedding/android/FlutterSurfaceView;->surfaceCallback:Landroid/view/SurfaceHolder$Callback;

    .line 83
    new-instance v0, Lio/flutter/embedding/android/FlutterSurfaceView$2;

    invoke-direct {v0, p0}, Lio/flutter/embedding/android/FlutterSurfaceView$2;-><init>(Lio/flutter/embedding/android/FlutterSurfaceView;)V

    iput-object v0, p0, Lio/flutter/embedding/android/FlutterSurfaceView;->flutterUiDisplayListener:Lio/flutter/embedding/engine/renderer/FlutterUiDisplayListener;

    .line 123
    iput-boolean p3, p0, Lio/flutter/embedding/android/FlutterSurfaceView;->renderTransparently:Z

    .line 124
    invoke-direct {p0}, Lio/flutter/embedding/android/FlutterSurfaceView;->init()V

    .line 125
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Z)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "renderTransparently"    # Z

    .line 112
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0, p2}, Lio/flutter/embedding/android/FlutterSurfaceView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;Z)V

    .line 113
    return-void
.end method

.method static synthetic access$002(Lio/flutter/embedding/android/FlutterSurfaceView;Z)Z
    .locals 0
    .param p0, "x0"    # Lio/flutter/embedding/android/FlutterSurfaceView;
    .param p1, "x1"    # Z

    .line 36
    iput-boolean p1, p0, Lio/flutter/embedding/android/FlutterSurfaceView;->isSurfaceAvailableForRendering:Z

    return p1
.end method

.method static synthetic access$100(Lio/flutter/embedding/android/FlutterSurfaceView;)Z
    .locals 1
    .param p0, "x0"    # Lio/flutter/embedding/android/FlutterSurfaceView;

    .line 36
    invoke-direct {p0}, Lio/flutter/embedding/android/FlutterSurfaceView;->shouldNotify()Z

    move-result v0

    return v0
.end method

.method static synthetic access$200(Lio/flutter/embedding/android/FlutterSurfaceView;)V
    .locals 0
    .param p0, "x0"    # Lio/flutter/embedding/android/FlutterSurfaceView;

    .line 36
    invoke-direct {p0}, Lio/flutter/embedding/android/FlutterSurfaceView;->connectSurfaceToRenderer()V

    return-void
.end method

.method static synthetic access$300(Lio/flutter/embedding/android/FlutterSurfaceView;II)V
    .locals 0
    .param p0, "x0"    # Lio/flutter/embedding/android/FlutterSurfaceView;
    .param p1, "x1"    # I
    .param p2, "x2"    # I

    .line 36
    invoke-direct {p0, p1, p2}, Lio/flutter/embedding/android/FlutterSurfaceView;->changeSurfaceSize(II)V

    return-void
.end method

.method static synthetic access$400(Lio/flutter/embedding/android/FlutterSurfaceView;)V
    .locals 0
    .param p0, "x0"    # Lio/flutter/embedding/android/FlutterSurfaceView;

    .line 36
    invoke-direct {p0}, Lio/flutter/embedding/android/FlutterSurfaceView;->disconnectSurfaceFromRenderer()V

    return-void
.end method

.method static synthetic access$500(Lio/flutter/embedding/android/FlutterSurfaceView;)Lio/flutter/embedding/engine/renderer/FlutterRenderer;
    .locals 1
    .param p0, "x0"    # Lio/flutter/embedding/android/FlutterSurfaceView;

    .line 36
    iget-object v0, p0, Lio/flutter/embedding/android/FlutterSurfaceView;->flutterRenderer:Lio/flutter/embedding/engine/renderer/FlutterRenderer;

    return-object v0
.end method

.method private changeSurfaceSize(II)V
    .locals 2
    .param p1, "width"    # I
    .param p2, "height"    # I

    .line 281
    iget-object v0, p0, Lio/flutter/embedding/android/FlutterSurfaceView;->flutterRenderer:Lio/flutter/embedding/engine/renderer/FlutterRenderer;

    if-eqz v0, :cond_0

    .line 286
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Notifying FlutterRenderer that Android surface size has changed to "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " x "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "FlutterSurfaceView"

    invoke-static {v1, v0}, Lio/flutter/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 292
    iget-object v0, p0, Lio/flutter/embedding/android/FlutterSurfaceView;->flutterRenderer:Lio/flutter/embedding/engine/renderer/FlutterRenderer;

    invoke-virtual {v0, p1, p2}, Lio/flutter/embedding/engine/renderer/FlutterRenderer;->surfaceChanged(II)V

    .line 293
    return-void

    .line 282
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "changeSurfaceSize() should only be called when flutterRenderer is non-null."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private connectSurfaceToRenderer()V
    .locals 3

    .line 265
    iget-object v0, p0, Lio/flutter/embedding/android/FlutterSurfaceView;->flutterRenderer:Lio/flutter/embedding/engine/renderer/FlutterRenderer;

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lio/flutter/embedding/android/FlutterSurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 276
    iget-object v0, p0, Lio/flutter/embedding/android/FlutterSurfaceView;->flutterRenderer:Lio/flutter/embedding/engine/renderer/FlutterRenderer;

    invoke-virtual {p0}, Lio/flutter/embedding/android/FlutterSurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v1

    invoke-interface {v1}, Landroid/view/SurfaceHolder;->getSurface()Landroid/view/Surface;

    move-result-object v1

    iget-boolean v2, p0, Lio/flutter/embedding/android/FlutterSurfaceView;->isPaused:Z

    invoke-virtual {v0, v1, v2}, Lio/flutter/embedding/engine/renderer/FlutterRenderer;->startRenderingToSurface(Landroid/view/Surface;Z)V

    .line 277
    return-void

    .line 266
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "connectSurfaceToRenderer() should only be called when flutterRenderer and getHolder() are non-null."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private disconnectSurfaceFromRenderer()V
    .locals 2

    .line 297
    iget-object v0, p0, Lio/flutter/embedding/android/FlutterSurfaceView;->flutterRenderer:Lio/flutter/embedding/engine/renderer/FlutterRenderer;

    if-eqz v0, :cond_0

    .line 303
    invoke-virtual {v0}, Lio/flutter/embedding/engine/renderer/FlutterRenderer;->stopRenderingToSurface()V

    .line 304
    return-void

    .line 298
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "disconnectSurfaceFromRenderer() should only be called when flutterRenderer is non-null."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private init()V
    .locals 2

    .line 130
    iget-boolean v0, p0, Lio/flutter/embedding/android/FlutterSurfaceView;->renderTransparently:Z

    if-eqz v0, :cond_0

    .line 131
    invoke-virtual {p0}, Lio/flutter/embedding/android/FlutterSurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v0

    const/4 v1, -0x2

    invoke-interface {v0, v1}, Landroid/view/SurfaceHolder;->setFormat(I)V

    .line 132
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lio/flutter/embedding/android/FlutterSurfaceView;->setZOrderOnTop(Z)V

    .line 137
    :cond_0
    invoke-virtual {p0}, Lio/flutter/embedding/android/FlutterSurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v0

    iget-object v1, p0, Lio/flutter/embedding/android/FlutterSurfaceView;->surfaceCallback:Landroid/view/SurfaceHolder$Callback;

    invoke-interface {v0, v1}, Landroid/view/SurfaceHolder;->addCallback(Landroid/view/SurfaceHolder$Callback;)V

    .line 141
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lio/flutter/embedding/android/FlutterSurfaceView;->setAlpha(F)V

    .line 142
    return-void
.end method

.method private shouldNotify()Z
    .locals 1

    .line 45
    iget-object v0, p0, Lio/flutter/embedding/android/FlutterSurfaceView;->flutterRenderer:Lio/flutter/embedding/engine/renderer/FlutterRenderer;

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lio/flutter/embedding/android/FlutterSurfaceView;->isPaused:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method


# virtual methods
.method public attachToRenderer(Lio/flutter/embedding/engine/renderer/FlutterRenderer;)V
    .locals 2
    .param p1, "flutterRenderer"    # Lio/flutter/embedding/engine/renderer/FlutterRenderer;

    .line 190
    const-string v0, "Attaching to FlutterRenderer."

    const-string v1, "FlutterSurfaceView"

    invoke-static {v1, v0}, Lio/flutter/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 191
    iget-object v0, p0, Lio/flutter/embedding/android/FlutterSurfaceView;->flutterRenderer:Lio/flutter/embedding/engine/renderer/FlutterRenderer;

    if-eqz v0, :cond_0

    .line 192
    const-string v0, "Already connected to a FlutterRenderer. Detaching from old one and attaching to new one."

    invoke-static {v1, v0}, Lio/flutter/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 196
    iget-object v0, p0, Lio/flutter/embedding/android/FlutterSurfaceView;->flutterRenderer:Lio/flutter/embedding/engine/renderer/FlutterRenderer;

    invoke-virtual {v0}, Lio/flutter/embedding/engine/renderer/FlutterRenderer;->stopRenderingToSurface()V

    .line 197
    iget-object v0, p0, Lio/flutter/embedding/android/FlutterSurfaceView;->flutterRenderer:Lio/flutter/embedding/engine/renderer/FlutterRenderer;

    iget-object v1, p0, Lio/flutter/embedding/android/FlutterSurfaceView;->flutterUiDisplayListener:Lio/flutter/embedding/engine/renderer/FlutterUiDisplayListener;

    invoke-virtual {v0, v1}, Lio/flutter/embedding/engine/renderer/FlutterRenderer;->removeIsDisplayingFlutterUiListener(Lio/flutter/embedding/engine/renderer/FlutterUiDisplayListener;)V

    .line 200
    :cond_0
    iput-object p1, p0, Lio/flutter/embedding/android/FlutterSurfaceView;->flutterRenderer:Lio/flutter/embedding/engine/renderer/FlutterRenderer;

    .line 202
    invoke-virtual {p0}, Lio/flutter/embedding/android/FlutterSurfaceView;->resume()V

    .line 203
    return-void
.end method

.method public detachFromRenderer()V
    .locals 2

    .line 213
    iget-object v0, p0, Lio/flutter/embedding/android/FlutterSurfaceView;->flutterRenderer:Lio/flutter/embedding/engine/renderer/FlutterRenderer;

    const-string v1, "FlutterSurfaceView"

    if-eqz v0, :cond_1

    .line 218
    invoke-virtual {p0}, Lio/flutter/embedding/android/FlutterSurfaceView;->getWindowToken()Landroid/os/IBinder;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 219
    const-string v0, "Disconnecting FlutterRenderer from Android surface."

    invoke-static {v1, v0}, Lio/flutter/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 220
    invoke-direct {p0}, Lio/flutter/embedding/android/FlutterSurfaceView;->disconnectSurfaceFromRenderer()V

    .line 224
    :cond_0
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lio/flutter/embedding/android/FlutterSurfaceView;->setAlpha(F)V

    .line 225
    iget-object v0, p0, Lio/flutter/embedding/android/FlutterSurfaceView;->flutterRenderer:Lio/flutter/embedding/engine/renderer/FlutterRenderer;

    iget-object v1, p0, Lio/flutter/embedding/android/FlutterSurfaceView;->flutterUiDisplayListener:Lio/flutter/embedding/engine/renderer/FlutterUiDisplayListener;

    invoke-virtual {v0, v1}, Lio/flutter/embedding/engine/renderer/FlutterRenderer;->removeIsDisplayingFlutterUiListener(Lio/flutter/embedding/engine/renderer/FlutterUiDisplayListener;)V

    .line 226
    const/4 v0, 0x0

    iput-object v0, p0, Lio/flutter/embedding/android/FlutterSurfaceView;->flutterRenderer:Lio/flutter/embedding/engine/renderer/FlutterRenderer;

    goto :goto_0

    .line 229
    :cond_1
    const-string v0, "detachFromRenderer() invoked when no FlutterRenderer was attached."

    invoke-static {v1, v0}, Lio/flutter/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 231
    :goto_0
    return-void
.end method

.method public gatherTransparentRegion(Landroid/graphics/Region;)Z
    .locals 9
    .param p1, "region"    # Landroid/graphics/Region;

    .line 152
    invoke-virtual {p0}, Lio/flutter/embedding/android/FlutterSurfaceView;->getAlpha()F

    move-result v0

    const/high16 v1, 0x3f800000    # 1.0f

    const/4 v2, 0x0

    cmpg-float v0, v0, v1

    if-gez v0, :cond_0

    .line 153
    return v2

    .line 155
    :cond_0
    const/4 v0, 0x2

    new-array v0, v0, [I

    .line 156
    .local v0, "location":[I
    invoke-virtual {p0, v0}, Lio/flutter/embedding/android/FlutterSurfaceView;->getLocationInWindow([I)V

    .line 157
    aget v4, v0, v2

    const/4 v1, 0x1

    aget v5, v0, v1

    aget v2, v0, v2

    .line 160
    invoke-virtual {p0}, Lio/flutter/embedding/android/FlutterSurfaceView;->getRight()I

    move-result v3

    add-int/2addr v2, v3

    invoke-virtual {p0}, Lio/flutter/embedding/android/FlutterSurfaceView;->getLeft()I

    move-result v3

    sub-int v6, v2, v3

    aget v2, v0, v1

    .line 161
    invoke-virtual {p0}, Lio/flutter/embedding/android/FlutterSurfaceView;->getBottom()I

    move-result v3

    add-int/2addr v2, v3

    invoke-virtual {p0}, Lio/flutter/embedding/android/FlutterSurfaceView;->getTop()I

    move-result v3

    sub-int v7, v2, v3

    sget-object v8, Landroid/graphics/Region$Op;->DIFFERENCE:Landroid/graphics/Region$Op;

    .line 157
    move-object v3, p1

    invoke-virtual/range {v3 .. v8}, Landroid/graphics/Region;->op(IIIILandroid/graphics/Region$Op;)Z

    .line 163
    return v1
.end method

.method public getAttachedRenderer()Lio/flutter/embedding/engine/renderer/FlutterRenderer;
    .locals 1

    .line 169
    iget-object v0, p0, Lio/flutter/embedding/android/FlutterSurfaceView;->flutterRenderer:Lio/flutter/embedding/engine/renderer/FlutterRenderer;

    return-object v0
.end method

.method isSurfaceAvailableForRendering()Z
    .locals 1

    .line 174
    iget-boolean v0, p0, Lio/flutter/embedding/android/FlutterSurfaceView;->isSurfaceAvailableForRendering:Z

    return v0
.end method

.method public pause()V
    .locals 2

    .line 238
    iget-object v0, p0, Lio/flutter/embedding/android/FlutterSurfaceView;->flutterRenderer:Lio/flutter/embedding/engine/renderer/FlutterRenderer;

    if-nez v0, :cond_0

    .line 239
    const-string v0, "FlutterSurfaceView"

    const-string v1, "pause() invoked when no FlutterRenderer was attached."

    invoke-static {v0, v1}, Lio/flutter/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 240
    return-void

    .line 242
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/flutter/embedding/android/FlutterSurfaceView;->isPaused:Z

    .line 243
    return-void
.end method

.method public resume()V
    .locals 3

    .line 246
    iget-object v0, p0, Lio/flutter/embedding/android/FlutterSurfaceView;->flutterRenderer:Lio/flutter/embedding/engine/renderer/FlutterRenderer;

    const-string v1, "FlutterSurfaceView"

    if-nez v0, :cond_0

    .line 247
    const-string v0, "resume() invoked when no FlutterRenderer was attached."

    invoke-static {v1, v0}, Lio/flutter/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 248
    return-void

    .line 250
    :cond_0
    iget-object v2, p0, Lio/flutter/embedding/android/FlutterSurfaceView;->flutterUiDisplayListener:Lio/flutter/embedding/engine/renderer/FlutterUiDisplayListener;

    invoke-virtual {v0, v2}, Lio/flutter/embedding/engine/renderer/FlutterRenderer;->addIsDisplayingFlutterUiListener(Lio/flutter/embedding/engine/renderer/FlutterUiDisplayListener;)V

    .line 254
    invoke-virtual {p0}, Lio/flutter/embedding/android/FlutterSurfaceView;->isSurfaceAvailableForRendering()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 255
    const-string v0, "Surface is available for rendering. Connecting FlutterRenderer to Android surface."

    invoke-static {v1, v0}, Lio/flutter/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 258
    invoke-direct {p0}, Lio/flutter/embedding/android/FlutterSurfaceView;->connectSurfaceToRenderer()V

    .line 260
    :cond_1
    const/4 v0, 0x0

    iput-boolean v0, p0, Lio/flutter/embedding/android/FlutterSurfaceView;->isPaused:Z

    .line 261
    return-void
.end method
