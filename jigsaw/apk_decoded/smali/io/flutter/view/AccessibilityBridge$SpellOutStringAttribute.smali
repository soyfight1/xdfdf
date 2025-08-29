.class Lio/flutter/view/AccessibilityBridge$SpellOutStringAttribute;
.super Lio/flutter/view/AccessibilityBridge$StringAttribute;
.source "AccessibilityBridge.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/view/AccessibilityBridge;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "SpellOutStringAttribute"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 2262
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lio/flutter/view/AccessibilityBridge$StringAttribute;-><init>(Lio/flutter/view/AccessibilityBridge$1;)V

    return-void
.end method

.method synthetic constructor <init>(Lio/flutter/view/AccessibilityBridge$1;)V
    .locals 0
    .param p1, "x0"    # Lio/flutter/view/AccessibilityBridge$1;

    .line 2262
    invoke-direct {p0}, Lio/flutter/view/AccessibilityBridge$SpellOutStringAttribute;-><init>()V

    return-void
.end method
