.class public final Lio/flutter/util/PathUtils;
.super Ljava/lang/Object;
.source "PathUtils.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getCacheDirectory(Landroid/content/Context;)Ljava/lang/String;
    .locals 4
    .param p0, "applicationContext"    # Landroid/content/Context;

    .line 37
    invoke-virtual {p0}, Landroid/content/Context;->getCodeCacheDir()Ljava/io/File;

    move-result-object v0

    .line 38
    .local v0, "cacheDir":Ljava/io/File;
    if-nez v0, :cond_0

    .line 39
    invoke-virtual {p0}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object v0

    .line 41
    :cond_0
    if-nez v0, :cond_1

    .line 47
    new-instance v1, Ljava/io/File;

    invoke-static {p0}, Lio/flutter/util/PathUtils;->getDataDirPath(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "cache"

    invoke-direct {v1, v2, v3}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    move-object v0, v1

    .line 49
    :cond_1
    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method private static getDataDirPath(Landroid/content/Context;)Ljava/lang/String;
    .locals 2
    .param p0, "applicationContext"    # Landroid/content/Context;

    .line 53
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x18

    if-lt v0, v1, :cond_0

    .line 54
    invoke-virtual {p0}, Landroid/content/Context;->getDataDir()Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 56
    :cond_0
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v0

    iget-object v0, v0, Landroid/content/pm/ApplicationInfo;->dataDir:Ljava/lang/String;

    return-object v0
.end method

.method public static getDataDirectory(Landroid/content/Context;)Ljava/lang/String;
    .locals 5
    .param p0, "applicationContext"    # Landroid/content/Context;

    .line 26
    const-string v0, "flutter"

    .line 27
    .local v0, "name":Ljava/lang/String;
    const-string v1, "flutter"

    const/4 v2, 0x0

    invoke-virtual {p0, v1, v2}, Landroid/content/Context;->getDir(Ljava/lang/String;I)Ljava/io/File;

    move-result-object v1

    .line 28
    .local v1, "flutterDir":Ljava/io/File;
    if-nez v1, :cond_0

    .line 29
    new-instance v2, Ljava/io/File;

    invoke-static {p0}, Lio/flutter/util/PathUtils;->getDataDirPath(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "app_flutter"

    invoke-direct {v2, v3, v4}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    move-object v1, v2

    .line 31
    :cond_0
    invoke-virtual {v1}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public static getFilesDir(Landroid/content/Context;)Ljava/lang/String;
    .locals 4
    .param p0, "applicationContext"    # Landroid/content/Context;

    .line 17
    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v0

    .line 18
    .local v0, "filesDir":Ljava/io/File;
    if-nez v0, :cond_0

    .line 19
    new-instance v1, Ljava/io/File;

    invoke-static {p0}, Lio/flutter/util/PathUtils;->getDataDirPath(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "files"

    invoke-direct {v1, v2, v3}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    move-object v0, v1

    .line 21
    :cond_0
    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
