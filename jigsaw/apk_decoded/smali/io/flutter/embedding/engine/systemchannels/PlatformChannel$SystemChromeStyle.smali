.class public Lio/flutter/embedding/engine/systemchannels/PlatformChannel$SystemChromeStyle;
.super Ljava/lang/Object;
.source "PlatformChannel.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/embedding/engine/systemchannels/PlatformChannel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "SystemChromeStyle"
.end annotation


# instance fields
.field public final statusBarColor:Ljava/lang/Integer;

.field public final statusBarIconBrightness:Lio/flutter/embedding/engine/systemchannels/PlatformChannel$Brightness;

.field public final systemNavigationBarColor:Ljava/lang/Integer;

.field public final systemNavigationBarContrastEnforced:Ljava/lang/Boolean;

.field public final systemNavigationBarDividerColor:Ljava/lang/Integer;

.field public final systemNavigationBarIconBrightness:Lio/flutter/embedding/engine/systemchannels/PlatformChannel$Brightness;

.field public final systemStatusBarContrastEnforced:Ljava/lang/Boolean;


# direct methods
.method public constructor <init>(Ljava/lang/Integer;Lio/flutter/embedding/engine/systemchannels/PlatformChannel$Brightness;Ljava/lang/Boolean;Ljava/lang/Integer;Lio/flutter/embedding/engine/systemchannels/PlatformChannel$Brightness;Ljava/lang/Integer;Ljava/lang/Boolean;)V
    .locals 0
    .param p1, "statusBarColor"    # Ljava/lang/Integer;
    .param p2, "statusBarIconBrightness"    # Lio/flutter/embedding/engine/systemchannels/PlatformChannel$Brightness;
    .param p3, "systemStatusBarContrastEnforced"    # Ljava/lang/Boolean;
    .param p4, "systemNavigationBarColor"    # Ljava/lang/Integer;
    .param p5, "systemNavigationBarIconBrightness"    # Lio/flutter/embedding/engine/systemchannels/PlatformChannel$Brightness;
    .param p6, "systemNavigationBarDividerColor"    # Ljava/lang/Integer;
    .param p7, "systemNavigationBarContrastEnforced"    # Ljava/lang/Boolean;

    .line 730
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 731
    iput-object p1, p0, Lio/flutter/embedding/engine/systemchannels/PlatformChannel$SystemChromeStyle;->statusBarColor:Ljava/lang/Integer;

    .line 732
    iput-object p2, p0, Lio/flutter/embedding/engine/systemchannels/PlatformChannel$SystemChromeStyle;->statusBarIconBrightness:Lio/flutter/embedding/engine/systemchannels/PlatformChannel$Brightness;

    .line 733
    iput-object p3, p0, Lio/flutter/embedding/engine/systemchannels/PlatformChannel$SystemChromeStyle;->systemStatusBarContrastEnforced:Ljava/lang/Boolean;

    .line 734
    iput-object p4, p0, Lio/flutter/embedding/engine/systemchannels/PlatformChannel$SystemChromeStyle;->systemNavigationBarColor:Ljava/lang/Integer;

    .line 735
    iput-object p5, p0, Lio/flutter/embedding/engine/systemchannels/PlatformChannel$SystemChromeStyle;->systemNavigationBarIconBrightness:Lio/flutter/embedding/engine/systemchannels/PlatformChannel$Brightness;

    .line 736
    iput-object p6, p0, Lio/flutter/embedding/engine/systemchannels/PlatformChannel$SystemChromeStyle;->systemNavigationBarDividerColor:Ljava/lang/Integer;

    .line 737
    iput-object p7, p0, Lio/flutter/embedding/engine/systemchannels/PlatformChannel$SystemChromeStyle;->systemNavigationBarContrastEnforced:Ljava/lang/Boolean;

    .line 738
    return-void
.end method
