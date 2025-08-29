.class Lio/flutter/plugin/platform/PlatformViewWrapper$1;
.super Ljava/lang/Object;
.source "PlatformViewWrapper.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalFocusChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/flutter/plugin/platform/PlatformViewWrapper;->setOnDescendantFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lio/flutter/plugin/platform/PlatformViewWrapper;

.field final synthetic val$userFocusListener:Landroid/view/View$OnFocusChangeListener;


# direct methods
.method constructor <init>(Lio/flutter/plugin/platform/PlatformViewWrapper;Landroid/view/View$OnFocusChangeListener;)V
    .locals 0
    .param p1, "this$0"    # Lio/flutter/plugin/platform/PlatformViewWrapper;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 232
    iput-object p1, p0, Lio/flutter/plugin/platform/PlatformViewWrapper$1;->this$0:Lio/flutter/plugin/platform/PlatformViewWrapper;

    iput-object p2, p0, Lio/flutter/plugin/platform/PlatformViewWrapper$1;->val$userFocusListener:Landroid/view/View$OnFocusChangeListener;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onGlobalFocusChanged(Landroid/view/View;Landroid/view/View;)V
    .locals 3
    .param p1, "oldFocus"    # Landroid/view/View;
    .param p2, "newFocus"    # Landroid/view/View;

    .line 235
    iget-object v0, p0, Lio/flutter/plugin/platform/PlatformViewWrapper$1;->val$userFocusListener:Landroid/view/View$OnFocusChangeListener;

    iget-object v1, p0, Lio/flutter/plugin/platform/PlatformViewWrapper$1;->this$0:Lio/flutter/plugin/platform/PlatformViewWrapper;

    .line 236
    invoke-static {v1}, Lio/flutter/util/ViewUtils;->childHasFocus(Landroid/view/View;)Z

    move-result v2

    .line 235
    invoke-interface {v0, v1, v2}, Landroid/view/View$OnFocusChangeListener;->onFocusChange(Landroid/view/View;Z)V

    .line 237
    return-void
.end method
