.class public final Lio/flutter/embedding/engine/loader/ApplicationInfoLoader;
.super Ljava/lang/Object;
.source "ApplicationInfoLoader.java"


# static fields
.field public static final NETWORK_POLICY_METADATA_KEY:Ljava/lang/String; = "io.flutter.network-policy"

.field public static final PUBLIC_AOT_SHARED_LIBRARY_NAME:Ljava/lang/String;

.field public static final PUBLIC_AUTOMATICALLY_REGISTER_PLUGINS_METADATA_KEY:Ljava/lang/String; = "io.flutter.automatically-register-plugins"

.field public static final PUBLIC_FLUTTER_ASSETS_DIR_KEY:Ljava/lang/String;

.field public static final PUBLIC_ISOLATE_SNAPSHOT_DATA_KEY:Ljava/lang/String;

.field public static final PUBLIC_VM_SNAPSHOT_DATA_KEY:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 20
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-class v1, Lio/flutter/embedding/engine/loader/FlutterLoader;

    .line 21
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x2e

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "aot-shared-library-name"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lio/flutter/embedding/engine/loader/ApplicationInfoLoader;->PUBLIC_AOT_SHARED_LIBRARY_NAME:Ljava/lang/String;

    .line 22
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-class v2, Lio/flutter/embedding/engine/loader/FlutterLoader;

    .line 23
    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "vm-snapshot-data"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lio/flutter/embedding/engine/loader/ApplicationInfoLoader;->PUBLIC_VM_SNAPSHOT_DATA_KEY:Ljava/lang/String;

    .line 24
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-class v2, Lio/flutter/embedding/engine/loader/FlutterLoader;

    .line 25
    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "isolate-snapshot-data"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lio/flutter/embedding/engine/loader/ApplicationInfoLoader;->PUBLIC_ISOLATE_SNAPSHOT_DATA_KEY:Ljava/lang/String;

    .line 26
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-class v2, Lio/flutter/embedding/engine/loader/FlutterLoader;

    .line 27
    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "flutter-assets-dir"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lio/flutter/embedding/engine/loader/ApplicationInfoLoader;->PUBLIC_FLUTTER_ASSETS_DIR_KEY:Ljava/lang/String;

    .line 26
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static getApplicationInfo(Landroid/content/Context;)Landroid/content/pm/ApplicationInfo;
    .locals 3
    .param p0, "applicationContext"    # Landroid/content/Context;

    .line 35
    nop

    .line 36
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    .line 37
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x80

    invoke-virtual {v0, v1, v2}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object v0
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 35
    return-object v0

    .line 38
    :catch_0
    move-exception v0

    .line 39
    .local v0, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method private static getBoolean(Landroid/os/Bundle;Ljava/lang/String;Z)Z
    .locals 1
    .param p0, "metadata"    # Landroid/os/Bundle;
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "defaultValue"    # Z

    .line 51
    if-nez p0, :cond_0

    .line 52
    return p2

    .line 54
    :cond_0
    invoke-virtual {p0, p1, p2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method private static getNetworkPolicy(Landroid/content/pm/ApplicationInfo;Landroid/content/Context;)Ljava/lang/String;
    .locals 9
    .param p0, "appInfo"    # Landroid/content/pm/ApplicationInfo;
    .param p1, "context"    # Landroid/content/Context;

    .line 62
    iget-object v0, p0, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;

    .line 63
    .local v0, "metadata":Landroid/os/Bundle;
    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 64
    return-object v1

    .line 67
    :cond_0
    const-string v2, "io.flutter.network-policy"

    const/4 v3, 0x0

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v2

    .line 68
    .local v2, "networkSecurityConfigRes":I
    if-gtz v2, :cond_1

    .line 69
    return-object v1

    .line 72
    :cond_1
    new-instance v4, Lorg/json/JSONArray;

    invoke-direct {v4}, Lorg/json/JSONArray;-><init>()V

    .line 74
    .local v4, "output":Lorg/json/JSONArray;
    :try_start_0
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {v5, v2}, Landroid/content/res/Resources;->getXml(I)Landroid/content/res/XmlResourceParser;

    move-result-object v5

    .line 75
    .local v5, "xrp":Landroid/content/res/XmlResourceParser;
    invoke-interface {v5}, Landroid/content/res/XmlResourceParser;->next()I

    .line 76
    invoke-interface {v5}, Landroid/content/res/XmlResourceParser;->getEventType()I

    move-result v6

    .line 77
    .local v6, "eventType":I
    :goto_0
    const/4 v7, 0x1

    if-eq v6, v7, :cond_3

    .line 78
    const/4 v7, 0x2

    if-ne v6, v7, :cond_2

    .line 79
    invoke-interface {v5}, Landroid/content/res/XmlResourceParser;->getName()Ljava/lang/String;

    move-result-object v7

    const-string v8, "domain-config"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_2

    .line 80
    invoke-static {v5, v4, v3}, Lio/flutter/embedding/engine/loader/ApplicationInfoLoader;->parseDomainConfig(Landroid/content/res/XmlResourceParser;Lorg/json/JSONArray;Z)V

    .line 83
    :cond_2
    invoke-interface {v5}, Landroid/content/res/XmlResourceParser;->next()I

    move-result v7
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_0 .. :try_end_0} :catch_0

    move v6, v7

    goto :goto_0

    .line 87
    .end local v5    # "xrp":Landroid/content/res/XmlResourceParser;
    .end local v6    # "eventType":I
    :cond_3
    nop

    .line 88
    invoke-virtual {v4}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 85
    :catch_0
    move-exception v3

    goto :goto_1

    :catch_1
    move-exception v3

    .line 86
    .local v3, "e":Ljava/lang/Exception;
    :goto_1
    return-object v1
.end method

.method private static getString(Landroid/os/Bundle;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "metadata"    # Landroid/os/Bundle;
    .param p1, "key"    # Ljava/lang/String;

    .line 44
    const/4 v0, 0x0

    if-nez p0, :cond_0

    .line 45
    return-object v0

    .line 47
    :cond_0
    invoke-virtual {p0, p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static load(Landroid/content/Context;)Lio/flutter/embedding/engine/loader/FlutterApplicationInfo;
    .locals 11
    .param p0, "applicationContext"    # Landroid/content/Context;

    .line 148
    invoke-static {p0}, Lio/flutter/embedding/engine/loader/ApplicationInfoLoader;->getApplicationInfo(Landroid/content/Context;)Landroid/content/pm/ApplicationInfo;

    move-result-object v0

    .line 149
    .local v0, "appInfo":Landroid/content/pm/ApplicationInfo;
    new-instance v9, Lio/flutter/embedding/engine/loader/FlutterApplicationInfo;

    iget-object v1, v0, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;

    sget-object v2, Lio/flutter/embedding/engine/loader/ApplicationInfoLoader;->PUBLIC_AOT_SHARED_LIBRARY_NAME:Ljava/lang/String;

    .line 150
    invoke-static {v1, v2}, Lio/flutter/embedding/engine/loader/ApplicationInfoLoader;->getString(Landroid/os/Bundle;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iget-object v1, v0, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;

    sget-object v3, Lio/flutter/embedding/engine/loader/ApplicationInfoLoader;->PUBLIC_VM_SNAPSHOT_DATA_KEY:Ljava/lang/String;

    .line 151
    invoke-static {v1, v3}, Lio/flutter/embedding/engine/loader/ApplicationInfoLoader;->getString(Landroid/os/Bundle;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iget-object v1, v0, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;

    sget-object v4, Lio/flutter/embedding/engine/loader/ApplicationInfoLoader;->PUBLIC_ISOLATE_SNAPSHOT_DATA_KEY:Ljava/lang/String;

    .line 152
    invoke-static {v1, v4}, Lio/flutter/embedding/engine/loader/ApplicationInfoLoader;->getString(Landroid/os/Bundle;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iget-object v1, v0, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;

    sget-object v5, Lio/flutter/embedding/engine/loader/ApplicationInfoLoader;->PUBLIC_FLUTTER_ASSETS_DIR_KEY:Ljava/lang/String;

    .line 153
    invoke-static {v1, v5}, Lio/flutter/embedding/engine/loader/ApplicationInfoLoader;->getString(Landroid/os/Bundle;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 154
    invoke-static {v0, p0}, Lio/flutter/embedding/engine/loader/ApplicationInfoLoader;->getNetworkPolicy(Landroid/content/pm/ApplicationInfo;Landroid/content/Context;)Ljava/lang/String;

    move-result-object v6

    iget-object v7, v0, Landroid/content/pm/ApplicationInfo;->nativeLibraryDir:Ljava/lang/String;

    iget-object v1, v0, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;

    .line 156
    const-string v8, "io.flutter.automatically-register-plugins"

    const/4 v10, 0x1

    invoke-static {v1, v8, v10}, Lio/flutter/embedding/engine/loader/ApplicationInfoLoader;->getBoolean(Landroid/os/Bundle;Ljava/lang/String;Z)Z

    move-result v8

    move-object v1, v9

    invoke-direct/range {v1 .. v8}, Lio/flutter/embedding/engine/loader/FlutterApplicationInfo;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V

    .line 149
    return-object v9
.end method

.method private static parseDomain(Landroid/content/res/XmlResourceParser;Lorg/json/JSONArray;Z)V
    .locals 5
    .param p0, "xrp"    # Landroid/content/res/XmlResourceParser;
    .param p1, "output"    # Lorg/json/JSONArray;
    .param p2, "cleartextPermitted"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/xmlpull/v1/XmlPullParserException;
        }
    .end annotation

    .line 125
    const-string v0, "includeSubdomains"

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-interface {p0, v2, v0, v1}, Landroid/content/res/XmlResourceParser;->getAttributeBooleanValue(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v0

    .line 126
    .local v0, "includeSubDomains":Z
    invoke-interface {p0}, Landroid/content/res/XmlResourceParser;->next()I

    .line 127
    invoke-interface {p0}, Landroid/content/res/XmlResourceParser;->getEventType()I

    move-result v1

    const/4 v2, 0x4

    if-ne v1, v2, :cond_1

    .line 130
    invoke-interface {p0}, Landroid/content/res/XmlResourceParser;->getText()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    .line 131
    .local v1, "domain":Ljava/lang/String;
    new-instance v2, Lorg/json/JSONArray;

    invoke-direct {v2}, Lorg/json/JSONArray;-><init>()V

    .line 132
    .local v2, "outputArray":Lorg/json/JSONArray;
    invoke-virtual {v2, v1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 133
    invoke-virtual {v2, v0}, Lorg/json/JSONArray;->put(Z)Lorg/json/JSONArray;

    .line 134
    invoke-virtual {v2, p2}, Lorg/json/JSONArray;->put(Z)Lorg/json/JSONArray;

    .line 135
    invoke-virtual {p1, v2}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 136
    invoke-interface {p0}, Landroid/content/res/XmlResourceParser;->next()I

    .line 137
    invoke-interface {p0}, Landroid/content/res/XmlResourceParser;->getEventType()I

    move-result v3

    const/4 v4, 0x3

    if-ne v3, v4, :cond_0

    .line 140
    return-void

    .line 138
    :cond_0
    new-instance v3, Ljava/lang/IllegalStateException;

    const-string v4, "Expected end of domain tag"

    invoke-direct {v3, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 128
    .end local v1    # "domain":Ljava/lang/String;
    .end local v2    # "outputArray":Lorg/json/JSONArray;
    :cond_1
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Expected text"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private static parseDomainConfig(Landroid/content/res/XmlResourceParser;Lorg/json/JSONArray;Z)V
    .locals 4
    .param p0, "xrp"    # Landroid/content/res/XmlResourceParser;
    .param p1, "output"    # Lorg/json/JSONArray;
    .param p2, "inheritedCleartextPermitted"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/xmlpull/v1/XmlPullParserException;
        }
    .end annotation

    .line 94
    nop

    .line 95
    const/4 v0, 0x0

    const-string v1, "cleartextTrafficPermitted"

    invoke-interface {p0, v0, v1, p2}, Landroid/content/res/XmlResourceParser;->getAttributeBooleanValue(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v0

    .line 98
    .local v0, "cleartextTrafficPermitted":Z
    :goto_0
    invoke-interface {p0}, Landroid/content/res/XmlResourceParser;->next()I

    move-result v1

    .line 99
    .local v1, "eventType":I
    const/4 v2, 0x2

    if-ne v1, v2, :cond_2

    .line 100
    invoke-interface {p0}, Landroid/content/res/XmlResourceParser;->getName()Ljava/lang/String;

    move-result-object v2

    const-string v3, "domain"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 102
    invoke-static {p0, p1, v0}, Lio/flutter/embedding/engine/loader/ApplicationInfoLoader;->parseDomain(Landroid/content/res/XmlResourceParser;Lorg/json/JSONArray;Z)V

    goto :goto_1

    .line 103
    :cond_0
    invoke-interface {p0}, Landroid/content/res/XmlResourceParser;->getName()Ljava/lang/String;

    move-result-object v2

    const-string v3, "domain-config"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 104
    invoke-static {p0, p1, v0}, Lio/flutter/embedding/engine/loader/ApplicationInfoLoader;->parseDomainConfig(Landroid/content/res/XmlResourceParser;Lorg/json/JSONArray;Z)V

    goto :goto_1

    .line 106
    :cond_1
    invoke-static {p0}, Lio/flutter/embedding/engine/loader/ApplicationInfoLoader;->skipTag(Landroid/content/res/XmlResourceParser;)V

    goto :goto_1

    .line 108
    :cond_2
    const/4 v2, 0x3

    if-ne v1, v2, :cond_3

    .line 109
    nop

    .line 112
    .end local v1    # "eventType":I
    return-void

    .line 111
    :cond_3
    :goto_1
    goto :goto_0
.end method

.method private static skipTag(Landroid/content/res/XmlResourceParser;)V
    .locals 3
    .param p0, "xrp"    # Landroid/content/res/XmlResourceParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/xmlpull/v1/XmlPullParserException;
        }
    .end annotation

    .line 115
    invoke-interface {p0}, Landroid/content/res/XmlResourceParser;->getName()Ljava/lang/String;

    move-result-object v0

    .line 116
    .local v0, "name":Ljava/lang/String;
    invoke-interface {p0}, Landroid/content/res/XmlResourceParser;->getEventType()I

    move-result v1

    .line 117
    .local v1, "eventType":I
    :goto_0
    const/4 v2, 0x3

    if-ne v1, v2, :cond_1

    invoke-interface {p0}, Landroid/content/res/XmlResourceParser;->getName()Ljava/lang/String;

    move-result-object v2

    if-eq v2, v0, :cond_0

    goto :goto_1

    .line 120
    :cond_0
    return-void

    .line 118
    :cond_1
    :goto_1
    invoke-interface {p0}, Landroid/content/res/XmlResourceParser;->next()I

    move-result v1

    goto :goto_0
.end method
