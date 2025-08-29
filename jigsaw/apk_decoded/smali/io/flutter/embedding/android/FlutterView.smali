.class public Lio/flutter/embedding/android/FlutterView;
.super Landroid/widget/FrameLayout;
.source "FlutterView.java"

# interfaces
.implements Lio/flutter/plugin/mouse/MouseCursorPlugin$MouseCursorViewDelegate;
.implements Lio/flutter/embedding/android/KeyboardManager$ViewDelegate;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/flutter/embedding/android/FlutterView$ZeroSides;,
        Lio/flutter/embedding/android/FlutterView$FlutterEngineAttachmentListener;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "FlutterView"


# instance fields
.field private accessibilityBridge:Lio/flutter/view/AccessibilityBridge;

.field private androidTouchProcessor:Lio/flutter/embedding/android/AndroidTouchProcessor;

.field private delegate:Lio/flutter/embedding/android/FlutterViewDelegate;

.field private flutterEngine:Lio/flutter/embedding/engine/FlutterEngine;

.field private final flutterEngineAttachmentListeners:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Lio/flutter/embedding/android/FlutterView$FlutterEngineAttachmentListener;",
            ">;"
        }
    .end annotation
.end field

.field private flutterImageView:Lio/flutter/embedding/android/FlutterImageView;

.field private flutterSurfaceView:Lio/flutter/embedding/android/FlutterSurfaceView;

.field private flutterTextureView:Lio/flutter/embedding/android/FlutterTextureView;

.field private final flutterUiDisplayListener:Lio/flutter/embedding/engine/renderer/FlutterUiDisplayListener;

.field private final flutterUiDisplayListeners:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Lio/flutter/embedding/engine/renderer/FlutterUiDisplayListener;",
            ">;"
        }
    .end annotation
.end field

.field private isFlutterUiDisplayed:Z

.field private keyboardManager:Lio/flutter/embedding/android/KeyboardManager;

.field private localizationPlugin:Lio/flutter/plugin/localization/LocalizationPlugin;

.field private mouseCursorPlugin:Lio/flutter/plugin/mouse/MouseCursorPlugin;

.field private final onAccessibilityChangeListener:Lio/flutter/view/AccessibilityBridge$OnAccessibilityChangeListener;

.field private previousRenderSurface:Lio/flutter/embedding/engine/renderer/RenderSurface;

.field renderSurface:Lio/flutter/embedding/engine/renderer/RenderSurface;

.field private spellCheckPlugin:Lio/flutter/plugin/editing/SpellCheckPlugin;

.field private final systemSettingsObserver:Landroid/database/ContentObserver;

.field private textInputPlugin:Lio/flutter/plugin/editing/TextInputPlugin;

.field private textServicesManager:Landroid/view/textservice/TextServicesManager;

.field private final viewportMetrics:Lio/flutter/embedding/engine/renderer/FlutterRenderer$ViewportMetrics;

.field private final windowInfoListener:Landroidx/core/util/Consumer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/core/util/Consumer<",
            "Landroidx/window/layout/WindowLayoutInfo;",
            ">;"
        }
    .end annotation
.end field

.field private windowInfoRepo:Lio/flutter/embedding/android/WindowInfoRepositoryCallbackAdapterWrapper;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .line 219
    new-instance v0, Lio/flutter/embedding/android/FlutterSurfaceView;

    invoke-direct {v0, p1}, Lio/flutter/embedding/android/FlutterSurfaceView;-><init>(Landroid/content/Context;)V

    const/4 v1, 0x0

    invoke-direct {p0, p1, v1, v0}, Lio/flutter/embedding/android/FlutterView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;Lio/flutter/embedding/android/FlutterSurfaceView;)V

    .line 220
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .line 308
    new-instance v0, Lio/flutter/embedding/android/FlutterSurfaceView;

    invoke-direct {v0, p1}, Lio/flutter/embedding/android/FlutterSurfaceView;-><init>(Landroid/content/Context;)V

    invoke-direct {p0, p1, p2, v0}, Lio/flutter/embedding/android/FlutterView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;Lio/flutter/embedding/android/FlutterSurfaceView;)V

    .line 309
    return-void
.end method

.method private constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;Lio/flutter/embedding/android/FlutterImageView;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "flutterImageView"    # Lio/flutter/embedding/android/FlutterImageView;

    .line 366
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 118
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lio/flutter/embedding/android/FlutterView;->flutterUiDisplayListeners:Ljava/util/Set;

    .line 124
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lio/flutter/embedding/android/FlutterView;->flutterEngineAttachmentListeners:Ljava/util/Set;

    .line 145
    new-instance v0, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ViewportMetrics;

    invoke-direct {v0}, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ViewportMetrics;-><init>()V

    iput-object v0, p0, Lio/flutter/embedding/android/FlutterView;->viewportMetrics:Lio/flutter/embedding/engine/renderer/FlutterRenderer$ViewportMetrics;

    .line 148
    new-instance v0, Lio/flutter/embedding/android/FlutterView$1;

    invoke-direct {v0, p0}, Lio/flutter/embedding/android/FlutterView$1;-><init>(Lio/flutter/embedding/android/FlutterView;)V

    iput-object v0, p0, Lio/flutter/embedding/android/FlutterView;->onAccessibilityChangeListener:Lio/flutter/view/AccessibilityBridge$OnAccessibilityChangeListener;

    .line 157
    new-instance v0, Lio/flutter/embedding/android/FlutterView$2;

    new-instance v1, Landroid/os/Handler;

    .line 158
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    invoke-direct {v0, p0, v1}, Lio/flutter/embedding/android/FlutterView$2;-><init>(Lio/flutter/embedding/android/FlutterView;Landroid/os/Handler;)V

    iput-object v0, p0, Lio/flutter/embedding/android/FlutterView;->systemSettingsObserver:Landroid/database/ContentObserver;

    .line 176
    new-instance v0, Lio/flutter/embedding/android/FlutterView$3;

    invoke-direct {v0, p0}, Lio/flutter/embedding/android/FlutterView$3;-><init>(Lio/flutter/embedding/android/FlutterView;)V

    iput-object v0, p0, Lio/flutter/embedding/android/FlutterView;->flutterUiDisplayListener:Lio/flutter/embedding/engine/renderer/FlutterUiDisplayListener;

    .line 197
    new-instance v0, Lio/flutter/embedding/android/FlutterView$4;

    invoke-direct {v0, p0}, Lio/flutter/embedding/android/FlutterView$4;-><init>(Lio/flutter/embedding/android/FlutterView;)V

    iput-object v0, p0, Lio/flutter/embedding/android/FlutterView;->windowInfoListener:Landroidx/core/util/Consumer;

    .line 1469
    new-instance v0, Lio/flutter/embedding/android/FlutterViewDelegate;

    invoke-direct {v0}, Lio/flutter/embedding/android/FlutterViewDelegate;-><init>()V

    iput-object v0, p0, Lio/flutter/embedding/android/FlutterView;->delegate:Lio/flutter/embedding/android/FlutterViewDelegate;

    .line 368
    iput-object p3, p0, Lio/flutter/embedding/android/FlutterView;->flutterImageView:Lio/flutter/embedding/android/FlutterImageView;

    .line 369
    iput-object p3, p0, Lio/flutter/embedding/android/FlutterView;->renderSurface:Lio/flutter/embedding/engine/renderer/RenderSurface;

    .line 371
    invoke-direct {p0}, Lio/flutter/embedding/android/FlutterView;->init()V

    .line 372
    return-void
.end method

.method private constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;Lio/flutter/embedding/android/FlutterSurfaceView;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "flutterSurfaceView"    # Lio/flutter/embedding/android/FlutterSurfaceView;

    .line 342
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 118
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lio/flutter/embedding/android/FlutterView;->flutterUiDisplayListeners:Ljava/util/Set;

    .line 124
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lio/flutter/embedding/android/FlutterView;->flutterEngineAttachmentListeners:Ljava/util/Set;

    .line 145
    new-instance v0, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ViewportMetrics;

    invoke-direct {v0}, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ViewportMetrics;-><init>()V

    iput-object v0, p0, Lio/flutter/embedding/android/FlutterView;->viewportMetrics:Lio/flutter/embedding/engine/renderer/FlutterRenderer$ViewportMetrics;

    .line 148
    new-instance v0, Lio/flutter/embedding/android/FlutterView$1;

    invoke-direct {v0, p0}, Lio/flutter/embedding/android/FlutterView$1;-><init>(Lio/flutter/embedding/android/FlutterView;)V

    iput-object v0, p0, Lio/flutter/embedding/android/FlutterView;->onAccessibilityChangeListener:Lio/flutter/view/AccessibilityBridge$OnAccessibilityChangeListener;

    .line 157
    new-instance v0, Lio/flutter/embedding/android/FlutterView$2;

    new-instance v1, Landroid/os/Handler;

    .line 158
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    invoke-direct {v0, p0, v1}, Lio/flutter/embedding/android/FlutterView$2;-><init>(Lio/flutter/embedding/android/FlutterView;Landroid/os/Handler;)V

    iput-object v0, p0, Lio/flutter/embedding/android/FlutterView;->systemSettingsObserver:Landroid/database/ContentObserver;

    .line 176
    new-instance v0, Lio/flutter/embedding/android/FlutterView$3;

    invoke-direct {v0, p0}, Lio/flutter/embedding/android/FlutterView$3;-><init>(Lio/flutter/embedding/android/FlutterView;)V

    iput-object v0, p0, Lio/flutter/embedding/android/FlutterView;->flutterUiDisplayListener:Lio/flutter/embedding/engine/renderer/FlutterUiDisplayListener;

    .line 197
    new-instance v0, Lio/flutter/embedding/android/FlutterView$4;

    invoke-direct {v0, p0}, Lio/flutter/embedding/android/FlutterView$4;-><init>(Lio/flutter/embedding/android/FlutterView;)V

    iput-object v0, p0, Lio/flutter/embedding/android/FlutterView;->windowInfoListener:Landroidx/core/util/Consumer;

    .line 1469
    new-instance v0, Lio/flutter/embedding/android/FlutterViewDelegate;

    invoke-direct {v0}, Lio/flutter/embedding/android/FlutterViewDelegate;-><init>()V

    iput-object v0, p0, Lio/flutter/embedding/android/FlutterView;->delegate:Lio/flutter/embedding/android/FlutterViewDelegate;

    .line 344
    iput-object p3, p0, Lio/flutter/embedding/android/FlutterView;->flutterSurfaceView:Lio/flutter/embedding/android/FlutterSurfaceView;

    .line 345
    iput-object p3, p0, Lio/flutter/embedding/android/FlutterView;->renderSurface:Lio/flutter/embedding/engine/renderer/RenderSurface;

    .line 347
    invoke-direct {p0}, Lio/flutter/embedding/android/FlutterView;->init()V

    .line 348
    return-void
.end method

.method private constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;Lio/flutter/embedding/android/FlutterTextureView;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "flutterTextureView"    # Lio/flutter/embedding/android/FlutterTextureView;

    .line 354
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 118
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lio/flutter/embedding/android/FlutterView;->flutterUiDisplayListeners:Ljava/util/Set;

    .line 124
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lio/flutter/embedding/android/FlutterView;->flutterEngineAttachmentListeners:Ljava/util/Set;

    .line 145
    new-instance v0, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ViewportMetrics;

    invoke-direct {v0}, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ViewportMetrics;-><init>()V

    iput-object v0, p0, Lio/flutter/embedding/android/FlutterView;->viewportMetrics:Lio/flutter/embedding/engine/renderer/FlutterRenderer$ViewportMetrics;

    .line 148
    new-instance v0, Lio/flutter/embedding/android/FlutterView$1;

    invoke-direct {v0, p0}, Lio/flutter/embedding/android/FlutterView$1;-><init>(Lio/flutter/embedding/android/FlutterView;)V

    iput-object v0, p0, Lio/flutter/embedding/android/FlutterView;->onAccessibilityChangeListener:Lio/flutter/view/AccessibilityBridge$OnAccessibilityChangeListener;

    .line 157
    new-instance v0, Lio/flutter/embedding/android/FlutterView$2;

    new-instance v1, Landroid/os/Handler;

    .line 158
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    invoke-direct {v0, p0, v1}, Lio/flutter/embedding/android/FlutterView$2;-><init>(Lio/flutter/embedding/android/FlutterView;Landroid/os/Handler;)V

    iput-object v0, p0, Lio/flutter/embedding/android/FlutterView;->systemSettingsObserver:Landroid/database/ContentObserver;

    .line 176
    new-instance v0, Lio/flutter/embedding/android/FlutterView$3;

    invoke-direct {v0, p0}, Lio/flutter/embedding/android/FlutterView$3;-><init>(Lio/flutter/embedding/android/FlutterView;)V

    iput-object v0, p0, Lio/flutter/embedding/android/FlutterView;->flutterUiDisplayListener:Lio/flutter/embedding/engine/renderer/FlutterUiDisplayListener;

    .line 197
    new-instance v0, Lio/flutter/embedding/android/FlutterView$4;

    invoke-direct {v0, p0}, Lio/flutter/embedding/android/FlutterView$4;-><init>(Lio/flutter/embedding/android/FlutterView;)V

    iput-object v0, p0, Lio/flutter/embedding/android/FlutterView;->windowInfoListener:Landroidx/core/util/Consumer;

    .line 1469
    new-instance v0, Lio/flutter/embedding/android/FlutterViewDelegate;

    invoke-direct {v0}, Lio/flutter/embedding/android/FlutterViewDelegate;-><init>()V

    iput-object v0, p0, Lio/flutter/embedding/android/FlutterView;->delegate:Lio/flutter/embedding/android/FlutterViewDelegate;

    .line 356
    iput-object p3, p0, Lio/flutter/embedding/android/FlutterView;->flutterTextureView:Lio/flutter/embedding/android/FlutterTextureView;

    .line 357
    iput-object p3, p0, Lio/flutter/embedding/android/FlutterView;->renderSurface:Lio/flutter/embedding/engine/renderer/RenderSurface;

    .line 359
    invoke-direct {p0}, Lio/flutter/embedding/android/FlutterView;->init()V

    .line 360
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lio/flutter/embedding/android/FlutterImageView;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "flutterImageView"    # Lio/flutter/embedding/android/FlutterImageView;

    .line 297
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0, p2}, Lio/flutter/embedding/android/FlutterView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;Lio/flutter/embedding/android/FlutterImageView;)V

    .line 298
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lio/flutter/embedding/android/FlutterSurfaceView;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "flutterSurfaceView"    # Lio/flutter/embedding/android/FlutterSurfaceView;

    .line 274
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0, p2}, Lio/flutter/embedding/android/FlutterView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;Lio/flutter/embedding/android/FlutterSurfaceView;)V

    .line 275
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lio/flutter/embedding/android/FlutterTextureView;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "flutterTextureView"    # Lio/flutter/embedding/android/FlutterTextureView;

    .line 286
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0, p2}, Lio/flutter/embedding/android/FlutterView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;Lio/flutter/embedding/android/FlutterTextureView;)V

    .line 287
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lio/flutter/embedding/android/RenderMode;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "renderMode"    # Lio/flutter/embedding/android/RenderMode;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 229
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 118
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lio/flutter/embedding/android/FlutterView;->flutterUiDisplayListeners:Ljava/util/Set;

    .line 124
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lio/flutter/embedding/android/FlutterView;->flutterEngineAttachmentListeners:Ljava/util/Set;

    .line 145
    new-instance v0, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ViewportMetrics;

    invoke-direct {v0}, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ViewportMetrics;-><init>()V

    iput-object v0, p0, Lio/flutter/embedding/android/FlutterView;->viewportMetrics:Lio/flutter/embedding/engine/renderer/FlutterRenderer$ViewportMetrics;

    .line 148
    new-instance v0, Lio/flutter/embedding/android/FlutterView$1;

    invoke-direct {v0, p0}, Lio/flutter/embedding/android/FlutterView$1;-><init>(Lio/flutter/embedding/android/FlutterView;)V

    iput-object v0, p0, Lio/flutter/embedding/android/FlutterView;->onAccessibilityChangeListener:Lio/flutter/view/AccessibilityBridge$OnAccessibilityChangeListener;

    .line 157
    new-instance v0, Lio/flutter/embedding/android/FlutterView$2;

    new-instance v1, Landroid/os/Handler;

    .line 158
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    invoke-direct {v0, p0, v1}, Lio/flutter/embedding/android/FlutterView$2;-><init>(Lio/flutter/embedding/android/FlutterView;Landroid/os/Handler;)V

    iput-object v0, p0, Lio/flutter/embedding/android/FlutterView;->systemSettingsObserver:Landroid/database/ContentObserver;

    .line 176
    new-instance v0, Lio/flutter/embedding/android/FlutterView$3;

    invoke-direct {v0, p0}, Lio/flutter/embedding/android/FlutterView$3;-><init>(Lio/flutter/embedding/android/FlutterView;)V

    iput-object v0, p0, Lio/flutter/embedding/android/FlutterView;->flutterUiDisplayListener:Lio/flutter/embedding/engine/renderer/FlutterUiDisplayListener;

    .line 197
    new-instance v0, Lio/flutter/embedding/android/FlutterView$4;

    invoke-direct {v0, p0}, Lio/flutter/embedding/android/FlutterView$4;-><init>(Lio/flutter/embedding/android/FlutterView;)V

    iput-object v0, p0, Lio/flutter/embedding/android/FlutterView;->windowInfoListener:Landroidx/core/util/Consumer;

    .line 1469
    new-instance v0, Lio/flutter/embedding/android/FlutterViewDelegate;

    invoke-direct {v0}, Lio/flutter/embedding/android/FlutterViewDelegate;-><init>()V

    iput-object v0, p0, Lio/flutter/embedding/android/FlutterView;->delegate:Lio/flutter/embedding/android/FlutterViewDelegate;

    .line 231
    sget-object v0, Lio/flutter/embedding/android/RenderMode;->surface:Lio/flutter/embedding/android/RenderMode;

    if-ne p2, v0, :cond_0

    .line 232
    new-instance v0, Lio/flutter/embedding/android/FlutterSurfaceView;

    invoke-direct {v0, p1}, Lio/flutter/embedding/android/FlutterSurfaceView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lio/flutter/embedding/android/FlutterView;->flutterSurfaceView:Lio/flutter/embedding/android/FlutterSurfaceView;

    .line 233
    iput-object v0, p0, Lio/flutter/embedding/android/FlutterView;->renderSurface:Lio/flutter/embedding/engine/renderer/RenderSurface;

    goto :goto_0

    .line 234
    :cond_0
    sget-object v0, Lio/flutter/embedding/android/RenderMode;->texture:Lio/flutter/embedding/android/RenderMode;

    if-ne p2, v0, :cond_1

    .line 235
    new-instance v0, Lio/flutter/embedding/android/FlutterTextureView;

    invoke-direct {v0, p1}, Lio/flutter/embedding/android/FlutterTextureView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lio/flutter/embedding/android/FlutterView;->flutterTextureView:Lio/flutter/embedding/android/FlutterTextureView;

    .line 236
    iput-object v0, p0, Lio/flutter/embedding/android/FlutterView;->renderSurface:Lio/flutter/embedding/engine/renderer/RenderSurface;

    .line 242
    :goto_0
    invoke-direct {p0}, Lio/flutter/embedding/android/FlutterView;->init()V

    .line 243
    return-void

    .line 238
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "RenderMode not supported with this constructor: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public constructor <init>(Landroid/content/Context;Lio/flutter/embedding/android/RenderMode;Lio/flutter/embedding/android/TransparencyMode;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "renderMode"    # Lio/flutter/embedding/android/RenderMode;
    .param p3, "transparencyMode"    # Lio/flutter/embedding/android/TransparencyMode;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 321
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 118
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lio/flutter/embedding/android/FlutterView;->flutterUiDisplayListeners:Ljava/util/Set;

    .line 124
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lio/flutter/embedding/android/FlutterView;->flutterEngineAttachmentListeners:Ljava/util/Set;

    .line 145
    new-instance v0, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ViewportMetrics;

    invoke-direct {v0}, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ViewportMetrics;-><init>()V

    iput-object v0, p0, Lio/flutter/embedding/android/FlutterView;->viewportMetrics:Lio/flutter/embedding/engine/renderer/FlutterRenderer$ViewportMetrics;

    .line 148
    new-instance v0, Lio/flutter/embedding/android/FlutterView$1;

    invoke-direct {v0, p0}, Lio/flutter/embedding/android/FlutterView$1;-><init>(Lio/flutter/embedding/android/FlutterView;)V

    iput-object v0, p0, Lio/flutter/embedding/android/FlutterView;->onAccessibilityChangeListener:Lio/flutter/view/AccessibilityBridge$OnAccessibilityChangeListener;

    .line 157
    new-instance v0, Lio/flutter/embedding/android/FlutterView$2;

    new-instance v1, Landroid/os/Handler;

    .line 158
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    invoke-direct {v0, p0, v1}, Lio/flutter/embedding/android/FlutterView$2;-><init>(Lio/flutter/embedding/android/FlutterView;Landroid/os/Handler;)V

    iput-object v0, p0, Lio/flutter/embedding/android/FlutterView;->systemSettingsObserver:Landroid/database/ContentObserver;

    .line 176
    new-instance v0, Lio/flutter/embedding/android/FlutterView$3;

    invoke-direct {v0, p0}, Lio/flutter/embedding/android/FlutterView$3;-><init>(Lio/flutter/embedding/android/FlutterView;)V

    iput-object v0, p0, Lio/flutter/embedding/android/FlutterView;->flutterUiDisplayListener:Lio/flutter/embedding/engine/renderer/FlutterUiDisplayListener;

    .line 197
    new-instance v0, Lio/flutter/embedding/android/FlutterView$4;

    invoke-direct {v0, p0}, Lio/flutter/embedding/android/FlutterView$4;-><init>(Lio/flutter/embedding/android/FlutterView;)V

    iput-object v0, p0, Lio/flutter/embedding/android/FlutterView;->windowInfoListener:Landroidx/core/util/Consumer;

    .line 1469
    new-instance v0, Lio/flutter/embedding/android/FlutterViewDelegate;

    invoke-direct {v0}, Lio/flutter/embedding/android/FlutterViewDelegate;-><init>()V

    iput-object v0, p0, Lio/flutter/embedding/android/FlutterView;->delegate:Lio/flutter/embedding/android/FlutterViewDelegate;

    .line 323
    sget-object v0, Lio/flutter/embedding/android/RenderMode;->surface:Lio/flutter/embedding/android/RenderMode;

    if-ne p2, v0, :cond_1

    .line 324
    new-instance v0, Lio/flutter/embedding/android/FlutterSurfaceView;

    sget-object v1, Lio/flutter/embedding/android/TransparencyMode;->transparent:Lio/flutter/embedding/android/TransparencyMode;

    if-ne p3, v1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    invoke-direct {v0, p1, v1}, Lio/flutter/embedding/android/FlutterSurfaceView;-><init>(Landroid/content/Context;Z)V

    iput-object v0, p0, Lio/flutter/embedding/android/FlutterView;->flutterSurfaceView:Lio/flutter/embedding/android/FlutterSurfaceView;

    .line 326
    iput-object v0, p0, Lio/flutter/embedding/android/FlutterView;->renderSurface:Lio/flutter/embedding/engine/renderer/RenderSurface;

    goto :goto_1

    .line 327
    :cond_1
    sget-object v0, Lio/flutter/embedding/android/RenderMode;->texture:Lio/flutter/embedding/android/RenderMode;

    if-ne p2, v0, :cond_2

    .line 328
    new-instance v0, Lio/flutter/embedding/android/FlutterTextureView;

    invoke-direct {v0, p1}, Lio/flutter/embedding/android/FlutterTextureView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lio/flutter/embedding/android/FlutterView;->flutterTextureView:Lio/flutter/embedding/android/FlutterTextureView;

    .line 329
    iput-object v0, p0, Lio/flutter/embedding/android/FlutterView;->renderSurface:Lio/flutter/embedding/engine/renderer/RenderSurface;

    .line 335
    :goto_1
    invoke-direct {p0}, Lio/flutter/embedding/android/FlutterView;->init()V

    .line 336
    return-void

    .line 331
    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "RenderMode not supported with this constructor: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public constructor <init>(Landroid/content/Context;Lio/flutter/embedding/android/TransparencyMode;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "transparencyMode"    # Lio/flutter/embedding/android/TransparencyMode;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 259
    new-instance v0, Lio/flutter/embedding/android/FlutterSurfaceView;

    sget-object v1, Lio/flutter/embedding/android/TransparencyMode;->transparent:Lio/flutter/embedding/android/TransparencyMode;

    if-ne p2, v1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    invoke-direct {v0, p1, v1}, Lio/flutter/embedding/android/FlutterSurfaceView;-><init>(Landroid/content/Context;Z)V

    const/4 v1, 0x0

    invoke-direct {p0, p1, v1, v0}, Lio/flutter/embedding/android/FlutterView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;Lio/flutter/embedding/android/FlutterSurfaceView;)V

    .line 263
    return-void
.end method

.method static synthetic access$000(Lio/flutter/embedding/android/FlutterView;ZZ)V
    .locals 0
    .param p0, "x0"    # Lio/flutter/embedding/android/FlutterView;
    .param p1, "x1"    # Z
    .param p2, "x2"    # Z

    .line 108
    invoke-direct {p0, p1, p2}, Lio/flutter/embedding/android/FlutterView;->resetWillNotDraw(ZZ)V

    return-void
.end method

.method static synthetic access$100(Lio/flutter/embedding/android/FlutterView;)Lio/flutter/embedding/engine/FlutterEngine;
    .locals 1
    .param p0, "x0"    # Lio/flutter/embedding/android/FlutterView;

    .line 108
    iget-object v0, p0, Lio/flutter/embedding/android/FlutterView;->flutterEngine:Lio/flutter/embedding/engine/FlutterEngine;

    return-object v0
.end method

.method static synthetic access$202(Lio/flutter/embedding/android/FlutterView;Z)Z
    .locals 0
    .param p0, "x0"    # Lio/flutter/embedding/android/FlutterView;
    .param p1, "x1"    # Z

    .line 108
    iput-boolean p1, p0, Lio/flutter/embedding/android/FlutterView;->isFlutterUiDisplayed:Z

    return p1
.end method

.method static synthetic access$300(Lio/flutter/embedding/android/FlutterView;)Ljava/util/Set;
    .locals 1
    .param p0, "x0"    # Lio/flutter/embedding/android/FlutterView;

    .line 108
    iget-object v0, p0, Lio/flutter/embedding/android/FlutterView;->flutterUiDisplayListeners:Ljava/util/Set;

    return-object v0
.end method

.method static synthetic access$400(Lio/flutter/embedding/android/FlutterView;)Lio/flutter/embedding/android/FlutterImageView;
    .locals 1
    .param p0, "x0"    # Lio/flutter/embedding/android/FlutterView;

    .line 108
    iget-object v0, p0, Lio/flutter/embedding/android/FlutterView;->flutterImageView:Lio/flutter/embedding/android/FlutterImageView;

    return-object v0
.end method

.method static synthetic access$500(Lio/flutter/embedding/android/FlutterView;)V
    .locals 0
    .param p0, "x0"    # Lio/flutter/embedding/android/FlutterView;

    .line 108
    invoke-direct {p0}, Lio/flutter/embedding/android/FlutterView;->releaseImageView()V

    return-void
.end method

.method private findViewByAccessibilityIdRootedAtCurrentView(ILandroid/view/View;)Landroid/view/View;
    .locals 5
    .param p1, "accessibilityId"    # I
    .param p2, "currentView"    # Landroid/view/View;

    .line 1014
    const/4 v0, 0x0

    :try_start_0
    const-class v1, Landroid/view/View;

    const-string v2, "getAccessibilityViewId"

    const/4 v3, 0x0

    new-array v4, v3, [Ljava/lang/Class;

    invoke-virtual {v1, v2, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1
    :try_end_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_2

    .line 1017
    .local v1, "getAccessibilityViewIdMethod":Ljava/lang/reflect/Method;
    nop

    .line 1018
    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 1020
    :try_start_1
    new-array v2, v3, [Ljava/lang/Object;

    invoke-virtual {v1, p2, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2
    :try_end_1
    .catch Ljava/lang/IllegalAccessException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_1 .. :try_end_1} :catch_0

    if-eqz v2, :cond_0

    .line 1021
    return-object p2

    .line 1027
    :cond_0
    nop

    .line 1028
    instance-of v2, p2, Landroid/view/ViewGroup;

    if-eqz v2, :cond_2

    .line 1029
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    move-object v3, p2

    check-cast v3, Landroid/view/ViewGroup;

    invoke-virtual {v3}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v3

    if-ge v2, v3, :cond_2

    .line 1030
    move-object v3, p2

    check-cast v3, Landroid/view/ViewGroup;

    .line 1032
    invoke-virtual {v3, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    .line 1031
    invoke-direct {p0, p1, v3}, Lio/flutter/embedding/android/FlutterView;->findViewByAccessibilityIdRootedAtCurrentView(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    .line 1033
    .local v3, "view":Landroid/view/View;
    if-eqz v3, :cond_1

    .line 1034
    return-object v3

    .line 1029
    .end local v3    # "view":Landroid/view/View;
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 1038
    .end local v2    # "i":I
    :cond_2
    return-object v0

    .line 1025
    :catch_0
    move-exception v2

    .line 1026
    .local v2, "exception":Ljava/lang/reflect/InvocationTargetException;
    return-object v0

    .line 1023
    .end local v2    # "exception":Ljava/lang/reflect/InvocationTargetException;
    :catch_1
    move-exception v2

    .line 1024
    .local v2, "exception":Ljava/lang/IllegalAccessException;
    return-object v0

    .line 1015
    .end local v1    # "getAccessibilityViewIdMethod":Ljava/lang/reflect/Method;
    .end local v2    # "exception":Ljava/lang/IllegalAccessException;
    :catch_2
    move-exception v1

    .line 1016
    .local v1, "exception":Ljava/lang/NoSuchMethodException;
    return-object v0
.end method

.method private guessBottomKeyboardInset(Landroid/view/WindowInsets;)I
    .locals 9
    .param p1, "insets"    # Landroid/view/WindowInsets;

    .line 658
    invoke-virtual {p0}, Lio/flutter/embedding/android/FlutterView;->getRootView()Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v0

    .line 661
    .local v0, "screenHeight":I
    const-wide v1, 0x3fc70a3d70a3d70aL    # 0.18

    .line 662
    .local v1, "keyboardHeightRatioHeuristic":D
    invoke-virtual {p1}, Landroid/view/WindowInsets;->getSystemWindowInsetBottom()I

    move-result v3

    int-to-double v3, v3

    int-to-double v5, v0

    const-wide v7, 0x3fc70a3d70a3d70aL    # 0.18

    mul-double v5, v5, v7

    cmpg-double v7, v3, v5

    if-gez v7, :cond_0

    .line 664
    const/4 v3, 0x0

    return v3

    .line 667
    :cond_0
    invoke-virtual {p1}, Landroid/view/WindowInsets;->getSystemWindowInsetBottom()I

    move-result v3

    return v3
.end method

.method private init()V
    .locals 3

    .line 375
    const-string v0, "Initializing FlutterView"

    const-string v1, "FlutterView"

    invoke-static {v1, v0}, Lio/flutter/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 377
    iget-object v0, p0, Lio/flutter/embedding/android/FlutterView;->flutterSurfaceView:Lio/flutter/embedding/android/FlutterSurfaceView;

    if-eqz v0, :cond_0

    .line 378
    const-string v0, "Internally using a FlutterSurfaceView."

    invoke-static {v1, v0}, Lio/flutter/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 379
    iget-object v0, p0, Lio/flutter/embedding/android/FlutterView;->flutterSurfaceView:Lio/flutter/embedding/android/FlutterSurfaceView;

    invoke-virtual {p0, v0}, Lio/flutter/embedding/android/FlutterView;->addView(Landroid/view/View;)V

    goto :goto_0

    .line 380
    :cond_0
    iget-object v0, p0, Lio/flutter/embedding/android/FlutterView;->flutterTextureView:Lio/flutter/embedding/android/FlutterTextureView;

    if-eqz v0, :cond_1

    .line 381
    const-string v0, "Internally using a FlutterTextureView."

    invoke-static {v1, v0}, Lio/flutter/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 382
    iget-object v0, p0, Lio/flutter/embedding/android/FlutterView;->flutterTextureView:Lio/flutter/embedding/android/FlutterTextureView;

    invoke-virtual {p0, v0}, Lio/flutter/embedding/android/FlutterView;->addView(Landroid/view/View;)V

    goto :goto_0

    .line 384
    :cond_1
    const-string v0, "Internally using a FlutterImageView."

    invoke-static {v1, v0}, Lio/flutter/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 385
    iget-object v0, p0, Lio/flutter/embedding/android/FlutterView;->flutterImageView:Lio/flutter/embedding/android/FlutterImageView;

    invoke-virtual {p0, v0}, Lio/flutter/embedding/android/FlutterView;->addView(Landroid/view/View;)V

    .line 389
    :goto_0
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lio/flutter/embedding/android/FlutterView;->setFocusable(Z)V

    .line 390
    invoke-virtual {p0, v0}, Lio/flutter/embedding/android/FlutterView;->setFocusableInTouchMode(Z)V

    .line 391
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1a

    if-lt v1, v2, :cond_2

    .line 392
    invoke-virtual {p0, v0}, Lio/flutter/embedding/android/FlutterView;->setImportantForAutofill(I)V

    .line 394
    :cond_2
    return-void
.end method

.method static synthetic lambda$sendUserSettingsToFlutter$0(Landroid/view/textservice/SpellCheckerInfo;)Z
    .locals 2
    .param p0, "spellCheckerInfo"    # Landroid/view/textservice/SpellCheckerInfo;

    .line 1441
    nop

    .line 1442
    invoke-virtual {p0}, Landroid/view/textservice/SpellCheckerInfo;->getPackageName()Ljava/lang/String;

    move-result-object v0

    .line 1443
    const-string v1, "com.google.android.inputmethod.latin"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    .line 1441
    return v0
.end method

.method private releaseImageView()V
    .locals 1

    .line 1263
    iget-object v0, p0, Lio/flutter/embedding/android/FlutterView;->flutterImageView:Lio/flutter/embedding/android/FlutterImageView;

    if-eqz v0, :cond_0

    .line 1264
    invoke-virtual {v0}, Lio/flutter/embedding/android/FlutterImageView;->closeImageReader()V

    .line 1268
    iget-object v0, p0, Lio/flutter/embedding/android/FlutterView;->flutterImageView:Lio/flutter/embedding/android/FlutterImageView;

    invoke-virtual {p0, v0}, Lio/flutter/embedding/android/FlutterView;->removeView(Landroid/view/View;)V

    .line 1269
    const/4 v0, 0x0

    iput-object v0, p0, Lio/flutter/embedding/android/FlutterView;->flutterImageView:Lio/flutter/embedding/android/FlutterImageView;

    .line 1271
    :cond_0
    return-void
.end method

.method private resetWillNotDraw(ZZ)V
    .locals 2
    .param p1, "isAccessibilityEnabled"    # Z
    .param p2, "isTouchExplorationEnabled"    # Z

    .line 1044
    iget-object v0, p0, Lio/flutter/embedding/android/FlutterView;->flutterEngine:Lio/flutter/embedding/engine/FlutterEngine;

    invoke-virtual {v0}, Lio/flutter/embedding/engine/FlutterEngine;->getRenderer()Lio/flutter/embedding/engine/renderer/FlutterRenderer;

    move-result-object v0

    invoke-virtual {v0}, Lio/flutter/embedding/engine/renderer/FlutterRenderer;->isSoftwareRenderingEnabled()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_1

    .line 1045
    if-nez p1, :cond_0

    if-nez p2, :cond_0

    const/4 v1, 0x1

    :cond_0
    invoke-virtual {p0, v1}, Lio/flutter/embedding/android/FlutterView;->setWillNotDraw(Z)V

    goto :goto_0

    .line 1047
    :cond_1
    invoke-virtual {p0, v1}, Lio/flutter/embedding/android/FlutterView;->setWillNotDraw(Z)V

    .line 1049
    :goto_0
    return-void
.end method

.method private sendViewportMetricsToFlutter()V
    .locals 2

    .line 1477
    invoke-virtual {p0}, Lio/flutter/embedding/android/FlutterView;->isAttachedToFlutterEngine()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1478
    const-string v0, "FlutterView"

    const-string v1, "Tried to send viewport metrics from Android to Flutter but this FlutterView was not attached to a FlutterEngine."

    invoke-static {v0, v1}, Lio/flutter/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 1482
    return-void

    .line 1485
    :cond_0
    iget-object v0, p0, Lio/flutter/embedding/android/FlutterView;->viewportMetrics:Lio/flutter/embedding/engine/renderer/FlutterRenderer$ViewportMetrics;

    invoke-virtual {p0}, Lio/flutter/embedding/android/FlutterView;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    iget v1, v1, Landroid/util/DisplayMetrics;->density:F

    iput v1, v0, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ViewportMetrics;->devicePixelRatio:F

    .line 1486
    iget-object v0, p0, Lio/flutter/embedding/android/FlutterView;->viewportMetrics:Lio/flutter/embedding/engine/renderer/FlutterRenderer$ViewportMetrics;

    invoke-virtual {p0}, Lio/flutter/embedding/android/FlutterView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    move-result v1

    iput v1, v0, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ViewportMetrics;->physicalTouchSlop:I

    .line 1488
    iget-object v0, p0, Lio/flutter/embedding/android/FlutterView;->flutterEngine:Lio/flutter/embedding/engine/FlutterEngine;

    invoke-virtual {v0}, Lio/flutter/embedding/engine/FlutterEngine;->getRenderer()Lio/flutter/embedding/engine/renderer/FlutterRenderer;

    move-result-object v0

    iget-object v1, p0, Lio/flutter/embedding/android/FlutterView;->viewportMetrics:Lio/flutter/embedding/engine/renderer/FlutterRenderer$ViewportMetrics;

    invoke-virtual {v0, v1}, Lio/flutter/embedding/engine/renderer/FlutterRenderer;->setViewportMetrics(Lio/flutter/embedding/engine/renderer/FlutterRenderer$ViewportMetrics;)V

    .line 1489
    return-void
.end method


# virtual methods
.method public acquireLatestImageViewFrame()Z
    .locals 1

    .line 1365
    iget-object v0, p0, Lio/flutter/embedding/android/FlutterView;->flutterImageView:Lio/flutter/embedding/android/FlutterImageView;

    if-eqz v0, :cond_0

    .line 1366
    invoke-virtual {v0}, Lio/flutter/embedding/android/FlutterImageView;->acquireLatestImage()Z

    move-result v0

    return v0

    .line 1368
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public addFlutterEngineAttachmentListener(Lio/flutter/embedding/android/FlutterView$FlutterEngineAttachmentListener;)V
    .locals 1
    .param p1, "listener"    # Lio/flutter/embedding/android/FlutterView$FlutterEngineAttachmentListener;

    .line 1399
    iget-object v0, p0, Lio/flutter/embedding/android/FlutterView;->flutterEngineAttachmentListeners:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 1400
    return-void
.end method

.method public addOnFirstFrameRenderedListener(Lio/flutter/embedding/engine/renderer/FlutterUiDisplayListener;)V
    .locals 1
    .param p1, "listener"    # Lio/flutter/embedding/engine/renderer/FlutterUiDisplayListener;

    .line 422
    iget-object v0, p0, Lio/flutter/embedding/android/FlutterView;->flutterUiDisplayListeners:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 423
    return-void
.end method

.method public attachOverlaySurfaceToRender(Lio/flutter/embedding/android/FlutterImageView;)V
    .locals 1
    .param p1, "view"    # Lio/flutter/embedding/android/FlutterImageView;

    .line 1359
    iget-object v0, p0, Lio/flutter/embedding/android/FlutterView;->flutterEngine:Lio/flutter/embedding/engine/FlutterEngine;

    if-eqz v0, :cond_0

    .line 1360
    invoke-virtual {v0}, Lio/flutter/embedding/engine/FlutterEngine;->getRenderer()Lio/flutter/embedding/engine/renderer/FlutterRenderer;

    move-result-object v0

    invoke-virtual {p1, v0}, Lio/flutter/embedding/android/FlutterImageView;->attachToRenderer(Lio/flutter/embedding/engine/renderer/FlutterRenderer;)V

    .line 1362
    :cond_0
    return-void
.end method

.method public attachToFlutterEngine(Lio/flutter/embedding/engine/FlutterEngine;)V
    .locals 10
    .param p1, "flutterEngine"    # Lio/flutter/embedding/engine/FlutterEngine;

    .line 1094
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Attaching to a FlutterEngine: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "FlutterView"

    invoke-static {v1, v0}, Lio/flutter/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 1095
    invoke-virtual {p0}, Lio/flutter/embedding/android/FlutterView;->isAttachedToFlutterEngine()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1096
    iget-object v0, p0, Lio/flutter/embedding/android/FlutterView;->flutterEngine:Lio/flutter/embedding/engine/FlutterEngine;

    if-ne p1, v0, :cond_0

    .line 1098
    const-string v0, "Already attached to this engine. Doing nothing."

    invoke-static {v1, v0}, Lio/flutter/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 1099
    return-void

    .line 1103
    :cond_0
    const-string v0, "Currently attached to a different engine. Detaching and then attaching to new engine."

    invoke-static {v1, v0}, Lio/flutter/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 1107
    invoke-virtual {p0}, Lio/flutter/embedding/android/FlutterView;->detachFromFlutterEngine()V

    .line 1110
    :cond_1
    iput-object p1, p0, Lio/flutter/embedding/android/FlutterView;->flutterEngine:Lio/flutter/embedding/engine/FlutterEngine;

    .line 1113
    invoke-virtual {p1}, Lio/flutter/embedding/engine/FlutterEngine;->getRenderer()Lio/flutter/embedding/engine/renderer/FlutterRenderer;

    move-result-object v0

    .line 1114
    .local v0, "flutterRenderer":Lio/flutter/embedding/engine/renderer/FlutterRenderer;
    invoke-virtual {v0}, Lio/flutter/embedding/engine/renderer/FlutterRenderer;->isDisplayingFlutterUi()Z

    move-result v2

    iput-boolean v2, p0, Lio/flutter/embedding/android/FlutterView;->isFlutterUiDisplayed:Z

    .line 1115
    iget-object v2, p0, Lio/flutter/embedding/android/FlutterView;->renderSurface:Lio/flutter/embedding/engine/renderer/RenderSurface;

    invoke-interface {v2, v0}, Lio/flutter/embedding/engine/renderer/RenderSurface;->attachToRenderer(Lio/flutter/embedding/engine/renderer/FlutterRenderer;)V

    .line 1116
    iget-object v2, p0, Lio/flutter/embedding/android/FlutterView;->flutterUiDisplayListener:Lio/flutter/embedding/engine/renderer/FlutterUiDisplayListener;

    invoke-virtual {v0, v2}, Lio/flutter/embedding/engine/renderer/FlutterRenderer;->addIsDisplayingFlutterUiListener(Lio/flutter/embedding/engine/renderer/FlutterUiDisplayListener;)V

    .line 1120
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x18

    if-lt v2, v3, :cond_2

    .line 1121
    new-instance v2, Lio/flutter/plugin/mouse/MouseCursorPlugin;

    iget-object v3, p0, Lio/flutter/embedding/android/FlutterView;->flutterEngine:Lio/flutter/embedding/engine/FlutterEngine;

    invoke-virtual {v3}, Lio/flutter/embedding/engine/FlutterEngine;->getMouseCursorChannel()Lio/flutter/embedding/engine/systemchannels/MouseCursorChannel;

    move-result-object v3

    invoke-direct {v2, p0, v3}, Lio/flutter/plugin/mouse/MouseCursorPlugin;-><init>(Lio/flutter/plugin/mouse/MouseCursorPlugin$MouseCursorViewDelegate;Lio/flutter/embedding/engine/systemchannels/MouseCursorChannel;)V

    iput-object v2, p0, Lio/flutter/embedding/android/FlutterView;->mouseCursorPlugin:Lio/flutter/plugin/mouse/MouseCursorPlugin;

    .line 1123
    :cond_2
    new-instance v2, Lio/flutter/plugin/editing/TextInputPlugin;

    iget-object v3, p0, Lio/flutter/embedding/android/FlutterView;->flutterEngine:Lio/flutter/embedding/engine/FlutterEngine;

    .line 1126
    invoke-virtual {v3}, Lio/flutter/embedding/engine/FlutterEngine;->getTextInputChannel()Lio/flutter/embedding/engine/systemchannels/TextInputChannel;

    move-result-object v3

    iget-object v4, p0, Lio/flutter/embedding/android/FlutterView;->flutterEngine:Lio/flutter/embedding/engine/FlutterEngine;

    .line 1127
    invoke-virtual {v4}, Lio/flutter/embedding/engine/FlutterEngine;->getPlatformViewsController()Lio/flutter/plugin/platform/PlatformViewsController;

    move-result-object v4

    invoke-direct {v2, p0, v3, v4}, Lio/flutter/plugin/editing/TextInputPlugin;-><init>(Landroid/view/View;Lio/flutter/embedding/engine/systemchannels/TextInputChannel;Lio/flutter/plugin/platform/PlatformViewsController;)V

    iput-object v2, p0, Lio/flutter/embedding/android/FlutterView;->textInputPlugin:Lio/flutter/plugin/editing/TextInputPlugin;

    .line 1130
    nop

    .line 1132
    :try_start_0
    invoke-virtual {p0}, Lio/flutter/embedding/android/FlutterView;->getContext()Landroid/content/Context;

    move-result-object v2

    const-string v3, "textservices"

    invoke-virtual {v2, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/textservice/TextServicesManager;

    iput-object v2, p0, Lio/flutter/embedding/android/FlutterView;->textServicesManager:Landroid/view/textservice/TextServicesManager;

    .line 1133
    new-instance v3, Lio/flutter/plugin/editing/SpellCheckPlugin;

    iget-object v4, p0, Lio/flutter/embedding/android/FlutterView;->flutterEngine:Lio/flutter/embedding/engine/FlutterEngine;

    .line 1134
    invoke-virtual {v4}, Lio/flutter/embedding/engine/FlutterEngine;->getSpellCheckChannel()Lio/flutter/embedding/engine/systemchannels/SpellCheckChannel;

    move-result-object v4

    invoke-direct {v3, v2, v4}, Lio/flutter/plugin/editing/SpellCheckPlugin;-><init>(Landroid/view/textservice/TextServicesManager;Lio/flutter/embedding/engine/systemchannels/SpellCheckChannel;)V

    iput-object v3, p0, Lio/flutter/embedding/android/FlutterView;->spellCheckPlugin:Lio/flutter/plugin/editing/SpellCheckPlugin;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1137
    goto :goto_0

    .line 1135
    :catch_0
    move-exception v2

    .line 1136
    .local v2, "e":Ljava/lang/Exception;
    const-string v3, "TextServicesManager not supported by device, spell check disabled."

    invoke-static {v1, v3}, Lio/flutter/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 1139
    .end local v2    # "e":Ljava/lang/Exception;
    :goto_0
    iget-object v1, p0, Lio/flutter/embedding/android/FlutterView;->flutterEngine:Lio/flutter/embedding/engine/FlutterEngine;

    invoke-virtual {v1}, Lio/flutter/embedding/engine/FlutterEngine;->getLocalizationPlugin()Lio/flutter/plugin/localization/LocalizationPlugin;

    move-result-object v1

    iput-object v1, p0, Lio/flutter/embedding/android/FlutterView;->localizationPlugin:Lio/flutter/plugin/localization/LocalizationPlugin;

    .line 1141
    new-instance v1, Lio/flutter/embedding/android/KeyboardManager;

    invoke-direct {v1, p0}, Lio/flutter/embedding/android/KeyboardManager;-><init>(Lio/flutter/embedding/android/KeyboardManager$ViewDelegate;)V

    iput-object v1, p0, Lio/flutter/embedding/android/FlutterView;->keyboardManager:Lio/flutter/embedding/android/KeyboardManager;

    .line 1142
    new-instance v1, Lio/flutter/embedding/android/AndroidTouchProcessor;

    iget-object v2, p0, Lio/flutter/embedding/android/FlutterView;->flutterEngine:Lio/flutter/embedding/engine/FlutterEngine;

    .line 1143
    invoke-virtual {v2}, Lio/flutter/embedding/engine/FlutterEngine;->getRenderer()Lio/flutter/embedding/engine/renderer/FlutterRenderer;

    move-result-object v2

    const/4 v3, 0x0

    invoke-direct {v1, v2, v3}, Lio/flutter/embedding/android/AndroidTouchProcessor;-><init>(Lio/flutter/embedding/engine/renderer/FlutterRenderer;Z)V

    iput-object v1, p0, Lio/flutter/embedding/android/FlutterView;->androidTouchProcessor:Lio/flutter/embedding/android/AndroidTouchProcessor;

    .line 1144
    new-instance v1, Lio/flutter/view/AccessibilityBridge;

    .line 1147
    invoke-virtual {p1}, Lio/flutter/embedding/engine/FlutterEngine;->getAccessibilityChannel()Lio/flutter/embedding/engine/systemchannels/AccessibilityChannel;

    move-result-object v6

    .line 1148
    invoke-virtual {p0}, Lio/flutter/embedding/android/FlutterView;->getContext()Landroid/content/Context;

    move-result-object v2

    const-string v4, "accessibility"

    invoke-virtual {v2, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    move-object v7, v2

    check-cast v7, Landroid/view/accessibility/AccessibilityManager;

    .line 1149
    invoke-virtual {p0}, Lio/flutter/embedding/android/FlutterView;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v8

    iget-object v2, p0, Lio/flutter/embedding/android/FlutterView;->flutterEngine:Lio/flutter/embedding/engine/FlutterEngine;

    .line 1150
    invoke-virtual {v2}, Lio/flutter/embedding/engine/FlutterEngine;->getPlatformViewsController()Lio/flutter/plugin/platform/PlatformViewsController;

    move-result-object v9

    move-object v4, v1

    move-object v5, p0

    invoke-direct/range {v4 .. v9}, Lio/flutter/view/AccessibilityBridge;-><init>(Landroid/view/View;Lio/flutter/embedding/engine/systemchannels/AccessibilityChannel;Landroid/view/accessibility/AccessibilityManager;Landroid/content/ContentResolver;Lio/flutter/plugin/platform/PlatformViewsAccessibilityDelegate;)V

    iput-object v1, p0, Lio/flutter/embedding/android/FlutterView;->accessibilityBridge:Lio/flutter/view/AccessibilityBridge;

    .line 1151
    iget-object v2, p0, Lio/flutter/embedding/android/FlutterView;->onAccessibilityChangeListener:Lio/flutter/view/AccessibilityBridge$OnAccessibilityChangeListener;

    invoke-virtual {v1, v2}, Lio/flutter/view/AccessibilityBridge;->setOnAccessibilityChangeListener(Lio/flutter/view/AccessibilityBridge$OnAccessibilityChangeListener;)V

    .line 1152
    iget-object v1, p0, Lio/flutter/embedding/android/FlutterView;->accessibilityBridge:Lio/flutter/view/AccessibilityBridge;

    .line 1153
    invoke-virtual {v1}, Lio/flutter/view/AccessibilityBridge;->isAccessibilityEnabled()Z

    move-result v1

    iget-object v2, p0, Lio/flutter/embedding/android/FlutterView;->accessibilityBridge:Lio/flutter/view/AccessibilityBridge;

    .line 1154
    invoke-virtual {v2}, Lio/flutter/view/AccessibilityBridge;->isTouchExplorationEnabled()Z

    move-result v2

    .line 1152
    invoke-direct {p0, v1, v2}, Lio/flutter/embedding/android/FlutterView;->resetWillNotDraw(ZZ)V

    .line 1158
    iget-object v1, p0, Lio/flutter/embedding/android/FlutterView;->flutterEngine:Lio/flutter/embedding/engine/FlutterEngine;

    invoke-virtual {v1}, Lio/flutter/embedding/engine/FlutterEngine;->getPlatformViewsController()Lio/flutter/plugin/platform/PlatformViewsController;

    move-result-object v1

    iget-object v2, p0, Lio/flutter/embedding/android/FlutterView;->accessibilityBridge:Lio/flutter/view/AccessibilityBridge;

    invoke-virtual {v1, v2}, Lio/flutter/plugin/platform/PlatformViewsController;->attachAccessibilityBridge(Lio/flutter/view/AccessibilityBridge;)V

    .line 1159
    iget-object v1, p0, Lio/flutter/embedding/android/FlutterView;->flutterEngine:Lio/flutter/embedding/engine/FlutterEngine;

    .line 1160
    invoke-virtual {v1}, Lio/flutter/embedding/engine/FlutterEngine;->getPlatformViewsController()Lio/flutter/plugin/platform/PlatformViewsController;

    move-result-object v1

    iget-object v2, p0, Lio/flutter/embedding/android/FlutterView;->flutterEngine:Lio/flutter/embedding/engine/FlutterEngine;

    .line 1161
    invoke-virtual {v2}, Lio/flutter/embedding/engine/FlutterEngine;->getRenderer()Lio/flutter/embedding/engine/renderer/FlutterRenderer;

    move-result-object v2

    invoke-virtual {v1, v2}, Lio/flutter/plugin/platform/PlatformViewsController;->attachToFlutterRenderer(Lio/flutter/embedding/engine/renderer/FlutterRenderer;)V

    .line 1166
    iget-object v1, p0, Lio/flutter/embedding/android/FlutterView;->textInputPlugin:Lio/flutter/plugin/editing/TextInputPlugin;

    invoke-virtual {v1}, Lio/flutter/plugin/editing/TextInputPlugin;->getInputMethodManager()Landroid/view/inputmethod/InputMethodManager;

    move-result-object v1

    invoke-virtual {v1, p0}, Landroid/view/inputmethod/InputMethodManager;->restartInput(Landroid/view/View;)V

    .line 1169
    invoke-virtual {p0}, Lio/flutter/embedding/android/FlutterView;->sendUserSettingsToFlutter()V

    .line 1170
    invoke-virtual {p0}, Lio/flutter/embedding/android/FlutterView;->getContext()Landroid/content/Context;

    move-result-object v1

    .line 1171
    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    .line 1173
    const-string v2, "show_password"

    invoke-static {v2}, Landroid/provider/Settings$System;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    iget-object v4, p0, Lio/flutter/embedding/android/FlutterView;->systemSettingsObserver:Landroid/database/ContentObserver;

    .line 1172
    invoke-virtual {v1, v2, v3, v4}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 1177
    invoke-direct {p0}, Lio/flutter/embedding/android/FlutterView;->sendViewportMetricsToFlutter()V

    .line 1179
    invoke-virtual {p1}, Lio/flutter/embedding/engine/FlutterEngine;->getPlatformViewsController()Lio/flutter/plugin/platform/PlatformViewsController;

    move-result-object v1

    invoke-virtual {v1, p0}, Lio/flutter/plugin/platform/PlatformViewsController;->attachToView(Lio/flutter/embedding/android/FlutterView;)V

    .line 1182
    iget-object v1, p0, Lio/flutter/embedding/android/FlutterView;->flutterEngineAttachmentListeners:Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lio/flutter/embedding/android/FlutterView$FlutterEngineAttachmentListener;

    .line 1183
    .local v2, "listener":Lio/flutter/embedding/android/FlutterView$FlutterEngineAttachmentListener;
    invoke-interface {v2, p1}, Lio/flutter/embedding/android/FlutterView$FlutterEngineAttachmentListener;->onFlutterEngineAttachedToFlutterView(Lio/flutter/embedding/engine/FlutterEngine;)V

    .line 1184
    .end local v2    # "listener":Lio/flutter/embedding/android/FlutterView$FlutterEngineAttachmentListener;
    goto :goto_1

    .line 1189
    :cond_3
    iget-boolean v1, p0, Lio/flutter/embedding/android/FlutterView;->isFlutterUiDisplayed:Z

    if-eqz v1, :cond_4

    .line 1190
    iget-object v1, p0, Lio/flutter/embedding/android/FlutterView;->flutterUiDisplayListener:Lio/flutter/embedding/engine/renderer/FlutterUiDisplayListener;

    invoke-interface {v1}, Lio/flutter/embedding/engine/renderer/FlutterUiDisplayListener;->onFlutterUiDisplayed()V

    .line 1192
    :cond_4
    return-void
.end method

.method public autofill(Landroid/util/SparseArray;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/SparseArray<",
            "Landroid/view/autofill/AutofillValue;",
            ">;)V"
        }
    .end annotation

    .line 1499
    .local p1, "values":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Landroid/view/autofill/AutofillValue;>;"
    iget-object v0, p0, Lio/flutter/embedding/android/FlutterView;->textInputPlugin:Lio/flutter/plugin/editing/TextInputPlugin;

    invoke-virtual {v0, p1}, Lio/flutter/plugin/editing/TextInputPlugin;->autofill(Landroid/util/SparseArray;)V

    .line 1500
    return-void
.end method

.method public calculateShouldZeroSides()Lio/flutter/embedding/android/FlutterView$ZeroSides;
    .locals 5

    .line 621
    invoke-virtual {p0}, Lio/flutter/embedding/android/FlutterView;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 622
    .local v0, "context":Landroid/content/Context;
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v1

    iget v1, v1, Landroid/content/res/Configuration;->orientation:I

    .line 624
    .local v1, "orientation":I
    const/4 v2, 0x2

    if-ne v1, v2, :cond_4

    .line 625
    nop

    .line 626
    const-string v3, "display"

    invoke-virtual {v0, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/hardware/display/DisplayManager;

    .line 627
    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Landroid/hardware/display/DisplayManager;->getDisplay(I)Landroid/view/Display;

    move-result-object v3

    .line 628
    invoke-virtual {v3}, Landroid/view/Display;->getRotation()I

    move-result v3

    .line 630
    .local v3, "rotation":I
    const/4 v4, 0x1

    if-ne v3, v4, :cond_0

    .line 631
    sget-object v2, Lio/flutter/embedding/android/FlutterView$ZeroSides;->RIGHT:Lio/flutter/embedding/android/FlutterView$ZeroSides;

    return-object v2

    .line 632
    :cond_0
    const/4 v4, 0x3

    if-ne v3, v4, :cond_2

    .line 634
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0x17

    if-lt v2, v4, :cond_1

    sget-object v2, Lio/flutter/embedding/android/FlutterView$ZeroSides;->LEFT:Lio/flutter/embedding/android/FlutterView$ZeroSides;

    goto :goto_0

    :cond_1
    sget-object v2, Lio/flutter/embedding/android/FlutterView$ZeroSides;->RIGHT:Lio/flutter/embedding/android/FlutterView$ZeroSides;

    :goto_0
    return-object v2

    .line 637
    :cond_2
    if-eqz v3, :cond_3

    if-ne v3, v2, :cond_4

    .line 638
    :cond_3
    sget-object v2, Lio/flutter/embedding/android/FlutterView$ZeroSides;->BOTH:Lio/flutter/embedding/android/FlutterView$ZeroSides;

    return-object v2

    .line 643
    .end local v3    # "rotation":I
    :cond_4
    sget-object v2, Lio/flutter/embedding/android/FlutterView$ZeroSides;->NONE:Lio/flutter/embedding/android/FlutterView$ZeroSides;

    return-object v2
.end method

.method public checkInputConnectionProxy(Landroid/view/View;)Z
    .locals 1
    .param p1, "view"    # Landroid/view/View;

    .line 856
    iget-object v0, p0, Lio/flutter/embedding/android/FlutterView;->flutterEngine:Lio/flutter/embedding/engine/FlutterEngine;

    if-eqz v0, :cond_0

    .line 857
    invoke-virtual {v0}, Lio/flutter/embedding/engine/FlutterEngine;->getPlatformViewsController()Lio/flutter/plugin/platform/PlatformViewsController;

    move-result-object v0

    invoke-virtual {v0, p1}, Lio/flutter/plugin/platform/PlatformViewsController;->checkInputConnectionProxy(Landroid/view/View;)Z

    move-result v0

    goto :goto_0

    .line 858
    :cond_0
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->checkInputConnectionProxy(Landroid/view/View;)Z

    move-result v0

    .line 856
    :goto_0
    return v0
.end method

.method public convertToImageView()V
    .locals 3

    .line 1290
    iget-object v0, p0, Lio/flutter/embedding/android/FlutterView;->renderSurface:Lio/flutter/embedding/engine/renderer/RenderSurface;

    invoke-interface {v0}, Lio/flutter/embedding/engine/renderer/RenderSurface;->pause()V

    .line 1292
    iget-object v0, p0, Lio/flutter/embedding/android/FlutterView;->flutterImageView:Lio/flutter/embedding/android/FlutterImageView;

    if-nez v0, :cond_0

    .line 1293
    invoke-virtual {p0}, Lio/flutter/embedding/android/FlutterView;->createImageView()Lio/flutter/embedding/android/FlutterImageView;

    move-result-object v0

    iput-object v0, p0, Lio/flutter/embedding/android/FlutterView;->flutterImageView:Lio/flutter/embedding/android/FlutterImageView;

    .line 1294
    invoke-virtual {p0, v0}, Lio/flutter/embedding/android/FlutterView;->addView(Landroid/view/View;)V

    goto :goto_0

    .line 1296
    :cond_0
    invoke-virtual {p0}, Lio/flutter/embedding/android/FlutterView;->getWidth()I

    move-result v1

    invoke-virtual {p0}, Lio/flutter/embedding/android/FlutterView;->getHeight()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Lio/flutter/embedding/android/FlutterImageView;->resizeIfNeeded(II)V

    .line 1299
    :goto_0
    iget-object v0, p0, Lio/flutter/embedding/android/FlutterView;->renderSurface:Lio/flutter/embedding/engine/renderer/RenderSurface;

    iput-object v0, p0, Lio/flutter/embedding/android/FlutterView;->previousRenderSurface:Lio/flutter/embedding/engine/renderer/RenderSurface;

    .line 1300
    iget-object v0, p0, Lio/flutter/embedding/android/FlutterView;->flutterImageView:Lio/flutter/embedding/android/FlutterImageView;

    iput-object v0, p0, Lio/flutter/embedding/android/FlutterView;->renderSurface:Lio/flutter/embedding/engine/renderer/RenderSurface;

    .line 1301
    iget-object v1, p0, Lio/flutter/embedding/android/FlutterView;->flutterEngine:Lio/flutter/embedding/engine/FlutterEngine;

    if-eqz v1, :cond_1

    .line 1302
    invoke-virtual {v1}, Lio/flutter/embedding/engine/FlutterEngine;->getRenderer()Lio/flutter/embedding/engine/renderer/FlutterRenderer;

    move-result-object v1

    invoke-interface {v0, v1}, Lio/flutter/embedding/engine/renderer/RenderSurface;->attachToRenderer(Lio/flutter/embedding/engine/renderer/FlutterRenderer;)V

    .line 1304
    :cond_1
    return-void
.end method

.method public createImageView()Lio/flutter/embedding/android/FlutterImageView;
    .locals 5

    .line 1276
    new-instance v0, Lio/flutter/embedding/android/FlutterImageView;

    .line 1277
    invoke-virtual {p0}, Lio/flutter/embedding/android/FlutterView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {p0}, Lio/flutter/embedding/android/FlutterView;->getWidth()I

    move-result v2

    invoke-virtual {p0}, Lio/flutter/embedding/android/FlutterView;->getHeight()I

    move-result v3

    sget-object v4, Lio/flutter/embedding/android/FlutterImageView$SurfaceKind;->background:Lio/flutter/embedding/android/FlutterImageView$SurfaceKind;

    invoke-direct {v0, v1, v2, v3, v4}, Lio/flutter/embedding/android/FlutterImageView;-><init>(Landroid/content/Context;IILio/flutter/embedding/android/FlutterImageView$SurfaceKind;)V

    .line 1276
    return-object v0
.end method

.method protected createWindowInfoRepo()Lio/flutter/embedding/android/WindowInfoRepositoryCallbackAdapterWrapper;
    .locals 4

    .line 490
    :try_start_0
    new-instance v0, Lio/flutter/embedding/android/WindowInfoRepositoryCallbackAdapterWrapper;

    new-instance v1, Landroidx/window/java/layout/WindowInfoTrackerCallbackAdapter;

    sget-object v2, Landroidx/window/layout/WindowInfoTracker;->Companion:Landroidx/window/layout/WindowInfoTracker$Companion;

    .line 492
    invoke-virtual {p0}, Lio/flutter/embedding/android/FlutterView;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroidx/window/layout/WindowInfoTracker$Companion;->getOrCreate(Landroid/content/Context;)Landroidx/window/layout/WindowInfoTracker;

    move-result-object v2

    invoke-direct {v1, v2}, Landroidx/window/java/layout/WindowInfoTrackerCallbackAdapter;-><init>(Landroidx/window/layout/WindowInfoTracker;)V

    invoke-direct {v0, v1}, Lio/flutter/embedding/android/WindowInfoRepositoryCallbackAdapterWrapper;-><init>(Landroidx/window/java/layout/WindowInfoTrackerCallbackAdapter;)V
    :try_end_0
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_0 .. :try_end_0} :catch_0

    .line 490
    return-object v0

    .line 493
    :catch_0
    move-exception v0

    .line 500
    .local v0, "noClassDefFoundError":Ljava/lang/NoClassDefFoundError;
    const/4 v1, 0x0

    return-object v1
.end method

.method public detachFromFlutterEngine()V
    .locals 5

    .line 1206
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Detaching from a FlutterEngine: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lio/flutter/embedding/android/FlutterView;->flutterEngine:Lio/flutter/embedding/engine/FlutterEngine;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "FlutterView"

    invoke-static {v1, v0}, Lio/flutter/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 1207
    invoke-virtual {p0}, Lio/flutter/embedding/android/FlutterView;->isAttachedToFlutterEngine()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1208
    const-string v0, "FlutterView not attached to an engine. Not detaching."

    invoke-static {v1, v0}, Lio/flutter/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 1209
    return-void

    .line 1213
    :cond_0
    iget-object v0, p0, Lio/flutter/embedding/android/FlutterView;->flutterEngineAttachmentListeners:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/flutter/embedding/android/FlutterView$FlutterEngineAttachmentListener;

    .line 1214
    .local v1, "listener":Lio/flutter/embedding/android/FlutterView$FlutterEngineAttachmentListener;
    invoke-interface {v1}, Lio/flutter/embedding/android/FlutterView$FlutterEngineAttachmentListener;->onFlutterEngineDetachedFromFlutterView()V

    .line 1215
    .end local v1    # "listener":Lio/flutter/embedding/android/FlutterView$FlutterEngineAttachmentListener;
    goto :goto_0

    .line 1217
    :cond_1
    invoke-virtual {p0}, Lio/flutter/embedding/android/FlutterView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    iget-object v1, p0, Lio/flutter/embedding/android/FlutterView;->systemSettingsObserver:Landroid/database/ContentObserver;

    invoke-virtual {v0, v1}, Landroid/content/ContentResolver;->unregisterContentObserver(Landroid/database/ContentObserver;)V

    .line 1219
    iget-object v0, p0, Lio/flutter/embedding/android/FlutterView;->flutterEngine:Lio/flutter/embedding/engine/FlutterEngine;

    invoke-virtual {v0}, Lio/flutter/embedding/engine/FlutterEngine;->getPlatformViewsController()Lio/flutter/plugin/platform/PlatformViewsController;

    move-result-object v0

    invoke-virtual {v0}, Lio/flutter/plugin/platform/PlatformViewsController;->detachFromView()V

    .line 1222
    iget-object v0, p0, Lio/flutter/embedding/android/FlutterView;->flutterEngine:Lio/flutter/embedding/engine/FlutterEngine;

    invoke-virtual {v0}, Lio/flutter/embedding/engine/FlutterEngine;->getPlatformViewsController()Lio/flutter/plugin/platform/PlatformViewsController;

    move-result-object v0

    invoke-virtual {v0}, Lio/flutter/plugin/platform/PlatformViewsController;->detachAccessibilityBridge()V

    .line 1225
    iget-object v0, p0, Lio/flutter/embedding/android/FlutterView;->accessibilityBridge:Lio/flutter/view/AccessibilityBridge;

    invoke-virtual {v0}, Lio/flutter/view/AccessibilityBridge;->release()V

    .line 1226
    const/4 v0, 0x0

    iput-object v0, p0, Lio/flutter/embedding/android/FlutterView;->accessibilityBridge:Lio/flutter/view/AccessibilityBridge;

    .line 1232
    iget-object v1, p0, Lio/flutter/embedding/android/FlutterView;->textInputPlugin:Lio/flutter/plugin/editing/TextInputPlugin;

    invoke-virtual {v1}, Lio/flutter/plugin/editing/TextInputPlugin;->getInputMethodManager()Landroid/view/inputmethod/InputMethodManager;

    move-result-object v1

    invoke-virtual {v1, p0}, Landroid/view/inputmethod/InputMethodManager;->restartInput(Landroid/view/View;)V

    .line 1233
    iget-object v1, p0, Lio/flutter/embedding/android/FlutterView;->textInputPlugin:Lio/flutter/plugin/editing/TextInputPlugin;

    invoke-virtual {v1}, Lio/flutter/plugin/editing/TextInputPlugin;->destroy()V

    .line 1234
    iget-object v1, p0, Lio/flutter/embedding/android/FlutterView;->keyboardManager:Lio/flutter/embedding/android/KeyboardManager;

    invoke-virtual {v1}, Lio/flutter/embedding/android/KeyboardManager;->destroy()V

    .line 1235
    iget-object v1, p0, Lio/flutter/embedding/android/FlutterView;->spellCheckPlugin:Lio/flutter/plugin/editing/SpellCheckPlugin;

    if-eqz v1, :cond_2

    .line 1236
    invoke-virtual {v1}, Lio/flutter/plugin/editing/SpellCheckPlugin;->destroy()V

    .line 1239
    :cond_2
    iget-object v1, p0, Lio/flutter/embedding/android/FlutterView;->mouseCursorPlugin:Lio/flutter/plugin/mouse/MouseCursorPlugin;

    if-eqz v1, :cond_3

    .line 1240
    invoke-virtual {v1}, Lio/flutter/plugin/mouse/MouseCursorPlugin;->destroy()V

    .line 1244
    :cond_3
    iget-object v1, p0, Lio/flutter/embedding/android/FlutterView;->flutterEngine:Lio/flutter/embedding/engine/FlutterEngine;

    invoke-virtual {v1}, Lio/flutter/embedding/engine/FlutterEngine;->getRenderer()Lio/flutter/embedding/engine/renderer/FlutterRenderer;

    move-result-object v1

    .line 1245
    .local v1, "flutterRenderer":Lio/flutter/embedding/engine/renderer/FlutterRenderer;
    const/4 v2, 0x0

    iput-boolean v2, p0, Lio/flutter/embedding/android/FlutterView;->isFlutterUiDisplayed:Z

    .line 1246
    iget-object v3, p0, Lio/flutter/embedding/android/FlutterView;->flutterUiDisplayListener:Lio/flutter/embedding/engine/renderer/FlutterUiDisplayListener;

    invoke-virtual {v1, v3}, Lio/flutter/embedding/engine/renderer/FlutterRenderer;->removeIsDisplayingFlutterUiListener(Lio/flutter/embedding/engine/renderer/FlutterUiDisplayListener;)V

    .line 1247
    invoke-virtual {v1}, Lio/flutter/embedding/engine/renderer/FlutterRenderer;->stopRenderingToSurface()V

    .line 1248
    invoke-virtual {v1, v2}, Lio/flutter/embedding/engine/renderer/FlutterRenderer;->setSemanticsEnabled(Z)V

    .line 1251
    iget-object v2, p0, Lio/flutter/embedding/android/FlutterView;->previousRenderSurface:Lio/flutter/embedding/engine/renderer/RenderSurface;

    if-eqz v2, :cond_4

    iget-object v3, p0, Lio/flutter/embedding/android/FlutterView;->renderSurface:Lio/flutter/embedding/engine/renderer/RenderSurface;

    iget-object v4, p0, Lio/flutter/embedding/android/FlutterView;->flutterImageView:Lio/flutter/embedding/android/FlutterImageView;

    if-ne v3, v4, :cond_4

    .line 1252
    iput-object v2, p0, Lio/flutter/embedding/android/FlutterView;->renderSurface:Lio/flutter/embedding/engine/renderer/RenderSurface;

    .line 1254
    :cond_4
    iget-object v2, p0, Lio/flutter/embedding/android/FlutterView;->renderSurface:Lio/flutter/embedding/engine/renderer/RenderSurface;

    invoke-interface {v2}, Lio/flutter/embedding/engine/renderer/RenderSurface;->detachFromRenderer()V

    .line 1256
    invoke-direct {p0}, Lio/flutter/embedding/android/FlutterView;->releaseImageView()V

    .line 1258
    iput-object v0, p0, Lio/flutter/embedding/android/FlutterView;->previousRenderSurface:Lio/flutter/embedding/engine/renderer/RenderSurface;

    .line 1259
    iput-object v0, p0, Lio/flutter/embedding/android/FlutterView;->flutterEngine:Lio/flutter/embedding/engine/FlutterEngine;

    .line 1260
    return-void
.end method

.method public dispatchKeyEvent(Landroid/view/KeyEvent;)Z
    .locals 2
    .param p1, "event"    # Landroid/view/KeyEvent;

    .line 874
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I

    move-result v0

    const/4 v1, 0x1

    if-nez v0, :cond_0

    invoke-virtual {p1}, Landroid/view/KeyEvent;->getRepeatCount()I

    move-result v0

    if-nez v0, :cond_0

    .line 876
    invoke-virtual {p0}, Lio/flutter/embedding/android/FlutterView;->getKeyDispatcherState()Landroid/view/KeyEvent$DispatcherState;

    move-result-object v0

    invoke-virtual {v0, p1, p0}, Landroid/view/KeyEvent$DispatcherState;->startTracking(Landroid/view/KeyEvent;Ljava/lang/Object;)V

    goto :goto_0

    .line 877
    :cond_0
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I

    move-result v0

    if-ne v0, v1, :cond_1

    .line 879
    invoke-virtual {p0}, Lio/flutter/embedding/android/FlutterView;->getKeyDispatcherState()Landroid/view/KeyEvent$DispatcherState;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/view/KeyEvent$DispatcherState;->handleUpEvent(Landroid/view/KeyEvent;)V

    .line 885
    :cond_1
    :goto_0
    invoke-virtual {p0}, Lio/flutter/embedding/android/FlutterView;->isAttachedToFlutterEngine()Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lio/flutter/embedding/android/FlutterView;->keyboardManager:Lio/flutter/embedding/android/KeyboardManager;

    invoke-virtual {v0, p1}, Lio/flutter/embedding/android/KeyboardManager;->handleEvent(Landroid/view/KeyEvent;)Z

    move-result v0

    if-nez v0, :cond_3

    .line 886
    :cond_2
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    move-result v0

    if-eqz v0, :cond_4

    :cond_3
    goto :goto_1

    :cond_4
    const/4 v1, 0x0

    .line 885
    :goto_1
    return v1
.end method

.method public findViewByAccessibilityIdTraversal(I)Landroid/view/View;
    .locals 7
    .param p1, "accessibilityId"    # I

    .line 978
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1d

    if-ge v0, v1, :cond_0

    .line 979
    invoke-direct {p0, p1, p0}, Lio/flutter/embedding/android/FlutterView;->findViewByAccessibilityIdRootedAtCurrentView(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    return-object v0

    .line 988
    :cond_0
    const/4 v0, 0x0

    :try_start_0
    const-class v1, Landroid/view/View;

    const-string v2, "findViewByAccessibilityIdTraversal"

    const/4 v3, 0x1

    new-array v4, v3, [Ljava/lang/Class;

    sget-object v5, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    const/4 v6, 0x0

    aput-object v5, v4, v6

    .line 989
    invoke-virtual {v1, v2, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1
    :try_end_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_2

    .line 992
    .local v1, "findViewByAccessibilityIdTraversalMethod":Ljava/lang/reflect/Method;
    nop

    .line 993
    invoke-virtual {v1, v3}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 995
    :try_start_1
    new-array v2, v3, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v6

    invoke-virtual {v1, p0, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/View;
    :try_end_1
    .catch Ljava/lang/IllegalAccessException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_1 .. :try_end_1} :catch_0

    return-object v2

    .line 998
    :catch_0
    move-exception v2

    .line 999
    .local v2, "exception":Ljava/lang/reflect/InvocationTargetException;
    return-object v0

    .line 996
    .end local v2    # "exception":Ljava/lang/reflect/InvocationTargetException;
    :catch_1
    move-exception v2

    .line 997
    .local v2, "exception":Ljava/lang/IllegalAccessException;
    return-object v0

    .line 990
    .end local v1    # "findViewByAccessibilityIdTraversalMethod":Ljava/lang/reflect/Method;
    .end local v2    # "exception":Ljava/lang/IllegalAccessException;
    :catch_2
    move-exception v1

    .line 991
    .local v1, "exception":Ljava/lang/NoSuchMethodException;
    return-object v0
.end method

.method public getAccessibilityNodeProvider()Landroid/view/accessibility/AccessibilityNodeProvider;
    .locals 1

    .line 951
    iget-object v0, p0, Lio/flutter/embedding/android/FlutterView;->accessibilityBridge:Lio/flutter/view/AccessibilityBridge;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lio/flutter/view/AccessibilityBridge;->isAccessibilityEnabled()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 952
    iget-object v0, p0, Lio/flutter/embedding/android/FlutterView;->accessibilityBridge:Lio/flutter/view/AccessibilityBridge;

    return-object v0

    .line 957
    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public getAttachedFlutterEngine()Lio/flutter/embedding/engine/FlutterEngine;
    .locals 1

    .line 1389
    iget-object v0, p0, Lio/flutter/embedding/android/FlutterView;->flutterEngine:Lio/flutter/embedding/engine/FlutterEngine;

    return-object v0
.end method

.method public getBinaryMessenger()Lio/flutter/plugin/common/BinaryMessenger;
    .locals 1

    .line 1066
    iget-object v0, p0, Lio/flutter/embedding/android/FlutterView;->flutterEngine:Lio/flutter/embedding/engine/FlutterEngine;

    invoke-virtual {v0}, Lio/flutter/embedding/engine/FlutterEngine;->getDartExecutor()Lio/flutter/embedding/engine/dart/DartExecutor;

    move-result-object v0

    return-object v0
.end method

.method public getCurrentImageSurface()Lio/flutter/embedding/android/FlutterImageView;
    .locals 1

    .line 1282
    iget-object v0, p0, Lio/flutter/embedding/android/FlutterView;->flutterImageView:Lio/flutter/embedding/android/FlutterImageView;

    return-object v0
.end method

.method public getSystemPointerIcon(I)Landroid/view/PointerIcon;
    .locals 1
    .param p1, "type"    # I

    .line 1058
    invoke-virtual {p0}, Lio/flutter/embedding/android/FlutterView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p1}, Landroid/view/PointerIcon;->getSystemIcon(Landroid/content/Context;I)Landroid/view/PointerIcon;

    move-result-object v0

    return-object v0
.end method

.method public getViewportMetrics()Lio/flutter/embedding/engine/renderer/FlutterRenderer$ViewportMetrics;
    .locals 1

    .line 1519
    iget-object v0, p0, Lio/flutter/embedding/android/FlutterView;->viewportMetrics:Lio/flutter/embedding/engine/renderer/FlutterRenderer$ViewportMetrics;

    return-object v0
.end method

.method public hasRenderedFirstFrame()Z
    .locals 1

    .line 414
    iget-boolean v0, p0, Lio/flutter/embedding/android/FlutterView;->isFlutterUiDisplayed:Z

    return v0
.end method

.method public isAttachedToFlutterEngine()Z
    .locals 2

    .line 1377
    iget-object v0, p0, Lio/flutter/embedding/android/FlutterView;->flutterEngine:Lio/flutter/embedding/engine/FlutterEngine;

    if-eqz v0, :cond_0

    .line 1378
    invoke-virtual {v0}, Lio/flutter/embedding/engine/FlutterEngine;->getRenderer()Lio/flutter/embedding/engine/renderer/FlutterRenderer;

    move-result-object v0

    iget-object v1, p0, Lio/flutter/embedding/android/FlutterView;->renderSurface:Lio/flutter/embedding/engine/renderer/RenderSurface;

    invoke-interface {v1}, Lio/flutter/embedding/engine/renderer/RenderSurface;->getAttachedRenderer()Lio/flutter/embedding/engine/renderer/FlutterRenderer;

    move-result-object v1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 1377
    :goto_0
    return v0
.end method

.method public final onApplyWindowInsets(Landroid/view/WindowInsets;)Landroid/view/WindowInsets;
    .locals 12
    .param p1, "insets"    # Landroid/view/WindowInsets;

    .line 689
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->onApplyWindowInsets(Landroid/view/WindowInsets;)Landroid/view/WindowInsets;

    move-result-object v0

    .line 692
    .local v0, "newInsets":Landroid/view/WindowInsets;
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1d

    if-ne v1, v2, :cond_0

    .line 693
    invoke-virtual {p1}, Landroid/view/WindowInsets;->getSystemGestureInsets()Landroid/graphics/Insets;

    move-result-object v1

    .line 694
    .local v1, "systemGestureInsets":Landroid/graphics/Insets;
    iget-object v2, p0, Lio/flutter/embedding/android/FlutterView;->viewportMetrics:Lio/flutter/embedding/engine/renderer/FlutterRenderer$ViewportMetrics;

    iget v3, v1, Landroid/graphics/Insets;->top:I

    iput v3, v2, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ViewportMetrics;->systemGestureInsetTop:I

    .line 695
    iget-object v2, p0, Lio/flutter/embedding/android/FlutterView;->viewportMetrics:Lio/flutter/embedding/engine/renderer/FlutterRenderer$ViewportMetrics;

    iget v3, v1, Landroid/graphics/Insets;->right:I

    iput v3, v2, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ViewportMetrics;->systemGestureInsetRight:I

    .line 696
    iget-object v2, p0, Lio/flutter/embedding/android/FlutterView;->viewportMetrics:Lio/flutter/embedding/engine/renderer/FlutterRenderer$ViewportMetrics;

    iget v3, v1, Landroid/graphics/Insets;->bottom:I

    iput v3, v2, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ViewportMetrics;->systemGestureInsetBottom:I

    .line 697
    iget-object v2, p0, Lio/flutter/embedding/android/FlutterView;->viewportMetrics:Lio/flutter/embedding/engine/renderer/FlutterRenderer$ViewportMetrics;

    iget v3, v1, Landroid/graphics/Insets;->left:I

    iput v3, v2, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ViewportMetrics;->systemGestureInsetLeft:I

    .line 700
    .end local v1    # "systemGestureInsets":Landroid/graphics/Insets;
    :cond_0
    invoke-virtual {p0}, Lio/flutter/embedding/android/FlutterView;->getWindowSystemUiVisibility()I

    move-result v1

    and-int/lit8 v1, v1, 0x4

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-nez v1, :cond_1

    const/4 v1, 0x1

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    .line 701
    .local v1, "statusBarVisible":Z
    :goto_0
    nop

    .line 702
    invoke-virtual {p0}, Lio/flutter/embedding/android/FlutterView;->getWindowSystemUiVisibility()I

    move-result v4

    and-int/lit8 v4, v4, 0x2

    if-nez v4, :cond_2

    goto :goto_1

    :cond_2
    const/4 v2, 0x0

    .line 704
    .local v2, "navigationBarVisible":Z
    :goto_1
    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v5, 0x1e

    if-lt v4, v5, :cond_6

    .line 705
    const/4 v3, 0x0

    .line 706
    .local v3, "mask":I
    if-eqz v2, :cond_3

    .line 707
    invoke-static {}, Landroid/view/WindowInsets$Type;->navigationBars()I

    move-result v4

    or-int/2addr v3, v4

    .line 709
    :cond_3
    if-eqz v1, :cond_4

    .line 710
    invoke-static {}, Landroid/view/WindowInsets$Type;->statusBars()I

    move-result v4

    or-int/2addr v3, v4

    .line 712
    :cond_4
    invoke-virtual {p1, v3}, Landroid/view/WindowInsets;->getInsets(I)Landroid/graphics/Insets;

    move-result-object v4

    .line 713
    .local v4, "uiInsets":Landroid/graphics/Insets;
    iget-object v5, p0, Lio/flutter/embedding/android/FlutterView;->viewportMetrics:Lio/flutter/embedding/engine/renderer/FlutterRenderer$ViewportMetrics;

    iget v6, v4, Landroid/graphics/Insets;->top:I

    iput v6, v5, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ViewportMetrics;->viewPaddingTop:I

    .line 714
    iget-object v5, p0, Lio/flutter/embedding/android/FlutterView;->viewportMetrics:Lio/flutter/embedding/engine/renderer/FlutterRenderer$ViewportMetrics;

    iget v6, v4, Landroid/graphics/Insets;->right:I

    iput v6, v5, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ViewportMetrics;->viewPaddingRight:I

    .line 715
    iget-object v5, p0, Lio/flutter/embedding/android/FlutterView;->viewportMetrics:Lio/flutter/embedding/engine/renderer/FlutterRenderer$ViewportMetrics;

    iget v6, v4, Landroid/graphics/Insets;->bottom:I

    iput v6, v5, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ViewportMetrics;->viewPaddingBottom:I

    .line 716
    iget-object v5, p0, Lio/flutter/embedding/android/FlutterView;->viewportMetrics:Lio/flutter/embedding/engine/renderer/FlutterRenderer$ViewportMetrics;

    iget v6, v4, Landroid/graphics/Insets;->left:I

    iput v6, v5, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ViewportMetrics;->viewPaddingLeft:I

    .line 718
    invoke-static {}, Landroid/view/WindowInsets$Type;->ime()I

    move-result v5

    invoke-virtual {p1, v5}, Landroid/view/WindowInsets;->getInsets(I)Landroid/graphics/Insets;

    move-result-object v5

    .line 719
    .local v5, "imeInsets":Landroid/graphics/Insets;
    iget-object v6, p0, Lio/flutter/embedding/android/FlutterView;->viewportMetrics:Lio/flutter/embedding/engine/renderer/FlutterRenderer$ViewportMetrics;

    iget v7, v5, Landroid/graphics/Insets;->top:I

    iput v7, v6, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ViewportMetrics;->viewInsetTop:I

    .line 720
    iget-object v6, p0, Lio/flutter/embedding/android/FlutterView;->viewportMetrics:Lio/flutter/embedding/engine/renderer/FlutterRenderer$ViewportMetrics;

    iget v7, v5, Landroid/graphics/Insets;->right:I

    iput v7, v6, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ViewportMetrics;->viewInsetRight:I

    .line 721
    iget-object v6, p0, Lio/flutter/embedding/android/FlutterView;->viewportMetrics:Lio/flutter/embedding/engine/renderer/FlutterRenderer$ViewportMetrics;

    iget v7, v5, Landroid/graphics/Insets;->bottom:I

    iput v7, v6, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ViewportMetrics;->viewInsetBottom:I

    .line 722
    iget-object v6, p0, Lio/flutter/embedding/android/FlutterView;->viewportMetrics:Lio/flutter/embedding/engine/renderer/FlutterRenderer$ViewportMetrics;

    iget v7, v5, Landroid/graphics/Insets;->left:I

    iput v7, v6, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ViewportMetrics;->viewInsetLeft:I

    .line 724
    nop

    .line 725
    invoke-static {}, Landroid/view/WindowInsets$Type;->systemGestures()I

    move-result v6

    invoke-virtual {p1, v6}, Landroid/view/WindowInsets;->getInsets(I)Landroid/graphics/Insets;

    move-result-object v6

    .line 726
    .local v6, "systemGestureInsets":Landroid/graphics/Insets;
    iget-object v7, p0, Lio/flutter/embedding/android/FlutterView;->viewportMetrics:Lio/flutter/embedding/engine/renderer/FlutterRenderer$ViewportMetrics;

    iget v8, v6, Landroid/graphics/Insets;->top:I

    iput v8, v7, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ViewportMetrics;->systemGestureInsetTop:I

    .line 727
    iget-object v7, p0, Lio/flutter/embedding/android/FlutterView;->viewportMetrics:Lio/flutter/embedding/engine/renderer/FlutterRenderer$ViewportMetrics;

    iget v8, v6, Landroid/graphics/Insets;->right:I

    iput v8, v7, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ViewportMetrics;->systemGestureInsetRight:I

    .line 728
    iget-object v7, p0, Lio/flutter/embedding/android/FlutterView;->viewportMetrics:Lio/flutter/embedding/engine/renderer/FlutterRenderer$ViewportMetrics;

    iget v8, v6, Landroid/graphics/Insets;->bottom:I

    iput v8, v7, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ViewportMetrics;->systemGestureInsetBottom:I

    .line 729
    iget-object v7, p0, Lio/flutter/embedding/android/FlutterView;->viewportMetrics:Lio/flutter/embedding/engine/renderer/FlutterRenderer$ViewportMetrics;

    iget v8, v6, Landroid/graphics/Insets;->left:I

    iput v8, v7, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ViewportMetrics;->systemGestureInsetLeft:I

    .line 734
    invoke-virtual {p1}, Landroid/view/WindowInsets;->getDisplayCutout()Landroid/view/DisplayCutout;

    move-result-object v7

    .line 735
    .local v7, "cutout":Landroid/view/DisplayCutout;
    if-eqz v7, :cond_5

    .line 736
    invoke-virtual {v7}, Landroid/view/DisplayCutout;->getWaterfallInsets()Landroid/graphics/Insets;

    move-result-object v8

    .line 737
    .local v8, "waterfallInsets":Landroid/graphics/Insets;
    iget-object v9, p0, Lio/flutter/embedding/android/FlutterView;->viewportMetrics:Lio/flutter/embedding/engine/renderer/FlutterRenderer$ViewportMetrics;

    iget v10, v9, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ViewportMetrics;->viewPaddingTop:I

    iget v11, v8, Landroid/graphics/Insets;->top:I

    .line 739
    invoke-static {v10, v11}, Ljava/lang/Math;->max(II)I

    move-result v10

    .line 740
    invoke-virtual {v7}, Landroid/view/DisplayCutout;->getSafeInsetTop()I

    move-result v11

    .line 738
    invoke-static {v10, v11}, Ljava/lang/Math;->max(II)I

    move-result v10

    iput v10, v9, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ViewportMetrics;->viewPaddingTop:I

    .line 741
    iget-object v9, p0, Lio/flutter/embedding/android/FlutterView;->viewportMetrics:Lio/flutter/embedding/engine/renderer/FlutterRenderer$ViewportMetrics;

    iget v10, v9, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ViewportMetrics;->viewPaddingRight:I

    iget v11, v8, Landroid/graphics/Insets;->right:I

    .line 743
    invoke-static {v10, v11}, Ljava/lang/Math;->max(II)I

    move-result v10

    .line 744
    invoke-virtual {v7}, Landroid/view/DisplayCutout;->getSafeInsetRight()I

    move-result v11

    .line 742
    invoke-static {v10, v11}, Ljava/lang/Math;->max(II)I

    move-result v10

    iput v10, v9, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ViewportMetrics;->viewPaddingRight:I

    .line 745
    iget-object v9, p0, Lio/flutter/embedding/android/FlutterView;->viewportMetrics:Lio/flutter/embedding/engine/renderer/FlutterRenderer$ViewportMetrics;

    iget v10, v9, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ViewportMetrics;->viewPaddingBottom:I

    iget v11, v8, Landroid/graphics/Insets;->bottom:I

    .line 747
    invoke-static {v10, v11}, Ljava/lang/Math;->max(II)I

    move-result v10

    .line 748
    invoke-virtual {v7}, Landroid/view/DisplayCutout;->getSafeInsetBottom()I

    move-result v11

    .line 746
    invoke-static {v10, v11}, Ljava/lang/Math;->max(II)I

    move-result v10

    iput v10, v9, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ViewportMetrics;->viewPaddingBottom:I

    .line 749
    iget-object v9, p0, Lio/flutter/embedding/android/FlutterView;->viewportMetrics:Lio/flutter/embedding/engine/renderer/FlutterRenderer$ViewportMetrics;

    iget v10, v9, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ViewportMetrics;->viewPaddingLeft:I

    iget v11, v8, Landroid/graphics/Insets;->left:I

    .line 751
    invoke-static {v10, v11}, Ljava/lang/Math;->max(II)I

    move-result v10

    .line 752
    invoke-virtual {v7}, Landroid/view/DisplayCutout;->getSafeInsetLeft()I

    move-result v11

    .line 750
    invoke-static {v10, v11}, Ljava/lang/Math;->max(II)I

    move-result v10

    iput v10, v9, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ViewportMetrics;->viewPaddingLeft:I

    .line 754
    .end local v3    # "mask":I
    .end local v4    # "uiInsets":Landroid/graphics/Insets;
    .end local v5    # "imeInsets":Landroid/graphics/Insets;
    .end local v6    # "systemGestureInsets":Landroid/graphics/Insets;
    .end local v7    # "cutout":Landroid/view/DisplayCutout;
    .end local v8    # "waterfallInsets":Landroid/graphics/Insets;
    :cond_5
    goto :goto_8

    .line 757
    :cond_6
    sget-object v4, Lio/flutter/embedding/android/FlutterView$ZeroSides;->NONE:Lio/flutter/embedding/android/FlutterView$ZeroSides;

    .line 758
    .local v4, "zeroSides":Lio/flutter/embedding/android/FlutterView$ZeroSides;
    if-nez v2, :cond_7

    .line 759
    invoke-virtual {p0}, Lio/flutter/embedding/android/FlutterView;->calculateShouldZeroSides()Lio/flutter/embedding/android/FlutterView$ZeroSides;

    move-result-object v4

    .line 764
    :cond_7
    iget-object v5, p0, Lio/flutter/embedding/android/FlutterView;->viewportMetrics:Lio/flutter/embedding/engine/renderer/FlutterRenderer$ViewportMetrics;

    if-eqz v1, :cond_8

    invoke-virtual {p1}, Landroid/view/WindowInsets;->getSystemWindowInsetTop()I

    move-result v6

    goto :goto_2

    :cond_8
    const/4 v6, 0x0

    :goto_2
    iput v6, v5, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ViewportMetrics;->viewPaddingTop:I

    .line 765
    iget-object v5, p0, Lio/flutter/embedding/android/FlutterView;->viewportMetrics:Lio/flutter/embedding/engine/renderer/FlutterRenderer$ViewportMetrics;

    .line 766
    sget-object v6, Lio/flutter/embedding/android/FlutterView$ZeroSides;->RIGHT:Lio/flutter/embedding/android/FlutterView$ZeroSides;

    if-eq v4, v6, :cond_a

    sget-object v6, Lio/flutter/embedding/android/FlutterView$ZeroSides;->BOTH:Lio/flutter/embedding/android/FlutterView$ZeroSides;

    if-ne v4, v6, :cond_9

    goto :goto_3

    .line 768
    :cond_9
    invoke-virtual {p1}, Landroid/view/WindowInsets;->getSystemWindowInsetRight()I

    move-result v6

    goto :goto_4

    .line 767
    :cond_a
    :goto_3
    const/4 v6, 0x0

    .line 768
    :goto_4
    iput v6, v5, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ViewportMetrics;->viewPaddingRight:I

    .line 769
    iget-object v5, p0, Lio/flutter/embedding/android/FlutterView;->viewportMetrics:Lio/flutter/embedding/engine/renderer/FlutterRenderer$ViewportMetrics;

    .line 770
    if-eqz v2, :cond_b

    invoke-direct {p0, p1}, Lio/flutter/embedding/android/FlutterView;->guessBottomKeyboardInset(Landroid/view/WindowInsets;)I

    move-result v6

    if-nez v6, :cond_b

    .line 771
    invoke-virtual {p1}, Landroid/view/WindowInsets;->getSystemWindowInsetBottom()I

    move-result v6

    goto :goto_5

    .line 772
    :cond_b
    const/4 v6, 0x0

    :goto_5
    iput v6, v5, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ViewportMetrics;->viewPaddingBottom:I

    .line 773
    iget-object v5, p0, Lio/flutter/embedding/android/FlutterView;->viewportMetrics:Lio/flutter/embedding/engine/renderer/FlutterRenderer$ViewportMetrics;

    .line 774
    sget-object v6, Lio/flutter/embedding/android/FlutterView$ZeroSides;->LEFT:Lio/flutter/embedding/android/FlutterView$ZeroSides;

    if-eq v4, v6, :cond_d

    sget-object v6, Lio/flutter/embedding/android/FlutterView$ZeroSides;->BOTH:Lio/flutter/embedding/android/FlutterView$ZeroSides;

    if-ne v4, v6, :cond_c

    goto :goto_6

    .line 776
    :cond_c
    invoke-virtual {p1}, Landroid/view/WindowInsets;->getSystemWindowInsetLeft()I

    move-result v6

    goto :goto_7

    .line 775
    :cond_d
    :goto_6
    const/4 v6, 0x0

    .line 776
    :goto_7
    iput v6, v5, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ViewportMetrics;->viewPaddingLeft:I

    .line 779
    iget-object v5, p0, Lio/flutter/embedding/android/FlutterView;->viewportMetrics:Lio/flutter/embedding/engine/renderer/FlutterRenderer$ViewportMetrics;

    iput v3, v5, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ViewportMetrics;->viewInsetTop:I

    .line 780
    iget-object v5, p0, Lio/flutter/embedding/android/FlutterView;->viewportMetrics:Lio/flutter/embedding/engine/renderer/FlutterRenderer$ViewportMetrics;

    iput v3, v5, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ViewportMetrics;->viewInsetRight:I

    .line 781
    iget-object v5, p0, Lio/flutter/embedding/android/FlutterView;->viewportMetrics:Lio/flutter/embedding/engine/renderer/FlutterRenderer$ViewportMetrics;

    invoke-direct {p0, p1}, Lio/flutter/embedding/android/FlutterView;->guessBottomKeyboardInset(Landroid/view/WindowInsets;)I

    move-result v6

    iput v6, v5, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ViewportMetrics;->viewInsetBottom:I

    .line 782
    iget-object v5, p0, Lio/flutter/embedding/android/FlutterView;->viewportMetrics:Lio/flutter/embedding/engine/renderer/FlutterRenderer$ViewportMetrics;

    iput v3, v5, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ViewportMetrics;->viewInsetLeft:I

    .line 788
    .end local v4    # "zeroSides":Lio/flutter/embedding/android/FlutterView$ZeroSides;
    :goto_8
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0x23

    if-lt v3, v4, :cond_e

    .line 789
    iget-object v3, p0, Lio/flutter/embedding/android/FlutterView;->delegate:Lio/flutter/embedding/android/FlutterViewDelegate;

    invoke-virtual {p0}, Lio/flutter/embedding/android/FlutterView;->getContext()Landroid/content/Context;

    move-result-object v4

    iget-object v5, p0, Lio/flutter/embedding/android/FlutterView;->viewportMetrics:Lio/flutter/embedding/engine/renderer/FlutterRenderer$ViewportMetrics;

    invoke-virtual {v3, v4, v5}, Lio/flutter/embedding/android/FlutterViewDelegate;->growViewportMetricsToCaptionBar(Landroid/content/Context;Lio/flutter/embedding/engine/renderer/FlutterRenderer$ViewportMetrics;)V

    .line 792
    :cond_e
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Updating window insets (onApplyWindowInsets()):\nStatus bar insets: Top: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lio/flutter/embedding/android/FlutterView;->viewportMetrics:Lio/flutter/embedding/engine/renderer/FlutterRenderer$ViewportMetrics;

    iget v4, v4, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ViewportMetrics;->viewPaddingTop:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", Left: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v5, p0, Lio/flutter/embedding/android/FlutterView;->viewportMetrics:Lio/flutter/embedding/engine/renderer/FlutterRenderer$ViewportMetrics;

    iget v5, v5, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ViewportMetrics;->viewPaddingLeft:I

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v5, ", Right: "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v6, p0, Lio/flutter/embedding/android/FlutterView;->viewportMetrics:Lio/flutter/embedding/engine/renderer/FlutterRenderer$ViewportMetrics;

    iget v6, v6, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ViewportMetrics;->viewPaddingRight:I

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v6, "\nKeyboard insets: Bottom: "

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v6, p0, Lio/flutter/embedding/android/FlutterView;->viewportMetrics:Lio/flutter/embedding/engine/renderer/FlutterRenderer$ViewportMetrics;

    iget v6, v6, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ViewportMetrics;->viewInsetBottom:I

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lio/flutter/embedding/android/FlutterView;->viewportMetrics:Lio/flutter/embedding/engine/renderer/FlutterRenderer$ViewportMetrics;

    iget v4, v4, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ViewportMetrics;->viewInsetLeft:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lio/flutter/embedding/android/FlutterView;->viewportMetrics:Lio/flutter/embedding/engine/renderer/FlutterRenderer$ViewportMetrics;

    iget v4, v4, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ViewportMetrics;->viewInsetRight:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "System Gesture Insets - Left: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lio/flutter/embedding/android/FlutterView;->viewportMetrics:Lio/flutter/embedding/engine/renderer/FlutterRenderer$ViewportMetrics;

    iget v4, v4, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ViewportMetrics;->systemGestureInsetLeft:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", Top: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lio/flutter/embedding/android/FlutterView;->viewportMetrics:Lio/flutter/embedding/engine/renderer/FlutterRenderer$ViewportMetrics;

    iget v4, v4, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ViewportMetrics;->systemGestureInsetTop:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lio/flutter/embedding/android/FlutterView;->viewportMetrics:Lio/flutter/embedding/engine/renderer/FlutterRenderer$ViewportMetrics;

    iget v4, v4, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ViewportMetrics;->systemGestureInsetRight:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", Bottom: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lio/flutter/embedding/android/FlutterView;->viewportMetrics:Lio/flutter/embedding/engine/renderer/FlutterRenderer$ViewportMetrics;

    iget v4, v4, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ViewportMetrics;->viewInsetBottom:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const-string v4, "FlutterView"

    invoke-static {v4, v3}, Lio/flutter/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 817
    invoke-direct {p0}, Lio/flutter/embedding/android/FlutterView;->sendViewportMetricsToFlutter()V

    .line 818
    return-object v0
.end method

.method protected onAttachedToWindow()V
    .locals 4

    .line 511
    invoke-super {p0}, Landroid/widget/FrameLayout;->onAttachedToWindow()V

    .line 512
    invoke-virtual {p0}, Lio/flutter/embedding/android/FlutterView;->createWindowInfoRepo()Lio/flutter/embedding/android/WindowInfoRepositoryCallbackAdapterWrapper;

    move-result-object v0

    iput-object v0, p0, Lio/flutter/embedding/android/FlutterView;->windowInfoRepo:Lio/flutter/embedding/android/WindowInfoRepositoryCallbackAdapterWrapper;

    .line 513
    invoke-virtual {p0}, Lio/flutter/embedding/android/FlutterView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lio/flutter/util/ViewUtils;->getActivity(Landroid/content/Context;)Landroid/app/Activity;

    move-result-object v0

    .line 514
    .local v0, "activity":Landroid/app/Activity;
    iget-object v1, p0, Lio/flutter/embedding/android/FlutterView;->windowInfoRepo:Lio/flutter/embedding/android/WindowInfoRepositoryCallbackAdapterWrapper;

    if-eqz v1, :cond_0

    if-eqz v0, :cond_0

    .line 515
    nop

    .line 516
    invoke-virtual {p0}, Lio/flutter/embedding/android/FlutterView;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Landroidx/core/content/ContextCompat;->getMainExecutor(Landroid/content/Context;)Ljava/util/concurrent/Executor;

    move-result-object v2

    iget-object v3, p0, Lio/flutter/embedding/android/FlutterView;->windowInfoListener:Landroidx/core/util/Consumer;

    .line 515
    invoke-virtual {v1, v0, v2, v3}, Lio/flutter/embedding/android/WindowInfoRepositoryCallbackAdapterWrapper;->addWindowLayoutInfoListener(Landroid/app/Activity;Ljava/util/concurrent/Executor;Landroidx/core/util/Consumer;)V

    .line 518
    :cond_0
    return-void
.end method

.method protected onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 2
    .param p1, "newConfig"    # Landroid/content/res/Configuration;

    .line 443
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 451
    iget-object v0, p0, Lio/flutter/embedding/android/FlutterView;->flutterEngine:Lio/flutter/embedding/engine/FlutterEngine;

    if-eqz v0, :cond_0

    .line 452
    const-string v0, "FlutterView"

    const-string v1, "Configuration changed. Sending locales and user settings to Flutter."

    invoke-static {v0, v1}, Lio/flutter/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 453
    iget-object v0, p0, Lio/flutter/embedding/android/FlutterView;->localizationPlugin:Lio/flutter/plugin/localization/LocalizationPlugin;

    invoke-virtual {v0, p1}, Lio/flutter/plugin/localization/LocalizationPlugin;->sendLocalesToFlutter(Landroid/content/res/Configuration;)V

    .line 454
    invoke-virtual {p0}, Lio/flutter/embedding/android/FlutterView;->sendUserSettingsToFlutter()V

    .line 456
    invoke-virtual {p0}, Lio/flutter/embedding/android/FlutterView;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lio/flutter/embedding/android/FlutterView;->flutterEngine:Lio/flutter/embedding/engine/FlutterEngine;

    invoke-static {v0, v1}, Lio/flutter/util/ViewUtils;->calculateMaximumDisplayMetrics(Landroid/content/Context;Lio/flutter/util/ViewUtils$DisplayUpdater;)V

    .line 458
    :cond_0
    return-void
.end method

.method public onCreateInputConnection(Landroid/view/inputmethod/EditorInfo;)Landroid/view/inputmethod/InputConnection;
    .locals 2
    .param p1, "outAttrs"    # Landroid/view/inputmethod/EditorInfo;

    .line 839
    invoke-virtual {p0}, Lio/flutter/embedding/android/FlutterView;->isAttachedToFlutterEngine()Z

    move-result v0

    if-nez v0, :cond_0

    .line 840
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->onCreateInputConnection(Landroid/view/inputmethod/EditorInfo;)Landroid/view/inputmethod/InputConnection;

    move-result-object v0

    return-object v0

    .line 843
    :cond_0
    iget-object v0, p0, Lio/flutter/embedding/android/FlutterView;->textInputPlugin:Lio/flutter/plugin/editing/TextInputPlugin;

    iget-object v1, p0, Lio/flutter/embedding/android/FlutterView;->keyboardManager:Lio/flutter/embedding/android/KeyboardManager;

    invoke-virtual {v0, p0, v1, p1}, Lio/flutter/plugin/editing/TextInputPlugin;->createInputConnection(Landroid/view/View;Lio/flutter/embedding/android/KeyboardManager;Landroid/view/inputmethod/EditorInfo;)Landroid/view/inputmethod/InputConnection;

    move-result-object v0

    return-object v0
.end method

.method protected onDetachedFromWindow()V
    .locals 2

    .line 527
    iget-object v0, p0, Lio/flutter/embedding/android/FlutterView;->windowInfoRepo:Lio/flutter/embedding/android/WindowInfoRepositoryCallbackAdapterWrapper;

    if-eqz v0, :cond_0

    .line 528
    iget-object v1, p0, Lio/flutter/embedding/android/FlutterView;->windowInfoListener:Landroidx/core/util/Consumer;

    invoke-virtual {v0, v1}, Lio/flutter/embedding/android/WindowInfoRepositoryCallbackAdapterWrapper;->removeWindowLayoutInfoListener(Landroidx/core/util/Consumer;)V

    .line 530
    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lio/flutter/embedding/android/FlutterView;->windowInfoRepo:Lio/flutter/embedding/android/WindowInfoRepositoryCallbackAdapterWrapper;

    .line 531
    invoke-super {p0}, Landroid/widget/FrameLayout;->onDetachedFromWindow()V

    .line 532
    return-void
.end method

.method public onGenericMotionEvent(Landroid/view/MotionEvent;)Z
    .locals 3
    .param p1, "event"    # Landroid/view/MotionEvent;

    .line 915
    nop

    .line 916
    invoke-virtual {p0}, Lio/flutter/embedding/android/FlutterView;->isAttachedToFlutterEngine()Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    iget-object v0, p0, Lio/flutter/embedding/android/FlutterView;->androidTouchProcessor:Lio/flutter/embedding/android/AndroidTouchProcessor;

    .line 917
    invoke-virtual {p0}, Lio/flutter/embedding/android/FlutterView;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v0, p1, v2}, Lio/flutter/embedding/android/AndroidTouchProcessor;->onGenericMotionEvent(Landroid/view/MotionEvent;Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 918
    .local v0, "handled":Z
    :goto_0
    if-eqz v0, :cond_1

    goto :goto_1

    :cond_1
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->onGenericMotionEvent(Landroid/view/MotionEvent;)Z

    move-result v1

    :goto_1
    return v1
.end method

.method public onHoverEvent(Landroid/view/MotionEvent;)Z
    .locals 1
    .param p1, "event"    # Landroid/view/MotionEvent;

    .line 934
    invoke-virtual {p0}, Lio/flutter/embedding/android/FlutterView;->isAttachedToFlutterEngine()Z

    move-result v0

    if-nez v0, :cond_0

    .line 935
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->onHoverEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    return v0

    .line 938
    :cond_0
    iget-object v0, p0, Lio/flutter/embedding/android/FlutterView;->accessibilityBridge:Lio/flutter/view/AccessibilityBridge;

    invoke-virtual {v0, p1}, Lio/flutter/view/AccessibilityBridge;->onAccessibilityHoverEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    .line 939
    .local v0, "handled":Z
    nop

    .line 943
    return v0
.end method

.method public onProvideAutofillVirtualStructure(Landroid/view/ViewStructure;I)V
    .locals 1
    .param p1, "structure"    # Landroid/view/ViewStructure;
    .param p2, "flags"    # I

    .line 1493
    invoke-super {p0, p1, p2}, Landroid/widget/FrameLayout;->onProvideAutofillVirtualStructure(Landroid/view/ViewStructure;I)V

    .line 1494
    iget-object v0, p0, Lio/flutter/embedding/android/FlutterView;->textInputPlugin:Lio/flutter/plugin/editing/TextInputPlugin;

    invoke-virtual {v0, p1, p2}, Lio/flutter/plugin/editing/TextInputPlugin;->onProvideAutofillVirtualStructure(Landroid/view/ViewStructure;I)V

    .line 1495
    return-void
.end method

.method protected onSizeChanged(IIII)V
    .locals 3
    .param p1, "width"    # I
    .param p2, "height"    # I
    .param p3, "oldWidth"    # I
    .param p4, "oldHeight"    # I

    .line 471
    invoke-super {p0, p1, p2, p3, p4}, Landroid/widget/FrameLayout;->onSizeChanged(IIII)V

    .line 472
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Size changed. Sending Flutter new viewport metrics. FlutterView was "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " x "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, ", it is now "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "FlutterView"

    invoke-static {v1, v0}, Lio/flutter/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 482
    iget-object v0, p0, Lio/flutter/embedding/android/FlutterView;->viewportMetrics:Lio/flutter/embedding/engine/renderer/FlutterRenderer$ViewportMetrics;

    iput p1, v0, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ViewportMetrics;->width:I

    .line 483
    iget-object v0, p0, Lio/flutter/embedding/android/FlutterView;->viewportMetrics:Lio/flutter/embedding/engine/renderer/FlutterRenderer$ViewportMetrics;

    iput p2, v0, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ViewportMetrics;->height:I

    .line 484
    invoke-direct {p0}, Lio/flutter/embedding/android/FlutterView;->sendViewportMetricsToFlutter()V

    .line 485
    return-void
.end method

.method public onTextInputKeyEvent(Landroid/view/KeyEvent;)Z
    .locals 1
    .param p1, "keyEvent"    # Landroid/view/KeyEvent;

    .line 1071
    iget-object v0, p0, Lio/flutter/embedding/android/FlutterView;->textInputPlugin:Lio/flutter/plugin/editing/TextInputPlugin;

    invoke-virtual {v0, p1}, Lio/flutter/plugin/editing/TextInputPlugin;->handleKeyEvent(Landroid/view/KeyEvent;)Z

    move-result v0

    return v0
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1
    .param p1, "event"    # Landroid/view/MotionEvent;

    .line 897
    invoke-virtual {p0}, Lio/flutter/embedding/android/FlutterView;->isAttachedToFlutterEngine()Z

    move-result v0

    if-nez v0, :cond_0

    .line 898
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    return v0

    .line 901
    :cond_0
    invoke-virtual {p0, p1}, Lio/flutter/embedding/android/FlutterView;->requestUnbufferedDispatch(Landroid/view/MotionEvent;)V

    .line 903
    iget-object v0, p0, Lio/flutter/embedding/android/FlutterView;->androidTouchProcessor:Lio/flutter/embedding/android/AndroidTouchProcessor;

    invoke-virtual {v0, p1}, Lio/flutter/embedding/android/AndroidTouchProcessor;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    return v0
.end method

.method public redispatch(Landroid/view/KeyEvent;)V
    .locals 1
    .param p1, "keyEvent"    # Landroid/view/KeyEvent;

    .line 1076
    invoke-virtual {p0}, Lio/flutter/embedding/android/FlutterView;->getRootView()Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/view/View;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    .line 1077
    return-void
.end method

.method public removeFlutterEngineAttachmentListener(Lio/flutter/embedding/android/FlutterView$FlutterEngineAttachmentListener;)V
    .locals 1
    .param p1, "listener"    # Lio/flutter/embedding/android/FlutterView$FlutterEngineAttachmentListener;

    .line 1409
    iget-object v0, p0, Lio/flutter/embedding/android/FlutterView;->flutterEngineAttachmentListeners:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 1410
    return-void
.end method

.method public removeOnFirstFrameRenderedListener(Lio/flutter/embedding/engine/renderer/FlutterUiDisplayListener;)V
    .locals 1
    .param p1, "listener"    # Lio/flutter/embedding/engine/renderer/FlutterUiDisplayListener;

    .line 430
    iget-object v0, p0, Lio/flutter/embedding/android/FlutterView;->flutterUiDisplayListeners:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 431
    return-void
.end method

.method public revertImageView(Ljava/lang/Runnable;)V
    .locals 2
    .param p1, "onDone"    # Ljava/lang/Runnable;

    .line 1314
    iget-object v0, p0, Lio/flutter/embedding/android/FlutterView;->flutterImageView:Lio/flutter/embedding/android/FlutterImageView;

    const-string v1, "FlutterView"

    if-nez v0, :cond_0

    .line 1315
    const-string v0, "Tried to revert the image view, but no image view is used."

    invoke-static {v1, v0}, Lio/flutter/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 1316
    return-void

    .line 1318
    :cond_0
    iget-object v0, p0, Lio/flutter/embedding/android/FlutterView;->previousRenderSurface:Lio/flutter/embedding/engine/renderer/RenderSurface;

    if-nez v0, :cond_1

    .line 1319
    const-string v0, "Tried to revert the image view, but no previous surface was used."

    invoke-static {v1, v0}, Lio/flutter/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 1320
    return-void

    .line 1322
    :cond_1
    iput-object v0, p0, Lio/flutter/embedding/android/FlutterView;->renderSurface:Lio/flutter/embedding/engine/renderer/RenderSurface;

    .line 1323
    const/4 v0, 0x0

    iput-object v0, p0, Lio/flutter/embedding/android/FlutterView;->previousRenderSurface:Lio/flutter/embedding/engine/renderer/RenderSurface;

    .line 1325
    iget-object v0, p0, Lio/flutter/embedding/android/FlutterView;->flutterEngine:Lio/flutter/embedding/engine/FlutterEngine;

    invoke-virtual {v0}, Lio/flutter/embedding/engine/FlutterEngine;->getRenderer()Lio/flutter/embedding/engine/renderer/FlutterRenderer;

    move-result-object v0

    .line 1327
    .local v0, "renderer":Lio/flutter/embedding/engine/renderer/FlutterRenderer;
    iget-object v1, p0, Lio/flutter/embedding/android/FlutterView;->flutterEngine:Lio/flutter/embedding/engine/FlutterEngine;

    if-eqz v1, :cond_3

    if-nez v0, :cond_2

    goto :goto_0

    .line 1335
    :cond_2
    iget-object v1, p0, Lio/flutter/embedding/android/FlutterView;->renderSurface:Lio/flutter/embedding/engine/renderer/RenderSurface;

    invoke-interface {v1}, Lio/flutter/embedding/engine/renderer/RenderSurface;->resume()V

    .line 1339
    new-instance v1, Lio/flutter/embedding/android/FlutterView$5;

    invoke-direct {v1, p0, v0, p1}, Lio/flutter/embedding/android/FlutterView$5;-><init>(Lio/flutter/embedding/android/FlutterView;Lio/flutter/embedding/engine/renderer/FlutterRenderer;Ljava/lang/Runnable;)V

    invoke-virtual {v0, v1}, Lio/flutter/embedding/engine/renderer/FlutterRenderer;->addIsDisplayingFlutterUiListener(Lio/flutter/embedding/engine/renderer/FlutterUiDisplayListener;)V

    .line 1356
    return-void

    .line 1328
    :cond_3
    :goto_0
    iget-object v1, p0, Lio/flutter/embedding/android/FlutterView;->flutterImageView:Lio/flutter/embedding/android/FlutterImageView;

    invoke-virtual {v1}, Lio/flutter/embedding/android/FlutterImageView;->detachFromRenderer()V

    .line 1329
    invoke-direct {p0}, Lio/flutter/embedding/android/FlutterView;->releaseImageView()V

    .line 1330
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 1331
    return-void
.end method

.method sendUserSettingsToFlutter()V
    .locals 8

    .line 1423
    nop

    .line 1424
    invoke-virtual {p0}, Lio/flutter/embedding/android/FlutterView;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    iget v0, v0, Landroid/content/res/Configuration;->uiMode:I

    and-int/lit8 v0, v0, 0x30

    const/16 v1, 0x20

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 1427
    .local v0, "isNightModeOn":Z
    :goto_0
    if-eqz v0, :cond_1

    .line 1428
    sget-object v1, Lio/flutter/embedding/engine/systemchannels/SettingsChannel$PlatformBrightness;->dark:Lio/flutter/embedding/engine/systemchannels/SettingsChannel$PlatformBrightness;

    goto :goto_1

    .line 1429
    :cond_1
    sget-object v1, Lio/flutter/embedding/engine/systemchannels/SettingsChannel$PlatformBrightness;->light:Lio/flutter/embedding/engine/systemchannels/SettingsChannel$PlatformBrightness;

    :goto_1
    nop

    .line 1431
    .local v1, "brightness":Lio/flutter/embedding/engine/systemchannels/SettingsChannel$PlatformBrightness;
    const/4 v4, 0x0

    .line 1433
    .local v4, "isNativeSpellCheckServiceDefined":Z
    iget-object v5, p0, Lio/flutter/embedding/android/FlutterView;->textServicesManager:Landroid/view/textservice/TextServicesManager;

    if-eqz v5, :cond_4

    .line 1434
    sget v5, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v6, 0x1f

    if-lt v5, v6, :cond_3

    .line 1435
    iget-object v5, p0, Lio/flutter/embedding/android/FlutterView;->textServicesManager:Landroid/view/textservice/TextServicesManager;

    .line 1436
    invoke-virtual {v5}, Landroid/view/textservice/TextServicesManager;->getEnabledSpellCheckerInfos()Ljava/util/List;

    move-result-object v5

    .line 1437
    .local v5, "enabledSpellCheckerInfos":Ljava/util/List;, "Ljava/util/List<Landroid/view/textservice/SpellCheckerInfo;>;"
    nop

    .line 1438
    invoke-interface {v5}, Ljava/util/List;->stream()Ljava/util/stream/Stream;

    move-result-object v6

    new-instance v7, Lio/flutter/embedding/android/FlutterView$$ExternalSyntheticLambda0;

    invoke-direct {v7}, Lio/flutter/embedding/android/FlutterView$$ExternalSyntheticLambda0;-><init>()V

    .line 1439
    invoke-interface {v6, v7}, Ljava/util/stream/Stream;->anyMatch(Ljava/util/function/Predicate;)Z

    move-result v6

    .line 1447
    .local v6, "gboardSpellCheckerEnabled":Z
    iget-object v7, p0, Lio/flutter/embedding/android/FlutterView;->textServicesManager:Landroid/view/textservice/TextServicesManager;

    .line 1448
    invoke-virtual {v7}, Landroid/view/textservice/TextServicesManager;->isSpellCheckerEnabled()Z

    move-result v7

    if-eqz v7, :cond_2

    if-eqz v6, :cond_2

    const/4 v7, 0x1

    goto :goto_2

    :cond_2
    const/4 v7, 0x0

    :goto_2
    move v4, v7

    .line 1449
    .end local v5    # "enabledSpellCheckerInfos":Ljava/util/List;, "Ljava/util/List<Landroid/view/textservice/SpellCheckerInfo;>;"
    .end local v6    # "gboardSpellCheckerEnabled":Z
    goto :goto_3

    .line 1450
    :cond_3
    const/4 v4, 0x1

    .line 1454
    :cond_4
    :goto_3
    iget-object v5, p0, Lio/flutter/embedding/android/FlutterView;->flutterEngine:Lio/flutter/embedding/engine/FlutterEngine;

    .line 1455
    invoke-virtual {v5}, Lio/flutter/embedding/engine/FlutterEngine;->getSettingsChannel()Lio/flutter/embedding/engine/systemchannels/SettingsChannel;

    move-result-object v5

    .line 1456
    invoke-virtual {v5}, Lio/flutter/embedding/engine/systemchannels/SettingsChannel;->startMessage()Lio/flutter/embedding/engine/systemchannels/SettingsChannel$MessageBuilder;

    move-result-object v5

    .line 1457
    invoke-virtual {p0}, Lio/flutter/embedding/android/FlutterView;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    invoke-virtual {v6}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v6

    iget v6, v6, Landroid/content/res/Configuration;->fontScale:F

    invoke-virtual {v5, v6}, Lio/flutter/embedding/engine/systemchannels/SettingsChannel$MessageBuilder;->setTextScaleFactor(F)Lio/flutter/embedding/engine/systemchannels/SettingsChannel$MessageBuilder;

    move-result-object v5

    .line 1458
    invoke-virtual {p0}, Lio/flutter/embedding/android/FlutterView;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    invoke-virtual {v6}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v6

    invoke-virtual {v5, v6}, Lio/flutter/embedding/engine/systemchannels/SettingsChannel$MessageBuilder;->setDisplayMetrics(Landroid/util/DisplayMetrics;)Lio/flutter/embedding/engine/systemchannels/SettingsChannel$MessageBuilder;

    move-result-object v5

    .line 1459
    invoke-virtual {v5, v4}, Lio/flutter/embedding/engine/systemchannels/SettingsChannel$MessageBuilder;->setNativeSpellCheckServiceDefined(Z)Lio/flutter/embedding/engine/systemchannels/SettingsChannel$MessageBuilder;

    move-result-object v5

    .line 1462
    invoke-virtual {p0}, Lio/flutter/embedding/android/FlutterView;->getContext()Landroid/content/Context;

    move-result-object v6

    invoke-virtual {v6}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v6

    .line 1461
    const-string v7, "show_password"

    invoke-static {v6, v7, v3}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v6

    if-ne v6, v3, :cond_5

    const/4 v2, 0x1

    .line 1460
    :cond_5
    invoke-virtual {v5, v2}, Lio/flutter/embedding/engine/systemchannels/SettingsChannel$MessageBuilder;->setBrieflyShowPassword(Z)Lio/flutter/embedding/engine/systemchannels/SettingsChannel$MessageBuilder;

    move-result-object v2

    .line 1464
    invoke-virtual {p0}, Lio/flutter/embedding/android/FlutterView;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Landroid/text/format/DateFormat;->is24HourFormat(Landroid/content/Context;)Z

    move-result v3

    invoke-virtual {v2, v3}, Lio/flutter/embedding/engine/systemchannels/SettingsChannel$MessageBuilder;->setUse24HourFormat(Z)Lio/flutter/embedding/engine/systemchannels/SettingsChannel$MessageBuilder;

    move-result-object v2

    .line 1465
    invoke-virtual {v2, v1}, Lio/flutter/embedding/engine/systemchannels/SettingsChannel$MessageBuilder;->setPlatformBrightness(Lio/flutter/embedding/engine/systemchannels/SettingsChannel$PlatformBrightness;)Lio/flutter/embedding/engine/systemchannels/SettingsChannel$MessageBuilder;

    move-result-object v2

    .line 1466
    invoke-virtual {v2}, Lio/flutter/embedding/engine/systemchannels/SettingsChannel$MessageBuilder;->send()V

    .line 1467
    return-void
.end method

.method public setDelegate(Lio/flutter/embedding/android/FlutterViewDelegate;)V
    .locals 0
    .param p1, "delegate"    # Lio/flutter/embedding/android/FlutterViewDelegate;

    .line 1473
    iput-object p1, p0, Lio/flutter/embedding/android/FlutterView;->delegate:Lio/flutter/embedding/android/FlutterViewDelegate;

    .line 1474
    return-void
.end method

.method public setVisibility(I)V
    .locals 2
    .param p1, "visibility"    # I

    .line 1504
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 1508
    iget-object v0, p0, Lio/flutter/embedding/android/FlutterView;->renderSurface:Lio/flutter/embedding/engine/renderer/RenderSurface;

    instance-of v1, v0, Lio/flutter/embedding/android/FlutterSurfaceView;

    if-eqz v1, :cond_0

    .line 1509
    check-cast v0, Lio/flutter/embedding/android/FlutterSurfaceView;

    invoke-virtual {v0, p1}, Lio/flutter/embedding/android/FlutterSurfaceView;->setVisibility(I)V

    .line 1511
    :cond_0
    return-void
.end method

.method protected setWindowInfoListenerDisplayFeatures(Landroidx/window/layout/WindowLayoutInfo;)V
    .locals 9
    .param p1, "layoutInfo"    # Landroidx/window/layout/WindowLayoutInfo;

    .line 540
    invoke-virtual {p1}, Landroidx/window/layout/WindowLayoutInfo;->getDisplayFeatures()Ljava/util/List;

    move-result-object v0

    .line 541
    .local v0, "displayFeatures":Ljava/util/List;, "Ljava/util/List<Landroidx/window/layout/DisplayFeature;>;"
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 545
    .local v1, "result":Ljava/util/List;, "Ljava/util/List<Lio/flutter/embedding/engine/renderer/FlutterRenderer$DisplayFeature;>;"
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    const-string v4, "FlutterView"

    if-eqz v3, :cond_4

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/window/layout/DisplayFeature;

    .line 546
    .local v3, "displayFeature":Landroidx/window/layout/DisplayFeature;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "WindowInfoTracker Display Feature reported with bounds = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 549
    invoke-interface {v3}, Landroidx/window/layout/DisplayFeature;->getBounds()Landroid/graphics/Rect;

    move-result-object v6

    invoke-virtual {v6}, Landroid/graphics/Rect;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " and type = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 551
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 546
    invoke-static {v4, v5}, Lio/flutter/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 552
    instance-of v4, v3, Landroidx/window/layout/FoldingFeature;

    if-eqz v4, :cond_3

    .line 555
    move-object v4, v3

    check-cast v4, Landroidx/window/layout/FoldingFeature;

    .line 556
    .local v4, "feature":Landroidx/window/layout/FoldingFeature;
    invoke-interface {v4}, Landroidx/window/layout/FoldingFeature;->getOcclusionType()Landroidx/window/layout/FoldingFeature$OcclusionType;

    move-result-object v5

    sget-object v6, Landroidx/window/layout/FoldingFeature$OcclusionType;->FULL:Landroidx/window/layout/FoldingFeature$OcclusionType;

    if-ne v5, v6, :cond_0

    .line 557
    sget-object v5, Lio/flutter/embedding/engine/renderer/FlutterRenderer$DisplayFeatureType;->HINGE:Lio/flutter/embedding/engine/renderer/FlutterRenderer$DisplayFeatureType;

    .local v5, "type":Lio/flutter/embedding/engine/renderer/FlutterRenderer$DisplayFeatureType;
    goto :goto_1

    .line 559
    .end local v5    # "type":Lio/flutter/embedding/engine/renderer/FlutterRenderer$DisplayFeatureType;
    :cond_0
    sget-object v5, Lio/flutter/embedding/engine/renderer/FlutterRenderer$DisplayFeatureType;->FOLD:Lio/flutter/embedding/engine/renderer/FlutterRenderer$DisplayFeatureType;

    .line 561
    .restart local v5    # "type":Lio/flutter/embedding/engine/renderer/FlutterRenderer$DisplayFeatureType;
    :goto_1
    invoke-interface {v4}, Landroidx/window/layout/FoldingFeature;->getState()Landroidx/window/layout/FoldingFeature$State;

    move-result-object v6

    sget-object v7, Landroidx/window/layout/FoldingFeature$State;->FLAT:Landroidx/window/layout/FoldingFeature$State;

    if-ne v6, v7, :cond_1

    .line 562
    sget-object v6, Lio/flutter/embedding/engine/renderer/FlutterRenderer$DisplayFeatureState;->POSTURE_FLAT:Lio/flutter/embedding/engine/renderer/FlutterRenderer$DisplayFeatureState;

    .local v6, "state":Lio/flutter/embedding/engine/renderer/FlutterRenderer$DisplayFeatureState;
    goto :goto_2

    .line 563
    .end local v6    # "state":Lio/flutter/embedding/engine/renderer/FlutterRenderer$DisplayFeatureState;
    :cond_1
    invoke-interface {v4}, Landroidx/window/layout/FoldingFeature;->getState()Landroidx/window/layout/FoldingFeature$State;

    move-result-object v6

    sget-object v7, Landroidx/window/layout/FoldingFeature$State;->HALF_OPENED:Landroidx/window/layout/FoldingFeature$State;

    if-ne v6, v7, :cond_2

    .line 564
    sget-object v6, Lio/flutter/embedding/engine/renderer/FlutterRenderer$DisplayFeatureState;->POSTURE_HALF_OPENED:Lio/flutter/embedding/engine/renderer/FlutterRenderer$DisplayFeatureState;

    .restart local v6    # "state":Lio/flutter/embedding/engine/renderer/FlutterRenderer$DisplayFeatureState;
    goto :goto_2

    .line 566
    .end local v6    # "state":Lio/flutter/embedding/engine/renderer/FlutterRenderer$DisplayFeatureState;
    :cond_2
    sget-object v6, Lio/flutter/embedding/engine/renderer/FlutterRenderer$DisplayFeatureState;->UNKNOWN:Lio/flutter/embedding/engine/renderer/FlutterRenderer$DisplayFeatureState;

    .line 568
    .restart local v6    # "state":Lio/flutter/embedding/engine/renderer/FlutterRenderer$DisplayFeatureState;
    :goto_2
    new-instance v7, Lio/flutter/embedding/engine/renderer/FlutterRenderer$DisplayFeature;

    invoke-interface {v3}, Landroidx/window/layout/DisplayFeature;->getBounds()Landroid/graphics/Rect;

    move-result-object v8

    invoke-direct {v7, v8, v5, v6}, Lio/flutter/embedding/engine/renderer/FlutterRenderer$DisplayFeature;-><init>(Landroid/graphics/Rect;Lio/flutter/embedding/engine/renderer/FlutterRenderer$DisplayFeatureType;Lio/flutter/embedding/engine/renderer/FlutterRenderer$DisplayFeatureState;)V

    invoke-interface {v1, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 569
    .end local v4    # "feature":Landroidx/window/layout/FoldingFeature;
    .end local v5    # "type":Lio/flutter/embedding/engine/renderer/FlutterRenderer$DisplayFeatureType;
    .end local v6    # "state":Lio/flutter/embedding/engine/renderer/FlutterRenderer$DisplayFeatureState;
    goto :goto_3

    .line 570
    :cond_3
    new-instance v4, Lio/flutter/embedding/engine/renderer/FlutterRenderer$DisplayFeature;

    .line 572
    invoke-interface {v3}, Landroidx/window/layout/DisplayFeature;->getBounds()Landroid/graphics/Rect;

    move-result-object v5

    sget-object v6, Lio/flutter/embedding/engine/renderer/FlutterRenderer$DisplayFeatureType;->UNKNOWN:Lio/flutter/embedding/engine/renderer/FlutterRenderer$DisplayFeatureType;

    sget-object v7, Lio/flutter/embedding/engine/renderer/FlutterRenderer$DisplayFeatureState;->UNKNOWN:Lio/flutter/embedding/engine/renderer/FlutterRenderer$DisplayFeatureState;

    invoke-direct {v4, v5, v6, v7}, Lio/flutter/embedding/engine/renderer/FlutterRenderer$DisplayFeature;-><init>(Landroid/graphics/Rect;Lio/flutter/embedding/engine/renderer/FlutterRenderer$DisplayFeatureType;Lio/flutter/embedding/engine/renderer/FlutterRenderer$DisplayFeatureState;)V

    .line 570
    invoke-interface {v1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 576
    .end local v3    # "displayFeature":Landroidx/window/layout/DisplayFeature;
    :goto_3
    goto/16 :goto_0

    .line 580
    :cond_4
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x1c

    if-lt v2, v3, :cond_5

    .line 581
    invoke-virtual {p0}, Lio/flutter/embedding/android/FlutterView;->getRootWindowInsets()Landroid/view/WindowInsets;

    move-result-object v2

    .line 582
    .local v2, "insets":Landroid/view/WindowInsets;
    if-eqz v2, :cond_5

    .line 583
    invoke-virtual {v2}, Landroid/view/WindowInsets;->getDisplayCutout()Landroid/view/DisplayCutout;

    move-result-object v3

    .line 584
    .local v3, "cutout":Landroid/view/DisplayCutout;
    if-eqz v3, :cond_5

    .line 585
    invoke-virtual {v3}, Landroid/view/DisplayCutout;->getBoundingRects()Ljava/util/List;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_4
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_5

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/graphics/Rect;

    .line 586
    .local v6, "bounds":Landroid/graphics/Rect;
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "DisplayCutout area reported with bounds = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v6}, Landroid/graphics/Rect;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v4, v7}, Lio/flutter/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 587
    new-instance v7, Lio/flutter/embedding/engine/renderer/FlutterRenderer$DisplayFeature;

    sget-object v8, Lio/flutter/embedding/engine/renderer/FlutterRenderer$DisplayFeatureType;->CUTOUT:Lio/flutter/embedding/engine/renderer/FlutterRenderer$DisplayFeatureType;

    invoke-direct {v7, v6, v8}, Lio/flutter/embedding/engine/renderer/FlutterRenderer$DisplayFeature;-><init>(Landroid/graphics/Rect;Lio/flutter/embedding/engine/renderer/FlutterRenderer$DisplayFeatureType;)V

    invoke-interface {v1, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 588
    .end local v6    # "bounds":Landroid/graphics/Rect;
    goto :goto_4

    .line 592
    .end local v2    # "insets":Landroid/view/WindowInsets;
    .end local v3    # "cutout":Landroid/view/DisplayCutout;
    :cond_5
    iget-object v2, p0, Lio/flutter/embedding/android/FlutterView;->viewportMetrics:Lio/flutter/embedding/engine/renderer/FlutterRenderer$ViewportMetrics;

    iput-object v1, v2, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ViewportMetrics;->displayFeatures:Ljava/util/List;

    .line 593
    invoke-direct {p0}, Lio/flutter/embedding/android/FlutterView;->sendViewportMetricsToFlutter()V

    .line 594
    return-void
.end method
