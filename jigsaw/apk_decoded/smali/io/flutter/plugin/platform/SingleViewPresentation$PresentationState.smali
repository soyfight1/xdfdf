.class Lio/flutter/plugin/platform/SingleViewPresentation$PresentationState;
.super Ljava/lang/Object;
.source "SingleViewPresentation.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/plugin/platform/SingleViewPresentation;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "PresentationState"
.end annotation


# instance fields
.field private fakeWindowViewGroup:Lio/flutter/plugin/platform/SingleViewFakeWindowViewGroup;

.field private platformView:Lio/flutter/plugin/platform/PlatformView;

.field private windowManagerHandler:Lio/flutter/plugin/platform/WindowManagerHandler;


# direct methods
.method constructor <init>()V
    .locals 0

    .line 53
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lio/flutter/plugin/platform/SingleViewPresentation$PresentationState;)Lio/flutter/plugin/platform/PlatformView;
    .locals 1
    .param p0, "x0"    # Lio/flutter/plugin/platform/SingleViewPresentation$PresentationState;

    .line 53
    iget-object v0, p0, Lio/flutter/plugin/platform/SingleViewPresentation$PresentationState;->platformView:Lio/flutter/plugin/platform/PlatformView;

    return-object v0
.end method

.method static synthetic access$002(Lio/flutter/plugin/platform/SingleViewPresentation$PresentationState;Lio/flutter/plugin/platform/PlatformView;)Lio/flutter/plugin/platform/PlatformView;
    .locals 0
    .param p0, "x0"    # Lio/flutter/plugin/platform/SingleViewPresentation$PresentationState;
    .param p1, "x1"    # Lio/flutter/plugin/platform/PlatformView;

    .line 53
    iput-object p1, p0, Lio/flutter/plugin/platform/SingleViewPresentation$PresentationState;->platformView:Lio/flutter/plugin/platform/PlatformView;

    return-object p1
.end method

.method static synthetic access$100(Lio/flutter/plugin/platform/SingleViewPresentation$PresentationState;)Lio/flutter/plugin/platform/SingleViewFakeWindowViewGroup;
    .locals 1
    .param p0, "x0"    # Lio/flutter/plugin/platform/SingleViewPresentation$PresentationState;

    .line 53
    iget-object v0, p0, Lio/flutter/plugin/platform/SingleViewPresentation$PresentationState;->fakeWindowViewGroup:Lio/flutter/plugin/platform/SingleViewFakeWindowViewGroup;

    return-object v0
.end method

.method static synthetic access$102(Lio/flutter/plugin/platform/SingleViewPresentation$PresentationState;Lio/flutter/plugin/platform/SingleViewFakeWindowViewGroup;)Lio/flutter/plugin/platform/SingleViewFakeWindowViewGroup;
    .locals 0
    .param p0, "x0"    # Lio/flutter/plugin/platform/SingleViewPresentation$PresentationState;
    .param p1, "x1"    # Lio/flutter/plugin/platform/SingleViewFakeWindowViewGroup;

    .line 53
    iput-object p1, p0, Lio/flutter/plugin/platform/SingleViewPresentation$PresentationState;->fakeWindowViewGroup:Lio/flutter/plugin/platform/SingleViewFakeWindowViewGroup;

    return-object p1
.end method

.method static synthetic access$200(Lio/flutter/plugin/platform/SingleViewPresentation$PresentationState;)Lio/flutter/plugin/platform/WindowManagerHandler;
    .locals 1
    .param p0, "x0"    # Lio/flutter/plugin/platform/SingleViewPresentation$PresentationState;

    .line 53
    iget-object v0, p0, Lio/flutter/plugin/platform/SingleViewPresentation$PresentationState;->windowManagerHandler:Lio/flutter/plugin/platform/WindowManagerHandler;

    return-object v0
.end method

.method static synthetic access$202(Lio/flutter/plugin/platform/SingleViewPresentation$PresentationState;Lio/flutter/plugin/platform/WindowManagerHandler;)Lio/flutter/plugin/platform/WindowManagerHandler;
    .locals 0
    .param p0, "x0"    # Lio/flutter/plugin/platform/SingleViewPresentation$PresentationState;
    .param p1, "x1"    # Lio/flutter/plugin/platform/WindowManagerHandler;

    .line 53
    iput-object p1, p0, Lio/flutter/plugin/platform/SingleViewPresentation$PresentationState;->windowManagerHandler:Lio/flutter/plugin/platform/WindowManagerHandler;

    return-object p1
.end method
