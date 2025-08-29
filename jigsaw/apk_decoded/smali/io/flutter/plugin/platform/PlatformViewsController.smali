.class public Lio/flutter/plugin/platform/PlatformViewsController;
.super Ljava/lang/Object;
.source "PlatformViewsController.java"

# interfaces
.implements Lio/flutter/plugin/platform/PlatformViewsAccessibilityDelegate;


# static fields
.field private static final TAG:Ljava/lang/String; = "PlatformViewsController"

.field private static VIEW_TYPES_REQUIRE_VIRTUAL_DISPLAY:[Ljava/lang/Class;

.field private static enableImageRenderTarget:Z

.field private static enableSurfaceProducerRenderTarget:Z


# instance fields
.field private final accessibilityEventsDelegate:Lio/flutter/plugin/platform/AccessibilityEventsDelegate;

.field private androidTouchProcessor:Lio/flutter/embedding/android/AndroidTouchProcessor;

.field private final channelHandler:Lio/flutter/embedding/engine/systemchannels/PlatformViewsChannel$PlatformViewsHandler;

.field private context:Landroid/content/Context;

.field final contextToEmbeddedView:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Landroid/content/Context;",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field private final currentFrameUsedOverlayLayerIds:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private final currentFrameUsedPlatformViewIds:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private flutterView:Lio/flutter/embedding/android/FlutterView;

.field private flutterViewConvertedToImageView:Z

.field private final motionEventTracker:Lio/flutter/embedding/android/MotionEventTracker;

.field private nextOverlayLayerId:I

.field private final overlayLayerViews:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Lio/flutter/plugin/platform/PlatformOverlayView;",
            ">;"
        }
    .end annotation
.end field

.field private final platformViewParent:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Lio/flutter/embedding/engine/mutatorsstack/FlutterMutatorView;",
            ">;"
        }
    .end annotation
.end field

.field private final platformViews:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Lio/flutter/plugin/platform/PlatformView;",
            ">;"
        }
    .end annotation
.end field

.field private platformViewsChannel:Lio/flutter/embedding/engine/systemchannels/PlatformViewsChannel;

.field private final registry:Lio/flutter/plugin/platform/PlatformViewRegistryImpl;

.field private synchronizeToNativeViewHierarchy:Z

.field private textInputPlugin:Lio/flutter/plugin/editing/TextInputPlugin;

.field private textureRegistry:Lio/flutter/view/TextureRegistry;

.field private usesSoftwareRendering:Z

.field final vdControllers:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/Integer;",
            "Lio/flutter/plugin/platform/VirtualDisplayController;",
            ">;"
        }
    .end annotation
.end field

.field private final viewWrappers:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Lio/flutter/plugin/platform/PlatformViewWrapper;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 65
    const/4 v0, 0x1

    new-array v1, v0, [Ljava/lang/Class;

    const/4 v2, 0x0

    const-class v3, Landroid/view/SurfaceView;

    aput-object v3, v1, v2

    sput-object v1, Lio/flutter/plugin/platform/PlatformViewsController;->VIEW_TYPES_REQUIRE_VIRTUAL_DISPLAY:[Ljava/lang/Class;

    .line 152
    sput-boolean v0, Lio/flutter/plugin/platform/PlatformViewsController;->enableImageRenderTarget:Z

    .line 154
    sput-boolean v0, Lio/flutter/plugin/platform/PlatformViewsController;->enableSurfaceProducerRenderTarget:Z

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 736
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 130
    const/4 v0, 0x0

    iput v0, p0, Lio/flutter/plugin/platform/PlatformViewsController;->nextOverlayLayerId:I

    .line 133
    iput-boolean v0, p0, Lio/flutter/plugin/platform/PlatformViewsController;->flutterViewConvertedToImageView:Z

    .line 138
    const/4 v1, 0x1

    iput-boolean v1, p0, Lio/flutter/plugin/platform/PlatformViewsController;->synchronizeToNativeViewHierarchy:Z

    .line 150
    iput-boolean v0, p0, Lio/flutter/plugin/platform/PlatformViewsController;->usesSoftwareRendering:Z

    .line 156
    new-instance v0, Lio/flutter/plugin/platform/PlatformViewsController$1;

    invoke-direct {v0, p0}, Lio/flutter/plugin/platform/PlatformViewsController$1;-><init>(Lio/flutter/plugin/platform/PlatformViewsController;)V

    iput-object v0, p0, Lio/flutter/plugin/platform/PlatformViewsController;->channelHandler:Lio/flutter/embedding/engine/systemchannels/PlatformViewsChannel$PlatformViewsHandler;

    .line 737
    new-instance v0, Lio/flutter/plugin/platform/PlatformViewRegistryImpl;

    invoke-direct {v0}, Lio/flutter/plugin/platform/PlatformViewRegistryImpl;-><init>()V

    iput-object v0, p0, Lio/flutter/plugin/platform/PlatformViewsController;->registry:Lio/flutter/plugin/platform/PlatformViewRegistryImpl;

    .line 738
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lio/flutter/plugin/platform/PlatformViewsController;->vdControllers:Ljava/util/HashMap;

    .line 739
    new-instance v0, Lio/flutter/plugin/platform/AccessibilityEventsDelegate;

    invoke-direct {v0}, Lio/flutter/plugin/platform/AccessibilityEventsDelegate;-><init>()V

    iput-object v0, p0, Lio/flutter/plugin/platform/PlatformViewsController;->accessibilityEventsDelegate:Lio/flutter/plugin/platform/AccessibilityEventsDelegate;

    .line 740
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lio/flutter/plugin/platform/PlatformViewsController;->contextToEmbeddedView:Ljava/util/HashMap;

    .line 741
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lio/flutter/plugin/platform/PlatformViewsController;->overlayLayerViews:Landroid/util/SparseArray;

    .line 742
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lio/flutter/plugin/platform/PlatformViewsController;->currentFrameUsedOverlayLayerIds:Ljava/util/HashSet;

    .line 743
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lio/flutter/plugin/platform/PlatformViewsController;->currentFrameUsedPlatformViewIds:Ljava/util/HashSet;

    .line 744
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lio/flutter/plugin/platform/PlatformViewsController;->viewWrappers:Landroid/util/SparseArray;

    .line 745
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lio/flutter/plugin/platform/PlatformViewsController;->platformViews:Landroid/util/SparseArray;

    .line 746
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lio/flutter/plugin/platform/PlatformViewsController;->platformViewParent:Landroid/util/SparseArray;

    .line 748
    invoke-static {}, Lio/flutter/embedding/android/MotionEventTracker;->getInstance()Lio/flutter/embedding/android/MotionEventTracker;

    move-result-object v0

    iput-object v0, p0, Lio/flutter/plugin/platform/PlatformViewsController;->motionEventTracker:Lio/flutter/embedding/android/MotionEventTracker;

    .line 749
    return-void
.end method

.method static synthetic access$000(Lio/flutter/plugin/platform/PlatformViewsController;I)V
    .locals 0
    .param p0, "x0"    # Lio/flutter/plugin/platform/PlatformViewsController;
    .param p1, "x1"    # I

    .line 51
    invoke-direct {p0, p1}, Lio/flutter/plugin/platform/PlatformViewsController;->enforceMinimumAndroidApiVersion(I)V

    return-void
.end method

.method static synthetic access$100(Lio/flutter/plugin/platform/PlatformViewsController;Lio/flutter/embedding/engine/systemchannels/PlatformViewsChannel$PlatformViewCreationRequest;)V
    .locals 0
    .param p0, "x0"    # Lio/flutter/plugin/platform/PlatformViewsController;
    .param p1, "x1"    # Lio/flutter/embedding/engine/systemchannels/PlatformViewsChannel$PlatformViewCreationRequest;

    .line 51
    invoke-direct {p0, p1}, Lio/flutter/plugin/platform/PlatformViewsController;->ensureValidRequest(Lio/flutter/embedding/engine/systemchannels/PlatformViewsChannel$PlatformViewCreationRequest;)V

    return-void
.end method

.method static synthetic access$1000(Lio/flutter/plugin/platform/PlatformViewsController;)Landroid/util/SparseArray;
    .locals 1
    .param p0, "x0"    # Lio/flutter/plugin/platform/PlatformViewsController;

    .line 51
    iget-object v0, p0, Lio/flutter/plugin/platform/PlatformViewsController;->platformViewParent:Landroid/util/SparseArray;

    return-object v0
.end method

.method static synthetic access$1100(Lio/flutter/plugin/platform/PlatformViewsController;D)I
    .locals 1
    .param p0, "x0"    # Lio/flutter/plugin/platform/PlatformViewsController;
    .param p1, "x1"    # D

    .line 51
    invoke-direct {p0, p1, p2}, Lio/flutter/plugin/platform/PlatformViewsController;->toPhysicalPixels(D)I

    move-result v0

    return v0
.end method

.method static synthetic access$1200(Lio/flutter/plugin/platform/PlatformViewsController;)F
    .locals 1
    .param p0, "x0"    # Lio/flutter/plugin/platform/PlatformViewsController;

    .line 51
    invoke-direct {p0}, Lio/flutter/plugin/platform/PlatformViewsController;->getDisplayDensity()F

    move-result v0

    return v0
.end method

.method static synthetic access$1300(Lio/flutter/plugin/platform/PlatformViewsController;Lio/flutter/plugin/platform/VirtualDisplayController;)V
    .locals 0
    .param p0, "x0"    # Lio/flutter/plugin/platform/PlatformViewsController;
    .param p1, "x1"    # Lio/flutter/plugin/platform/VirtualDisplayController;

    .line 51
    invoke-direct {p0, p1}, Lio/flutter/plugin/platform/PlatformViewsController;->lockInputConnection(Lio/flutter/plugin/platform/VirtualDisplayController;)V

    return-void
.end method

.method static synthetic access$1400(Lio/flutter/plugin/platform/PlatformViewsController;D)I
    .locals 1
    .param p0, "x0"    # Lio/flutter/plugin/platform/PlatformViewsController;
    .param p1, "x1"    # D

    .line 51
    invoke-direct {p0, p1, p2}, Lio/flutter/plugin/platform/PlatformViewsController;->toLogicalPixels(D)I

    move-result v0

    return v0
.end method

.method static synthetic access$1500(Lio/flutter/plugin/platform/PlatformViewsController;)Landroid/content/Context;
    .locals 1
    .param p0, "x0"    # Lio/flutter/plugin/platform/PlatformViewsController;

    .line 51
    iget-object v0, p0, Lio/flutter/plugin/platform/PlatformViewsController;->context:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$1600(I)Z
    .locals 1
    .param p0, "x0"    # I

    .line 51
    invoke-static {p0}, Lio/flutter/plugin/platform/PlatformViewsController;->validateDirection(I)Z

    move-result v0

    return v0
.end method

.method static synthetic access$1702(Lio/flutter/plugin/platform/PlatformViewsController;Z)Z
    .locals 0
    .param p0, "x0"    # Lio/flutter/plugin/platform/PlatformViewsController;
    .param p1, "x1"    # Z

    .line 51
    iput-boolean p1, p0, Lio/flutter/plugin/platform/PlatformViewsController;->synchronizeToNativeViewHierarchy:Z

    return p1
.end method

.method static synthetic access$1800(Lio/flutter/plugin/platform/PlatformViewsController;Lio/flutter/plugin/platform/VirtualDisplayController;)V
    .locals 0
    .param p0, "x0"    # Lio/flutter/plugin/platform/PlatformViewsController;
    .param p1, "x1"    # Lio/flutter/plugin/platform/VirtualDisplayController;

    .line 51
    invoke-direct {p0, p1}, Lio/flutter/plugin/platform/PlatformViewsController;->unlockInputConnection(Lio/flutter/plugin/platform/VirtualDisplayController;)V

    return-void
.end method

.method static synthetic access$1900(Lio/flutter/plugin/platform/PlatformViewsController;DF)I
    .locals 1
    .param p0, "x0"    # Lio/flutter/plugin/platform/PlatformViewsController;
    .param p1, "x1"    # D
    .param p3, "x2"    # F

    .line 51
    invoke-direct {p0, p1, p2, p3}, Lio/flutter/plugin/platform/PlatformViewsController;->toLogicalPixels(DF)I

    move-result v0

    return v0
.end method

.method static synthetic access$200(Lio/flutter/plugin/platform/PlatformViewsController;Lio/flutter/plugin/platform/PlatformView;Lio/flutter/embedding/engine/systemchannels/PlatformViewsChannel$PlatformViewCreationRequest;)V
    .locals 0
    .param p0, "x0"    # Lio/flutter/plugin/platform/PlatformViewsController;
    .param p1, "x1"    # Lio/flutter/plugin/platform/PlatformView;
    .param p2, "x2"    # Lio/flutter/embedding/engine/systemchannels/PlatformViewsChannel$PlatformViewCreationRequest;

    .line 51
    invoke-direct {p0, p1, p2}, Lio/flutter/plugin/platform/PlatformViewsController;->configureForHybridComposition(Lio/flutter/plugin/platform/PlatformView;Lio/flutter/embedding/engine/systemchannels/PlatformViewsChannel$PlatformViewCreationRequest;)V

    return-void
.end method

.method static synthetic access$300(Lio/flutter/plugin/platform/PlatformViewsController;)Landroid/util/SparseArray;
    .locals 1
    .param p0, "x0"    # Lio/flutter/plugin/platform/PlatformViewsController;

    .line 51
    iget-object v0, p0, Lio/flutter/plugin/platform/PlatformViewsController;->viewWrappers:Landroid/util/SparseArray;

    return-object v0
.end method

.method static synthetic access$400(Lio/flutter/plugin/platform/PlatformViewsController;)Lio/flutter/view/TextureRegistry;
    .locals 1
    .param p0, "x0"    # Lio/flutter/plugin/platform/PlatformViewsController;

    .line 51
    iget-object v0, p0, Lio/flutter/plugin/platform/PlatformViewsController;->textureRegistry:Lio/flutter/view/TextureRegistry;

    return-object v0
.end method

.method static synthetic access$500(Lio/flutter/plugin/platform/PlatformViewsController;)Lio/flutter/embedding/android/FlutterView;
    .locals 1
    .param p0, "x0"    # Lio/flutter/plugin/platform/PlatformViewsController;

    .line 51
    iget-object v0, p0, Lio/flutter/plugin/platform/PlatformViewsController;->flutterView:Lio/flutter/embedding/android/FlutterView;

    return-object v0
.end method

.method static synthetic access$600()[Ljava/lang/Class;
    .locals 1

    .line 51
    sget-object v0, Lio/flutter/plugin/platform/PlatformViewsController;->VIEW_TYPES_REQUIRE_VIRTUAL_DISPLAY:[Ljava/lang/Class;

    return-object v0
.end method

.method static synthetic access$700(Lio/flutter/plugin/platform/PlatformViewsController;)Z
    .locals 1
    .param p0, "x0"    # Lio/flutter/plugin/platform/PlatformViewsController;

    .line 51
    iget-boolean v0, p0, Lio/flutter/plugin/platform/PlatformViewsController;->usesSoftwareRendering:Z

    return v0
.end method

.method static synthetic access$800(Lio/flutter/plugin/platform/PlatformViewsController;Lio/flutter/plugin/platform/PlatformView;Lio/flutter/embedding/engine/systemchannels/PlatformViewsChannel$PlatformViewCreationRequest;)J
    .locals 2
    .param p0, "x0"    # Lio/flutter/plugin/platform/PlatformViewsController;
    .param p1, "x1"    # Lio/flutter/plugin/platform/PlatformView;
    .param p2, "x2"    # Lio/flutter/embedding/engine/systemchannels/PlatformViewsChannel$PlatformViewCreationRequest;

    .line 51
    invoke-direct {p0, p1, p2}, Lio/flutter/plugin/platform/PlatformViewsController;->configureForVirtualDisplay(Lio/flutter/plugin/platform/PlatformView;Lio/flutter/embedding/engine/systemchannels/PlatformViewsChannel$PlatformViewCreationRequest;)J

    move-result-wide v0

    return-wide v0
.end method

.method static synthetic access$900(Lio/flutter/plugin/platform/PlatformViewsController;)Landroid/util/SparseArray;
    .locals 1
    .param p0, "x0"    # Lio/flutter/plugin/platform/PlatformViewsController;

    .line 51
    iget-object v0, p0, Lio/flutter/plugin/platform/PlatformViewsController;->platformViews:Landroid/util/SparseArray;

    return-object v0
.end method

.method private configureForHybridComposition(Lio/flutter/plugin/platform/PlatformView;Lio/flutter/embedding/engine/systemchannels/PlatformViewsChannel$PlatformViewCreationRequest;)V
    .locals 2
    .param p1, "platformView"    # Lio/flutter/plugin/platform/PlatformView;
    .param p2, "request"    # Lio/flutter/embedding/engine/systemchannels/PlatformViewsChannel$PlatformViewCreationRequest;

    .line 541
    const/16 v0, 0x13

    invoke-direct {p0, v0}, Lio/flutter/plugin/platform/PlatformViewsController;->enforceMinimumAndroidApiVersion(I)V

    .line 542
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Using hybrid composition for platform view: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p2, Lio/flutter/embedding/engine/systemchannels/PlatformViewsChannel$PlatformViewCreationRequest;->viewId:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "PlatformViewsController"

    invoke-static {v1, v0}, Lio/flutter/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 543
    return-void
.end method

.method private configureForVirtualDisplay(Lio/flutter/plugin/platform/PlatformView;Lio/flutter/embedding/engine/systemchannels/PlatformViewsChannel$PlatformViewCreationRequest;)J
    .locals 12
    .param p1, "platformView"    # Lio/flutter/plugin/platform/PlatformView;
    .param p2, "request"    # Lio/flutter/embedding/engine/systemchannels/PlatformViewsChannel$PlatformViewCreationRequest;

    .line 553
    const/16 v0, 0x14

    invoke-direct {p0, v0}, Lio/flutter/plugin/platform/PlatformViewsController;->enforceMinimumAndroidApiVersion(I)V

    .line 555
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Hosting view in a virtual display for platform view: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p2, Lio/flutter/embedding/engine/systemchannels/PlatformViewsChannel$PlatformViewCreationRequest;->viewId:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "PlatformViewsController"

    invoke-static {v1, v0}, Lio/flutter/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 557
    iget-object v0, p0, Lio/flutter/plugin/platform/PlatformViewsController;->textureRegistry:Lio/flutter/view/TextureRegistry;

    invoke-static {v0}, Lio/flutter/plugin/platform/PlatformViewsController;->makePlatformViewRenderTarget(Lio/flutter/view/TextureRegistry;)Lio/flutter/plugin/platform/PlatformViewRenderTarget;

    move-result-object v0

    .line 558
    .local v0, "renderTarget":Lio/flutter/plugin/platform/PlatformViewRenderTarget;
    iget-wide v1, p2, Lio/flutter/embedding/engine/systemchannels/PlatformViewsChannel$PlatformViewCreationRequest;->logicalWidth:D

    invoke-direct {p0, v1, v2}, Lio/flutter/plugin/platform/PlatformViewsController;->toPhysicalPixels(D)I

    move-result v10

    .line 559
    .local v10, "physicalWidth":I
    iget-wide v1, p2, Lio/flutter/embedding/engine/systemchannels/PlatformViewsChannel$PlatformViewCreationRequest;->logicalHeight:D

    invoke-direct {p0, v1, v2}, Lio/flutter/plugin/platform/PlatformViewsController;->toPhysicalPixels(D)I

    move-result v11

    .line 560
    .local v11, "physicalHeight":I
    iget-object v1, p0, Lio/flutter/plugin/platform/PlatformViewsController;->context:Landroid/content/Context;

    iget-object v2, p0, Lio/flutter/plugin/platform/PlatformViewsController;->accessibilityEventsDelegate:Lio/flutter/plugin/platform/AccessibilityEventsDelegate;

    iget v7, p2, Lio/flutter/embedding/engine/systemchannels/PlatformViewsChannel$PlatformViewCreationRequest;->viewId:I

    const/4 v8, 0x0

    new-instance v9, Lio/flutter/plugin/platform/PlatformViewsController$$ExternalSyntheticLambda3;

    invoke-direct {v9, p0, p2}, Lio/flutter/plugin/platform/PlatformViewsController$$ExternalSyntheticLambda3;-><init>(Lio/flutter/plugin/platform/PlatformViewsController;Lio/flutter/embedding/engine/systemchannels/PlatformViewsChannel$PlatformViewCreationRequest;)V

    .line 561
    move-object v3, p1

    move-object v4, v0

    move v5, v10

    move v6, v11

    invoke-static/range {v1 .. v9}, Lio/flutter/plugin/platform/VirtualDisplayController;->create(Landroid/content/Context;Lio/flutter/plugin/platform/AccessibilityEventsDelegate;Lio/flutter/plugin/platform/PlatformView;Lio/flutter/plugin/platform/PlatformViewRenderTarget;IIILjava/lang/Object;Landroid/view/View$OnFocusChangeListener;)Lio/flutter/plugin/platform/VirtualDisplayController;

    move-result-object v1

    .line 576
    .local v1, "vdController":Lio/flutter/plugin/platform/VirtualDisplayController;
    if-eqz v1, :cond_0

    .line 587
    iget-object v2, p0, Lio/flutter/plugin/platform/PlatformViewsController;->vdControllers:Ljava/util/HashMap;

    iget v3, p2, Lio/flutter/embedding/engine/systemchannels/PlatformViewsChannel$PlatformViewCreationRequest;->viewId:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v2, v3, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 588
    invoke-interface {p1}, Lio/flutter/plugin/platform/PlatformView;->getView()Landroid/view/View;

    move-result-object v2

    .line 589
    .local v2, "embeddedView":Landroid/view/View;
    iget-object v3, p0, Lio/flutter/plugin/platform/PlatformViewsController;->contextToEmbeddedView:Ljava/util/HashMap;

    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v3, v4, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 591
    invoke-interface {v0}, Lio/flutter/plugin/platform/PlatformViewRenderTarget;->getId()J

    move-result-wide v3

    return-wide v3

    .line 577
    .end local v2    # "embeddedView":Landroid/view/View;
    :cond_0
    new-instance v2, Ljava/lang/IllegalStateException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Failed creating virtual display for a "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p2, Lio/flutter/embedding/engine/systemchannels/PlatformViewsChannel$PlatformViewCreationRequest;->viewType:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " with id: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, p2, Lio/flutter/embedding/engine/systemchannels/PlatformViewsChannel$PlatformViewCreationRequest;->viewId:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method private diposeAllViews()V
    .locals 2

    .line 1069
    nop

    :goto_0
    iget-object v0, p0, Lio/flutter/plugin/platform/PlatformViewsController;->platformViews:Landroid/util/SparseArray;

    invoke-virtual {v0}, Landroid/util/SparseArray;->size()I

    move-result v0

    if-lez v0, :cond_0

    .line 1070
    iget-object v0, p0, Lio/flutter/plugin/platform/PlatformViewsController;->platformViews:Landroid/util/SparseArray;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/util/SparseArray;->keyAt(I)I

    move-result v0

    .line 1072
    .local v0, "viewId":I
    iget-object v1, p0, Lio/flutter/plugin/platform/PlatformViewsController;->channelHandler:Lio/flutter/embedding/engine/systemchannels/PlatformViewsChannel$PlatformViewsHandler;

    invoke-interface {v1, v0}, Lio/flutter/embedding/engine/systemchannels/PlatformViewsChannel$PlatformViewsHandler;->dispose(I)V

    .line 1073
    .end local v0    # "viewId":I
    goto :goto_0

    .line 1074
    :cond_0
    return-void
.end method

.method private enforceMinimumAndroidApiVersion(I)V
    .locals 3
    .param p1, "minSdkVersion"    # I

    .line 481
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v0, p1, :cond_0

    .line 488
    return-void

    .line 482
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Trying to use platform views with API "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", required API level is: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private ensureValidRequest(Lio/flutter/embedding/engine/systemchannels/PlatformViewsChannel$PlatformViewCreationRequest;)V
    .locals 3
    .param p1, "request"    # Lio/flutter/embedding/engine/systemchannels/PlatformViewsChannel$PlatformViewCreationRequest;

    .line 492
    iget v0, p1, Lio/flutter/embedding/engine/systemchannels/PlatformViewsChannel$PlatformViewCreationRequest;->direction:I

    invoke-static {v0}, Lio/flutter/plugin/platform/PlatformViewsController;->validateDirection(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 500
    return-void

    .line 493
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Trying to create a view with unknown direction value: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p1, Lio/flutter/embedding/engine/systemchannels/PlatformViewsChannel$PlatformViewCreationRequest;->direction:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "(view id: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p1, Lio/flutter/embedding/engine/systemchannels/PlatformViewsChannel$PlatformViewCreationRequest;->viewId:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private finishFrame(Z)V
    .locals 6
    .param p1, "isFrameRenderedUsingImageReaders"    # Z

    .line 1280
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lio/flutter/plugin/platform/PlatformViewsController;->overlayLayerViews:Landroid/util/SparseArray;

    invoke-virtual {v1}, Landroid/util/SparseArray;->size()I

    move-result v1

    const/16 v2, 0x8

    if-ge v0, v1, :cond_2

    .line 1281
    iget-object v1, p0, Lio/flutter/plugin/platform/PlatformViewsController;->overlayLayerViews:Landroid/util/SparseArray;

    invoke-virtual {v1, v0}, Landroid/util/SparseArray;->keyAt(I)I

    move-result v1

    .line 1282
    .local v1, "overlayId":I
    iget-object v3, p0, Lio/flutter/plugin/platform/PlatformViewsController;->overlayLayerViews:Landroid/util/SparseArray;

    invoke-virtual {v3, v0}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lio/flutter/plugin/platform/PlatformOverlayView;

    .line 1284
    .local v3, "overlayView":Lio/flutter/plugin/platform/PlatformOverlayView;
    iget-object v4, p0, Lio/flutter/plugin/platform/PlatformViewsController;->currentFrameUsedOverlayLayerIds:Ljava/util/HashSet;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 1285
    iget-object v2, p0, Lio/flutter/plugin/platform/PlatformViewsController;->flutterView:Lio/flutter/embedding/android/FlutterView;

    invoke-virtual {v2, v3}, Lio/flutter/embedding/android/FlutterView;->attachOverlaySurfaceToRender(Lio/flutter/embedding/android/FlutterImageView;)V

    .line 1286
    invoke-virtual {v3}, Lio/flutter/plugin/platform/PlatformOverlayView;->acquireLatestImage()Z

    move-result v2

    .line 1287
    .local v2, "didAcquireOverlaySurfaceImage":Z
    and-int/2addr p1, v2

    .line 1288
    .end local v2    # "didAcquireOverlaySurfaceImage":Z
    goto :goto_1

    .line 1292
    :cond_0
    iget-boolean v4, p0, Lio/flutter/plugin/platform/PlatformViewsController;->flutterViewConvertedToImageView:Z

    if-nez v4, :cond_1

    .line 1293
    invoke-virtual {v3}, Lio/flutter/plugin/platform/PlatformOverlayView;->detachFromRenderer()V

    .line 1296
    :cond_1
    invoke-virtual {v3, v2}, Lio/flutter/plugin/platform/PlatformOverlayView;->setVisibility(I)V

    .line 1297
    iget-object v2, p0, Lio/flutter/plugin/platform/PlatformViewsController;->flutterView:Lio/flutter/embedding/android/FlutterView;

    invoke-virtual {v2, v3}, Lio/flutter/embedding/android/FlutterView;->removeView(Landroid/view/View;)V

    .line 1280
    .end local v1    # "overlayId":I
    .end local v3    # "overlayView":Lio/flutter/plugin/platform/PlatformOverlayView;
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1301
    .end local v0    # "i":I
    :cond_2
    const/4 v0, 0x0

    .restart local v0    # "i":I
    :goto_2
    iget-object v1, p0, Lio/flutter/plugin/platform/PlatformViewsController;->platformViewParent:Landroid/util/SparseArray;

    invoke-virtual {v1}, Landroid/util/SparseArray;->size()I

    move-result v1

    if-ge v0, v1, :cond_5

    .line 1302
    iget-object v1, p0, Lio/flutter/plugin/platform/PlatformViewsController;->platformViewParent:Landroid/util/SparseArray;

    invoke-virtual {v1, v0}, Landroid/util/SparseArray;->keyAt(I)I

    move-result v1

    .line 1303
    .local v1, "viewId":I
    iget-object v3, p0, Lio/flutter/plugin/platform/PlatformViewsController;->platformViewParent:Landroid/util/SparseArray;

    invoke-virtual {v3, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/view/View;

    .line 1314
    .local v3, "parentView":Landroid/view/View;
    iget-object v4, p0, Lio/flutter/plugin/platform/PlatformViewsController;->currentFrameUsedPlatformViewIds:Ljava/util/HashSet;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4

    if-nez p1, :cond_3

    iget-boolean v4, p0, Lio/flutter/plugin/platform/PlatformViewsController;->synchronizeToNativeViewHierarchy:Z

    if-nez v4, :cond_4

    .line 1316
    :cond_3
    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Landroid/view/View;->setVisibility(I)V

    goto :goto_3

    .line 1318
    :cond_4
    invoke-virtual {v3, v2}, Landroid/view/View;->setVisibility(I)V

    .line 1301
    .end local v1    # "viewId":I
    .end local v3    # "parentView":Landroid/view/View;
    :goto_3
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 1321
    .end local v0    # "i":I
    :cond_5
    return-void
.end method

.method private getDisplayDensity()F
    .locals 1

    .line 1053
    iget-object v0, p0, Lio/flutter/plugin/platform/PlatformViewsController;->context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    return v0
.end method

.method private initializeRootImageViewIfNeeded()V
    .locals 1

    .line 1105
    iget-boolean v0, p0, Lio/flutter/plugin/platform/PlatformViewsController;->synchronizeToNativeViewHierarchy:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lio/flutter/plugin/platform/PlatformViewsController;->flutterViewConvertedToImageView:Z

    if-nez v0, :cond_0

    .line 1106
    iget-object v0, p0, Lio/flutter/plugin/platform/PlatformViewsController;->flutterView:Lio/flutter/embedding/android/FlutterView;

    invoke-virtual {v0}, Lio/flutter/embedding/android/FlutterView;->convertToImageView()V

    .line 1107
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/flutter/plugin/platform/PlatformViewsController;->flutterViewConvertedToImageView:Z

    .line 1109
    :cond_0
    return-void
.end method

.method private lockInputConnection(Lio/flutter/plugin/platform/VirtualDisplayController;)V
    .locals 1
    .param p1, "controller"    # Lio/flutter/plugin/platform/VirtualDisplayController;

    .line 971
    iget-object v0, p0, Lio/flutter/plugin/platform/PlatformViewsController;->textInputPlugin:Lio/flutter/plugin/editing/TextInputPlugin;

    if-nez v0, :cond_0

    .line 972
    return-void

    .line 974
    :cond_0
    invoke-virtual {v0}, Lio/flutter/plugin/editing/TextInputPlugin;->lockPlatformViewInputConnection()V

    .line 975
    invoke-virtual {p1}, Lio/flutter/plugin/platform/VirtualDisplayController;->onInputConnectionLocked()V

    .line 976
    return-void
.end method

.method private static makePlatformViewRenderTarget(Lio/flutter/view/TextureRegistry;)Lio/flutter/plugin/platform/PlatformViewRenderTarget;
    .locals 3
    .param p0, "textureRegistry"    # Lio/flutter/view/TextureRegistry;

    .line 988
    sget-boolean v0, Lio/flutter/plugin/platform/PlatformViewsController;->enableSurfaceProducerRenderTarget:Z

    const/16 v1, 0x1d

    const-string v2, "PlatformViewsController"

    if-eqz v0, :cond_0

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v0, v1, :cond_0

    .line 989
    invoke-interface {p0}, Lio/flutter/view/TextureRegistry;->createSurfaceProducer()Lio/flutter/view/TextureRegistry$SurfaceProducer;

    move-result-object v0

    .line 990
    .local v0, "textureEntry":Lio/flutter/view/TextureRegistry$SurfaceProducer;
    const-string v1, "PlatformView is using SurfaceProducer backend"

    invoke-static {v2, v1}, Lio/flutter/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 991
    new-instance v1, Lio/flutter/plugin/platform/SurfaceProducerPlatformViewRenderTarget;

    invoke-direct {v1, v0}, Lio/flutter/plugin/platform/SurfaceProducerPlatformViewRenderTarget;-><init>(Lio/flutter/view/TextureRegistry$SurfaceProducer;)V

    return-object v1

    .line 993
    .end local v0    # "textureEntry":Lio/flutter/view/TextureRegistry$SurfaceProducer;
    :cond_0
    sget-boolean v0, Lio/flutter/plugin/platform/PlatformViewsController;->enableImageRenderTarget:Z

    if-eqz v0, :cond_1

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v0, v1, :cond_1

    .line 994
    invoke-interface {p0}, Lio/flutter/view/TextureRegistry;->createImageTexture()Lio/flutter/view/TextureRegistry$ImageTextureEntry;

    move-result-object v0

    .line 995
    .local v0, "textureEntry":Lio/flutter/view/TextureRegistry$ImageTextureEntry;
    const-string v1, "PlatformView is using ImageReader backend"

    invoke-static {v2, v1}, Lio/flutter/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 996
    new-instance v1, Lio/flutter/plugin/platform/ImageReaderPlatformViewRenderTarget;

    invoke-direct {v1, v0}, Lio/flutter/plugin/platform/ImageReaderPlatformViewRenderTarget;-><init>(Lio/flutter/view/TextureRegistry$ImageTextureEntry;)V

    return-object v1

    .line 998
    .end local v0    # "textureEntry":Lio/flutter/view/TextureRegistry$ImageTextureEntry;
    :cond_1
    invoke-interface {p0}, Lio/flutter/view/TextureRegistry;->createSurfaceTexture()Lio/flutter/view/TextureRegistry$SurfaceTextureEntry;

    move-result-object v0

    .line 999
    .local v0, "textureEntry":Lio/flutter/view/TextureRegistry$SurfaceTextureEntry;
    const-string v1, "PlatformView is using SurfaceTexture backend"

    invoke-static {v2, v1}, Lio/flutter/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 1000
    new-instance v1, Lio/flutter/plugin/platform/SurfaceTexturePlatformViewRenderTarget;

    invoke-direct {v1, v0}, Lio/flutter/plugin/platform/SurfaceTexturePlatformViewRenderTarget;-><init>(Lio/flutter/view/TextureRegistry$SurfaceTextureEntry;)V

    return-object v1
.end method

.method private maybeInvokeOnFlutterViewAttached(Lio/flutter/plugin/platform/PlatformView;)V
    .locals 2
    .param p1, "view"    # Lio/flutter/plugin/platform/PlatformView;

    .line 867
    iget-object v0, p0, Lio/flutter/plugin/platform/PlatformViewsController;->flutterView:Lio/flutter/embedding/android/FlutterView;

    if-nez v0, :cond_0

    .line 868
    const-string v0, "PlatformViewsController"

    const-string v1, "null flutterView"

    invoke-static {v0, v1}, Lio/flutter/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 870
    return-void

    .line 872
    :cond_0
    invoke-interface {p1, v0}, Lio/flutter/plugin/platform/PlatformView;->onFlutterViewAttached(Landroid/view/View;)V

    .line 873
    return-void
.end method

.method private static parsePointerCoords(Ljava/lang/Object;F)Landroid/view/MotionEvent$PointerCoords;
    .locals 6
    .param p0, "rawCoords"    # Ljava/lang/Object;
    .param p1, "density"    # F

    .line 1038
    move-object v0, p0

    check-cast v0, Ljava/util/List;

    .line 1039
    .local v0, "coordsList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    new-instance v1, Landroid/view/MotionEvent$PointerCoords;

    invoke-direct {v1}, Landroid/view/MotionEvent$PointerCoords;-><init>()V

    .line 1040
    .local v1, "coords":Landroid/view/MotionEvent$PointerCoords;
    const/4 v2, 0x0

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Double;

    invoke-virtual {v2}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v2

    double-to-float v2, v2

    iput v2, v1, Landroid/view/MotionEvent$PointerCoords;->orientation:F

    .line 1041
    const/4 v2, 0x1

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Double;

    invoke-virtual {v2}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v2

    double-to-float v2, v2

    iput v2, v1, Landroid/view/MotionEvent$PointerCoords;->pressure:F

    .line 1042
    const/4 v2, 0x2

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Double;

    invoke-virtual {v2}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v2

    double-to-float v2, v2

    iput v2, v1, Landroid/view/MotionEvent$PointerCoords;->size:F

    .line 1043
    const/4 v2, 0x3

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Double;

    invoke-virtual {v2}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v2

    float-to-double v4, p1

    mul-double v2, v2, v4

    double-to-float v2, v2

    iput v2, v1, Landroid/view/MotionEvent$PointerCoords;->toolMajor:F

    .line 1044
    const/4 v2, 0x4

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Double;

    invoke-virtual {v2}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v2

    float-to-double v4, p1

    mul-double v2, v2, v4

    double-to-float v2, v2

    iput v2, v1, Landroid/view/MotionEvent$PointerCoords;->toolMinor:F

    .line 1045
    const/4 v2, 0x5

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Double;

    invoke-virtual {v2}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v2

    float-to-double v4, p1

    mul-double v2, v2, v4

    double-to-float v2, v2

    iput v2, v1, Landroid/view/MotionEvent$PointerCoords;->touchMajor:F

    .line 1046
    const/4 v2, 0x6

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Double;

    invoke-virtual {v2}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v2

    float-to-double v4, p1

    mul-double v2, v2, v4

    double-to-float v2, v2

    iput v2, v1, Landroid/view/MotionEvent$PointerCoords;->touchMinor:F

    .line 1047
    const/4 v2, 0x7

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Double;

    invoke-virtual {v2}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v2

    float-to-double v4, p1

    mul-double v2, v2, v4

    double-to-float v2, v2

    iput v2, v1, Landroid/view/MotionEvent$PointerCoords;->x:F

    .line 1048
    const/16 v2, 0x8

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Double;

    invoke-virtual {v2}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v2

    float-to-double v4, p1

    mul-double v2, v2, v4

    double-to-float v2, v2

    iput v2, v1, Landroid/view/MotionEvent$PointerCoords;->y:F

    .line 1049
    return-object v1
.end method

.method private static parsePointerCoordsList(Ljava/lang/Object;F)Ljava/util/List;
    .locals 5
    .param p0, "rawCoordsList"    # Ljava/lang/Object;
    .param p1, "density"    # F
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "F)",
            "Ljava/util/List<",
            "Landroid/view/MotionEvent$PointerCoords;",
            ">;"
        }
    .end annotation

    .line 1028
    move-object v0, p0

    check-cast v0, Ljava/util/List;

    .line 1029
    .local v0, "rawCoords":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 1030
    .local v1, "pointerCoords":Ljava/util/List;, "Ljava/util/List<Landroid/view/MotionEvent$PointerCoords;>;"
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    .line 1031
    .local v3, "o":Ljava/lang/Object;
    invoke-static {v3, p1}, Lio/flutter/plugin/platform/PlatformViewsController;->parsePointerCoords(Ljava/lang/Object;F)Landroid/view/MotionEvent$PointerCoords;

    move-result-object v4

    invoke-interface {v1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1032
    .end local v3    # "o":Ljava/lang/Object;
    goto :goto_0

    .line 1033
    :cond_0
    return-object v1
.end method

.method private static parsePointerProperties(Ljava/lang/Object;)Landroid/view/MotionEvent$PointerProperties;
    .locals 3
    .param p0, "rawProperties"    # Ljava/lang/Object;

    .line 1019
    move-object v0, p0

    check-cast v0, Ljava/util/List;

    .line 1020
    .local v0, "propertiesList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    new-instance v1, Landroid/view/MotionEvent$PointerProperties;

    invoke-direct {v1}, Landroid/view/MotionEvent$PointerProperties;-><init>()V

    .line 1021
    .local v1, "properties":Landroid/view/MotionEvent$PointerProperties;
    const/4 v2, 0x0

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    iput v2, v1, Landroid/view/MotionEvent$PointerProperties;->id:I

    .line 1022
    const/4 v2, 0x1

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    iput v2, v1, Landroid/view/MotionEvent$PointerProperties;->toolType:I

    .line 1023
    return-object v1
.end method

.method private static parsePointerPropertiesList(Ljava/lang/Object;)Ljava/util/List;
    .locals 5
    .param p0, "rawPropertiesList"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")",
            "Ljava/util/List<",
            "Landroid/view/MotionEvent$PointerProperties;",
            ">;"
        }
    .end annotation

    .line 1009
    move-object v0, p0

    check-cast v0, Ljava/util/List;

    .line 1010
    .local v0, "rawProperties":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 1011
    .local v1, "pointerProperties":Ljava/util/List;, "Ljava/util/List<Landroid/view/MotionEvent$PointerProperties;>;"
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    .line 1012
    .local v3, "o":Ljava/lang/Object;
    invoke-static {v3}, Lio/flutter/plugin/platform/PlatformViewsController;->parsePointerProperties(Ljava/lang/Object;)Landroid/view/MotionEvent$PointerProperties;

    move-result-object v4

    invoke-interface {v1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1013
    .end local v3    # "o":Ljava/lang/Object;
    goto :goto_0

    .line 1014
    :cond_0
    return-object v1
.end method

.method private removeOverlaySurfaces()V
    .locals 3

    .line 1379
    iget-object v0, p0, Lio/flutter/plugin/platform/PlatformViewsController;->flutterView:Lio/flutter/embedding/android/FlutterView;

    if-nez v0, :cond_0

    .line 1380
    const-string v0, "PlatformViewsController"

    const-string v1, "removeOverlaySurfaces called while flutter view is null"

    invoke-static {v0, v1}, Lio/flutter/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 1381
    return-void

    .line 1383
    :cond_0
    const/4 v0, 0x0

    .local v0, "viewId":I
    :goto_0
    iget-object v1, p0, Lio/flutter/plugin/platform/PlatformViewsController;->overlayLayerViews:Landroid/util/SparseArray;

    invoke-virtual {v1}, Landroid/util/SparseArray;->size()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 1384
    iget-object v1, p0, Lio/flutter/plugin/platform/PlatformViewsController;->flutterView:Lio/flutter/embedding/android/FlutterView;

    iget-object v2, p0, Lio/flutter/plugin/platform/PlatformViewsController;->overlayLayerViews:Landroid/util/SparseArray;

    invoke-virtual {v2, v0}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/View;

    invoke-virtual {v1, v2}, Lio/flutter/embedding/android/FlutterView;->removeView(Landroid/view/View;)V

    .line 1383
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1386
    .end local v0    # "viewId":I
    :cond_1
    iget-object v0, p0, Lio/flutter/plugin/platform/PlatformViewsController;->overlayLayerViews:Landroid/util/SparseArray;

    invoke-virtual {v0}, Landroid/util/SparseArray;->clear()V

    .line 1387
    return-void
.end method

.method private toLogicalPixels(D)I
    .locals 1
    .param p1, "physicalPixels"    # D

    .line 1065
    invoke-direct {p0}, Lio/flutter/plugin/platform/PlatformViewsController;->getDisplayDensity()F

    move-result v0

    invoke-direct {p0, p1, p2, v0}, Lio/flutter/plugin/platform/PlatformViewsController;->toLogicalPixels(DF)I

    move-result v0

    return v0
.end method

.method private toLogicalPixels(DF)I
    .locals 2
    .param p1, "physicalPixels"    # D
    .param p3, "displayDensity"    # F

    .line 1061
    float-to-double v0, p3

    div-double v0, p1, v0

    invoke-static {v0, v1}, Ljava/lang/Math;->round(D)J

    move-result-wide v0

    long-to-int v1, v0

    return v1
.end method

.method private toPhysicalPixels(D)I
    .locals 2
    .param p1, "logicalPixels"    # D

    .line 1057
    invoke-direct {p0}, Lio/flutter/plugin/platform/PlatformViewsController;->getDisplayDensity()F

    move-result v0

    float-to-double v0, v0

    mul-double v0, v0, p1

    invoke-static {v0, v1}, Ljava/lang/Math;->round(D)J

    move-result-wide v0

    long-to-int v1, v0

    return v1
.end method

.method private static translateMotionEvent(Landroid/view/MotionEvent;[Landroid/view/MotionEvent$PointerCoords;)V
    .locals 3
    .param p0, "originalEvent"    # Landroid/view/MotionEvent;
    .param p1, "pointerCoords"    # [Landroid/view/MotionEvent$PointerCoords;

    .line 678
    array-length v0, p1

    const/4 v1, 0x1

    if-ge v0, v1, :cond_0

    .line 679
    return-void

    .line 682
    :cond_0
    const/4 v0, 0x0

    aget-object v1, p1, v0

    iget v1, v1, Landroid/view/MotionEvent$PointerCoords;->x:F

    invoke-virtual {p0}, Landroid/view/MotionEvent;->getX()F

    move-result v2

    sub-float/2addr v1, v2

    .line 683
    .local v1, "xOffset":F
    aget-object v0, p1, v0

    iget v0, v0, Landroid/view/MotionEvent$PointerCoords;->y:F

    invoke-virtual {p0}, Landroid/view/MotionEvent;->getY()F

    move-result v2

    sub-float/2addr v0, v2

    .line 685
    .local v0, "yOffset":F
    invoke-virtual {p0, v1, v0}, Landroid/view/MotionEvent;->offsetLocation(FF)V

    .line 686
    return-void
.end method

.method private unlockInputConnection(Lio/flutter/plugin/platform/VirtualDisplayController;)V
    .locals 1
    .param p1, "controller"    # Lio/flutter/plugin/platform/VirtualDisplayController;

    .line 979
    iget-object v0, p0, Lio/flutter/plugin/platform/PlatformViewsController;->textInputPlugin:Lio/flutter/plugin/editing/TextInputPlugin;

    if-nez v0, :cond_0

    .line 980
    return-void

    .line 982
    :cond_0
    invoke-virtual {v0}, Lio/flutter/plugin/editing/TextInputPlugin;->unlockPlatformViewInputConnection()V

    .line 983
    invoke-virtual {p1}, Lio/flutter/plugin/platform/VirtualDisplayController;->onInputConnectionUnlocked()V

    .line 984
    return-void
.end method

.method private static validateDirection(I)Z
    .locals 1
    .param p0, "direction"    # I

    .line 1004
    const/4 v0, 0x1

    if-eqz p0, :cond_1

    if-ne p0, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :cond_1
    :goto_0
    return v0
.end method


# virtual methods
.method public attach(Landroid/content/Context;Lio/flutter/view/TextureRegistry;Lio/flutter/embedding/engine/dart/DartExecutor;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "textureRegistry"    # Lio/flutter/view/TextureRegistry;
    .param p3, "dartExecutor"    # Lio/flutter/embedding/engine/dart/DartExecutor;

    .line 764
    iget-object v0, p0, Lio/flutter/plugin/platform/PlatformViewsController;->context:Landroid/content/Context;

    if-nez v0, :cond_0

    .line 769
    iput-object p1, p0, Lio/flutter/plugin/platform/PlatformViewsController;->context:Landroid/content/Context;

    .line 770
    iput-object p2, p0, Lio/flutter/plugin/platform/PlatformViewsController;->textureRegistry:Lio/flutter/view/TextureRegistry;

    .line 771
    new-instance v0, Lio/flutter/embedding/engine/systemchannels/PlatformViewsChannel;

    invoke-direct {v0, p3}, Lio/flutter/embedding/engine/systemchannels/PlatformViewsChannel;-><init>(Lio/flutter/embedding/engine/dart/DartExecutor;)V

    iput-object v0, p0, Lio/flutter/plugin/platform/PlatformViewsController;->platformViewsChannel:Lio/flutter/embedding/engine/systemchannels/PlatformViewsChannel;

    .line 772
    iget-object v1, p0, Lio/flutter/plugin/platform/PlatformViewsController;->channelHandler:Lio/flutter/embedding/engine/systemchannels/PlatformViewsChannel$PlatformViewsHandler;

    invoke-virtual {v0, v1}, Lio/flutter/embedding/engine/systemchannels/PlatformViewsChannel;->setPlatformViewsHandler(Lio/flutter/embedding/engine/systemchannels/PlatformViewsChannel$PlatformViewsHandler;)V

    .line 773
    return-void

    .line 765
    :cond_0
    new-instance v0, Ljava/lang/AssertionError;

    const-string v1, "A PlatformViewsController can only be attached to a single output target.\nattach was called while the PlatformViewsController was already attached."

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0
.end method

.method public attachAccessibilityBridge(Lio/flutter/view/AccessibilityBridge;)V
    .locals 1
    .param p1, "accessibilityBridge"    # Lio/flutter/view/AccessibilityBridge;

    .line 877
    iget-object v0, p0, Lio/flutter/plugin/platform/PlatformViewsController;->accessibilityEventsDelegate:Lio/flutter/plugin/platform/AccessibilityEventsDelegate;

    invoke-virtual {v0, p1}, Lio/flutter/plugin/platform/AccessibilityEventsDelegate;->setAccessibilityBridge(Lio/flutter/view/AccessibilityBridge;)V

    .line 878
    return-void
.end method

.method public attachTextInputPlugin(Lio/flutter/plugin/editing/TextInputPlugin;)V
    .locals 0
    .param p1, "textInputPlugin"    # Lio/flutter/plugin/editing/TextInputPlugin;

    .line 895
    iput-object p1, p0, Lio/flutter/plugin/platform/PlatformViewsController;->textInputPlugin:Lio/flutter/plugin/editing/TextInputPlugin;

    .line 896
    return-void
.end method

.method public attachToFlutterRenderer(Lio/flutter/embedding/engine/renderer/FlutterRenderer;)V
    .locals 2
    .param p1, "flutterRenderer"    # Lio/flutter/embedding/engine/renderer/FlutterRenderer;

    .line 1166
    new-instance v0, Lio/flutter/embedding/android/AndroidTouchProcessor;

    const/4 v1, 0x1

    invoke-direct {v0, p1, v1}, Lio/flutter/embedding/android/AndroidTouchProcessor;-><init>(Lio/flutter/embedding/engine/renderer/FlutterRenderer;Z)V

    iput-object v0, p0, Lio/flutter/plugin/platform/PlatformViewsController;->androidTouchProcessor:Lio/flutter/embedding/android/AndroidTouchProcessor;

    .line 1167
    return-void
.end method

.method public attachToView(Lio/flutter/embedding/android/FlutterView;)V
    .locals 3
    .param p1, "newFlutterView"    # Lio/flutter/embedding/android/FlutterView;

    .line 817
    iput-object p1, p0, Lio/flutter/plugin/platform/PlatformViewsController;->flutterView:Lio/flutter/embedding/android/FlutterView;

    .line 819
    const/4 v0, 0x0

    .local v0, "index":I
    :goto_0
    iget-object v1, p0, Lio/flutter/plugin/platform/PlatformViewsController;->viewWrappers:Landroid/util/SparseArray;

    invoke-virtual {v1}, Landroid/util/SparseArray;->size()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 820
    iget-object v1, p0, Lio/flutter/plugin/platform/PlatformViewsController;->viewWrappers:Landroid/util/SparseArray;

    invoke-virtual {v1, v0}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/flutter/plugin/platform/PlatformViewWrapper;

    .line 821
    .local v1, "view":Lio/flutter/plugin/platform/PlatformViewWrapper;
    iget-object v2, p0, Lio/flutter/plugin/platform/PlatformViewsController;->flutterView:Lio/flutter/embedding/android/FlutterView;

    invoke-virtual {v2, v1}, Lio/flutter/embedding/android/FlutterView;->addView(Landroid/view/View;)V

    .line 819
    .end local v1    # "view":Lio/flutter/plugin/platform/PlatformViewWrapper;
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 824
    .end local v0    # "index":I
    :cond_0
    const/4 v0, 0x0

    .restart local v0    # "index":I
    :goto_1
    iget-object v1, p0, Lio/flutter/plugin/platform/PlatformViewsController;->platformViewParent:Landroid/util/SparseArray;

    invoke-virtual {v1}, Landroid/util/SparseArray;->size()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 825
    iget-object v1, p0, Lio/flutter/plugin/platform/PlatformViewsController;->platformViewParent:Landroid/util/SparseArray;

    invoke-virtual {v1, v0}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/flutter/embedding/engine/mutatorsstack/FlutterMutatorView;

    .line 826
    .local v1, "view":Lio/flutter/embedding/engine/mutatorsstack/FlutterMutatorView;
    iget-object v2, p0, Lio/flutter/plugin/platform/PlatformViewsController;->flutterView:Lio/flutter/embedding/android/FlutterView;

    invoke-virtual {v2, v1}, Lio/flutter/embedding/android/FlutterView;->addView(Landroid/view/View;)V

    .line 824
    .end local v1    # "view":Lio/flutter/embedding/engine/mutatorsstack/FlutterMutatorView;
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 829
    .end local v0    # "index":I
    :cond_1
    const/4 v0, 0x0

    .restart local v0    # "index":I
    :goto_2
    iget-object v1, p0, Lio/flutter/plugin/platform/PlatformViewsController;->platformViews:Landroid/util/SparseArray;

    invoke-virtual {v1}, Landroid/util/SparseArray;->size()I

    move-result v1

    if-ge v0, v1, :cond_2

    .line 830
    iget-object v1, p0, Lio/flutter/plugin/platform/PlatformViewsController;->platformViews:Landroid/util/SparseArray;

    invoke-virtual {v1, v0}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/flutter/plugin/platform/PlatformView;

    .line 831
    .local v1, "view":Lio/flutter/plugin/platform/PlatformView;
    iget-object v2, p0, Lio/flutter/plugin/platform/PlatformViewsController;->flutterView:Lio/flutter/embedding/android/FlutterView;

    invoke-interface {v1, v2}, Lio/flutter/plugin/platform/PlatformView;->onFlutterViewAttached(Landroid/view/View;)V

    .line 829
    .end local v1    # "view":Lio/flutter/plugin/platform/PlatformView;
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 833
    .end local v0    # "index":I
    :cond_2
    return-void
.end method

.method public checkInputConnectionProxy(Landroid/view/View;)Z
    .locals 3
    .param p1, "view"    # Landroid/view/View;

    .line 913
    const/4 v0, 0x0

    if-nez p1, :cond_0

    .line 914
    return v0

    .line 916
    :cond_0
    iget-object v1, p0, Lio/flutter/plugin/platform/PlatformViewsController;->contextToEmbeddedView:Ljava/util/HashMap;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 917
    return v0

    .line 919
    :cond_1
    iget-object v0, p0, Lio/flutter/plugin/platform/PlatformViewsController;->contextToEmbeddedView:Ljava/util/HashMap;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    .line 920
    .local v0, "platformView":Landroid/view/View;
    if-ne v0, p1, :cond_2

    .line 921
    const/4 v1, 0x1

    return v1

    .line 923
    :cond_2
    invoke-virtual {v0, p1}, Landroid/view/View;->checkInputConnectionProxy(Landroid/view/View;)Z

    move-result v1

    return v1
.end method

.method public configureForTextureLayerComposition(Lio/flutter/plugin/platform/PlatformView;Lio/flutter/embedding/engine/systemchannels/PlatformViewsChannel$PlatformViewCreationRequest;)J
    .locals 11
    .param p1, "platformView"    # Lio/flutter/plugin/platform/PlatformView;
    .param p2, "request"    # Lio/flutter/embedding/engine/systemchannels/PlatformViewsChannel$PlatformViewCreationRequest;

    .line 606
    const/16 v0, 0x17

    invoke-direct {p0, v0}, Lio/flutter/plugin/platform/PlatformViewsController;->enforceMinimumAndroidApiVersion(I)V

    .line 607
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Hosting view in view hierarchy for platform view: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p2, Lio/flutter/embedding/engine/systemchannels/PlatformViewsChannel$PlatformViewCreationRequest;->viewId:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "PlatformViewsController"

    invoke-static {v1, v0}, Lio/flutter/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 609
    iget-wide v0, p2, Lio/flutter/embedding/engine/systemchannels/PlatformViewsChannel$PlatformViewCreationRequest;->logicalWidth:D

    invoke-direct {p0, v0, v1}, Lio/flutter/plugin/platform/PlatformViewsController;->toPhysicalPixels(D)I

    move-result v0

    .line 610
    .local v0, "physicalWidth":I
    iget-wide v1, p2, Lio/flutter/embedding/engine/systemchannels/PlatformViewsChannel$PlatformViewCreationRequest;->logicalHeight:D

    invoke-direct {p0, v1, v2}, Lio/flutter/plugin/platform/PlatformViewsController;->toPhysicalPixels(D)I

    move-result v1

    .line 613
    .local v1, "physicalHeight":I
    iget-boolean v2, p0, Lio/flutter/plugin/platform/PlatformViewsController;->usesSoftwareRendering:Z

    if-eqz v2, :cond_0

    .line 614
    new-instance v2, Lio/flutter/plugin/platform/PlatformViewWrapper;

    iget-object v3, p0, Lio/flutter/plugin/platform/PlatformViewsController;->context:Landroid/content/Context;

    invoke-direct {v2, v3}, Lio/flutter/plugin/platform/PlatformViewWrapper;-><init>(Landroid/content/Context;)V

    .line 615
    .local v2, "viewWrapper":Lio/flutter/plugin/platform/PlatformViewWrapper;
    const-wide/16 v3, -0x1

    .local v3, "textureId":J
    goto :goto_0

    .line 617
    .end local v2    # "viewWrapper":Lio/flutter/plugin/platform/PlatformViewWrapper;
    .end local v3    # "textureId":J
    :cond_0
    iget-object v2, p0, Lio/flutter/plugin/platform/PlatformViewsController;->textureRegistry:Lio/flutter/view/TextureRegistry;

    invoke-static {v2}, Lio/flutter/plugin/platform/PlatformViewsController;->makePlatformViewRenderTarget(Lio/flutter/view/TextureRegistry;)Lio/flutter/plugin/platform/PlatformViewRenderTarget;

    move-result-object v2

    .line 618
    .local v2, "renderTarget":Lio/flutter/plugin/platform/PlatformViewRenderTarget;
    new-instance v3, Lio/flutter/plugin/platform/PlatformViewWrapper;

    iget-object v4, p0, Lio/flutter/plugin/platform/PlatformViewsController;->context:Landroid/content/Context;

    invoke-direct {v3, v4, v2}, Lio/flutter/plugin/platform/PlatformViewWrapper;-><init>(Landroid/content/Context;Lio/flutter/plugin/platform/PlatformViewRenderTarget;)V

    .line 619
    .local v3, "viewWrapper":Lio/flutter/plugin/platform/PlatformViewWrapper;
    invoke-interface {v2}, Lio/flutter/plugin/platform/PlatformViewRenderTarget;->getId()J

    move-result-wide v4

    move-object v2, v3

    move-wide v3, v4

    .line 621
    .local v2, "viewWrapper":Lio/flutter/plugin/platform/PlatformViewWrapper;
    .local v3, "textureId":J
    :goto_0
    iget-object v5, p0, Lio/flutter/plugin/platform/PlatformViewsController;->androidTouchProcessor:Lio/flutter/embedding/android/AndroidTouchProcessor;

    invoke-virtual {v2, v5}, Lio/flutter/plugin/platform/PlatformViewWrapper;->setTouchProcessor(Lio/flutter/embedding/android/AndroidTouchProcessor;)V

    .line 622
    invoke-virtual {v2, v0, v1}, Lio/flutter/plugin/platform/PlatformViewWrapper;->resizeRenderTarget(II)V

    .line 624
    new-instance v5, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v5, v0, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 628
    .local v5, "viewWrapperLayoutParams":Landroid/widget/FrameLayout$LayoutParams;
    iget-wide v6, p2, Lio/flutter/embedding/engine/systemchannels/PlatformViewsChannel$PlatformViewCreationRequest;->logicalTop:D

    invoke-direct {p0, v6, v7}, Lio/flutter/plugin/platform/PlatformViewsController;->toPhysicalPixels(D)I

    move-result v6

    .line 629
    .local v6, "physicalTop":I
    iget-wide v7, p2, Lio/flutter/embedding/engine/systemchannels/PlatformViewsChannel$PlatformViewCreationRequest;->logicalLeft:D

    invoke-direct {p0, v7, v8}, Lio/flutter/plugin/platform/PlatformViewsController;->toPhysicalPixels(D)I

    move-result v7

    .line 630
    .local v7, "physicalLeft":I
    iput v6, v5, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 631
    iput v7, v5, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 632
    invoke-virtual {v2, v5}, Lio/flutter/plugin/platform/PlatformViewWrapper;->setLayoutParams(Landroid/widget/FrameLayout$LayoutParams;)V

    .line 635
    invoke-interface {p1}, Lio/flutter/plugin/platform/PlatformView;->getView()Landroid/view/View;

    move-result-object v8

    .line 636
    .local v8, "embeddedView":Landroid/view/View;
    new-instance v9, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v9, v0, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v8, v9}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 645
    const/4 v9, 0x4

    invoke-virtual {v8, v9}, Landroid/view/View;->setImportantForAccessibility(I)V

    .line 648
    invoke-virtual {v2, v8}, Lio/flutter/plugin/platform/PlatformViewWrapper;->addView(Landroid/view/View;)V

    .line 652
    new-instance v9, Lio/flutter/plugin/platform/PlatformViewsController$$ExternalSyntheticLambda0;

    invoke-direct {v9, p0, p2}, Lio/flutter/plugin/platform/PlatformViewsController$$ExternalSyntheticLambda0;-><init>(Lio/flutter/plugin/platform/PlatformViewsController;Lio/flutter/embedding/engine/systemchannels/PlatformViewsChannel$PlatformViewCreationRequest;)V

    invoke-virtual {v2, v9}, Lio/flutter/plugin/platform/PlatformViewWrapper;->setOnDescendantFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    .line 661
    iget-object v9, p0, Lio/flutter/plugin/platform/PlatformViewsController;->flutterView:Lio/flutter/embedding/android/FlutterView;

    invoke-virtual {v9, v2}, Lio/flutter/embedding/android/FlutterView;->addView(Landroid/view/View;)V

    .line 662
    iget-object v9, p0, Lio/flutter/plugin/platform/PlatformViewsController;->viewWrappers:Landroid/util/SparseArray;

    iget v10, p2, Lio/flutter/embedding/engine/systemchannels/PlatformViewsChannel$PlatformViewCreationRequest;->viewId:I

    invoke-virtual {v9, v10, v2}, Landroid/util/SparseArray;->append(ILjava/lang/Object;)V

    .line 664
    invoke-direct {p0, p1}, Lio/flutter/plugin/platform/PlatformViewsController;->maybeInvokeOnFlutterViewAttached(Lio/flutter/plugin/platform/PlatformView;)V

    .line 666
    return-wide v3
.end method

.method public createOverlaySurface()Lio/flutter/embedding/engine/FlutterOverlaySurface;
    .locals 5

    .line 1353
    new-instance v0, Lio/flutter/plugin/platform/PlatformOverlayView;

    iget-object v1, p0, Lio/flutter/plugin/platform/PlatformViewsController;->flutterView:Lio/flutter/embedding/android/FlutterView;

    .line 1355
    invoke-virtual {v1}, Lio/flutter/embedding/android/FlutterView;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lio/flutter/plugin/platform/PlatformViewsController;->flutterView:Lio/flutter/embedding/android/FlutterView;

    .line 1356
    invoke-virtual {v2}, Lio/flutter/embedding/android/FlutterView;->getWidth()I

    move-result v2

    iget-object v3, p0, Lio/flutter/plugin/platform/PlatformViewsController;->flutterView:Lio/flutter/embedding/android/FlutterView;

    .line 1357
    invoke-virtual {v3}, Lio/flutter/embedding/android/FlutterView;->getHeight()I

    move-result v3

    iget-object v4, p0, Lio/flutter/plugin/platform/PlatformViewsController;->accessibilityEventsDelegate:Lio/flutter/plugin/platform/AccessibilityEventsDelegate;

    invoke-direct {v0, v1, v2, v3, v4}, Lio/flutter/plugin/platform/PlatformOverlayView;-><init>(Landroid/content/Context;IILio/flutter/plugin/platform/AccessibilityEventsDelegate;)V

    .line 1353
    invoke-virtual {p0, v0}, Lio/flutter/plugin/platform/PlatformViewsController;->createOverlaySurface(Lio/flutter/plugin/platform/PlatformOverlayView;)Lio/flutter/embedding/engine/FlutterOverlaySurface;

    move-result-object v0

    return-object v0
.end method

.method public createOverlaySurface(Lio/flutter/plugin/platform/PlatformOverlayView;)Lio/flutter/embedding/engine/FlutterOverlaySurface;
    .locals 3
    .param p1, "imageView"    # Lio/flutter/plugin/platform/PlatformOverlayView;

    .line 1333
    iget v0, p0, Lio/flutter/plugin/platform/PlatformViewsController;->nextOverlayLayerId:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lio/flutter/plugin/platform/PlatformViewsController;->nextOverlayLayerId:I

    .line 1334
    .local v0, "id":I
    iget-object v1, p0, Lio/flutter/plugin/platform/PlatformViewsController;->overlayLayerViews:Landroid/util/SparseArray;

    invoke-virtual {v1, v0, p1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 1335
    new-instance v1, Lio/flutter/embedding/engine/FlutterOverlaySurface;

    invoke-virtual {p1}, Lio/flutter/plugin/platform/PlatformOverlayView;->getSurface()Landroid/view/Surface;

    move-result-object v2

    invoke-direct {v1, v0, v2}, Lio/flutter/embedding/engine/FlutterOverlaySurface;-><init>(ILandroid/view/Surface;)V

    return-object v1
.end method

.method public createPlatformView(Lio/flutter/embedding/engine/systemchannels/PlatformViewsChannel$PlatformViewCreationRequest;Z)Lio/flutter/plugin/platform/PlatformView;
    .locals 7
    .param p1, "request"    # Lio/flutter/embedding/engine/systemchannels/PlatformViewsChannel$PlatformViewCreationRequest;
    .param p2, "wrapContext"    # Z

    .line 507
    iget-object v0, p0, Lio/flutter/plugin/platform/PlatformViewsController;->registry:Lio/flutter/plugin/platform/PlatformViewRegistryImpl;

    iget-object v1, p1, Lio/flutter/embedding/engine/systemchannels/PlatformViewsChannel$PlatformViewCreationRequest;->viewType:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lio/flutter/plugin/platform/PlatformViewRegistryImpl;->getFactory(Ljava/lang/String;)Lio/flutter/plugin/platform/PlatformViewFactory;

    move-result-object v0

    .line 508
    .local v0, "viewFactory":Lio/flutter/plugin/platform/PlatformViewFactory;
    if-eqz v0, :cond_3

    .line 513
    const/4 v1, 0x0

    .line 514
    .local v1, "createParams":Ljava/lang/Object;
    iget-object v2, p1, Lio/flutter/embedding/engine/systemchannels/PlatformViewsChannel$PlatformViewCreationRequest;->params:Ljava/nio/ByteBuffer;

    if-eqz v2, :cond_0

    .line 515
    invoke-virtual {v0}, Lio/flutter/plugin/platform/PlatformViewFactory;->getCreateArgsCodec()Lio/flutter/plugin/common/MessageCodec;

    move-result-object v2

    iget-object v3, p1, Lio/flutter/embedding/engine/systemchannels/PlatformViewsChannel$PlatformViewCreationRequest;->params:Ljava/nio/ByteBuffer;

    invoke-interface {v2, v3}, Lio/flutter/plugin/common/MessageCodec;->decodeMessage(Ljava/nio/ByteBuffer;)Ljava/lang/Object;

    move-result-object v1

    .line 521
    :cond_0
    if-eqz p2, :cond_1

    new-instance v2, Landroid/content/MutableContextWrapper;

    iget-object v3, p0, Lio/flutter/plugin/platform/PlatformViewsController;->context:Landroid/content/Context;

    invoke-direct {v2, v3}, Landroid/content/MutableContextWrapper;-><init>(Landroid/content/Context;)V

    goto :goto_0

    :cond_1
    iget-object v2, p0, Lio/flutter/plugin/platform/PlatformViewsController;->context:Landroid/content/Context;

    .line 522
    .local v2, "mutableContext":Landroid/content/Context;
    :goto_0
    iget v3, p1, Lio/flutter/embedding/engine/systemchannels/PlatformViewsChannel$PlatformViewCreationRequest;->viewId:I

    .line 523
    invoke-virtual {v0, v2, v3, v1}, Lio/flutter/plugin/platform/PlatformViewFactory;->create(Landroid/content/Context;ILjava/lang/Object;)Lio/flutter/plugin/platform/PlatformView;

    move-result-object v3

    .line 526
    .local v3, "platformView":Lio/flutter/plugin/platform/PlatformView;
    invoke-interface {v3}, Lio/flutter/plugin/platform/PlatformView;->getView()Landroid/view/View;

    move-result-object v4

    .line 527
    .local v4, "embeddedView":Landroid/view/View;
    if-eqz v4, :cond_2

    .line 531
    iget v5, p1, Lio/flutter/embedding/engine/systemchannels/PlatformViewsChannel$PlatformViewCreationRequest;->direction:I

    invoke-virtual {v4, v5}, Landroid/view/View;->setLayoutDirection(I)V

    .line 532
    iget-object v5, p0, Lio/flutter/plugin/platform/PlatformViewsController;->platformViews:Landroid/util/SparseArray;

    iget v6, p1, Lio/flutter/embedding/engine/systemchannels/PlatformViewsChannel$PlatformViewCreationRequest;->viewId:I

    invoke-virtual {v5, v6, v3}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 533
    invoke-direct {p0, v3}, Lio/flutter/plugin/platform/PlatformViewsController;->maybeInvokeOnFlutterViewAttached(Lio/flutter/plugin/platform/PlatformView;)V

    .line 534
    return-object v3

    .line 528
    :cond_2
    new-instance v5, Ljava/lang/IllegalStateException;

    const-string v6, "PlatformView#getView() returned null, but an Android view reference was expected."

    invoke-direct {v5, v6}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 509
    .end local v1    # "createParams":Ljava/lang/Object;
    .end local v2    # "mutableContext":Landroid/content/Context;
    .end local v3    # "platformView":Lio/flutter/plugin/platform/PlatformView;
    .end local v4    # "embeddedView":Landroid/view/View;
    :cond_3
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Trying to create a platform view of unregistered type: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p1, Lio/flutter/embedding/engine/systemchannels/PlatformViewsChannel$PlatformViewCreationRequest;->viewType:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public destroyOverlaySurfaces()V
    .locals 2

    .line 1367
    const/4 v0, 0x0

    .local v0, "viewId":I
    :goto_0
    iget-object v1, p0, Lio/flutter/plugin/platform/PlatformViewsController;->overlayLayerViews:Landroid/util/SparseArray;

    invoke-virtual {v1}, Landroid/util/SparseArray;->size()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 1368
    iget-object v1, p0, Lio/flutter/plugin/platform/PlatformViewsController;->overlayLayerViews:Landroid/util/SparseArray;

    invoke-virtual {v1, v0}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/flutter/plugin/platform/PlatformOverlayView;

    .line 1369
    .local v1, "overlayView":Lio/flutter/plugin/platform/PlatformOverlayView;
    invoke-virtual {v1}, Lio/flutter/plugin/platform/PlatformOverlayView;->detachFromRenderer()V

    .line 1370
    invoke-virtual {v1}, Lio/flutter/plugin/platform/PlatformOverlayView;->closeImageReader()V

    .line 1367
    .end local v1    # "overlayView":Lio/flutter/plugin/platform/PlatformOverlayView;
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1376
    .end local v0    # "viewId":I
    :cond_0
    return-void
.end method

.method public detach()V
    .locals 2

    .line 801
    iget-object v0, p0, Lio/flutter/plugin/platform/PlatformViewsController;->platformViewsChannel:Lio/flutter/embedding/engine/systemchannels/PlatformViewsChannel;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 802
    invoke-virtual {v0, v1}, Lio/flutter/embedding/engine/systemchannels/PlatformViewsChannel;->setPlatformViewsHandler(Lio/flutter/embedding/engine/systemchannels/PlatformViewsChannel$PlatformViewsHandler;)V

    .line 804
    :cond_0
    invoke-virtual {p0}, Lio/flutter/plugin/platform/PlatformViewsController;->destroyOverlaySurfaces()V

    .line 805
    iput-object v1, p0, Lio/flutter/plugin/platform/PlatformViewsController;->platformViewsChannel:Lio/flutter/embedding/engine/systemchannels/PlatformViewsChannel;

    .line 806
    iput-object v1, p0, Lio/flutter/plugin/platform/PlatformViewsController;->context:Landroid/content/Context;

    .line 807
    iput-object v1, p0, Lio/flutter/plugin/platform/PlatformViewsController;->textureRegistry:Lio/flutter/view/TextureRegistry;

    .line 808
    return-void
.end method

.method public detachAccessibilityBridge()V
    .locals 2

    .line 882
    iget-object v0, p0, Lio/flutter/plugin/platform/PlatformViewsController;->accessibilityEventsDelegate:Lio/flutter/plugin/platform/AccessibilityEventsDelegate;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lio/flutter/plugin/platform/AccessibilityEventsDelegate;->setAccessibilityBridge(Lio/flutter/view/AccessibilityBridge;)V

    .line 883
    return-void
.end method

.method public detachFromView()V
    .locals 3

    .line 844
    const/4 v0, 0x0

    .local v0, "index":I
    :goto_0
    iget-object v1, p0, Lio/flutter/plugin/platform/PlatformViewsController;->viewWrappers:Landroid/util/SparseArray;

    invoke-virtual {v1}, Landroid/util/SparseArray;->size()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 845
    iget-object v1, p0, Lio/flutter/plugin/platform/PlatformViewsController;->viewWrappers:Landroid/util/SparseArray;

    invoke-virtual {v1, v0}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/flutter/plugin/platform/PlatformViewWrapper;

    .line 846
    .local v1, "view":Lio/flutter/plugin/platform/PlatformViewWrapper;
    iget-object v2, p0, Lio/flutter/plugin/platform/PlatformViewsController;->flutterView:Lio/flutter/embedding/android/FlutterView;

    invoke-virtual {v2, v1}, Lio/flutter/embedding/android/FlutterView;->removeView(Landroid/view/View;)V

    .line 844
    .end local v1    # "view":Lio/flutter/plugin/platform/PlatformViewWrapper;
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 849
    .end local v0    # "index":I
    :cond_0
    const/4 v0, 0x0

    .restart local v0    # "index":I
    :goto_1
    iget-object v1, p0, Lio/flutter/plugin/platform/PlatformViewsController;->platformViewParent:Landroid/util/SparseArray;

    invoke-virtual {v1}, Landroid/util/SparseArray;->size()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 850
    iget-object v1, p0, Lio/flutter/plugin/platform/PlatformViewsController;->platformViewParent:Landroid/util/SparseArray;

    invoke-virtual {v1, v0}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/flutter/embedding/engine/mutatorsstack/FlutterMutatorView;

    .line 851
    .local v1, "view":Lio/flutter/embedding/engine/mutatorsstack/FlutterMutatorView;
    iget-object v2, p0, Lio/flutter/plugin/platform/PlatformViewsController;->flutterView:Lio/flutter/embedding/android/FlutterView;

    invoke-virtual {v2, v1}, Lio/flutter/embedding/android/FlutterView;->removeView(Landroid/view/View;)V

    .line 849
    .end local v1    # "view":Lio/flutter/embedding/engine/mutatorsstack/FlutterMutatorView;
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 854
    .end local v0    # "index":I
    :cond_1
    invoke-virtual {p0}, Lio/flutter/plugin/platform/PlatformViewsController;->destroyOverlaySurfaces()V

    .line 855
    invoke-direct {p0}, Lio/flutter/plugin/platform/PlatformViewsController;->removeOverlaySurfaces()V

    .line 856
    const/4 v0, 0x0

    iput-object v0, p0, Lio/flutter/plugin/platform/PlatformViewsController;->flutterView:Lio/flutter/embedding/android/FlutterView;

    .line 857
    const/4 v0, 0x0

    iput-boolean v0, p0, Lio/flutter/plugin/platform/PlatformViewsController;->flutterViewConvertedToImageView:Z

    .line 860
    const/4 v0, 0x0

    .restart local v0    # "index":I
    :goto_2
    iget-object v1, p0, Lio/flutter/plugin/platform/PlatformViewsController;->platformViews:Landroid/util/SparseArray;

    invoke-virtual {v1}, Landroid/util/SparseArray;->size()I

    move-result v1

    if-ge v0, v1, :cond_2

    .line 861
    iget-object v1, p0, Lio/flutter/plugin/platform/PlatformViewsController;->platformViews:Landroid/util/SparseArray;

    invoke-virtual {v1, v0}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/flutter/plugin/platform/PlatformView;

    .line 862
    .local v1, "view":Lio/flutter/plugin/platform/PlatformView;
    invoke-interface {v1}, Lio/flutter/plugin/platform/PlatformView;->onFlutterViewDetached()V

    .line 860
    .end local v1    # "view":Lio/flutter/plugin/platform/PlatformView;
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 864
    .end local v0    # "index":I
    :cond_2
    return-void
.end method

.method public detachTextInputPlugin()V
    .locals 1

    .line 900
    const/4 v0, 0x0

    iput-object v0, p0, Lio/flutter/plugin/platform/PlatformViewsController;->textInputPlugin:Lio/flutter/plugin/editing/TextInputPlugin;

    .line 901
    return-void
.end method

.method public disposePlatformView(I)V
    .locals 1
    .param p1, "viewId"    # I

    .line 1101
    iget-object v0, p0, Lio/flutter/plugin/platform/PlatformViewsController;->channelHandler:Lio/flutter/embedding/engine/systemchannels/PlatformViewsChannel$PlatformViewsHandler;

    invoke-interface {v0, p1}, Lio/flutter/embedding/engine/systemchannels/PlatformViewsChannel$PlatformViewsHandler;->dispose(I)V

    .line 1102
    return-void
.end method

.method public getOverlayLayerViews()Landroid/util/SparseArray;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroid/util/SparseArray<",
            "Lio/flutter/plugin/platform/PlatformOverlayView;",
            ">;"
        }
    .end annotation

    .line 1391
    iget-object v0, p0, Lio/flutter/plugin/platform/PlatformViewsController;->overlayLayerViews:Landroid/util/SparseArray;

    return-object v0
.end method

.method public getPlatformViewById(I)Landroid/view/View;
    .locals 2
    .param p1, "viewId"    # I

    .line 953
    invoke-virtual {p0, p1}, Lio/flutter/plugin/platform/PlatformViewsController;->usesVirtualDisplay(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 954
    iget-object v0, p0, Lio/flutter/plugin/platform/PlatformViewsController;->vdControllers:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/flutter/plugin/platform/VirtualDisplayController;

    .line 955
    .local v0, "controller":Lio/flutter/plugin/platform/VirtualDisplayController;
    invoke-virtual {v0}, Lio/flutter/plugin/platform/VirtualDisplayController;->getView()Landroid/view/View;

    move-result-object v1

    return-object v1

    .line 958
    .end local v0    # "controller":Lio/flutter/plugin/platform/VirtualDisplayController;
    :cond_0
    iget-object v0, p0, Lio/flutter/plugin/platform/PlatformViewsController;->platformViews:Landroid/util/SparseArray;

    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/flutter/plugin/platform/PlatformView;

    .line 959
    .local v0, "platformView":Lio/flutter/plugin/platform/PlatformView;
    if-nez v0, :cond_1

    .line 960
    const/4 v1, 0x0

    return-object v1

    .line 962
    :cond_1
    invoke-interface {v0}, Lio/flutter/plugin/platform/PlatformView;->getView()Landroid/view/View;

    move-result-object v1

    return-object v1
.end method

.method public getRegistry()Lio/flutter/plugin/platform/PlatformViewRegistry;
    .locals 1

    .line 927
    iget-object v0, p0, Lio/flutter/plugin/platform/PlatformViewsController;->registry:Lio/flutter/plugin/platform/PlatformViewRegistryImpl;

    return-object v0
.end method

.method initializePlatformViewIfNeeded(I)Z
    .locals 7
    .param p1, "viewId"    # I

    .line 1119
    iget-object v0, p0, Lio/flutter/plugin/platform/PlatformViewsController;->platformViews:Landroid/util/SparseArray;

    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/flutter/plugin/platform/PlatformView;

    .line 1120
    .local v0, "platformView":Lio/flutter/plugin/platform/PlatformView;
    if-nez v0, :cond_0

    .line 1121
    const/4 v1, 0x0

    return v1

    .line 1123
    :cond_0
    iget-object v1, p0, Lio/flutter/plugin/platform/PlatformViewsController;->platformViewParent:Landroid/util/SparseArray;

    invoke-virtual {v1, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    const/4 v2, 0x1

    if-eqz v1, :cond_1

    .line 1124
    return v2

    .line 1126
    :cond_1
    invoke-interface {v0}, Lio/flutter/plugin/platform/PlatformView;->getView()Landroid/view/View;

    move-result-object v1

    .line 1127
    .local v1, "embeddedView":Landroid/view/View;
    if-eqz v1, :cond_3

    .line 1131
    invoke-virtual {v1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v3

    if-nez v3, :cond_2

    .line 1136
    new-instance v3, Lio/flutter/embedding/engine/mutatorsstack/FlutterMutatorView;

    iget-object v4, p0, Lio/flutter/plugin/platform/PlatformViewsController;->context:Landroid/content/Context;

    .line 1138
    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v5

    iget v5, v5, Landroid/util/DisplayMetrics;->density:F

    iget-object v6, p0, Lio/flutter/plugin/platform/PlatformViewsController;->androidTouchProcessor:Lio/flutter/embedding/android/AndroidTouchProcessor;

    invoke-direct {v3, v4, v5, v6}, Lio/flutter/embedding/engine/mutatorsstack/FlutterMutatorView;-><init>(Landroid/content/Context;FLio/flutter/embedding/android/AndroidTouchProcessor;)V

    .line 1140
    .local v3, "parentView":Lio/flutter/embedding/engine/mutatorsstack/FlutterMutatorView;
    new-instance v4, Lio/flutter/plugin/platform/PlatformViewsController$$ExternalSyntheticLambda1;

    invoke-direct {v4, p0, p1}, Lio/flutter/plugin/platform/PlatformViewsController$$ExternalSyntheticLambda1;-><init>(Lio/flutter/plugin/platform/PlatformViewsController;I)V

    invoke-virtual {v3, v4}, Lio/flutter/embedding/engine/mutatorsstack/FlutterMutatorView;->setOnDescendantFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    .line 1149
    iget-object v4, p0, Lio/flutter/plugin/platform/PlatformViewsController;->platformViewParent:Landroid/util/SparseArray;

    invoke-virtual {v4, p1, v3}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 1158
    const/4 v4, 0x4

    invoke-virtual {v1, v4}, Landroid/view/View;->setImportantForAccessibility(I)V

    .line 1160
    invoke-virtual {v3, v1}, Lio/flutter/embedding/engine/mutatorsstack/FlutterMutatorView;->addView(Landroid/view/View;)V

    .line 1161
    iget-object v4, p0, Lio/flutter/plugin/platform/PlatformViewsController;->flutterView:Lio/flutter/embedding/android/FlutterView;

    invoke-virtual {v4, v3}, Lio/flutter/embedding/android/FlutterView;->addView(Landroid/view/View;)V

    .line 1162
    return v2

    .line 1132
    .end local v3    # "parentView":Lio/flutter/embedding/engine/mutatorsstack/FlutterMutatorView;
    :cond_2
    new-instance v2, Ljava/lang/IllegalStateException;

    const-string v3, "The Android view returned from PlatformView#getView() was already added to a parent view."

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1128
    :cond_3
    new-instance v2, Ljava/lang/IllegalStateException;

    const-string v3, "PlatformView#getView() returned null, but an Android view reference was expected."

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method synthetic lambda$configureForTextureLayerComposition$1$io-flutter-plugin-platform-PlatformViewsController(Lio/flutter/embedding/engine/systemchannels/PlatformViewsChannel$PlatformViewCreationRequest;Landroid/view/View;Z)V
    .locals 2
    .param p1, "request"    # Lio/flutter/embedding/engine/systemchannels/PlatformViewsChannel$PlatformViewCreationRequest;
    .param p2, "v"    # Landroid/view/View;
    .param p3, "hasFocus"    # Z

    .line 654
    if-eqz p3, :cond_0

    .line 655
    iget-object v0, p0, Lio/flutter/plugin/platform/PlatformViewsController;->platformViewsChannel:Lio/flutter/embedding/engine/systemchannels/PlatformViewsChannel;

    iget v1, p1, Lio/flutter/embedding/engine/systemchannels/PlatformViewsChannel$PlatformViewCreationRequest;->viewId:I

    invoke-virtual {v0, v1}, Lio/flutter/embedding/engine/systemchannels/PlatformViewsChannel;->invokeViewFocused(I)V

    goto :goto_0

    .line 656
    :cond_0
    iget-object v0, p0, Lio/flutter/plugin/platform/PlatformViewsController;->textInputPlugin:Lio/flutter/plugin/editing/TextInputPlugin;

    if-eqz v0, :cond_1

    .line 657
    iget v1, p1, Lio/flutter/embedding/engine/systemchannels/PlatformViewsChannel$PlatformViewCreationRequest;->viewId:I

    invoke-virtual {v0, v1}, Lio/flutter/plugin/editing/TextInputPlugin;->clearPlatformViewClient(I)V

    .line 659
    :cond_1
    :goto_0
    return-void
.end method

.method synthetic lambda$configureForVirtualDisplay$0$io-flutter-plugin-platform-PlatformViewsController(Lio/flutter/embedding/engine/systemchannels/PlatformViewsChannel$PlatformViewCreationRequest;Landroid/view/View;Z)V
    .locals 2
    .param p1, "request"    # Lio/flutter/embedding/engine/systemchannels/PlatformViewsChannel$PlatformViewCreationRequest;
    .param p2, "view"    # Landroid/view/View;
    .param p3, "hasFocus"    # Z

    .line 571
    if-eqz p3, :cond_0

    .line 572
    iget-object v0, p0, Lio/flutter/plugin/platform/PlatformViewsController;->platformViewsChannel:Lio/flutter/embedding/engine/systemchannels/PlatformViewsChannel;

    iget v1, p1, Lio/flutter/embedding/engine/systemchannels/PlatformViewsChannel$PlatformViewCreationRequest;->viewId:I

    invoke-virtual {v0, v1}, Lio/flutter/embedding/engine/systemchannels/PlatformViewsChannel;->invokeViewFocused(I)V

    .line 574
    :cond_0
    return-void
.end method

.method synthetic lambda$initializePlatformViewIfNeeded$2$io-flutter-plugin-platform-PlatformViewsController(ILandroid/view/View;Z)V
    .locals 1
    .param p1, "viewId"    # I
    .param p2, "view"    # Landroid/view/View;
    .param p3, "hasFocus"    # Z

    .line 1142
    if-eqz p3, :cond_0

    .line 1143
    iget-object v0, p0, Lio/flutter/plugin/platform/PlatformViewsController;->platformViewsChannel:Lio/flutter/embedding/engine/systemchannels/PlatformViewsChannel;

    invoke-virtual {v0, p1}, Lio/flutter/embedding/engine/systemchannels/PlatformViewsChannel;->invokeViewFocused(I)V

    goto :goto_0

    .line 1144
    :cond_0
    iget-object v0, p0, Lio/flutter/plugin/platform/PlatformViewsController;->textInputPlugin:Lio/flutter/plugin/editing/TextInputPlugin;

    if-eqz v0, :cond_1

    .line 1145
    invoke-virtual {v0, p1}, Lio/flutter/plugin/editing/TextInputPlugin;->clearPlatformViewClient(I)V

    .line 1147
    :cond_1
    :goto_0
    return-void
.end method

.method synthetic lambda$onEndFrame$3$io-flutter-plugin-platform-PlatformViewsController()V
    .locals 1

    .line 1261
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lio/flutter/plugin/platform/PlatformViewsController;->finishFrame(Z)V

    .line 1262
    return-void
.end method

.method public onAttachedToJNI()V
    .locals 0

    .line 936
    return-void
.end method

.method public onBeginFrame()V
    .locals 1

    .line 1242
    iget-object v0, p0, Lio/flutter/plugin/platform/PlatformViewsController;->currentFrameUsedOverlayLayerIds:Ljava/util/HashSet;

    invoke-virtual {v0}, Ljava/util/HashSet;->clear()V

    .line 1243
    iget-object v0, p0, Lio/flutter/plugin/platform/PlatformViewsController;->currentFrameUsedPlatformViewIds:Ljava/util/HashSet;

    invoke-virtual {v0}, Ljava/util/HashSet;->clear()V

    .line 1244
    return-void
.end method

.method public onDetachedFromJNI()V
    .locals 0

    .line 943
    invoke-direct {p0}, Lio/flutter/plugin/platform/PlatformViewsController;->diposeAllViews()V

    .line 944
    return-void
.end method

.method public onDisplayOverlaySurface(IIIII)V
    .locals 4
    .param p1, "id"    # I
    .param p2, "x"    # I
    .param p3, "y"    # I
    .param p4, "width"    # I
    .param p5, "height"    # I

    .line 1222
    iget-object v0, p0, Lio/flutter/plugin/platform/PlatformViewsController;->overlayLayerViews:Landroid/util/SparseArray;

    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 1225
    invoke-direct {p0}, Lio/flutter/plugin/platform/PlatformViewsController;->initializeRootImageViewIfNeeded()V

    .line 1227
    iget-object v0, p0, Lio/flutter/plugin/platform/PlatformViewsController;->overlayLayerViews:Landroid/util/SparseArray;

    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/flutter/plugin/platform/PlatformOverlayView;

    .line 1228
    .local v0, "overlayView":Lio/flutter/plugin/platform/PlatformOverlayView;
    invoke-virtual {v0}, Lio/flutter/plugin/platform/PlatformOverlayView;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    if-nez v1, :cond_0

    .line 1229
    iget-object v1, p0, Lio/flutter/plugin/platform/PlatformViewsController;->flutterView:Lio/flutter/embedding/android/FlutterView;

    invoke-virtual {v1, v0}, Lio/flutter/embedding/android/FlutterView;->addView(Landroid/view/View;)V

    .line 1232
    :cond_0
    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v1, p4, p5}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 1233
    .local v1, "layoutParams":Landroid/widget/FrameLayout$LayoutParams;
    iput p2, v1, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 1234
    iput p3, v1, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 1235
    invoke-virtual {v0, v1}, Lio/flutter/plugin/platform/PlatformOverlayView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 1236
    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Lio/flutter/plugin/platform/PlatformOverlayView;->setVisibility(I)V

    .line 1237
    invoke-virtual {v0}, Lio/flutter/plugin/platform/PlatformOverlayView;->bringToFront()V

    .line 1238
    iget-object v2, p0, Lio/flutter/plugin/platform/PlatformViewsController;->currentFrameUsedOverlayLayerIds:Ljava/util/HashSet;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 1239
    return-void

    .line 1223
    .end local v0    # "overlayView":Lio/flutter/plugin/platform/PlatformOverlayView;
    .end local v1    # "layoutParams":Landroid/widget/FrameLayout$LayoutParams;
    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "The overlay surface (id:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ") doesn\'t exist"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public onDisplayPlatformView(IIIIIIILio/flutter/embedding/engine/mutatorsstack/FlutterMutatorsStack;)V
    .locals 7
    .param p1, "viewId"    # I
    .param p2, "x"    # I
    .param p3, "y"    # I
    .param p4, "width"    # I
    .param p5, "height"    # I
    .param p6, "viewWidth"    # I
    .param p7, "viewHeight"    # I
    .param p8, "mutatorsStack"    # Lio/flutter/embedding/engine/mutatorsstack/FlutterMutatorsStack;

    .line 1191
    invoke-direct {p0}, Lio/flutter/plugin/platform/PlatformViewsController;->initializeRootImageViewIfNeeded()V

    .line 1192
    invoke-virtual {p0, p1}, Lio/flutter/plugin/platform/PlatformViewsController;->initializePlatformViewIfNeeded(I)Z

    move-result v0

    if-nez v0, :cond_0

    .line 1193
    return-void

    .line 1196
    :cond_0
    iget-object v0, p0, Lio/flutter/plugin/platform/PlatformViewsController;->platformViewParent:Landroid/util/SparseArray;

    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/flutter/embedding/engine/mutatorsstack/FlutterMutatorView;

    .line 1197
    .local v0, "parentView":Lio/flutter/embedding/engine/mutatorsstack/FlutterMutatorView;
    move-object v1, v0

    move-object v2, p8

    move v3, p2

    move v4, p3

    move v5, p4

    move v6, p5

    invoke-virtual/range {v1 .. v6}, Lio/flutter/embedding/engine/mutatorsstack/FlutterMutatorView;->readyToDisplay(Lio/flutter/embedding/engine/mutatorsstack/FlutterMutatorsStack;IIII)V

    .line 1198
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lio/flutter/embedding/engine/mutatorsstack/FlutterMutatorView;->setVisibility(I)V

    .line 1199
    invoke-virtual {v0}, Lio/flutter/embedding/engine/mutatorsstack/FlutterMutatorView;->bringToFront()V

    .line 1201
    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v1, p6, p7}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 1203
    .local v1, "layoutParams":Landroid/widget/FrameLayout$LayoutParams;
    iget-object v2, p0, Lio/flutter/plugin/platform/PlatformViewsController;->platformViews:Landroid/util/SparseArray;

    invoke-virtual {v2, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lio/flutter/plugin/platform/PlatformView;

    invoke-interface {v2}, Lio/flutter/plugin/platform/PlatformView;->getView()Landroid/view/View;

    move-result-object v2

    .line 1204
    .local v2, "view":Landroid/view/View;
    if-eqz v2, :cond_1

    .line 1205
    invoke-virtual {v2, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 1206
    invoke-virtual {v2}, Landroid/view/View;->bringToFront()V

    .line 1208
    :cond_1
    iget-object v3, p0, Lio/flutter/plugin/platform/PlatformViewsController;->currentFrameUsedPlatformViewIds:Ljava/util/HashSet;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 1209
    return-void
.end method

.method public onEndFrame()V
    .locals 2

    .line 1256
    iget-boolean v0, p0, Lio/flutter/plugin/platform/PlatformViewsController;->flutterViewConvertedToImageView:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lio/flutter/plugin/platform/PlatformViewsController;->currentFrameUsedPlatformViewIds:Ljava/util/HashSet;

    invoke-virtual {v0}, Ljava/util/HashSet;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1257
    iput-boolean v1, p0, Lio/flutter/plugin/platform/PlatformViewsController;->flutterViewConvertedToImageView:Z

    .line 1258
    iget-object v0, p0, Lio/flutter/plugin/platform/PlatformViewsController;->flutterView:Lio/flutter/embedding/android/FlutterView;

    new-instance v1, Lio/flutter/plugin/platform/PlatformViewsController$$ExternalSyntheticLambda2;

    invoke-direct {v1, p0}, Lio/flutter/plugin/platform/PlatformViewsController$$ExternalSyntheticLambda2;-><init>(Lio/flutter/plugin/platform/PlatformViewsController;)V

    invoke-virtual {v0, v1}, Lio/flutter/embedding/android/FlutterView;->revertImageView(Ljava/lang/Runnable;)V

    .line 1263
    return-void

    .line 1274
    :cond_0
    iget-boolean v0, p0, Lio/flutter/plugin/platform/PlatformViewsController;->flutterViewConvertedToImageView:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Lio/flutter/plugin/platform/PlatformViewsController;->flutterView:Lio/flutter/embedding/android/FlutterView;

    .line 1275
    invoke-virtual {v0}, Lio/flutter/embedding/android/FlutterView;->acquireLatestImageViewFrame()Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v1, 0x1

    goto :goto_0

    :cond_1
    nop

    :goto_0
    move v0, v1

    .line 1276
    .local v0, "isFrameRenderedUsingImageReaders":Z
    invoke-direct {p0, v0}, Lio/flutter/plugin/platform/PlatformViewsController;->finishFrame(Z)V

    .line 1277
    return-void
.end method

.method public onPreEngineRestart()V
    .locals 0

    .line 947
    invoke-direct {p0}, Lio/flutter/plugin/platform/PlatformViewsController;->diposeAllViews()V

    .line 948
    return-void
.end method

.method public onResume()V
    .locals 2

    .line 1089
    iget-object v0, p0, Lio/flutter/plugin/platform/PlatformViewsController;->vdControllers:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/flutter/plugin/platform/VirtualDisplayController;

    .line 1090
    .local v1, "vdc":Lio/flutter/plugin/platform/VirtualDisplayController;
    invoke-virtual {v1}, Lio/flutter/plugin/platform/VirtualDisplayController;->resetSurface()V

    .line 1091
    .end local v1    # "vdc":Lio/flutter/plugin/platform/VirtualDisplayController;
    goto :goto_0

    .line 1092
    :cond_0
    return-void
.end method

.method public onTrimMemory(I)V
    .locals 2
    .param p1, "level"    # I

    .line 1078
    const/16 v0, 0x28

    if-ge p1, v0, :cond_0

    .line 1079
    return-void

    .line 1081
    :cond_0
    iget-object v0, p0, Lio/flutter/plugin/platform/PlatformViewsController;->vdControllers:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/flutter/plugin/platform/VirtualDisplayController;

    .line 1082
    .local v1, "vdc":Lio/flutter/plugin/platform/VirtualDisplayController;
    invoke-virtual {v1}, Lio/flutter/plugin/platform/VirtualDisplayController;->clearSurface()V

    .line 1083
    .end local v1    # "vdc":Lio/flutter/plugin/platform/VirtualDisplayController;
    goto :goto_0

    .line 1084
    :cond_1
    return-void
.end method

.method public setSoftwareRendering(Z)V
    .locals 0
    .param p1, "useSoftwareRendering"    # Z

    .line 788
    iput-boolean p1, p0, Lio/flutter/plugin/platform/PlatformViewsController;->usesSoftwareRendering:Z

    .line 789
    return-void
.end method

.method public toMotionEvent(FLio/flutter/embedding/engine/systemchannels/PlatformViewsChannel$PlatformViewTouch;Z)Landroid/view/MotionEvent;
    .locals 25
    .param p1, "density"    # F
    .param p2, "touch"    # Lio/flutter/embedding/engine/systemchannels/PlatformViewsChannel$PlatformViewTouch;
    .param p3, "usingVirtualDiplay"    # Z

    .line 691
    move-object/from16 v0, p2

    iget-wide v1, v0, Lio/flutter/embedding/engine/systemchannels/PlatformViewsChannel$PlatformViewTouch;->motionEventId:J

    .line 692
    invoke-static {v1, v2}, Lio/flutter/embedding/android/MotionEventTracker$MotionEventId;->from(J)Lio/flutter/embedding/android/MotionEventTracker$MotionEventId;

    move-result-object v1

    .line 693
    .local v1, "motionEventId":Lio/flutter/embedding/android/MotionEventTracker$MotionEventId;
    move-object/from16 v2, p0

    iget-object v3, v2, Lio/flutter/plugin/platform/PlatformViewsController;->motionEventTracker:Lio/flutter/embedding/android/MotionEventTracker;

    invoke-virtual {v3, v1}, Lio/flutter/embedding/android/MotionEventTracker;->pop(Lio/flutter/embedding/android/MotionEventTracker$MotionEventId;)Landroid/view/MotionEvent;

    move-result-object v3

    .line 700
    .local v3, "trackedEvent":Landroid/view/MotionEvent;
    iget-object v4, v0, Lio/flutter/embedding/engine/systemchannels/PlatformViewsChannel$PlatformViewTouch;->rawPointerCoords:Ljava/lang/Object;

    .line 701
    move/from16 v5, p1

    invoke-static {v4, v5}, Lio/flutter/plugin/platform/PlatformViewsController;->parsePointerCoordsList(Ljava/lang/Object;F)Ljava/util/List;

    move-result-object v4

    iget v6, v0, Lio/flutter/embedding/engine/systemchannels/PlatformViewsChannel$PlatformViewTouch;->pointerCount:I

    new-array v6, v6, [Landroid/view/MotionEvent$PointerCoords;

    .line 702
    invoke-interface {v4, v6}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [Landroid/view/MotionEvent$PointerCoords;

    .line 704
    .local v4, "pointerCoords":[Landroid/view/MotionEvent$PointerCoords;
    if-nez p3, :cond_0

    if-eqz v3, :cond_0

    .line 707
    invoke-static {v3, v4}, Lio/flutter/plugin/platform/PlatformViewsController;->translateMotionEvent(Landroid/view/MotionEvent;[Landroid/view/MotionEvent$PointerCoords;)V

    .line 708
    return-object v3

    .line 713
    :cond_0
    iget-object v6, v0, Lio/flutter/embedding/engine/systemchannels/PlatformViewsChannel$PlatformViewTouch;->rawPointerPropertiesList:Ljava/lang/Object;

    .line 714
    invoke-static {v6}, Lio/flutter/plugin/platform/PlatformViewsController;->parsePointerPropertiesList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v6

    iget v7, v0, Lio/flutter/embedding/engine/systemchannels/PlatformViewsChannel$PlatformViewTouch;->pointerCount:I

    new-array v7, v7, [Landroid/view/MotionEvent$PointerProperties;

    .line 715
    invoke-interface {v6, v7}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v6

    move-object/from16 v22, v6

    check-cast v22, [Landroid/view/MotionEvent$PointerProperties;

    .line 719
    .local v22, "pointerProperties":[Landroid/view/MotionEvent$PointerProperties;
    iget-object v6, v0, Lio/flutter/embedding/engine/systemchannels/PlatformViewsChannel$PlatformViewTouch;->downTime:Ljava/lang/Number;

    .line 720
    invoke-virtual {v6}, Ljava/lang/Number;->longValue()J

    move-result-wide v6

    iget-object v8, v0, Lio/flutter/embedding/engine/systemchannels/PlatformViewsChannel$PlatformViewTouch;->eventTime:Ljava/lang/Number;

    .line 721
    invoke-virtual {v8}, Ljava/lang/Number;->longValue()J

    move-result-wide v8

    iget v10, v0, Lio/flutter/embedding/engine/systemchannels/PlatformViewsChannel$PlatformViewTouch;->action:I

    iget v11, v0, Lio/flutter/embedding/engine/systemchannels/PlatformViewsChannel$PlatformViewTouch;->pointerCount:I

    iget v14, v0, Lio/flutter/embedding/engine/systemchannels/PlatformViewsChannel$PlatformViewTouch;->metaState:I

    iget v15, v0, Lio/flutter/embedding/engine/systemchannels/PlatformViewsChannel$PlatformViewTouch;->buttonState:I

    iget v13, v0, Lio/flutter/embedding/engine/systemchannels/PlatformViewsChannel$PlatformViewTouch;->xPrecision:F

    iget v12, v0, Lio/flutter/embedding/engine/systemchannels/PlatformViewsChannel$PlatformViewTouch;->yPrecision:F

    move-object/from16 v23, v1

    .end local v1    # "motionEventId":Lio/flutter/embedding/android/MotionEventTracker$MotionEventId;
    .local v23, "motionEventId":Lio/flutter/embedding/android/MotionEventTracker$MotionEventId;
    iget v1, v0, Lio/flutter/embedding/engine/systemchannels/PlatformViewsChannel$PlatformViewTouch;->deviceId:I

    iget v2, v0, Lio/flutter/embedding/engine/systemchannels/PlatformViewsChannel$PlatformViewTouch;->edgeFlags:I

    move-object/from16 v24, v3

    .end local v3    # "trackedEvent":Landroid/view/MotionEvent;
    .local v24, "trackedEvent":Landroid/view/MotionEvent;
    iget v3, v0, Lio/flutter/embedding/engine/systemchannels/PlatformViewsChannel$PlatformViewTouch;->source:I

    iget v5, v0, Lio/flutter/embedding/engine/systemchannels/PlatformViewsChannel$PlatformViewTouch;->flags:I

    .line 719
    move/from16 v17, v12

    move-object/from16 v12, v22

    move/from16 v16, v13

    move-object v13, v4

    move/from16 v18, v1

    move/from16 v19, v2

    move/from16 v20, v3

    move/from16 v21, v5

    invoke-static/range {v6 .. v21}, Landroid/view/MotionEvent;->obtain(JJII[Landroid/view/MotionEvent$PointerProperties;[Landroid/view/MotionEvent$PointerCoords;IIFFIIII)Landroid/view/MotionEvent;

    move-result-object v1

    return-object v1
.end method

.method public usesVirtualDisplay(I)Z
    .locals 2
    .param p1, "id"    # I

    .line 967
    iget-object v0, p0, Lio/flutter/plugin/platform/PlatformViewsController;->vdControllers:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method
