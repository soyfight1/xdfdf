.class public Lio/flutter/embedding/engine/loader/FlutterLoader;
.super Ljava/lang/Object;
.source "FlutterLoader.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/flutter/embedding/engine/loader/FlutterLoader$Settings;,
        Lio/flutter/embedding/engine/loader/FlutterLoader$InitResult;
    }
.end annotation


# static fields
.field static final AOT_SHARED_LIBRARY_NAME:Ljava/lang/String; = "aot-shared-library-name"

.field static final AOT_VMSERVICE_SHARED_LIBRARY_NAME:Ljava/lang/String; = "aot-vmservice-shared-library-name"

.field static final AUTOMATICALLY_REGISTER_PLUGINS_KEY:Ljava/lang/String; = "automatically-register-plugins"

.field private static final DEFAULT_KERNEL_BLOB:Ljava/lang/String; = "kernel_blob.bin"

.field private static final DEFAULT_LIBRARY:Ljava/lang/String; = "libflutter.so"

.field private static final DISABLE_SURFACE_CONTROL:Ljava/lang/String; = "io.flutter.embedding.android.DisableSurfaceControl"

.field private static final ENABLED_MERGED_PLATFORM_UI_THREAD_KEY:Ljava/lang/String; = "io.flutter.embedding.android.EnableMergedPlatformUIThread"

.field private static final ENABLE_IMPELLER_META_DATA_KEY:Ljava/lang/String; = "io.flutter.embedding.android.EnableImpeller"

.field private static final ENABLE_VULKAN_VALIDATION_META_DATA_KEY:Ljava/lang/String; = "io.flutter.embedding.android.EnableVulkanValidation"

.field static final FLUTTER_ASSETS_DIR_KEY:Ljava/lang/String; = "flutter-assets-dir"

.field private static final IMPELLER_BACKEND_META_DATA_KEY:Ljava/lang/String; = "io.flutter.embedding.android.ImpellerBackend"

.field private static final IMPELLER_OPENGL_GPU_TRACING_DATA_KEY:Ljava/lang/String; = "io.flutter.embedding.android.EnableOpenGLGPUTracing"

.field private static final IMPELLER_VULKAN_GPU_TRACING_DATA_KEY:Ljava/lang/String; = "io.flutter.embedding.android.EnableVulkanGPUTracing"

.field static final ISOLATE_SNAPSHOT_DATA_KEY:Ljava/lang/String; = "isolate-snapshot-data"

.field private static final LEAK_VM_META_DATA_KEY:Ljava/lang/String; = "io.flutter.embedding.android.LeakVM"

.field private static final OLD_GEN_HEAP_SIZE_META_DATA_KEY:Ljava/lang/String; = "io.flutter.embedding.android.OldGenHeapSize"

.field static final SNAPSHOT_ASSET_PATH_KEY:Ljava/lang/String; = "snapshot-asset-path"

.field private static final TAG:Ljava/lang/String; = "FlutterLoader"

.field private static final VMSERVICE_SNAPSHOT_LIBRARY:Ljava/lang/String; = "libvmservice_snapshot.so"

.field static final VM_SNAPSHOT_DATA_KEY:Ljava/lang/String; = "vm-snapshot-data"

.field private static instance:Lio/flutter/embedding/engine/loader/FlutterLoader;


# instance fields
.field private executorService:Ljava/util/concurrent/ExecutorService;

.field private flutterApplicationInfo:Lio/flutter/embedding/engine/loader/FlutterApplicationInfo;

.field private flutterJNI:Lio/flutter/embedding/engine/FlutterJNI;

.field initResultFuture:Ljava/util/concurrent/Future;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/Future<",
            "Lio/flutter/embedding/engine/loader/FlutterLoader$InitResult;",
            ">;"
        }
    .end annotation
.end field

.field private initStartTimestampMillis:J

.field private initialized:Z

.field private settings:Lio/flutter/embedding/engine/loader/FlutterLoader$Settings;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 89
    invoke-static {}, Lio/flutter/FlutterInjector;->instance()Lio/flutter/FlutterInjector;

    move-result-object v0

    invoke-virtual {v0}, Lio/flutter/FlutterInjector;->getFlutterJNIFactory()Lio/flutter/embedding/engine/FlutterJNI$Factory;

    move-result-object v0

    invoke-virtual {v0}, Lio/flutter/embedding/engine/FlutterJNI$Factory;->provideFlutterJNI()Lio/flutter/embedding/engine/FlutterJNI;

    move-result-object v0

    invoke-direct {p0, v0}, Lio/flutter/embedding/engine/loader/FlutterLoader;-><init>(Lio/flutter/embedding/engine/FlutterJNI;)V

    .line 90
    return-void
.end method

.method public constructor <init>(Lio/flutter/embedding/engine/FlutterJNI;)V
    .locals 1
    .param p1, "flutterJNI"    # Lio/flutter/embedding/engine/FlutterJNI;

    .line 99
    invoke-static {}, Lio/flutter/FlutterInjector;->instance()Lio/flutter/FlutterInjector;

    move-result-object v0

    invoke-virtual {v0}, Lio/flutter/FlutterInjector;->executorService()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lio/flutter/embedding/engine/loader/FlutterLoader;-><init>(Lio/flutter/embedding/engine/FlutterJNI;Ljava/util/concurrent/ExecutorService;)V

    .line 100
    return-void
.end method

.method public constructor <init>(Lio/flutter/embedding/engine/FlutterJNI;Ljava/util/concurrent/ExecutorService;)V
    .locals 1
    .param p1, "flutterJNI"    # Lio/flutter/embedding/engine/FlutterJNI;
    .param p2, "executorService"    # Ljava/util/concurrent/ExecutorService;

    .line 109
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 114
    const/4 v0, 0x0

    iput-boolean v0, p0, Lio/flutter/embedding/engine/loader/FlutterLoader;->initialized:Z

    .line 110
    iput-object p1, p0, Lio/flutter/embedding/engine/loader/FlutterLoader;->flutterJNI:Lio/flutter/embedding/engine/FlutterJNI;

    .line 111
    iput-object p2, p0, Lio/flutter/embedding/engine/loader/FlutterLoader;->executorService:Ljava/util/concurrent/ExecutorService;

    .line 112
    return-void
.end method

.method static synthetic access$000(Lio/flutter/embedding/engine/loader/FlutterLoader;Landroid/content/Context;)Lio/flutter/embedding/engine/loader/ResourceExtractor;
    .locals 1
    .param p0, "x0"    # Lio/flutter/embedding/engine/loader/FlutterLoader;
    .param p1, "x1"    # Landroid/content/Context;

    .line 35
    invoke-direct {p0, p1}, Lio/flutter/embedding/engine/loader/FlutterLoader;->initResources(Landroid/content/Context;)Lio/flutter/embedding/engine/loader/ResourceExtractor;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$100(Lio/flutter/embedding/engine/loader/FlutterLoader;)Lio/flutter/embedding/engine/FlutterJNI;
    .locals 1
    .param p0, "x0"    # Lio/flutter/embedding/engine/loader/FlutterLoader;

    .line 35
    iget-object v0, p0, Lio/flutter/embedding/engine/loader/FlutterLoader;->flutterJNI:Lio/flutter/embedding/engine/FlutterJNI;

    return-object v0
.end method

.method static synthetic access$200(Lio/flutter/embedding/engine/loader/FlutterLoader;)Lio/flutter/embedding/engine/loader/FlutterApplicationInfo;
    .locals 1
    .param p0, "x0"    # Lio/flutter/embedding/engine/loader/FlutterLoader;

    .line 35
    iget-object v0, p0, Lio/flutter/embedding/engine/loader/FlutterLoader;->flutterApplicationInfo:Lio/flutter/embedding/engine/loader/FlutterApplicationInfo;

    return-object v0
.end method

.method static synthetic access$300(Lio/flutter/embedding/engine/loader/FlutterLoader;)Ljava/util/concurrent/ExecutorService;
    .locals 1
    .param p0, "x0"    # Lio/flutter/embedding/engine/loader/FlutterLoader;

    .line 35
    iget-object v0, p0, Lio/flutter/embedding/engine/loader/FlutterLoader;->executorService:Ljava/util/concurrent/ExecutorService;

    return-object v0
.end method

.method private fullAssetPathFrom(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "filePath"    # Ljava/lang/String;

    .line 517
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lio/flutter/embedding/engine/loader/FlutterLoader;->flutterApplicationInfo:Lio/flutter/embedding/engine/loader/FlutterApplicationInfo;

    iget-object v1, v1, Lio/flutter/embedding/engine/loader/FlutterApplicationInfo;->flutterAssetsDir:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private initResources(Landroid/content/Context;)Lio/flutter/embedding/engine/loader/ResourceExtractor;
    .locals 7
    .param p1, "applicationContext"    # Landroid/content/Context;

    .line 457
    const/4 v0, 0x0

    .line 459
    .local v0, "resourceExtractor":Lio/flutter/embedding/engine/loader/ResourceExtractor;
    invoke-static {p1}, Lio/flutter/util/PathUtils;->getDataDirectory(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    .line 460
    .local v1, "dataDirPath":Ljava/lang/String;
    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    .line 461
    .local v2, "packageName":Ljava/lang/String;
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v3

    .line 462
    .local v3, "packageManager":Landroid/content/pm/PackageManager;
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/res/Resources;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v4

    .line 463
    .local v4, "assetManager":Landroid/content/res/AssetManager;
    new-instance v5, Lio/flutter/embedding/engine/loader/ResourceExtractor;

    invoke-direct {v5, v1, v2, v3, v4}, Lio/flutter/embedding/engine/loader/ResourceExtractor;-><init>(Ljava/lang/String;Ljava/lang/String;Landroid/content/pm/PackageManager;Landroid/content/res/AssetManager;)V

    move-object v0, v5

    .line 468
    iget-object v5, p0, Lio/flutter/embedding/engine/loader/FlutterLoader;->flutterApplicationInfo:Lio/flutter/embedding/engine/loader/FlutterApplicationInfo;

    iget-object v5, v5, Lio/flutter/embedding/engine/loader/FlutterApplicationInfo;->vmSnapshotData:Ljava/lang/String;

    .line 469
    invoke-direct {p0, v5}, Lio/flutter/embedding/engine/loader/FlutterLoader;->fullAssetPathFrom(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Lio/flutter/embedding/engine/loader/ResourceExtractor;->addResource(Ljava/lang/String;)Lio/flutter/embedding/engine/loader/ResourceExtractor;

    move-result-object v5

    iget-object v6, p0, Lio/flutter/embedding/engine/loader/FlutterLoader;->flutterApplicationInfo:Lio/flutter/embedding/engine/loader/FlutterApplicationInfo;

    iget-object v6, v6, Lio/flutter/embedding/engine/loader/FlutterApplicationInfo;->isolateSnapshotData:Ljava/lang/String;

    .line 470
    invoke-direct {p0, v6}, Lio/flutter/embedding/engine/loader/FlutterLoader;->fullAssetPathFrom(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Lio/flutter/embedding/engine/loader/ResourceExtractor;->addResource(Ljava/lang/String;)Lio/flutter/embedding/engine/loader/ResourceExtractor;

    move-result-object v5

    .line 471
    const-string v6, "kernel_blob.bin"

    invoke-direct {p0, v6}, Lio/flutter/embedding/engine/loader/FlutterLoader;->fullAssetPathFrom(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Lio/flutter/embedding/engine/loader/ResourceExtractor;->addResource(Ljava/lang/String;)Lio/flutter/embedding/engine/loader/ResourceExtractor;

    .line 473
    invoke-virtual {v0}, Lio/flutter/embedding/engine/loader/ResourceExtractor;->start()Lio/flutter/embedding/engine/loader/ResourceExtractor;

    .line 475
    .end local v1    # "dataDirPath":Ljava/lang/String;
    .end local v2    # "packageName":Ljava/lang/String;
    .end local v3    # "packageManager":Landroid/content/pm/PackageManager;
    .end local v4    # "assetManager":Landroid/content/res/AssetManager;
    return-object v0
.end method

.method private static isLeakVM(Landroid/os/Bundle;)Z
    .locals 3
    .param p0, "metaData"    # Landroid/os/Bundle;

    .line 404
    const/4 v0, 0x1

    .line 405
    .local v0, "leakVMDefaultValue":Z
    const/4 v1, 0x1

    if-nez p0, :cond_0

    .line 406
    return v1

    .line 408
    :cond_0
    const-string v2, "io.flutter.embedding.android.LeakVM"

    invoke-virtual {p0, v2, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    return v1
.end method


# virtual methods
.method public automaticallyRegisterPlugins()Z
    .locals 1

    .line 512
    iget-object v0, p0, Lio/flutter/embedding/engine/loader/FlutterLoader;->flutterApplicationInfo:Lio/flutter/embedding/engine/loader/FlutterApplicationInfo;

    iget-boolean v0, v0, Lio/flutter/embedding/engine/loader/FlutterApplicationInfo;->automaticallyRegisterPlugins:Z

    return v0
.end method

.method public ensureInitializationComplete(Landroid/content/Context;[Ljava/lang/String;)V
    .locals 23
    .param p1, "applicationContext"    # Landroid/content/Context;
    .param p2, "args"    # [Ljava/lang/String;

    .line 254
    move-object/from16 v1, p0

    move-object/from16 v2, p2

    const-string v0, "io.flutter.embedding.android.EnableMergedPlatformUIThread"

    const-string v3, "io.flutter.embedding.android.EnableImpeller"

    iget-boolean v4, v1, Lio/flutter/embedding/engine/loader/FlutterLoader;->initialized:Z

    if-eqz v4, :cond_0

    .line 255
    return-void

    .line 257
    :cond_0
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v4

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v5

    if-ne v4, v5, :cond_13

    .line 261
    iget-object v4, v1, Lio/flutter/embedding/engine/loader/FlutterLoader;->settings:Lio/flutter/embedding/engine/loader/FlutterLoader$Settings;

    if-eqz v4, :cond_12

    .line 266
    :try_start_0
    const-string v4, "FlutterLoader#ensureInitializationComplete"

    invoke-static {v4}, Lio/flutter/util/TraceSection;->scoped(Ljava/lang/String;)Lio/flutter/util/TraceSection;

    move-result-object v4
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 267
    .local v4, "e":Lio/flutter/util/TraceSection;
    :try_start_1
    iget-object v5, v1, Lio/flutter/embedding/engine/loader/FlutterLoader;->initResultFuture:Ljava/util/concurrent/Future;

    invoke-interface {v5}, Ljava/util/concurrent/Future;->get()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lio/flutter/embedding/engine/loader/FlutterLoader$InitResult;

    .line 269
    .local v5, "result":Lio/flutter/embedding/engine/loader/FlutterLoader$InitResult;
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 270
    .local v6, "shellArgs":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const-string v7, "--icu-symbol-prefix=_binary_icudtl_dat"

    invoke-interface {v6, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 272
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "--icu-native-lib-path="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, v1, Lio/flutter/embedding/engine/loader/FlutterLoader;->flutterApplicationInfo:Lio/flutter/embedding/engine/loader/FlutterApplicationInfo;

    iget-object v8, v8, Lio/flutter/embedding/engine/loader/FlutterApplicationInfo;->nativeLibraryDir:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    sget-object v8, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "libflutter.so"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v6, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 277
    if-eqz v2, :cond_1

    .line 278
    invoke-static {v6, v2}, Ljava/util/Collections;->addAll(Ljava/util/Collection;[Ljava/lang/Object;)Z

    .line 281
    :cond_1
    const/4 v7, 0x0

    .line 283
    .local v7, "kernelPath":Ljava/lang/String;
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v9, v5, Lio/flutter/embedding/engine/loader/FlutterLoader$InitResult;->dataDirPath:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    sget-object v9, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, v1, Lio/flutter/embedding/engine/loader/FlutterLoader;->flutterApplicationInfo:Lio/flutter/embedding/engine/loader/FlutterApplicationInfo;

    iget-object v9, v9, Lio/flutter/embedding/engine/loader/FlutterApplicationInfo;->flutterAssetsDir:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 285
    .local v8, "snapshotAssetPath":Ljava/lang/String;
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    sget-object v10, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "kernel_blob.bin"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    .line 286
    .end local v7    # "kernelPath":Ljava/lang/String;
    .local v13, "kernelPath":Ljava/lang/String;
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "--snapshot-asset-path="

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v6, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 287
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "--vm-snapshot-data="

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v9, v1, Lio/flutter/embedding/engine/loader/FlutterLoader;->flutterApplicationInfo:Lio/flutter/embedding/engine/loader/FlutterApplicationInfo;

    iget-object v9, v9, Lio/flutter/embedding/engine/loader/FlutterApplicationInfo;->vmSnapshotData:Ljava/lang/String;

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v6, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 288
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "--isolate-snapshot-data="

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v9, v1, Lio/flutter/embedding/engine/loader/FlutterLoader;->flutterApplicationInfo:Lio/flutter/embedding/engine/loader/FlutterApplicationInfo;

    iget-object v9, v9, Lio/flutter/embedding/engine/loader/FlutterApplicationInfo;->isolateSnapshotData:Ljava/lang/String;

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v6, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 313
    nop

    .end local v8    # "snapshotAssetPath":Ljava/lang/String;
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "--cache-dir-path="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, v5, Lio/flutter/embedding/engine/loader/FlutterLoader$InitResult;->engineCachesPath:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v6, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 314
    iget-object v7, v1, Lio/flutter/embedding/engine/loader/FlutterLoader;->flutterApplicationInfo:Lio/flutter/embedding/engine/loader/FlutterApplicationInfo;

    iget-object v7, v7, Lio/flutter/embedding/engine/loader/FlutterApplicationInfo;->domainNetworkPolicy:Ljava/lang/String;

    if-eqz v7, :cond_2

    .line 315
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "--domain-network-policy="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, v1, Lio/flutter/embedding/engine/loader/FlutterLoader;->flutterApplicationInfo:Lio/flutter/embedding/engine/loader/FlutterApplicationInfo;

    iget-object v8, v8, Lio/flutter/embedding/engine/loader/FlutterApplicationInfo;->domainNetworkPolicy:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v6, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 317
    :cond_2
    iget-object v7, v1, Lio/flutter/embedding/engine/loader/FlutterLoader;->settings:Lio/flutter/embedding/engine/loader/FlutterLoader$Settings;

    invoke-virtual {v7}, Lio/flutter/embedding/engine/loader/FlutterLoader$Settings;->getLogTag()Ljava/lang/String;

    move-result-object v7

    if-eqz v7, :cond_3

    .line 318
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "--log-tag="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, v1, Lio/flutter/embedding/engine/loader/FlutterLoader;->settings:Lio/flutter/embedding/engine/loader/FlutterLoader$Settings;

    invoke-virtual {v8}, Lio/flutter/embedding/engine/loader/FlutterLoader$Settings;->getLogTag()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v6, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 321
    :cond_3
    nop

    .line 323
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v7

    .line 325
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v8

    .line 324
    const/16 v9, 0x80

    invoke-virtual {v7, v8, v9}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object v7

    .line 326
    .local v7, "applicationInfo":Landroid/content/pm/ApplicationInfo;
    iget-object v8, v7, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;

    .line 328
    .local v8, "metaData":Landroid/os/Bundle;
    if-eqz v8, :cond_4

    const-string v10, "io.flutter.embedding.android.OldGenHeapSize"

    invoke-virtual {v8, v10}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v10
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_0

    :cond_4
    const/4 v10, 0x0

    .line 329
    .local v10, "oldGenHeapSizeMegaBytes":I
    :goto_0
    if-nez v10, :cond_5

    .line 331
    :try_start_2
    const-string v11, "activity"
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 332
    move-object/from16 v15, p1

    :try_start_3
    invoke-virtual {v15, v11}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Landroid/app/ActivityManager;

    .line 333
    .local v11, "activityManager":Landroid/app/ActivityManager;
    new-instance v12, Landroid/app/ActivityManager$MemoryInfo;

    invoke-direct {v12}, Landroid/app/ActivityManager$MemoryInfo;-><init>()V

    .line 334
    .local v12, "memInfo":Landroid/app/ActivityManager$MemoryInfo;
    invoke-virtual {v11, v12}, Landroid/app/ActivityManager;->getMemoryInfo(Landroid/app/ActivityManager$MemoryInfo;)V

    .line 335
    move/from16 v16, v10

    .end local v10    # "oldGenHeapSizeMegaBytes":I
    .local v16, "oldGenHeapSizeMegaBytes":I
    iget-wide v9, v12, Landroid/app/ActivityManager$MemoryInfo;->totalMem:J

    long-to-double v9, v9

    const-wide v17, 0x412e848000000000L    # 1000000.0

    div-double v9, v9, v17

    const-wide/high16 v17, 0x4000000000000000L    # 2.0

    div-double v9, v9, v17

    double-to-int v10, v9

    move v9, v10

    .end local v16    # "oldGenHeapSizeMegaBytes":I
    .restart local v10    # "oldGenHeapSizeMegaBytes":I
    goto :goto_1

    .line 266
    .end local v5    # "result":Lio/flutter/embedding/engine/loader/FlutterLoader$InitResult;
    .end local v6    # "shellArgs":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v7    # "applicationInfo":Landroid/content/pm/ApplicationInfo;
    .end local v8    # "metaData":Landroid/os/Bundle;
    .end local v10    # "oldGenHeapSizeMegaBytes":I
    .end local v11    # "activityManager":Landroid/app/ActivityManager;
    .end local v12    # "memInfo":Landroid/app/ActivityManager$MemoryInfo;
    .end local v13    # "kernelPath":Ljava/lang/String;
    :catchall_0
    move-exception v0

    move-object/from16 v15, p1

    goto/16 :goto_5

    .line 329
    .restart local v5    # "result":Lio/flutter/embedding/engine/loader/FlutterLoader$InitResult;
    .restart local v6    # "shellArgs":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .restart local v7    # "applicationInfo":Landroid/content/pm/ApplicationInfo;
    .restart local v8    # "metaData":Landroid/os/Bundle;
    .restart local v10    # "oldGenHeapSizeMegaBytes":I
    .restart local v13    # "kernelPath":Ljava/lang/String;
    :cond_5
    move-object/from16 v15, p1

    move/from16 v16, v10

    .end local v10    # "oldGenHeapSizeMegaBytes":I
    .restart local v16    # "oldGenHeapSizeMegaBytes":I
    move/from16 v9, v16

    .line 337
    .end local v16    # "oldGenHeapSizeMegaBytes":I
    .local v9, "oldGenHeapSizeMegaBytes":I
    :goto_1
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "--old-gen-heap-size="

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-interface {v6, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 339
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v10

    invoke-virtual {v10}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v10

    move-object v12, v10

    .line 340
    .local v12, "displayMetrics":Landroid/util/DisplayMetrics;
    iget v10, v12, Landroid/util/DisplayMetrics;->widthPixels:I

    move/from16 v18, v10

    .line 341
    .local v18, "screenWidth":I
    iget v10, v12, Landroid/util/DisplayMetrics;->heightPixels:I

    move/from16 v19, v10

    .line 344
    .local v19, "screenHeight":I
    mul-int v10, v18, v19

    mul-int/lit8 v10, v10, 0xc

    mul-int/lit8 v11, v10, 0x4

    .line 345
    .local v11, "resourceCacheMaxBytesThreshold":I
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "--resource-cache-max-bytes-threshold="

    invoke-virtual {v10, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-interface {v6, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 347
    const-string v10, "--prefetched-default-font-manager"

    invoke-interface {v6, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 349
    if-eqz v8, :cond_e

    .line 350
    invoke-virtual {v8, v3}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_7

    .line 351
    invoke-virtual {v8, v3}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_6

    .line 352
    const-string v3, "--enable-impeller=true"

    invoke-interface {v6, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 354
    :cond_6
    const-string v3, "--enable-impeller=false"

    invoke-interface {v6, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 357
    :cond_7
    :goto_2
    const-string v3, "io.flutter.embedding.android.EnableVulkanValidation"

    const/4 v10, 0x0

    invoke-virtual {v8, v3, v10}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v3

    if-eqz v3, :cond_8

    .line 358
    const-string v3, "--enable-vulkan-validation"

    invoke-interface {v6, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 360
    :cond_8
    const-string v3, "io.flutter.embedding.android.EnableOpenGLGPUTracing"

    const/4 v10, 0x0

    invoke-virtual {v8, v3, v10}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v3

    if-eqz v3, :cond_9

    .line 361
    const-string v3, "--enable-opengl-gpu-tracing"

    invoke-interface {v6, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 363
    :cond_9
    const-string v3, "io.flutter.embedding.android.EnableVulkanGPUTracing"

    const/4 v10, 0x0

    invoke-virtual {v8, v3, v10}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v3

    if-eqz v3, :cond_a

    .line 364
    const-string v3, "--enable-vulkan-gpu-tracing"

    invoke-interface {v6, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 366
    :cond_a
    const-string v3, "io.flutter.embedding.android.DisableSurfaceControl"

    const/4 v10, 0x0

    invoke-virtual {v8, v3, v10}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v3

    if-eqz v3, :cond_b

    .line 367
    const-string v3, "--disable-surface-control"

    invoke-interface {v6, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 369
    :cond_b
    invoke-virtual {v8, v0}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_d

    .line 370
    invoke-virtual {v8, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_c

    .line 371
    const-string v0, "--enable-merged-platform-ui-thread"

    invoke-interface {v6, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_3

    .line 373
    :cond_c
    const-string v0, "--no-enable-merged-platform-ui-thread"

    invoke-interface {v6, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 377
    :cond_d
    :goto_3
    const-string v0, "io.flutter.embedding.android.ImpellerBackend"

    invoke-virtual {v8, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 378
    .local v0, "backend":Ljava/lang/String;
    if-eqz v0, :cond_e

    .line 379
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "--impeller-backend="

    invoke-virtual {v3, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v6, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 383
    .end local v0    # "backend":Ljava/lang/String;
    :cond_e
    invoke-static {v8}, Lio/flutter/embedding/engine/loader/FlutterLoader;->isLeakVM(Landroid/os/Bundle;)Z

    move-result v0

    if-eqz v0, :cond_f

    const-string v0, "true"

    goto :goto_4

    :cond_f
    const-string v0, "false"

    .line 384
    .local v0, "leakVM":Ljava/lang/String;
    :goto_4
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "--leak-vm="

    invoke-virtual {v3, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v6, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 386
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v16

    iget-wide v14, v1, Lio/flutter/embedding/engine/loader/FlutterLoader;->initStartTimestampMillis:J

    sub-long v20, v16, v14

    .line 388
    .local v20, "initTimeMillis":J
    iget-object v3, v1, Lio/flutter/embedding/engine/loader/FlutterLoader;->flutterJNI:Lio/flutter/embedding/engine/FlutterJNI;

    const/4 v10, 0x0

    new-array v10, v10, [Ljava/lang/String;

    .line 390
    invoke-interface {v6, v10}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v10

    move-object v14, v10

    check-cast v14, [Ljava/lang/String;

    iget-object v15, v5, Lio/flutter/embedding/engine/loader/FlutterLoader$InitResult;->appStoragePath:Ljava/lang/String;

    iget-object v10, v5, Lio/flutter/embedding/engine/loader/FlutterLoader$InitResult;->engineCachesPath:Ljava/lang/String;

    .line 388
    move-object/from16 v16, v10

    move-object v10, v3

    move v3, v11

    .end local v11    # "resourceCacheMaxBytesThreshold":I
    .local v3, "resourceCacheMaxBytesThreshold":I
    move-object/from16 v11, p1

    move-object/from16 v22, v12

    .end local v12    # "displayMetrics":Landroid/util/DisplayMetrics;
    .local v22, "displayMetrics":Landroid/util/DisplayMetrics;
    move-object v12, v14

    move-object v14, v15

    move-object/from16 v15, v16

    move-wide/from16 v16, v20

    invoke-virtual/range {v10 .. v17}, Lio/flutter/embedding/engine/FlutterJNI;->init(Landroid/content/Context;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V

    .line 396
    const/4 v10, 0x1

    iput-boolean v10, v1, Lio/flutter/embedding/engine/loader/FlutterLoader;->initialized:Z
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 397
    .end local v0    # "leakVM":Ljava/lang/String;
    .end local v3    # "resourceCacheMaxBytesThreshold":I
    .end local v5    # "result":Lio/flutter/embedding/engine/loader/FlutterLoader$InitResult;
    .end local v6    # "shellArgs":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v7    # "applicationInfo":Landroid/content/pm/ApplicationInfo;
    .end local v8    # "metaData":Landroid/os/Bundle;
    .end local v9    # "oldGenHeapSizeMegaBytes":I
    .end local v13    # "kernelPath":Ljava/lang/String;
    .end local v18    # "screenWidth":I
    .end local v19    # "screenHeight":I
    .end local v20    # "initTimeMillis":J
    .end local v22    # "displayMetrics":Landroid/util/DisplayMetrics;
    if-eqz v4, :cond_10

    :try_start_4
    invoke-virtual {v4}, Lio/flutter/util/TraceSection;->close()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    .line 400
    .end local v4    # "e":Lio/flutter/util/TraceSection;
    :cond_10
    nop

    .line 401
    return-void

    .line 266
    .restart local v4    # "e":Lio/flutter/util/TraceSection;
    :catchall_1
    move-exception v0

    :goto_5
    move-object v3, v0

    if-eqz v4, :cond_11

    :try_start_5
    invoke-virtual {v4}, Lio/flutter/util/TraceSection;->close()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    goto :goto_6

    :catchall_2
    move-exception v0

    move-object v5, v0

    :try_start_6
    invoke-virtual {v3, v5}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local p1    # "applicationContext":Landroid/content/Context;
    .end local p2    # "args":[Ljava/lang/String;
    :cond_11
    :goto_6
    throw v3
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_0

    .line 397
    .end local v4    # "e":Lio/flutter/util/TraceSection;
    .restart local p1    # "applicationContext":Landroid/content/Context;
    .restart local p2    # "args":[Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 398
    .local v0, "e":Ljava/lang/Exception;
    const-string v3, "FlutterLoader"

    const-string v4, "Flutter initialization failed."

    invoke-static {v3, v4, v0}, Lio/flutter/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 399
    new-instance v3, Ljava/lang/RuntimeException;

    invoke-direct {v3, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v3

    .line 262
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_12
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v3, "ensureInitializationComplete must be called after startInitialization"

    invoke-direct {v0, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 258
    :cond_13
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v3, "ensureInitializationComplete must be called on the main thread"

    invoke-direct {v0, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public ensureInitializationCompleteAsync(Landroid/content/Context;[Ljava/lang/String;Landroid/os/Handler;Ljava/lang/Runnable;)V
    .locals 8
    .param p1, "applicationContext"    # Landroid/content/Context;
    .param p2, "args"    # [Ljava/lang/String;
    .param p3, "callbackHandler"    # Landroid/os/Handler;
    .param p4, "callback"    # Ljava/lang/Runnable;

    .line 420
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    if-ne v0, v1, :cond_2

    .line 424
    iget-object v0, p0, Lio/flutter/embedding/engine/loader/FlutterLoader;->settings:Lio/flutter/embedding/engine/loader/FlutterLoader$Settings;

    if-eqz v0, :cond_1

    .line 428
    iget-boolean v0, p0, Lio/flutter/embedding/engine/loader/FlutterLoader;->initialized:Z

    if-eqz v0, :cond_0

    .line 429
    invoke-virtual {p3, p4}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 430
    return-void

    .line 432
    :cond_0
    iget-object v0, p0, Lio/flutter/embedding/engine/loader/FlutterLoader;->executorService:Ljava/util/concurrent/ExecutorService;

    new-instance v7, Lio/flutter/embedding/engine/loader/FlutterLoader$$ExternalSyntheticLambda1;

    move-object v1, v7

    move-object v2, p0

    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    move-object v6, p4

    invoke-direct/range {v1 .. v6}, Lio/flutter/embedding/engine/loader/FlutterLoader$$ExternalSyntheticLambda1;-><init>(Lio/flutter/embedding/engine/loader/FlutterLoader;Landroid/content/Context;[Ljava/lang/String;Landroid/os/Handler;Ljava/lang/Runnable;)V

    invoke-interface {v0, v7}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 448
    return-void

    .line 425
    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "ensureInitializationComplete must be called after startInitialization"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 421
    :cond_2
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "ensureInitializationComplete must be called on the main thread"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public findAppBundlePath()Ljava/lang/String;
    .locals 1

    .line 480
    iget-object v0, p0, Lio/flutter/embedding/engine/loader/FlutterLoader;->flutterApplicationInfo:Lio/flutter/embedding/engine/loader/FlutterApplicationInfo;

    iget-object v0, v0, Lio/flutter/embedding/engine/loader/FlutterApplicationInfo;->flutterAssetsDir:Ljava/lang/String;

    return-object v0
.end method

.method public getLookupKeyForAsset(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "asset"    # Ljava/lang/String;

    .line 492
    invoke-direct {p0, p1}, Lio/flutter/embedding/engine/loader/FlutterLoader;->fullAssetPathFrom(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getLookupKeyForAsset(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "asset"    # Ljava/lang/String;
    .param p2, "packageName"    # Ljava/lang/String;

    .line 506
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "packages"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lio/flutter/embedding/engine/loader/FlutterLoader;->getLookupKeyForAsset(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public initialized()Z
    .locals 1

    .line 452
    iget-boolean v0, p0, Lio/flutter/embedding/engine/loader/FlutterLoader;->initialized:Z

    return v0
.end method

.method synthetic lambda$ensureInitializationCompleteAsync$0$io-flutter-embedding-engine-loader-FlutterLoader(Landroid/content/Context;[Ljava/lang/String;Landroid/os/Handler;Ljava/lang/Runnable;)V
    .locals 1
    .param p1, "applicationContext"    # Landroid/content/Context;
    .param p2, "args"    # [Ljava/lang/String;
    .param p3, "callbackHandler"    # Landroid/os/Handler;
    .param p4, "callback"    # Ljava/lang/Runnable;

    .line 444
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p0, v0, p2}, Lio/flutter/embedding/engine/loader/FlutterLoader;->ensureInitializationComplete(Landroid/content/Context;[Ljava/lang/String;)V

    .line 445
    invoke-virtual {p3, p4}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 446
    return-void
.end method

.method synthetic lambda$ensureInitializationCompleteAsync$1$io-flutter-embedding-engine-loader-FlutterLoader(Landroid/content/Context;[Ljava/lang/String;Landroid/os/Handler;Ljava/lang/Runnable;)V
    .locals 9
    .param p1, "applicationContext"    # Landroid/content/Context;
    .param p2, "args"    # [Ljava/lang/String;
    .param p3, "callbackHandler"    # Landroid/os/Handler;
    .param p4, "callback"    # Ljava/lang/Runnable;

    .line 436
    :try_start_0
    iget-object v0, p0, Lio/flutter/embedding/engine/loader/FlutterLoader;->initResultFuture:Ljava/util/concurrent/Future;

    invoke-interface {v0}, Ljava/util/concurrent/Future;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/flutter/embedding/engine/loader/FlutterLoader$InitResult;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 440
    .local v0, "result":Lio/flutter/embedding/engine/loader/FlutterLoader$InitResult;
    nop

    .line 441
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-static {v1}, Lio/flutter/util/HandlerCompat;->createAsyncHandler(Landroid/os/Looper;)Landroid/os/Handler;

    move-result-object v1

    new-instance v8, Lio/flutter/embedding/engine/loader/FlutterLoader$$ExternalSyntheticLambda0;

    move-object v2, v8

    move-object v3, p0

    move-object v4, p1

    move-object v5, p2

    move-object v6, p3

    move-object v7, p4

    invoke-direct/range {v2 .. v7}, Lio/flutter/embedding/engine/loader/FlutterLoader$$ExternalSyntheticLambda0;-><init>(Lio/flutter/embedding/engine/loader/FlutterLoader;Landroid/content/Context;[Ljava/lang/String;Landroid/os/Handler;Ljava/lang/Runnable;)V

    .line 442
    invoke-virtual {v1, v8}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 447
    return-void

    .line 437
    .end local v0    # "result":Lio/flutter/embedding/engine/loader/FlutterLoader$InitResult;
    :catch_0
    move-exception v0

    .line 438
    .local v0, "e":Ljava/lang/Exception;
    const-string v1, "FlutterLoader"

    const-string v2, "Flutter initialization failed."

    invoke-static {v1, v2, v0}, Lio/flutter/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 439
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public startInitialization(Landroid/content/Context;)V
    .locals 1
    .param p1, "applicationContext"    # Landroid/content/Context;

    .line 141
    new-instance v0, Lio/flutter/embedding/engine/loader/FlutterLoader$Settings;

    invoke-direct {v0}, Lio/flutter/embedding/engine/loader/FlutterLoader$Settings;-><init>()V

    invoke-virtual {p0, p1, v0}, Lio/flutter/embedding/engine/loader/FlutterLoader;->startInitialization(Landroid/content/Context;Lio/flutter/embedding/engine/loader/FlutterLoader$Settings;)V

    .line 142
    return-void
.end method

.method public startInitialization(Landroid/content/Context;Lio/flutter/embedding/engine/loader/FlutterLoader$Settings;)V
    .locals 6
    .param p1, "applicationContext"    # Landroid/content/Context;
    .param p2, "settings"    # Lio/flutter/embedding/engine/loader/FlutterLoader$Settings;

    .line 157
    iget-object v0, p0, Lio/flutter/embedding/engine/loader/FlutterLoader;->settings:Lio/flutter/embedding/engine/loader/FlutterLoader$Settings;

    if-eqz v0, :cond_0

    .line 158
    return-void

    .line 160
    :cond_0
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    if-ne v0, v1, :cond_3

    .line 164
    const-string v0, "FlutterLoader#startInitialization"

    invoke-static {v0}, Lio/flutter/util/TraceSection;->scoped(Ljava/lang/String;)Lio/flutter/util/TraceSection;

    move-result-object v0

    .line 166
    .local v0, "e":Lio/flutter/util/TraceSection;
    :try_start_0
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    .line 168
    .local v1, "appContext":Landroid/content/Context;
    iput-object p2, p0, Lio/flutter/embedding/engine/loader/FlutterLoader;->settings:Lio/flutter/embedding/engine/loader/FlutterLoader$Settings;

    .line 170
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v2

    iput-wide v2, p0, Lio/flutter/embedding/engine/loader/FlutterLoader;->initStartTimestampMillis:J

    .line 171
    invoke-static {v1}, Lio/flutter/embedding/engine/loader/ApplicationInfoLoader;->load(Landroid/content/Context;)Lio/flutter/embedding/engine/loader/FlutterApplicationInfo;

    move-result-object v2

    iput-object v2, p0, Lio/flutter/embedding/engine/loader/FlutterLoader;->flutterApplicationInfo:Lio/flutter/embedding/engine/loader/FlutterApplicationInfo;

    .line 173
    const-string v2, "display"

    .line 174
    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/hardware/display/DisplayManager;

    .line 175
    .local v2, "dm":Landroid/hardware/display/DisplayManager;
    iget-object v3, p0, Lio/flutter/embedding/engine/loader/FlutterLoader;->flutterJNI:Lio/flutter/embedding/engine/FlutterJNI;

    invoke-static {v2, v3}, Lio/flutter/view/VsyncWaiter;->getInstance(Landroid/hardware/display/DisplayManager;Lio/flutter/embedding/engine/FlutterJNI;)Lio/flutter/view/VsyncWaiter;

    move-result-object v3

    .line 176
    .local v3, "waiter":Lio/flutter/view/VsyncWaiter;
    invoke-virtual {v3}, Lio/flutter/view/VsyncWaiter;->init()V

    .line 179
    new-instance v4, Lio/flutter/embedding/engine/loader/FlutterLoader$1;

    invoke-direct {v4, p0, v1}, Lio/flutter/embedding/engine/loader/FlutterLoader$1;-><init>(Lio/flutter/embedding/engine/loader/FlutterLoader;Landroid/content/Context;)V

    .line 240
    .local v4, "initTask":Ljava/util/concurrent/Callable;, "Ljava/util/concurrent/Callable<Lio/flutter/embedding/engine/loader/FlutterLoader$InitResult;>;"
    iget-object v5, p0, Lio/flutter/embedding/engine/loader/FlutterLoader;->executorService:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v5, v4}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/Future;

    move-result-object v5

    iput-object v5, p0, Lio/flutter/embedding/engine/loader/FlutterLoader;->initResultFuture:Ljava/util/concurrent/Future;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 241
    .end local v1    # "appContext":Landroid/content/Context;
    .end local v2    # "dm":Landroid/hardware/display/DisplayManager;
    .end local v3    # "waiter":Lio/flutter/view/VsyncWaiter;
    .end local v4    # "initTask":Ljava/util/concurrent/Callable;, "Ljava/util/concurrent/Callable<Lio/flutter/embedding/engine/loader/FlutterLoader$InitResult;>;"
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lio/flutter/util/TraceSection;->close()V

    .line 242
    .end local v0    # "e":Lio/flutter/util/TraceSection;
    :cond_1
    return-void

    .line 164
    .restart local v0    # "e":Lio/flutter/util/TraceSection;
    :catchall_0
    move-exception v1

    if-eqz v0, :cond_2

    :try_start_1
    invoke-virtual {v0}, Lio/flutter/util/TraceSection;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_0

    :catchall_1
    move-exception v2

    invoke-virtual {v1, v2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_2
    :goto_0
    throw v1

    .line 161
    .end local v0    # "e":Lio/flutter/util/TraceSection;
    :cond_3
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "startInitialization must be called on the main thread"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
