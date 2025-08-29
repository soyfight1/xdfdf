.class public final synthetic Lio/flutter/view/TextureRegistry$SurfaceProducer$Callback$-CC;
.super Ljava/lang/Object;
.source "TextureRegistry.java"


# direct methods
.method public static $default$onSurfaceAvailable(Lio/flutter/view/TextureRegistry$SurfaceProducer$Callback;)V
    .locals 0
    .param p0, "_this"    # Lio/flutter/view/TextureRegistry$SurfaceProducer$Callback;

    .line 140
    invoke-interface {p0}, Lio/flutter/view/TextureRegistry$SurfaceProducer$Callback;->onSurfaceCreated()V

    .line 141
    return-void
.end method

.method public static $default$onSurfaceCreated(Lio/flutter/view/TextureRegistry$SurfaceProducer$Callback;)V
    .locals 0
    .param p0, "_this"    # Lio/flutter/view/TextureRegistry$SurfaceProducer$Callback;
    .annotation runtime Ljava/lang/Deprecated;
        forRemoval = true
        since = "Flutter 3.27"
    .end annotation

    .line 114
    return-void
.end method
