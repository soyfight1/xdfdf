.class public interface abstract Lio/flutter/view/TextureRegistry$SurfaceProducer$Callback;
.super Ljava/lang/Object;
.source "TextureRegistry.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/view/TextureRegistry$SurfaceProducer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "Callback"
.end annotation


# virtual methods
.method public abstract onSurfaceAvailable()V
.end method

.method public abstract onSurfaceCreated()V
    .annotation runtime Ljava/lang/Deprecated;
        forRemoval = true
        since = "Flutter 3.27"
    .end annotation
.end method

.method public abstract onSurfaceDestroyed()V
.end method
