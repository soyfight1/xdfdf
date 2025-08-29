.class Lio/flutter/plugin/platform/PlatformViewRegistryImpl;
.super Ljava/lang/Object;
.source "PlatformViewRegistryImpl.java"

# interfaces
.implements Lio/flutter/plugin/platform/PlatformViewRegistry;


# instance fields
.field private final viewFactories:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lio/flutter/plugin/platform/PlatformViewFactory;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>()V
    .locals 1

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lio/flutter/plugin/platform/PlatformViewRegistryImpl;->viewFactories:Ljava/util/Map;

    .line 14
    return-void
.end method


# virtual methods
.method getFactory(Ljava/lang/String;)Lio/flutter/plugin/platform/PlatformViewFactory;
    .locals 1
    .param p1, "viewTypeId"    # Ljava/lang/String;

    .line 27
    iget-object v0, p0, Lio/flutter/plugin/platform/PlatformViewRegistryImpl;->viewFactories:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/flutter/plugin/platform/PlatformViewFactory;

    return-object v0
.end method

.method public registerViewFactory(Ljava/lang/String;Lio/flutter/plugin/platform/PlatformViewFactory;)Z
    .locals 1
    .param p1, "viewTypeId"    # Ljava/lang/String;
    .param p2, "factory"    # Lio/flutter/plugin/platform/PlatformViewFactory;

    .line 21
    iget-object v0, p0, Lio/flutter/plugin/platform/PlatformViewRegistryImpl;->viewFactories:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    return v0

    .line 22
    :cond_0
    iget-object v0, p0, Lio/flutter/plugin/platform/PlatformViewRegistryImpl;->viewFactories:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 23
    const/4 v0, 0x1

    return v0
.end method
