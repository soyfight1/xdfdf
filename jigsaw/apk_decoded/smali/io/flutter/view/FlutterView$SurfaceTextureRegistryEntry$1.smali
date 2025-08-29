.class Lio/flutter/view/FlutterView$SurfaceTextureRegistryEntry$1;
.super Ljava/lang/Object;
.source "FlutterView.java"

# interfaces
.implements Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/view/FlutterView$SurfaceTextureRegistryEntry;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lio/flutter/view/FlutterView$SurfaceTextureRegistryEntry;


# direct methods
.method constructor <init>(Lio/flutter/view/FlutterView$SurfaceTextureRegistryEntry;)V
    .locals 0
    .param p1, "this$1"    # Lio/flutter/view/FlutterView$SurfaceTextureRegistryEntry;

    .line 941
    iput-object p1, p0, Lio/flutter/view/FlutterView$SurfaceTextureRegistryEntry$1;->this$1:Lio/flutter/view/FlutterView$SurfaceTextureRegistryEntry;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onFrameAvailable(Landroid/graphics/SurfaceTexture;)V
    .locals 3
    .param p1, "texture"    # Landroid/graphics/SurfaceTexture;

    .line 944
    iget-object v0, p0, Lio/flutter/view/FlutterView$SurfaceTextureRegistryEntry$1;->this$1:Lio/flutter/view/FlutterView$SurfaceTextureRegistryEntry;

    invoke-static {v0}, Lio/flutter/view/FlutterView$SurfaceTextureRegistryEntry;->access$200(Lio/flutter/view/FlutterView$SurfaceTextureRegistryEntry;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lio/flutter/view/FlutterView$SurfaceTextureRegistryEntry$1;->this$1:Lio/flutter/view/FlutterView$SurfaceTextureRegistryEntry;

    iget-object v0, v0, Lio/flutter/view/FlutterView$SurfaceTextureRegistryEntry;->this$0:Lio/flutter/view/FlutterView;

    invoke-static {v0}, Lio/flutter/view/FlutterView;->access$100(Lio/flutter/view/FlutterView;)Lio/flutter/view/FlutterNativeView;

    move-result-object v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 952
    :cond_0
    iget-object v0, p0, Lio/flutter/view/FlutterView$SurfaceTextureRegistryEntry$1;->this$1:Lio/flutter/view/FlutterView$SurfaceTextureRegistryEntry;

    iget-object v0, v0, Lio/flutter/view/FlutterView$SurfaceTextureRegistryEntry;->this$0:Lio/flutter/view/FlutterView;

    invoke-static {v0}, Lio/flutter/view/FlutterView;->access$100(Lio/flutter/view/FlutterView;)Lio/flutter/view/FlutterNativeView;

    move-result-object v0

    .line 953
    invoke-virtual {v0}, Lio/flutter/view/FlutterNativeView;->getFlutterJNI()Lio/flutter/embedding/engine/FlutterJNI;

    move-result-object v0

    iget-object v1, p0, Lio/flutter/view/FlutterView$SurfaceTextureRegistryEntry$1;->this$1:Lio/flutter/view/FlutterView$SurfaceTextureRegistryEntry;

    .line 954
    invoke-static {v1}, Lio/flutter/view/FlutterView$SurfaceTextureRegistryEntry;->access$300(Lio/flutter/view/FlutterView$SurfaceTextureRegistryEntry;)J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lio/flutter/embedding/engine/FlutterJNI;->markTextureFrameAvailable(J)V

    .line 955
    return-void

    .line 949
    :cond_1
    :goto_0
    return-void
.end method
