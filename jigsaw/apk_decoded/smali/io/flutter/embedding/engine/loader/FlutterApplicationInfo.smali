.class public final Lio/flutter/embedding/engine/loader/FlutterApplicationInfo;
.super Ljava/lang/Object;
.source "FlutterApplicationInfo.java"


# static fields
.field private static final DEFAULT_AOT_SHARED_LIBRARY_NAME:Ljava/lang/String; = "libapp.so"

.field private static final DEFAULT_FLUTTER_ASSETS_DIR:Ljava/lang/String; = "flutter_assets"

.field private static final DEFAULT_ISOLATE_SNAPSHOT_DATA:Ljava/lang/String; = "isolate_snapshot_data"

.field private static final DEFAULT_VM_SNAPSHOT_DATA:Ljava/lang/String; = "vm_snapshot_data"


# instance fields
.field public final aotSharedLibraryName:Ljava/lang/String;

.field final automaticallyRegisterPlugins:Z

.field public final domainNetworkPolicy:Ljava/lang/String;

.field public final flutterAssetsDir:Ljava/lang/String;

.field public final isolateSnapshotData:Ljava/lang/String;

.field public final nativeLibraryDir:Ljava/lang/String;

.field public final vmSnapshotData:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 1
    .param p1, "aotSharedLibraryName"    # Ljava/lang/String;
    .param p2, "vmSnapshotData"    # Ljava/lang/String;
    .param p3, "isolateSnapshotData"    # Ljava/lang/String;
    .param p4, "flutterAssetsDir"    # Ljava/lang/String;
    .param p5, "domainNetworkPolicy"    # Ljava/lang/String;
    .param p6, "nativeLibraryDir"    # Ljava/lang/String;
    .param p7, "automaticallyRegisterPlugins"    # Z

    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    nop

    .line 31
    if-nez p1, :cond_0

    const-string v0, "libapp.so"

    goto :goto_0

    :cond_0
    move-object v0, p1

    :goto_0
    iput-object v0, p0, Lio/flutter/embedding/engine/loader/FlutterApplicationInfo;->aotSharedLibraryName:Ljava/lang/String;

    .line 32
    if-nez p2, :cond_1

    const-string v0, "vm_snapshot_data"

    goto :goto_1

    :cond_1
    move-object v0, p2

    :goto_1
    iput-object v0, p0, Lio/flutter/embedding/engine/loader/FlutterApplicationInfo;->vmSnapshotData:Ljava/lang/String;

    .line 33
    nop

    .line 34
    if-nez p3, :cond_2

    const-string v0, "isolate_snapshot_data"

    goto :goto_2

    :cond_2
    move-object v0, p3

    :goto_2
    iput-object v0, p0, Lio/flutter/embedding/engine/loader/FlutterApplicationInfo;->isolateSnapshotData:Ljava/lang/String;

    .line 35
    nop

    .line 36
    if-nez p4, :cond_3

    const-string v0, "flutter_assets"

    goto :goto_3

    :cond_3
    move-object v0, p4

    :goto_3
    iput-object v0, p0, Lio/flutter/embedding/engine/loader/FlutterApplicationInfo;->flutterAssetsDir:Ljava/lang/String;

    .line 37
    iput-object p6, p0, Lio/flutter/embedding/engine/loader/FlutterApplicationInfo;->nativeLibraryDir:Ljava/lang/String;

    .line 38
    if-nez p5, :cond_4

    const-string v0, ""

    goto :goto_4

    :cond_4
    move-object v0, p5

    :goto_4
    iput-object v0, p0, Lio/flutter/embedding/engine/loader/FlutterApplicationInfo;->domainNetworkPolicy:Ljava/lang/String;

    .line 39
    iput-boolean p7, p0, Lio/flutter/embedding/engine/loader/FlutterApplicationInfo;->automaticallyRegisterPlugins:Z

    .line 40
    return-void
.end method
