.class public Lio/flutter/plugin/platform/PlatformOverlayView;
.super Lio/flutter/embedding/android/FlutterImageView;
.source "PlatformOverlayView.java"


# instance fields
.field private accessibilityDelegate:Lio/flutter/plugin/platform/AccessibilityEventsDelegate;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .line 28
    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, v0, v1}, Lio/flutter/plugin/platform/PlatformOverlayView;-><init>(Landroid/content/Context;IILio/flutter/plugin/platform/AccessibilityEventsDelegate;)V

    .line 29
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;IILio/flutter/plugin/platform/AccessibilityEventsDelegate;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "width"    # I
    .param p3, "height"    # I
    .param p4, "accessibilityDelegate"    # Lio/flutter/plugin/platform/AccessibilityEventsDelegate;

    .line 23
    sget-object v0, Lio/flutter/embedding/android/FlutterImageView$SurfaceKind;->overlay:Lio/flutter/embedding/android/FlutterImageView$SurfaceKind;

    invoke-direct {p0, p1, p2, p3, v0}, Lio/flutter/embedding/android/FlutterImageView;-><init>(Landroid/content/Context;IILio/flutter/embedding/android/FlutterImageView$SurfaceKind;)V

    .line 24
    iput-object p4, p0, Lio/flutter/plugin/platform/PlatformOverlayView;->accessibilityDelegate:Lio/flutter/plugin/platform/AccessibilityEventsDelegate;

    .line 25
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .line 32
    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, v0, v1}, Lio/flutter/plugin/platform/PlatformOverlayView;-><init>(Landroid/content/Context;IILio/flutter/plugin/platform/AccessibilityEventsDelegate;)V

    .line 33
    return-void
.end method


# virtual methods
.method public onHoverEvent(Landroid/view/MotionEvent;)Z
    .locals 2
    .param p1, "event"    # Landroid/view/MotionEvent;

    .line 43
    iget-object v0, p0, Lio/flutter/plugin/platform/PlatformOverlayView;->accessibilityDelegate:Lio/flutter/plugin/platform/AccessibilityEventsDelegate;

    if-eqz v0, :cond_0

    .line 44
    const/4 v1, 0x1

    invoke-virtual {v0, p1, v1}, Lio/flutter/plugin/platform/AccessibilityEventsDelegate;->onAccessibilityHoverEvent(Landroid/view/MotionEvent;Z)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 45
    return v1

    .line 47
    :cond_0
    invoke-super {p0, p1}, Lio/flutter/embedding/android/FlutterImageView;->onHoverEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    return v0
.end method
