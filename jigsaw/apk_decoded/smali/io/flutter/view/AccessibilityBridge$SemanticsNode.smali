.class Lio/flutter/view/AccessibilityBridge$SemanticsNode;
.super Ljava/lang/Object;
.source "AccessibilityBridge.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/view/AccessibilityBridge;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "SemanticsNode"
.end annotation


# instance fields
.field final accessibilityBridge:Lio/flutter/view/AccessibilityBridge;

.field private actions:I

.field private bottom:F

.field private childrenInHitTestOrder:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lio/flutter/view/AccessibilityBridge$SemanticsNode;",
            ">;"
        }
    .end annotation
.end field

.field private childrenInTraversalOrder:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lio/flutter/view/AccessibilityBridge$SemanticsNode;",
            ">;"
        }
    .end annotation
.end field

.field private currentValueLength:I

.field private customAccessibilityActions:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lio/flutter/view/AccessibilityBridge$CustomAccessibilityAction;",
            ">;"
        }
    .end annotation
.end field

.field private decreasedValue:Ljava/lang/String;

.field private decreasedValueAttributes:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lio/flutter/view/AccessibilityBridge$StringAttribute;",
            ">;"
        }
    .end annotation
.end field

.field private flags:I

.field private globalGeometryDirty:Z

.field private globalRect:Landroid/graphics/Rect;

.field private globalTransform:[F

.field private hadPreviousConfig:Z

.field private hint:Ljava/lang/String;

.field private hintAttributes:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lio/flutter/view/AccessibilityBridge$StringAttribute;",
            ">;"
        }
    .end annotation
.end field

.field private id:I

.field private identifier:Ljava/lang/String;

.field private increasedValue:Ljava/lang/String;

.field private increasedValueAttributes:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lio/flutter/view/AccessibilityBridge$StringAttribute;",
            ">;"
        }
    .end annotation
.end field

.field private inverseTransform:[F

.field private inverseTransformDirty:Z

.field private label:Ljava/lang/String;

.field private labelAttributes:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lio/flutter/view/AccessibilityBridge$StringAttribute;",
            ">;"
        }
    .end annotation
.end field

.field private left:F

.field private maxValueLength:I

.field private onLongPressOverride:Lio/flutter/view/AccessibilityBridge$CustomAccessibilityAction;

.field private onTapOverride:Lio/flutter/view/AccessibilityBridge$CustomAccessibilityAction;

.field private parent:Lio/flutter/view/AccessibilityBridge$SemanticsNode;

.field private platformViewId:I

.field private previousActions:I

.field private previousFlags:I

.field private previousLabel:Ljava/lang/String;

.field private previousNodeId:I

.field private previousScrollExtentMax:F

.field private previousScrollExtentMin:F

.field private previousScrollPosition:F

.field private previousTextSelectionBase:I

.field private previousTextSelectionExtent:I

.field private previousValue:Ljava/lang/String;

.field private right:F

.field private scrollChildren:I

.field private scrollExtentMax:F

.field private scrollExtentMin:F

.field private scrollIndex:I

.field private scrollPosition:F

.field private textDirection:Lio/flutter/view/AccessibilityBridge$TextDirection;

.field private textSelectionBase:I

.field private textSelectionExtent:I

.field private tooltip:Ljava/lang/String;

.field private top:F

.field private transform:[F

.field private value:Ljava/lang/String;

.field private valueAttributes:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lio/flutter/view/AccessibilityBridge$StringAttribute;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lio/flutter/view/AccessibilityBridge;)V
    .locals 1
    .param p1, "accessibilityBridge"    # Lio/flutter/view/AccessibilityBridge;

    .line 2368
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2289
    const/4 v0, -0x1

    iput v0, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->id:I

    .line 2332
    iput v0, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->previousNodeId:I

    .line 2337
    const/4 v0, 0x0

    iput-boolean v0, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->hadPreviousConfig:Z

    .line 2355
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->childrenInTraversalOrder:Ljava/util/List;

    .line 2356
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->childrenInHitTestOrder:Ljava/util/List;

    .line 2361
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->inverseTransformDirty:Z

    .line 2364
    iput-boolean v0, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->globalGeometryDirty:Z

    .line 2369
    iput-object p1, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->accessibilityBridge:Lio/flutter/view/AccessibilityBridge;

    .line 2370
    return-void
.end method

.method static synthetic access$000(Lio/flutter/view/AccessibilityBridge$SemanticsNode;)I
    .locals 1
    .param p0, "x0"    # Lio/flutter/view/AccessibilityBridge$SemanticsNode;

    .line 2280
    iget v0, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->id:I

    return v0
.end method

.method static synthetic access$002(Lio/flutter/view/AccessibilityBridge$SemanticsNode;I)I
    .locals 0
    .param p0, "x0"    # Lio/flutter/view/AccessibilityBridge$SemanticsNode;
    .param p1, "x1"    # I

    .line 2280
    iput p1, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->id:I

    return p1
.end method

.method static synthetic access$1400(Lio/flutter/view/AccessibilityBridge$SemanticsNode;)I
    .locals 1
    .param p0, "x0"    # Lio/flutter/view/AccessibilityBridge$SemanticsNode;

    .line 2280
    iget v0, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->scrollChildren:I

    return v0
.end method

.method static synthetic access$1500(Lio/flutter/view/AccessibilityBridge$SemanticsNode;Lio/flutter/util/Predicate;)Z
    .locals 1
    .param p0, "x0"    # Lio/flutter/view/AccessibilityBridge$SemanticsNode;
    .param p1, "x1"    # Lio/flutter/util/Predicate;

    .line 2280
    invoke-static {p0, p1}, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->nullableHasAncestor(Lio/flutter/view/AccessibilityBridge$SemanticsNode;Lio/flutter/util/Predicate;)Z

    move-result v0

    return v0
.end method

.method static synthetic access$1600(Lio/flutter/view/AccessibilityBridge$SemanticsNode;)I
    .locals 1
    .param p0, "x0"    # Lio/flutter/view/AccessibilityBridge$SemanticsNode;

    .line 2280
    iget v0, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->platformViewId:I

    return v0
.end method

.method static synthetic access$1700(Lio/flutter/view/AccessibilityBridge$SemanticsNode;)Landroid/graphics/Rect;
    .locals 1
    .param p0, "x0"    # Lio/flutter/view/AccessibilityBridge$SemanticsNode;

    .line 2280
    invoke-direct {p0}, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->getGlobalRect()Landroid/graphics/Rect;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$1800(Lio/flutter/view/AccessibilityBridge$SemanticsNode;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lio/flutter/view/AccessibilityBridge$SemanticsNode;

    .line 2280
    iget-object v0, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->identifier:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$1900(Lio/flutter/view/AccessibilityBridge$SemanticsNode;)Z
    .locals 1
    .param p0, "x0"    # Lio/flutter/view/AccessibilityBridge$SemanticsNode;

    .line 2280
    invoke-direct {p0}, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->isFocusable()Z

    move-result v0

    return v0
.end method

.method static synthetic access$2000(Lio/flutter/view/AccessibilityBridge$SemanticsNode;Lio/flutter/view/AccessibilityBridge$Flag;)Z
    .locals 1
    .param p0, "x0"    # Lio/flutter/view/AccessibilityBridge$SemanticsNode;
    .param p1, "x1"    # Lio/flutter/view/AccessibilityBridge$Flag;

    .line 2280
    invoke-direct {p0, p1}, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->hasFlag(Lio/flutter/view/AccessibilityBridge$Flag;)Z

    move-result v0

    return v0
.end method

.method static synthetic access$2100(Lio/flutter/view/AccessibilityBridge$SemanticsNode;)I
    .locals 1
    .param p0, "x0"    # Lio/flutter/view/AccessibilityBridge$SemanticsNode;

    .line 2280
    iget v0, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->textSelectionBase:I

    return v0
.end method

.method static synthetic access$2102(Lio/flutter/view/AccessibilityBridge$SemanticsNode;I)I
    .locals 0
    .param p0, "x0"    # Lio/flutter/view/AccessibilityBridge$SemanticsNode;
    .param p1, "x1"    # I

    .line 2280
    iput p1, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->textSelectionBase:I

    return p1
.end method

.method static synthetic access$2200(Lio/flutter/view/AccessibilityBridge$SemanticsNode;)I
    .locals 1
    .param p0, "x0"    # Lio/flutter/view/AccessibilityBridge$SemanticsNode;

    .line 2280
    iget v0, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->textSelectionExtent:I

    return v0
.end method

.method static synthetic access$2202(Lio/flutter/view/AccessibilityBridge$SemanticsNode;I)I
    .locals 0
    .param p0, "x0"    # Lio/flutter/view/AccessibilityBridge$SemanticsNode;
    .param p1, "x1"    # I

    .line 2280
    iput p1, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->textSelectionExtent:I

    return p1
.end method

.method static synthetic access$2212(Lio/flutter/view/AccessibilityBridge$SemanticsNode;I)I
    .locals 1
    .param p0, "x0"    # Lio/flutter/view/AccessibilityBridge$SemanticsNode;
    .param p1, "x1"    # I

    .line 2280
    iget v0, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->textSelectionExtent:I

    add-int/2addr v0, p1

    iput v0, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->textSelectionExtent:I

    return v0
.end method

.method static synthetic access$2220(Lio/flutter/view/AccessibilityBridge$SemanticsNode;I)I
    .locals 1
    .param p0, "x0"    # Lio/flutter/view/AccessibilityBridge$SemanticsNode;
    .param p1, "x1"    # I

    .line 2280
    iget v0, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->textSelectionExtent:I

    sub-int/2addr v0, p1

    iput v0, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->textSelectionExtent:I

    return v0
.end method

.method static synthetic access$2300(Lio/flutter/view/AccessibilityBridge$SemanticsNode;Lio/flutter/view/AccessibilityBridge$Action;)Z
    .locals 1
    .param p0, "x0"    # Lio/flutter/view/AccessibilityBridge$SemanticsNode;
    .param p1, "x1"    # Lio/flutter/view/AccessibilityBridge$Action;

    .line 2280
    invoke-direct {p0, p1}, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->hasAction(Lio/flutter/view/AccessibilityBridge$Action;)Z

    move-result v0

    return v0
.end method

.method static synthetic access$2400(Lio/flutter/view/AccessibilityBridge$SemanticsNode;)I
    .locals 1
    .param p0, "x0"    # Lio/flutter/view/AccessibilityBridge$SemanticsNode;

    .line 2280
    iget v0, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->maxValueLength:I

    return v0
.end method

.method static synthetic access$2500(Lio/flutter/view/AccessibilityBridge$SemanticsNode;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lio/flutter/view/AccessibilityBridge$SemanticsNode;

    .line 2280
    iget-object v0, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->value:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$2502(Lio/flutter/view/AccessibilityBridge$SemanticsNode;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p0, "x0"    # Lio/flutter/view/AccessibilityBridge$SemanticsNode;
    .param p1, "x1"    # Ljava/lang/String;

    .line 2280
    iput-object p1, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->value:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$2600(Lio/flutter/view/AccessibilityBridge$SemanticsNode;)I
    .locals 1
    .param p0, "x0"    # Lio/flutter/view/AccessibilityBridge$SemanticsNode;

    .line 2280
    iget v0, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->currentValueLength:I

    return v0
.end method

.method static synthetic access$2700(Lio/flutter/view/AccessibilityBridge$SemanticsNode;)Lio/flutter/view/AccessibilityBridge$SemanticsNode;
    .locals 1
    .param p0, "x0"    # Lio/flutter/view/AccessibilityBridge$SemanticsNode;

    .line 2280
    iget-object v0, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->parent:Lio/flutter/view/AccessibilityBridge$SemanticsNode;

    return-object v0
.end method

.method static synthetic access$2702(Lio/flutter/view/AccessibilityBridge$SemanticsNode;Lio/flutter/view/AccessibilityBridge$SemanticsNode;)Lio/flutter/view/AccessibilityBridge$SemanticsNode;
    .locals 0
    .param p0, "x0"    # Lio/flutter/view/AccessibilityBridge$SemanticsNode;
    .param p1, "x1"    # Lio/flutter/view/AccessibilityBridge$SemanticsNode;

    .line 2280
    iput-object p1, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->parent:Lio/flutter/view/AccessibilityBridge$SemanticsNode;

    return-object p1
.end method

.method static synthetic access$2800(Lio/flutter/view/AccessibilityBridge$SemanticsNode;)I
    .locals 1
    .param p0, "x0"    # Lio/flutter/view/AccessibilityBridge$SemanticsNode;

    .line 2280
    iget v0, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->previousNodeId:I

    return v0
.end method

.method static synthetic access$2900(Lio/flutter/view/AccessibilityBridge$SemanticsNode;)Lio/flutter/view/AccessibilityBridge$CustomAccessibilityAction;
    .locals 1
    .param p0, "x0"    # Lio/flutter/view/AccessibilityBridge$SemanticsNode;

    .line 2280
    iget-object v0, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->onTapOverride:Lio/flutter/view/AccessibilityBridge$CustomAccessibilityAction;

    return-object v0
.end method

.method static synthetic access$3100(Lio/flutter/view/AccessibilityBridge$SemanticsNode;)Lio/flutter/view/AccessibilityBridge$CustomAccessibilityAction;
    .locals 1
    .param p0, "x0"    # Lio/flutter/view/AccessibilityBridge$SemanticsNode;

    .line 2280
    iget-object v0, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->onLongPressOverride:Lio/flutter/view/AccessibilityBridge$CustomAccessibilityAction;

    return-object v0
.end method

.method static synthetic access$3200(Lio/flutter/view/AccessibilityBridge$SemanticsNode;)Ljava/lang/CharSequence;
    .locals 1
    .param p0, "x0"    # Lio/flutter/view/AccessibilityBridge$SemanticsNode;

    .line 2280
    invoke-direct {p0}, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->getValue()Ljava/lang/CharSequence;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$3300(Lio/flutter/view/AccessibilityBridge$SemanticsNode;)Ljava/lang/CharSequence;
    .locals 1
    .param p0, "x0"    # Lio/flutter/view/AccessibilityBridge$SemanticsNode;

    .line 2280
    invoke-direct {p0}, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->getTextFieldHint()Ljava/lang/CharSequence;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$3400(Lio/flutter/view/AccessibilityBridge$SemanticsNode;)Ljava/lang/CharSequence;
    .locals 1
    .param p0, "x0"    # Lio/flutter/view/AccessibilityBridge$SemanticsNode;

    .line 2280
    invoke-direct {p0}, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->getValueLabelHint()Ljava/lang/CharSequence;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$3500(Lio/flutter/view/AccessibilityBridge$SemanticsNode;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lio/flutter/view/AccessibilityBridge$SemanticsNode;

    .line 2280
    iget-object v0, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->tooltip:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$3600(Lio/flutter/view/AccessibilityBridge$SemanticsNode;)Ljava/util/List;
    .locals 1
    .param p0, "x0"    # Lio/flutter/view/AccessibilityBridge$SemanticsNode;

    .line 2280
    iget-object v0, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->customAccessibilityActions:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$3900(Lio/flutter/view/AccessibilityBridge$SemanticsNode;)Ljava/util/List;
    .locals 1
    .param p0, "x0"    # Lio/flutter/view/AccessibilityBridge$SemanticsNode;

    .line 2280
    iget-object v0, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->childrenInTraversalOrder:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$4000(Lio/flutter/view/AccessibilityBridge$SemanticsNode;)I
    .locals 1
    .param p0, "x0"    # Lio/flutter/view/AccessibilityBridge$SemanticsNode;

    .line 2280
    iget v0, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->actions:I

    return v0
.end method

.method static synthetic access$4100(Lio/flutter/view/AccessibilityBridge$SemanticsNode;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lio/flutter/view/AccessibilityBridge$SemanticsNode;

    .line 2280
    iget-object v0, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->increasedValue:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$4202(Lio/flutter/view/AccessibilityBridge$SemanticsNode;Ljava/util/List;)Ljava/util/List;
    .locals 0
    .param p0, "x0"    # Lio/flutter/view/AccessibilityBridge$SemanticsNode;
    .param p1, "x1"    # Ljava/util/List;

    .line 2280
    iput-object p1, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->valueAttributes:Ljava/util/List;

    return-object p1
.end method

.method static synthetic access$4300(Lio/flutter/view/AccessibilityBridge$SemanticsNode;)Ljava/util/List;
    .locals 1
    .param p0, "x0"    # Lio/flutter/view/AccessibilityBridge$SemanticsNode;

    .line 2280
    iget-object v0, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->increasedValueAttributes:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$4400(Lio/flutter/view/AccessibilityBridge$SemanticsNode;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lio/flutter/view/AccessibilityBridge$SemanticsNode;

    .line 2280
    iget-object v0, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->decreasedValue:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$4500(Lio/flutter/view/AccessibilityBridge$SemanticsNode;)Ljava/util/List;
    .locals 1
    .param p0, "x0"    # Lio/flutter/view/AccessibilityBridge$SemanticsNode;

    .line 2280
    iget-object v0, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->decreasedValueAttributes:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$4700(Lio/flutter/view/AccessibilityBridge$SemanticsNode;[FZ)Lio/flutter/view/AccessibilityBridge$SemanticsNode;
    .locals 1
    .param p0, "x0"    # Lio/flutter/view/AccessibilityBridge$SemanticsNode;
    .param p1, "x1"    # [F
    .param p2, "x2"    # Z

    .line 2280
    invoke-direct {p0, p1, p2}, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->hitTest([FZ)Lio/flutter/view/AccessibilityBridge$SemanticsNode;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$4900(Lio/flutter/view/AccessibilityBridge$SemanticsNode;Ljava/nio/ByteBuffer;[Ljava/lang/String;[Ljava/nio/ByteBuffer;)V
    .locals 0
    .param p0, "x0"    # Lio/flutter/view/AccessibilityBridge$SemanticsNode;
    .param p1, "x1"    # Ljava/nio/ByteBuffer;
    .param p2, "x2"    # [Ljava/lang/String;
    .param p3, "x3"    # [Ljava/nio/ByteBuffer;

    .line 2280
    invoke-direct {p0, p1, p2, p3}, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->updateWith(Ljava/nio/ByteBuffer;[Ljava/lang/String;[Ljava/nio/ByteBuffer;)V

    return-void
.end method

.method static synthetic access$5000(Lio/flutter/view/AccessibilityBridge$SemanticsNode;)Z
    .locals 1
    .param p0, "x0"    # Lio/flutter/view/AccessibilityBridge$SemanticsNode;

    .line 2280
    iget-boolean v0, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->hadPreviousConfig:Z

    return v0
.end method

.method static synthetic access$5102(Lio/flutter/view/AccessibilityBridge$SemanticsNode;Z)Z
    .locals 0
    .param p0, "x0"    # Lio/flutter/view/AccessibilityBridge$SemanticsNode;
    .param p1, "x1"    # Z

    .line 2280
    iput-boolean p1, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->globalGeometryDirty:Z

    return p1
.end method

.method static synthetic access$5202(Lio/flutter/view/AccessibilityBridge$SemanticsNode;Z)Z
    .locals 0
    .param p0, "x0"    # Lio/flutter/view/AccessibilityBridge$SemanticsNode;
    .param p1, "x1"    # Z

    .line 2280
    iput-boolean p1, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->inverseTransformDirty:Z

    return p1
.end method

.method static synthetic access$5300(Lio/flutter/view/AccessibilityBridge$SemanticsNode;[FLjava/util/Set;Z)V
    .locals 0
    .param p0, "x0"    # Lio/flutter/view/AccessibilityBridge$SemanticsNode;
    .param p1, "x1"    # [F
    .param p2, "x2"    # Ljava/util/Set;
    .param p3, "x3"    # Z

    .line 2280
    invoke-direct {p0, p1, p2, p3}, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->updateRecursively([FLjava/util/Set;Z)V

    return-void
.end method

.method static synthetic access$5400(Lio/flutter/view/AccessibilityBridge$SemanticsNode;Ljava/util/List;)V
    .locals 0
    .param p0, "x0"    # Lio/flutter/view/AccessibilityBridge$SemanticsNode;
    .param p1, "x1"    # Ljava/util/List;

    .line 2280
    invoke-direct {p0, p1}, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->collectRoutes(Ljava/util/List;)V

    return-void
.end method

.method static synthetic access$5500(Lio/flutter/view/AccessibilityBridge$SemanticsNode;)Z
    .locals 1
    .param p0, "x0"    # Lio/flutter/view/AccessibilityBridge$SemanticsNode;

    .line 2280
    invoke-direct {p0}, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->didScroll()Z

    move-result v0

    return v0
.end method

.method static synthetic access$5600(Lio/flutter/view/AccessibilityBridge$SemanticsNode;)F
    .locals 1
    .param p0, "x0"    # Lio/flutter/view/AccessibilityBridge$SemanticsNode;

    .line 2280
    iget v0, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->scrollPosition:F

    return v0
.end method

.method static synthetic access$5700(Lio/flutter/view/AccessibilityBridge$SemanticsNode;)F
    .locals 1
    .param p0, "x0"    # Lio/flutter/view/AccessibilityBridge$SemanticsNode;

    .line 2280
    iget v0, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->scrollExtentMax:F

    return v0
.end method

.method static synthetic access$5800(Lio/flutter/view/AccessibilityBridge$SemanticsNode;)F
    .locals 1
    .param p0, "x0"    # Lio/flutter/view/AccessibilityBridge$SemanticsNode;

    .line 2280
    iget v0, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->scrollExtentMin:F

    return v0
.end method

.method static synthetic access$5900(Lio/flutter/view/AccessibilityBridge$SemanticsNode;Lio/flutter/view/AccessibilityBridge$Action;)Z
    .locals 1
    .param p0, "x0"    # Lio/flutter/view/AccessibilityBridge$SemanticsNode;
    .param p1, "x1"    # Lio/flutter/view/AccessibilityBridge$Action;

    .line 2280
    invoke-direct {p0, p1}, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->hadAction(Lio/flutter/view/AccessibilityBridge$Action;)Z

    move-result v0

    return v0
.end method

.method static synthetic access$6000(Lio/flutter/view/AccessibilityBridge$SemanticsNode;)I
    .locals 1
    .param p0, "x0"    # Lio/flutter/view/AccessibilityBridge$SemanticsNode;

    .line 2280
    iget v0, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->scrollIndex:I

    return v0
.end method

.method static synthetic access$6100(Lio/flutter/view/AccessibilityBridge$SemanticsNode;)Ljava/util/List;
    .locals 1
    .param p0, "x0"    # Lio/flutter/view/AccessibilityBridge$SemanticsNode;

    .line 2280
    iget-object v0, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->childrenInHitTestOrder:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$6200(Lio/flutter/view/AccessibilityBridge$SemanticsNode;)Z
    .locals 1
    .param p0, "x0"    # Lio/flutter/view/AccessibilityBridge$SemanticsNode;

    .line 2280
    invoke-direct {p0}, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->didChangeLabel()Z

    move-result v0

    return v0
.end method

.method static synthetic access$6300(Lio/flutter/view/AccessibilityBridge$SemanticsNode;Lio/flutter/view/AccessibilityBridge$Flag;)Z
    .locals 1
    .param p0, "x0"    # Lio/flutter/view/AccessibilityBridge$SemanticsNode;
    .param p1, "x1"    # Lio/flutter/view/AccessibilityBridge$Flag;

    .line 2280
    invoke-direct {p0, p1}, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->hadFlag(Lio/flutter/view/AccessibilityBridge$Flag;)Z

    move-result v0

    return v0
.end method

.method static synthetic access$6400(Lio/flutter/view/AccessibilityBridge$SemanticsNode;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lio/flutter/view/AccessibilityBridge$SemanticsNode;

    .line 2280
    iget-object v0, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->label:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$6500(Lio/flutter/view/AccessibilityBridge$SemanticsNode;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lio/flutter/view/AccessibilityBridge$SemanticsNode;

    .line 2280
    iget-object v0, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->previousValue:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$6600(Lio/flutter/view/AccessibilityBridge$SemanticsNode;)I
    .locals 1
    .param p0, "x0"    # Lio/flutter/view/AccessibilityBridge$SemanticsNode;

    .line 2280
    iget v0, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->previousTextSelectionBase:I

    return v0
.end method

.method static synthetic access$6700(Lio/flutter/view/AccessibilityBridge$SemanticsNode;)I
    .locals 1
    .param p0, "x0"    # Lio/flutter/view/AccessibilityBridge$SemanticsNode;

    .line 2280
    iget v0, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->previousTextSelectionExtent:I

    return v0
.end method

.method static synthetic access$6800(Lio/flutter/view/AccessibilityBridge$SemanticsNode;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lio/flutter/view/AccessibilityBridge$SemanticsNode;

    .line 2280
    invoke-direct {p0}, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->getRouteName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private collectRoutes(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lio/flutter/view/AccessibilityBridge$SemanticsNode;",
            ">;)V"
        }
    .end annotation

    .line 2703
    .local p1, "edges":Ljava/util/List;, "Ljava/util/List<Lio/flutter/view/AccessibilityBridge$SemanticsNode;>;"
    sget-object v0, Lio/flutter/view/AccessibilityBridge$Flag;->SCOPES_ROUTE:Lio/flutter/view/AccessibilityBridge$Flag;

    invoke-direct {p0, v0}, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->hasFlag(Lio/flutter/view/AccessibilityBridge$Flag;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2704
    invoke-interface {p1, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 2706
    :cond_0
    iget-object v0, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->childrenInTraversalOrder:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/flutter/view/AccessibilityBridge$SemanticsNode;

    .line 2707
    .local v1, "child":Lio/flutter/view/AccessibilityBridge$SemanticsNode;
    invoke-direct {v1, p1}, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->collectRoutes(Ljava/util/List;)V

    .line 2708
    .end local v1    # "child":Lio/flutter/view/AccessibilityBridge$SemanticsNode;
    goto :goto_0

    .line 2709
    :cond_1
    return-void
.end method

.method private createSpannableString(Ljava/lang/String;Ljava/util/List;)Landroid/text/SpannableString;
    .locals 9
    .param p1, "string"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lio/flutter/view/AccessibilityBridge$StringAttribute;",
            ">;)",
            "Landroid/text/SpannableString;"
        }
    .end annotation

    .line 2862
    .local p2, "attributes":Ljava/util/List;, "Ljava/util/List<Lio/flutter/view/AccessibilityBridge$StringAttribute;>;"
    if-nez p1, :cond_0

    .line 2863
    const/4 v0, 0x0

    return-object v0

    .line 2865
    :cond_0
    new-instance v0, Landroid/text/SpannableString;

    invoke-direct {v0, p1}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 2866
    .local v0, "spannableString":Landroid/text/SpannableString;
    if-eqz p2, :cond_1

    .line 2867
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lio/flutter/view/AccessibilityBridge$StringAttribute;

    .line 2868
    .local v2, "attribute":Lio/flutter/view/AccessibilityBridge$StringAttribute;
    sget-object v3, Lio/flutter/view/AccessibilityBridge$5;->$SwitchMap$io$flutter$view$AccessibilityBridge$StringAttributeType:[I

    iget-object v4, v2, Lio/flutter/view/AccessibilityBridge$StringAttribute;->type:Lio/flutter/view/AccessibilityBridge$StringAttributeType;

    invoke-virtual {v4}, Lio/flutter/view/AccessibilityBridge$StringAttributeType;->ordinal()I

    move-result v4

    aget v3, v3, v4

    const/4 v4, 0x0

    packed-switch v3, :pswitch_data_0

    goto :goto_1

    .line 2877
    :pswitch_0
    move-object v3, v2

    check-cast v3, Lio/flutter/view/AccessibilityBridge$LocaleStringAttribute;

    .line 2878
    .local v3, "localeAttribute":Lio/flutter/view/AccessibilityBridge$LocaleStringAttribute;
    iget-object v5, v3, Lio/flutter/view/AccessibilityBridge$LocaleStringAttribute;->locale:Ljava/lang/String;

    invoke-static {v5}, Ljava/util/Locale;->forLanguageTag(Ljava/lang/String;)Ljava/util/Locale;

    move-result-object v5

    .line 2879
    .local v5, "locale":Ljava/util/Locale;
    new-instance v6, Landroid/text/style/LocaleSpan;

    invoke-direct {v6, v5}, Landroid/text/style/LocaleSpan;-><init>(Ljava/util/Locale;)V

    .line 2880
    .local v6, "localeSpan":Landroid/text/style/LocaleSpan;
    iget v7, v2, Lio/flutter/view/AccessibilityBridge$StringAttribute;->start:I

    iget v8, v2, Lio/flutter/view/AccessibilityBridge$StringAttribute;->end:I

    invoke-virtual {v0, v6, v7, v8, v4}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 2881
    goto :goto_1

    .line 2871
    .end local v3    # "localeAttribute":Lio/flutter/view/AccessibilityBridge$LocaleStringAttribute;
    .end local v5    # "locale":Ljava/util/Locale;
    .end local v6    # "localeSpan":Landroid/text/style/LocaleSpan;
    :pswitch_1
    new-instance v3, Landroid/text/style/TtsSpan$Builder;

    const-string v5, "android.type.verbatim"

    invoke-direct {v3, v5}, Landroid/text/style/TtsSpan$Builder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Landroid/text/style/TtsSpan$Builder;->build()Landroid/text/style/TtsSpan;

    move-result-object v3

    .line 2872
    .local v3, "ttsSpan":Landroid/text/style/TtsSpan;
    iget v5, v2, Lio/flutter/view/AccessibilityBridge$StringAttribute;->start:I

    iget v6, v2, Lio/flutter/view/AccessibilityBridge$StringAttribute;->end:I

    invoke-virtual {v0, v3, v5, v6, v4}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 2873
    nop

    .line 2884
    .end local v2    # "attribute":Lio/flutter/view/AccessibilityBridge$StringAttribute;
    .end local v3    # "ttsSpan":Landroid/text/style/TtsSpan;
    :goto_1
    goto :goto_0

    .line 2886
    :cond_1
    return-object v0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private didChangeLabel()Z
    .locals 3

    .line 2423
    iget-object v0, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->label:Ljava/lang/String;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    iget-object v2, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->previousLabel:Ljava/lang/String;

    if-nez v2, :cond_0

    .line 2424
    return v1

    .line 2426
    :cond_0
    if-eqz v0, :cond_1

    iget-object v2, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->previousLabel:Ljava/lang/String;

    if-eqz v2, :cond_1

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    :cond_1
    const/4 v1, 0x1

    :cond_2
    return v1
.end method

.method private didScroll()Z
    .locals 2

    .line 2417
    iget v0, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->scrollPosition:F

    invoke-static {v0}, Ljava/lang/Float;->isNaN(F)Z

    move-result v0

    if-nez v0, :cond_0

    iget v0, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->previousScrollPosition:F

    .line 2418
    invoke-static {v0}, Ljava/lang/Float;->isNaN(F)Z

    move-result v0

    if-nez v0, :cond_0

    iget v0, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->previousScrollPosition:F

    iget v1, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->scrollPosition:F

    cmpl-float v0, v0, v1

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 2417
    :goto_0
    return v0
.end method

.method private ensureInverseTransform()V
    .locals 3

    .line 2633
    iget-boolean v0, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->inverseTransformDirty:Z

    if-nez v0, :cond_0

    .line 2634
    return-void

    .line 2636
    :cond_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->inverseTransformDirty:Z

    .line 2637
    iget-object v1, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->inverseTransform:[F

    if-nez v1, :cond_1

    .line 2638
    const/16 v1, 0x10

    new-array v1, v1, [F

    iput-object v1, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->inverseTransform:[F

    .line 2640
    :cond_1
    iget-object v1, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->inverseTransform:[F

    iget-object v2, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->transform:[F

    invoke-static {v1, v0, v2, v0}, Landroid/opengl/Matrix;->invertM([FI[FI)Z

    move-result v0

    if-nez v0, :cond_2

    .line 2641
    iget-object v0, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->inverseTransform:[F

    const/4 v1, 0x0

    invoke-static {v0, v1}, Ljava/util/Arrays;->fill([FF)V

    .line 2643
    :cond_2
    return-void
.end method

.method private getAncestor(Lio/flutter/util/Predicate;)Lio/flutter/view/AccessibilityBridge$SemanticsNode;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/flutter/util/Predicate<",
            "Lio/flutter/view/AccessibilityBridge$SemanticsNode;",
            ">;)",
            "Lio/flutter/view/AccessibilityBridge$SemanticsNode;"
        }
    .end annotation

    .line 2377
    .local p1, "tester":Lio/flutter/util/Predicate;, "Lio/flutter/util/Predicate<Lio/flutter/view/AccessibilityBridge$SemanticsNode;>;"
    iget-object v0, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->parent:Lio/flutter/view/AccessibilityBridge$SemanticsNode;

    .line 2378
    .local v0, "nextAncestor":Lio/flutter/view/AccessibilityBridge$SemanticsNode;
    :goto_0
    if-eqz v0, :cond_1

    .line 2379
    invoke-interface {p1, v0}, Lio/flutter/util/Predicate;->test(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 2380
    return-object v0

    .line 2382
    :cond_0
    iget-object v0, v0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->parent:Lio/flutter/view/AccessibilityBridge$SemanticsNode;

    goto :goto_0

    .line 2384
    :cond_1
    const/4 v1, 0x0

    return-object v1
.end method

.method private getGlobalRect()Landroid/graphics/Rect;
    .locals 2

    .line 2646
    iget-boolean v0, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->globalGeometryDirty:Z

    if-eqz v0, :cond_0

    .line 2647
    const-string v0, "AccessibilityBridge"

    const-string v1, "Attempted to getGlobalRect with a dirty geometry."

    invoke-static {v0, v1}, Lio/flutter/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 2649
    :cond_0
    iget-object v0, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->globalRect:Landroid/graphics/Rect;

    return-object v0
.end method

.method private getHint()Ljava/lang/CharSequence;
    .locals 2

    .line 2828
    iget-object v0, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->hint:Ljava/lang/String;

    iget-object v1, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->hintAttributes:Ljava/util/List;

    invoke-direct {p0, v0, v1}, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->createSpannableString(Ljava/lang/String;Ljava/util/List;)Landroid/text/SpannableString;

    move-result-object v0

    return-object v0
.end method

.method private getLabel()Ljava/lang/CharSequence;
    .locals 2

    .line 2824
    iget-object v0, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->label:Ljava/lang/String;

    iget-object v1, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->labelAttributes:Ljava/util/List;

    invoke-direct {p0, v0, v1}, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->createSpannableString(Ljava/lang/String;Ljava/util/List;)Landroid/text/SpannableString;

    move-result-object v0

    return-object v0
.end method

.method private getRouteName()Ljava/lang/String;
    .locals 4

    .line 2714
    sget-object v0, Lio/flutter/view/AccessibilityBridge$Flag;->NAMES_ROUTE:Lio/flutter/view/AccessibilityBridge$Flag;

    invoke-direct {p0, v0}, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->hasFlag(Lio/flutter/view/AccessibilityBridge$Flag;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2715
    iget-object v0, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->label:Ljava/lang/String;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 2716
    iget-object v0, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->label:Ljava/lang/String;

    return-object v0

    .line 2719
    :cond_0
    iget-object v0, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->childrenInTraversalOrder:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/flutter/view/AccessibilityBridge$SemanticsNode;

    .line 2720
    .local v1, "child":Lio/flutter/view/AccessibilityBridge$SemanticsNode;
    invoke-direct {v1}, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->getRouteName()Ljava/lang/String;

    move-result-object v2

    .line 2721
    .local v2, "newName":Ljava/lang/String;
    if-eqz v2, :cond_1

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_1

    .line 2722
    return-object v2

    .line 2724
    .end local v1    # "child":Lio/flutter/view/AccessibilityBridge$SemanticsNode;
    .end local v2    # "newName":Ljava/lang/String;
    :cond_1
    goto :goto_0

    .line 2725
    :cond_2
    const/4 v0, 0x0

    return-object v0
.end method

.method private getStringAttributesFromBuffer(Ljava/nio/ByteBuffer;[Ljava/nio/ByteBuffer;)Ljava/util/List;
    .locals 11
    .param p1, "buffer"    # Ljava/nio/ByteBuffer;
    .param p2, "stringAttributeArgs"    # [Ljava/nio/ByteBuffer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/nio/ByteBuffer;",
            "[",
            "Ljava/nio/ByteBuffer;",
            ")",
            "Ljava/util/List<",
            "Lio/flutter/view/AccessibilityBridge$StringAttribute;",
            ">;"
        }
    .end annotation

    .line 2592
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    .line 2593
    .local v0, "attributesCount":I
    const/4 v1, -0x1

    const/4 v2, 0x0

    if-ne v0, v1, :cond_0

    .line 2594
    return-object v2

    .line 2596
    :cond_0
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1, v0}, Ljava/util/ArrayList;-><init>(I)V

    .line 2597
    .local v1, "result":Ljava/util/List;, "Ljava/util/List<Lio/flutter/view/AccessibilityBridge$StringAttribute;>;"
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    if-ge v3, v0, :cond_1

    .line 2598
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v4

    .line 2599
    .local v4, "start":I
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v5

    .line 2600
    .local v5, "end":I
    invoke-static {}, Lio/flutter/view/AccessibilityBridge$StringAttributeType;->values()[Lio/flutter/view/AccessibilityBridge$StringAttributeType;

    move-result-object v6

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v7

    aget-object v6, v6, v7

    .line 2601
    .local v6, "type":Lio/flutter/view/AccessibilityBridge$StringAttributeType;
    sget-object v7, Lio/flutter/view/AccessibilityBridge$5;->$SwitchMap$io$flutter$view$AccessibilityBridge$StringAttributeType:[I

    invoke-virtual {v6}, Lio/flutter/view/AccessibilityBridge$StringAttributeType;->ordinal()I

    move-result v8

    aget v7, v7, v8

    packed-switch v7, :pswitch_data_0

    goto :goto_1

    .line 2615
    :pswitch_0
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v7

    .line 2616
    .local v7, "argsIndex":I
    aget-object v8, p2, v7

    .line 2617
    .local v8, "args":Ljava/nio/ByteBuffer;
    new-instance v9, Lio/flutter/view/AccessibilityBridge$LocaleStringAttribute;

    invoke-direct {v9, v2}, Lio/flutter/view/AccessibilityBridge$LocaleStringAttribute;-><init>(Lio/flutter/view/AccessibilityBridge$1;)V

    .line 2618
    .local v9, "attribute":Lio/flutter/view/AccessibilityBridge$LocaleStringAttribute;
    iput v4, v9, Lio/flutter/view/AccessibilityBridge$LocaleStringAttribute;->start:I

    .line 2619
    iput v5, v9, Lio/flutter/view/AccessibilityBridge$LocaleStringAttribute;->end:I

    .line 2620
    iput-object v6, v9, Lio/flutter/view/AccessibilityBridge$LocaleStringAttribute;->type:Lio/flutter/view/AccessibilityBridge$StringAttributeType;

    .line 2621
    const-string v10, "UTF-8"

    invoke-static {v10}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v10

    invoke-virtual {v10, v8}, Ljava/nio/charset/Charset;->decode(Ljava/nio/ByteBuffer;)Ljava/nio/CharBuffer;

    move-result-object v10

    invoke-virtual {v10}, Ljava/nio/CharBuffer;->toString()Ljava/lang/String;

    move-result-object v10

    iput-object v10, v9, Lio/flutter/view/AccessibilityBridge$LocaleStringAttribute;->locale:Ljava/lang/String;

    .line 2622
    invoke-interface {v1, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 2623
    goto :goto_1

    .line 2605
    .end local v7    # "argsIndex":I
    .end local v8    # "args":Ljava/nio/ByteBuffer;
    .end local v9    # "attribute":Lio/flutter/view/AccessibilityBridge$LocaleStringAttribute;
    :pswitch_1
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    .line 2606
    new-instance v7, Lio/flutter/view/AccessibilityBridge$SpellOutStringAttribute;

    invoke-direct {v7, v2}, Lio/flutter/view/AccessibilityBridge$SpellOutStringAttribute;-><init>(Lio/flutter/view/AccessibilityBridge$1;)V

    .line 2607
    .local v7, "attribute":Lio/flutter/view/AccessibilityBridge$SpellOutStringAttribute;
    iput v4, v7, Lio/flutter/view/AccessibilityBridge$SpellOutStringAttribute;->start:I

    .line 2608
    iput v5, v7, Lio/flutter/view/AccessibilityBridge$SpellOutStringAttribute;->end:I

    .line 2609
    iput-object v6, v7, Lio/flutter/view/AccessibilityBridge$SpellOutStringAttribute;->type:Lio/flutter/view/AccessibilityBridge$StringAttributeType;

    .line 2610
    invoke-interface {v1, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 2611
    nop

    .line 2597
    .end local v4    # "start":I
    .end local v5    # "end":I
    .end local v6    # "type":Lio/flutter/view/AccessibilityBridge$StringAttributeType;
    .end local v7    # "attribute":Lio/flutter/view/AccessibilityBridge$SpellOutStringAttribute;
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 2629
    .end local v3    # "i":I
    :cond_1
    return-object v1

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private getTextFieldHint()Ljava/lang/CharSequence;
    .locals 10

    .line 2847
    const/4 v0, 0x2

    new-array v1, v0, [Ljava/lang/CharSequence;

    invoke-direct {p0}, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->getLabel()Ljava/lang/CharSequence;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    invoke-direct {p0}, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->getHint()Ljava/lang/CharSequence;

    move-result-object v2

    const/4 v4, 0x1

    aput-object v2, v1, v4

    .line 2848
    .local v1, "array":[Ljava/lang/CharSequence;
    const/4 v2, 0x0

    .line 2849
    .local v2, "result":Ljava/lang/CharSequence;
    array-length v5, v1

    const/4 v6, 0x0

    :goto_0
    if-ge v6, v5, :cond_3

    aget-object v7, v1, v6

    .line 2850
    .local v7, "word":Ljava/lang/CharSequence;
    if-eqz v7, :cond_2

    invoke-interface {v7}, Ljava/lang/CharSequence;->length()I

    move-result v8

    if-lez v8, :cond_2

    .line 2851
    if-eqz v2, :cond_1

    invoke-interface {v2}, Ljava/lang/CharSequence;->length()I

    move-result v8

    if-nez v8, :cond_0

    goto :goto_1

    .line 2854
    :cond_0
    const/4 v8, 0x3

    new-array v8, v8, [Ljava/lang/CharSequence;

    aput-object v2, v8, v3

    const-string v9, ", "

    aput-object v9, v8, v4

    aput-object v7, v8, v0

    invoke-static {v8}, Landroid/text/TextUtils;->concat([Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v2

    goto :goto_2

    .line 2852
    :cond_1
    :goto_1
    move-object v2, v7

    .line 2849
    .end local v7    # "word":Ljava/lang/CharSequence;
    :cond_2
    :goto_2
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 2858
    :cond_3
    return-object v2
.end method

.method private getValue()Ljava/lang/CharSequence;
    .locals 2

    .line 2820
    iget-object v0, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->value:Ljava/lang/String;

    iget-object v1, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->valueAttributes:Ljava/util/List;

    invoke-direct {p0, v0, v1}, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->createSpannableString(Ljava/lang/String;Ljava/util/List;)Landroid/text/SpannableString;

    move-result-object v0

    return-object v0
.end method

.method private getValueLabelHint()Ljava/lang/CharSequence;
    .locals 11

    .line 2832
    const/4 v0, 0x3

    new-array v1, v0, [Ljava/lang/CharSequence;

    invoke-direct {p0}, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->getValue()Ljava/lang/CharSequence;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    invoke-direct {p0}, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->getLabel()Ljava/lang/CharSequence;

    move-result-object v2

    const/4 v4, 0x1

    aput-object v2, v1, v4

    invoke-direct {p0}, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->getHint()Ljava/lang/CharSequence;

    move-result-object v2

    const/4 v5, 0x2

    aput-object v2, v1, v5

    .line 2833
    .local v1, "array":[Ljava/lang/CharSequence;
    const/4 v2, 0x0

    .line 2834
    .local v2, "result":Ljava/lang/CharSequence;
    array-length v6, v1

    const/4 v7, 0x0

    :goto_0
    if-ge v7, v6, :cond_3

    aget-object v8, v1, v7

    .line 2835
    .local v8, "word":Ljava/lang/CharSequence;
    if-eqz v8, :cond_2

    invoke-interface {v8}, Ljava/lang/CharSequence;->length()I

    move-result v9

    if-lez v9, :cond_2

    .line 2836
    if-eqz v2, :cond_1

    invoke-interface {v2}, Ljava/lang/CharSequence;->length()I

    move-result v9

    if-nez v9, :cond_0

    goto :goto_1

    .line 2839
    :cond_0
    new-array v9, v0, [Ljava/lang/CharSequence;

    aput-object v2, v9, v3

    const-string v10, ", "

    aput-object v10, v9, v4

    aput-object v8, v9, v5

    invoke-static {v9}, Landroid/text/TextUtils;->concat([Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v2

    goto :goto_2

    .line 2837
    :cond_1
    :goto_1
    move-object v2, v8

    .line 2834
    .end local v8    # "word":Ljava/lang/CharSequence;
    :cond_2
    :goto_2
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    .line 2843
    :cond_3
    return-object v2
.end method

.method private hadAction(Lio/flutter/view/AccessibilityBridge$Action;)Z
    .locals 2
    .param p1, "action"    # Lio/flutter/view/AccessibilityBridge$Action;

    .line 2402
    iget v0, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->previousActions:I

    iget v1, p1, Lio/flutter/view/AccessibilityBridge$Action;->value:I

    and-int/2addr v0, v1

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private hadFlag(Lio/flutter/view/AccessibilityBridge$Flag;)Z
    .locals 2
    .param p1, "flag"    # Lio/flutter/view/AccessibilityBridge$Flag;

    .line 2410
    iget-boolean v0, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->hadPreviousConfig:Z

    if-nez v0, :cond_0

    .line 2411
    const-string v0, "AccessibilityBridge"

    const-string v1, "Attempted to check hadFlag but had no previous config."

    invoke-static {v0, v1}, Lio/flutter/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 2413
    :cond_0
    iget v0, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->previousFlags:I

    iget v1, p1, Lio/flutter/view/AccessibilityBridge$Flag;->value:I

    and-int/2addr v0, v1

    if-eqz v0, :cond_1

    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private hasAction(Lio/flutter/view/AccessibilityBridge$Action;)Z
    .locals 2
    .param p1, "action"    # Lio/flutter/view/AccessibilityBridge$Action;

    .line 2394
    iget v0, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->actions:I

    iget v1, p1, Lio/flutter/view/AccessibilityBridge$Action;->value:I

    and-int/2addr v0, v1

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private hasFlag(Lio/flutter/view/AccessibilityBridge$Flag;)Z
    .locals 2
    .param p1, "flag"    # Lio/flutter/view/AccessibilityBridge$Flag;

    .line 2406
    iget v0, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->flags:I

    iget v1, p1, Lio/flutter/view/AccessibilityBridge$Flag;->value:I

    and-int/2addr v0, v1

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private hitTest([FZ)Lio/flutter/view/AccessibilityBridge$SemanticsNode;
    .locals 17
    .param p1, "point"    # [F
    .param p2, "stopAtPlatformView"    # Z

    .line 2661
    move-object/from16 v0, p0

    move/from16 v7, p2

    const/4 v1, 0x3

    aget v8, p1, v1

    .line 2662
    .local v8, "w":F
    const/4 v9, 0x0

    aget v1, p1, v9

    div-float v10, v1, v8

    .line 2663
    .local v10, "x":F
    const/4 v11, 0x1

    aget v1, p1, v11

    div-float v12, v1, v8

    .line 2664
    .local v12, "y":F
    iget v1, v0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->left:F

    const/4 v13, 0x0

    cmpg-float v1, v10, v1

    if-ltz v1, :cond_7

    iget v1, v0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->right:F

    cmpl-float v1, v10, v1

    if-gez v1, :cond_7

    iget v1, v0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->top:F

    cmpg-float v1, v12, v1

    if-ltz v1, :cond_7

    iget v1, v0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->bottom:F

    cmpl-float v1, v12, v1

    if-ltz v1, :cond_0

    goto :goto_2

    .line 2665
    :cond_0
    const/4 v1, 0x4

    new-array v14, v1, [F

    .line 2666
    .local v14, "transformedPoint":[F
    iget-object v1, v0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->childrenInHitTestOrder:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v15

    :goto_0
    invoke-interface {v15}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {v15}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    move-object v6, v1

    check-cast v6, Lio/flutter/view/AccessibilityBridge$SemanticsNode;

    .line 2667
    .local v6, "child":Lio/flutter/view/AccessibilityBridge$SemanticsNode;
    sget-object v1, Lio/flutter/view/AccessibilityBridge$Flag;->IS_HIDDEN:Lio/flutter/view/AccessibilityBridge$Flag;

    invoke-direct {v6, v1}, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->hasFlag(Lio/flutter/view/AccessibilityBridge$Flag;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 2668
    goto :goto_0

    .line 2670
    :cond_1
    invoke-direct {v6}, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->ensureInverseTransform()V

    .line 2671
    const/4 v2, 0x0

    iget-object v3, v6, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->inverseTransform:[F

    const/4 v4, 0x0

    const/16 v16, 0x0

    move-object v1, v14

    move-object/from16 v5, p1

    move-object v9, v6

    .end local v6    # "child":Lio/flutter/view/AccessibilityBridge$SemanticsNode;
    .local v9, "child":Lio/flutter/view/AccessibilityBridge$SemanticsNode;
    move/from16 v6, v16

    invoke-static/range {v1 .. v6}, Landroid/opengl/Matrix;->multiplyMV([FI[FI[FI)V

    .line 2672
    invoke-direct {v9, v14, v7}, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->hitTest([FZ)Lio/flutter/view/AccessibilityBridge$SemanticsNode;

    move-result-object v1

    .line 2673
    .local v1, "result":Lio/flutter/view/AccessibilityBridge$SemanticsNode;
    if-eqz v1, :cond_2

    .line 2674
    return-object v1

    .line 2676
    .end local v1    # "result":Lio/flutter/view/AccessibilityBridge$SemanticsNode;
    .end local v9    # "child":Lio/flutter/view/AccessibilityBridge$SemanticsNode;
    :cond_2
    const/4 v9, 0x0

    goto :goto_0

    .line 2677
    :cond_3
    if-eqz v7, :cond_4

    iget v1, v0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->platformViewId:I

    const/4 v2, -0x1

    if-eq v1, v2, :cond_4

    const/4 v9, 0x1

    goto :goto_1

    :cond_4
    const/4 v9, 0x0

    :goto_1
    move v1, v9

    .line 2678
    .local v1, "foundPlatformView":Z
    invoke-direct/range {p0 .. p0}, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->isFocusable()Z

    move-result v2

    if-nez v2, :cond_5

    if-eqz v1, :cond_6

    :cond_5
    move-object v13, v0

    :cond_6
    return-object v13

    .line 2664
    .end local v1    # "foundPlatformView":Z
    .end local v14    # "transformedPoint":[F
    :cond_7
    :goto_2
    return-object v13
.end method

.method private isFocusable()Z
    .locals 4

    .line 2686
    sget-object v0, Lio/flutter/view/AccessibilityBridge$Flag;->SCOPES_ROUTE:Lio/flutter/view/AccessibilityBridge$Flag;

    invoke-direct {p0, v0}, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->hasFlag(Lio/flutter/view/AccessibilityBridge$Flag;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 2687
    return v1

    .line 2689
    :cond_0
    sget-object v0, Lio/flutter/view/AccessibilityBridge$Flag;->IS_FOCUSABLE:Lio/flutter/view/AccessibilityBridge$Flag;

    invoke-direct {p0, v0}, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->hasFlag(Lio/flutter/view/AccessibilityBridge$Flag;)Z

    move-result v0

    const/4 v2, 0x1

    if-eqz v0, :cond_1

    .line 2690
    return v2

    .line 2695
    :cond_1
    iget v0, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->actions:I

    invoke-static {}, Lio/flutter/view/AccessibilityBridge;->access$7400()I

    move-result v3

    not-int v3, v3

    and-int/2addr v0, v3

    if-nez v0, :cond_5

    iget v0, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->flags:I

    .line 2696
    invoke-static {}, Lio/flutter/view/AccessibilityBridge;->access$7500()I

    move-result v3

    and-int/2addr v0, v3

    if-nez v0, :cond_5

    iget-object v0, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->label:Ljava/lang/String;

    if-eqz v0, :cond_2

    .line 2697
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_5

    :cond_2
    iget-object v0, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->value:Ljava/lang/String;

    if-eqz v0, :cond_3

    .line 2698
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_5

    :cond_3
    iget-object v0, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->hint:Ljava/lang/String;

    if-eqz v0, :cond_4

    .line 2699
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_4

    goto :goto_0

    :cond_4
    goto :goto_1

    :cond_5
    :goto_0
    const/4 v1, 0x1

    .line 2695
    :goto_1
    return v1
.end method

.method private log(Ljava/lang/String;Z)V
    .locals 4
    .param p1, "indent"    # Ljava/lang/String;
    .param p2, "recursive"    # Z

    .line 2431
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "SemanticsNode id="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->id:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " identifier="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->identifier:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " label="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->label:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " actions="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->actions:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " flags="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->flags:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "  +-- textDirection="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v2, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->textDirection:Lio/flutter/view/AccessibilityBridge$TextDirection;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "  +-- rect.ltrb=("

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v2, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->left:F

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, ", "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v3, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->top:F

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v3, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->right:F

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v2, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->bottom:F

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, ")\n"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "  +-- transform="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v2, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->transform:[F

    .line 2461
    invoke-static {v2}, Ljava/util/Arrays;->toString([F)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 2431
    const-string v1, "AccessibilityBridge"

    invoke-static {v1, v0}, Lio/flutter/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 2463
    if-eqz p2, :cond_0

    .line 2464
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "  "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 2465
    .local v0, "childIndent":Ljava/lang/String;
    iget-object v1, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->childrenInTraversalOrder:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lio/flutter/view/AccessibilityBridge$SemanticsNode;

    .line 2466
    .local v2, "child":Lio/flutter/view/AccessibilityBridge$SemanticsNode;
    invoke-direct {v2, v0, p2}, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->log(Ljava/lang/String;Z)V

    .line 2467
    .end local v2    # "child":Lio/flutter/view/AccessibilityBridge$SemanticsNode;
    goto :goto_0

    .line 2470
    .end local v0    # "childIndent":Ljava/lang/String;
    :cond_0
    return-void
.end method

.method private max(FFFF)F
    .locals 1
    .param p1, "a"    # F
    .param p2, "b"    # F
    .param p3, "c"    # F
    .param p4, "d"    # F

    .line 2816
    invoke-static {p3, p4}, Ljava/lang/Math;->max(FF)F

    move-result v0

    invoke-static {p2, v0}, Ljava/lang/Math;->max(FF)F

    move-result v0

    invoke-static {p1, v0}, Ljava/lang/Math;->max(FF)F

    move-result v0

    return v0
.end method

.method private min(FFFF)F
    .locals 1
    .param p1, "a"    # F
    .param p2, "b"    # F
    .param p3, "c"    # F
    .param p4, "d"    # F

    .line 2812
    invoke-static {p3, p4}, Ljava/lang/Math;->min(FF)F

    move-result v0

    invoke-static {p2, v0}, Ljava/lang/Math;->min(FF)F

    move-result v0

    invoke-static {p1, v0}, Ljava/lang/Math;->min(FF)F

    move-result v0

    return v0
.end method

.method private static nullableHasAncestor(Lio/flutter/view/AccessibilityBridge$SemanticsNode;Lio/flutter/util/Predicate;)Z
    .locals 1
    .param p0, "target"    # Lio/flutter/view/AccessibilityBridge$SemanticsNode;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/flutter/view/AccessibilityBridge$SemanticsNode;",
            "Lio/flutter/util/Predicate<",
            "Lio/flutter/view/AccessibilityBridge$SemanticsNode;",
            ">;)Z"
        }
    .end annotation

    .line 2283
    .local p1, "tester":Lio/flutter/util/Predicate;, "Lio/flutter/util/Predicate<Lio/flutter/view/AccessibilityBridge$SemanticsNode;>;"
    if-eqz p0, :cond_0

    invoke-direct {p0, p1}, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->getAncestor(Lio/flutter/util/Predicate;)Lio/flutter/view/AccessibilityBridge$SemanticsNode;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private transformPoint([F[F[F)V
    .locals 6
    .param p1, "result"    # [F
    .param p2, "transform"    # [F
    .param p3, "point"    # [F

    .line 2803
    const/4 v1, 0x0

    const/4 v3, 0x0

    const/4 v5, 0x0

    move-object v0, p1

    move-object v2, p2

    move-object v4, p3

    invoke-static/range {v0 .. v5}, Landroid/opengl/Matrix;->multiplyMV([FI[FI[FI)V

    .line 2804
    const/4 v0, 0x3

    aget v1, p1, v0

    .line 2805
    .local v1, "w":F
    const/4 v2, 0x0

    aget v3, p1, v2

    div-float/2addr v3, v1

    aput v3, p1, v2

    .line 2806
    const/4 v2, 0x1

    aget v3, p1, v2

    div-float/2addr v3, v1

    aput v3, p1, v2

    .line 2807
    const/4 v2, 0x2

    aget v3, p1, v2

    div-float/2addr v3, v1

    aput v3, p1, v2

    .line 2808
    const/4 v2, 0x0

    aput v2, p1, v0

    .line 2809
    return-void
.end method

.method private updateRecursively([FLjava/util/Set;Z)V
    .locals 17
    .param p1, "ancestorTransform"    # [F
    .param p3, "forceUpdate"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([F",
            "Ljava/util/Set<",
            "Lio/flutter/view/AccessibilityBridge$SemanticsNode;",
            ">;Z)V"
        }
    .end annotation

    .line 2730
    .local p2, "visitedObjects":Ljava/util/Set;, "Ljava/util/Set<Lio/flutter/view/AccessibilityBridge$SemanticsNode;>;"
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-interface {v1, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 2732
    iget-boolean v2, v0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->globalGeometryDirty:Z

    if-eqz v2, :cond_0

    .line 2733
    const/4 v2, 0x1

    .end local p3    # "forceUpdate":Z
    .local v2, "forceUpdate":Z
    goto :goto_0

    .line 2732
    .end local v2    # "forceUpdate":Z
    .restart local p3    # "forceUpdate":Z
    :cond_0
    move/from16 v2, p3

    .line 2736
    .end local p3    # "forceUpdate":Z
    .restart local v2    # "forceUpdate":Z
    :goto_0
    const-string v3, "AccessibilityBridge"

    if-eqz v2, :cond_4

    .line 2737
    iget-object v4, v0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->globalTransform:[F

    const/16 v5, 0x10

    if-nez v4, :cond_1

    .line 2738
    new-array v4, v5, [F

    iput-object v4, v0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->globalTransform:[F

    .line 2740
    :cond_1
    iget-object v4, v0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->transform:[F

    const/4 v6, 0x1

    if-nez v4, :cond_2

    .line 2742
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "transform has not been initialized for id = "

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v7, v0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->id:I

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lio/flutter/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 2743
    iget-object v4, v0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->accessibilityBridge:Lio/flutter/view/AccessibilityBridge;

    invoke-static {v4}, Lio/flutter/view/AccessibilityBridge;->access$7600(Lio/flutter/view/AccessibilityBridge;)Lio/flutter/view/AccessibilityBridge$SemanticsNode;

    move-result-object v4

    const-string v7, "Semantics tree:"

    invoke-direct {v4, v7, v6}, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->log(Ljava/lang/String;Z)V

    .line 2745
    new-array v4, v5, [F

    iput-object v4, v0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->transform:[F

    .line 2747
    :cond_2
    iget-object v7, v0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->globalTransform:[F

    const/4 v8, 0x0

    const/4 v10, 0x0

    iget-object v11, v0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->transform:[F

    const/4 v12, 0x0

    move-object/from16 v9, p1

    invoke-static/range {v7 .. v12}, Landroid/opengl/Matrix;->multiplyMM([FI[FI[FI)V

    .line 2749
    const/4 v4, 0x4

    new-array v5, v4, [F

    .line 2750
    .local v5, "sample":[F
    const/4 v7, 0x2

    const/4 v8, 0x0

    aput v8, v5, v7

    .line 2751
    const/4 v7, 0x3

    const/high16 v8, 0x3f800000    # 1.0f

    aput v8, v5, v7

    .line 2753
    new-array v7, v4, [F

    .line 2754
    .local v7, "point1":[F
    new-array v8, v4, [F

    .line 2755
    .local v8, "point2":[F
    new-array v9, v4, [F

    .line 2756
    .local v9, "point3":[F
    new-array v4, v4, [F

    .line 2758
    .local v4, "point4":[F
    iget v10, v0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->left:F

    const/4 v11, 0x0

    aput v10, v5, v11

    .line 2759
    iget v10, v0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->top:F

    aput v10, v5, v6

    .line 2760
    iget-object v10, v0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->globalTransform:[F

    invoke-direct {v0, v7, v10, v5}, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->transformPoint([F[F[F)V

    .line 2762
    iget v10, v0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->right:F

    aput v10, v5, v11

    .line 2763
    iget v10, v0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->top:F

    aput v10, v5, v6

    .line 2764
    iget-object v10, v0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->globalTransform:[F

    invoke-direct {v0, v8, v10, v5}, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->transformPoint([F[F[F)V

    .line 2766
    iget v10, v0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->right:F

    aput v10, v5, v11

    .line 2767
    iget v10, v0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->bottom:F

    aput v10, v5, v6

    .line 2768
    iget-object v10, v0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->globalTransform:[F

    invoke-direct {v0, v9, v10, v5}, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->transformPoint([F[F[F)V

    .line 2770
    iget v10, v0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->left:F

    aput v10, v5, v11

    .line 2771
    iget v10, v0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->bottom:F

    aput v10, v5, v6

    .line 2772
    iget-object v10, v0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->globalTransform:[F

    invoke-direct {v0, v4, v10, v5}, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->transformPoint([F[F[F)V

    .line 2774
    iget-object v10, v0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->globalRect:Landroid/graphics/Rect;

    if-nez v10, :cond_3

    new-instance v10, Landroid/graphics/Rect;

    invoke-direct {v10}, Landroid/graphics/Rect;-><init>()V

    iput-object v10, v0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->globalRect:Landroid/graphics/Rect;

    .line 2776
    :cond_3
    iget-object v10, v0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->globalRect:Landroid/graphics/Rect;

    aget v12, v7, v11

    aget v13, v8, v11

    aget v14, v9, v11

    aget v15, v4, v11

    .line 2777
    invoke-direct {v0, v12, v13, v14, v15}, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->min(FFFF)F

    move-result v12

    invoke-static {v12}, Ljava/lang/Math;->round(F)I

    move-result v12

    aget v13, v7, v6

    aget v14, v8, v6

    aget v15, v9, v6

    aget v11, v4, v6

    .line 2778
    invoke-direct {v0, v13, v14, v15, v11}, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->min(FFFF)F

    move-result v11

    invoke-static {v11}, Ljava/lang/Math;->round(F)I

    move-result v11

    const/4 v13, 0x0

    aget v14, v7, v13

    aget v15, v8, v13

    aget v6, v9, v13

    move-object/from16 v16, v5

    .end local v5    # "sample":[F
    .local v16, "sample":[F
    aget v5, v4, v13

    .line 2779
    invoke-direct {v0, v14, v15, v6, v5}, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->max(FFFF)F

    move-result v5

    invoke-static {v5}, Ljava/lang/Math;->round(F)I

    move-result v5

    const/4 v6, 0x1

    aget v13, v7, v6

    aget v14, v8, v6

    aget v15, v9, v6

    aget v6, v4, v6

    .line 2780
    invoke-direct {v0, v13, v14, v15, v6}, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->max(FFFF)F

    move-result v6

    invoke-static {v6}, Ljava/lang/Math;->round(F)I

    move-result v6

    .line 2776
    invoke-virtual {v10, v12, v11, v5, v6}, Landroid/graphics/Rect;->set(IIII)V

    .line 2782
    const/4 v5, 0x0

    iput-boolean v5, v0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->globalGeometryDirty:Z

    .line 2786
    .end local v4    # "point4":[F
    .end local v7    # "point1":[F
    .end local v8    # "point2":[F
    .end local v9    # "point3":[F
    .end local v16    # "sample":[F
    :cond_4
    iget-object v4, v0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->globalTransform:[F

    if-nez v4, :cond_5

    .line 2787
    const-string v4, "Expected globalTransform to not be null."

    invoke-static {v3, v4}, Lio/flutter/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 2789
    :cond_5
    iget-object v4, v0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->globalRect:Landroid/graphics/Rect;

    if-nez v4, :cond_6

    .line 2790
    const-string v4, "Expected globalRect to not be null."

    invoke-static {v3, v4}, Lio/flutter/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 2794
    :cond_6
    const/4 v3, -0x1

    .line 2795
    .local v3, "previousNodeId":I
    iget-object v4, v0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->childrenInTraversalOrder:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_7

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lio/flutter/view/AccessibilityBridge$SemanticsNode;

    .line 2796
    .local v5, "child":Lio/flutter/view/AccessibilityBridge$SemanticsNode;
    iput v3, v5, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->previousNodeId:I

    .line 2797
    iget v3, v5, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->id:I

    .line 2798
    iget-object v6, v0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->globalTransform:[F

    invoke-direct {v5, v6, v1, v2}, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->updateRecursively([FLjava/util/Set;Z)V

    .line 2799
    .end local v5    # "child":Lio/flutter/view/AccessibilityBridge$SemanticsNode;
    goto :goto_1

    .line 2800
    :cond_7
    return-void
.end method

.method private updateWith(Ljava/nio/ByteBuffer;[Ljava/lang/String;[Ljava/nio/ByteBuffer;)V
    .locals 8
    .param p1, "buffer"    # Ljava/nio/ByteBuffer;
    .param p2, "strings"    # [Ljava/lang/String;
    .param p3, "stringAttributeArgs"    # [Ljava/nio/ByteBuffer;

    .line 2476
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->hadPreviousConfig:Z

    .line 2477
    iget-object v1, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->value:Ljava/lang/String;

    iput-object v1, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->previousValue:Ljava/lang/String;

    .line 2478
    iget-object v1, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->label:Ljava/lang/String;

    iput-object v1, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->previousLabel:Ljava/lang/String;

    .line 2479
    iget v1, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->flags:I

    iput v1, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->previousFlags:I

    .line 2480
    iget v1, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->actions:I

    iput v1, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->previousActions:I

    .line 2481
    iget v1, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->textSelectionBase:I

    iput v1, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->previousTextSelectionBase:I

    .line 2482
    iget v1, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->textSelectionExtent:I

    iput v1, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->previousTextSelectionExtent:I

    .line 2483
    iget v1, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->scrollPosition:F

    iput v1, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->previousScrollPosition:F

    .line 2484
    iget v1, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->scrollExtentMax:F

    iput v1, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->previousScrollExtentMax:F

    .line 2485
    iget v1, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->scrollExtentMin:F

    iput v1, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->previousScrollExtentMin:F

    .line 2487
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v1

    iput v1, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->flags:I

    .line 2488
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v1

    iput v1, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->actions:I

    .line 2489
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v1

    iput v1, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->maxValueLength:I

    .line 2490
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v1

    iput v1, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->currentValueLength:I

    .line 2491
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v1

    iput v1, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->textSelectionBase:I

    .line 2492
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v1

    iput v1, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->textSelectionExtent:I

    .line 2493
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v1

    iput v1, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->platformViewId:I

    .line 2494
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v1

    iput v1, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->scrollChildren:I

    .line 2495
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v1

    iput v1, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->scrollIndex:I

    .line 2496
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getFloat()F

    move-result v1

    iput v1, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->scrollPosition:F

    .line 2497
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getFloat()F

    move-result v1

    iput v1, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->scrollExtentMax:F

    .line 2498
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getFloat()F

    move-result v1

    iput v1, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->scrollExtentMin:F

    .line 2500
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v1

    .line 2502
    .local v1, "stringIndex":I
    const/4 v2, 0x0

    const/4 v3, -0x1

    if-ne v1, v3, :cond_0

    move-object v4, v2

    goto :goto_0

    :cond_0
    aget-object v4, p2, v1

    :goto_0
    iput-object v4, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->identifier:Ljava/lang/String;

    .line 2503
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v1

    .line 2505
    if-ne v1, v3, :cond_1

    move-object v4, v2

    goto :goto_1

    :cond_1
    aget-object v4, p2, v1

    :goto_1
    iput-object v4, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->label:Ljava/lang/String;

    .line 2507
    invoke-direct {p0, p1, p3}, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->getStringAttributesFromBuffer(Ljava/nio/ByteBuffer;[Ljava/nio/ByteBuffer;)Ljava/util/List;

    move-result-object v4

    iput-object v4, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->labelAttributes:Ljava/util/List;

    .line 2509
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v1

    .line 2510
    if-ne v1, v3, :cond_2

    move-object v4, v2

    goto :goto_2

    :cond_2
    aget-object v4, p2, v1

    :goto_2
    iput-object v4, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->value:Ljava/lang/String;

    .line 2512
    invoke-direct {p0, p1, p3}, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->getStringAttributesFromBuffer(Ljava/nio/ByteBuffer;[Ljava/nio/ByteBuffer;)Ljava/util/List;

    move-result-object v4

    iput-object v4, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->valueAttributes:Ljava/util/List;

    .line 2514
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v1

    .line 2515
    if-ne v1, v3, :cond_3

    move-object v4, v2

    goto :goto_3

    :cond_3
    aget-object v4, p2, v1

    :goto_3
    iput-object v4, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->increasedValue:Ljava/lang/String;

    .line 2517
    invoke-direct {p0, p1, p3}, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->getStringAttributesFromBuffer(Ljava/nio/ByteBuffer;[Ljava/nio/ByteBuffer;)Ljava/util/List;

    move-result-object v4

    iput-object v4, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->increasedValueAttributes:Ljava/util/List;

    .line 2519
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v1

    .line 2520
    if-ne v1, v3, :cond_4

    move-object v4, v2

    goto :goto_4

    :cond_4
    aget-object v4, p2, v1

    :goto_4
    iput-object v4, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->decreasedValue:Ljava/lang/String;

    .line 2522
    invoke-direct {p0, p1, p3}, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->getStringAttributesFromBuffer(Ljava/nio/ByteBuffer;[Ljava/nio/ByteBuffer;)Ljava/util/List;

    move-result-object v4

    iput-object v4, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->decreasedValueAttributes:Ljava/util/List;

    .line 2524
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v1

    .line 2525
    if-ne v1, v3, :cond_5

    move-object v4, v2

    goto :goto_5

    :cond_5
    aget-object v4, p2, v1

    :goto_5
    iput-object v4, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->hint:Ljava/lang/String;

    .line 2527
    invoke-direct {p0, p1, p3}, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->getStringAttributesFromBuffer(Ljava/nio/ByteBuffer;[Ljava/nio/ByteBuffer;)Ljava/util/List;

    move-result-object v4

    iput-object v4, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->hintAttributes:Ljava/util/List;

    .line 2529
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v1

    .line 2530
    if-ne v1, v3, :cond_6

    move-object v4, v2

    goto :goto_6

    :cond_6
    aget-object v4, p2, v1

    :goto_6
    iput-object v4, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->tooltip:Ljava/lang/String;

    .line 2532
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v4

    invoke-static {v4}, Lio/flutter/view/AccessibilityBridge$TextDirection;->fromInt(I)Lio/flutter/view/AccessibilityBridge$TextDirection;

    move-result-object v4

    iput-object v4, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->textDirection:Lio/flutter/view/AccessibilityBridge$TextDirection;

    .line 2534
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getFloat()F

    move-result v4

    iput v4, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->left:F

    .line 2535
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getFloat()F

    move-result v4

    iput v4, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->top:F

    .line 2536
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getFloat()F

    move-result v4

    iput v4, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->right:F

    .line 2537
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getFloat()F

    move-result v4

    iput v4, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->bottom:F

    .line 2539
    iget-object v4, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->transform:[F

    const/16 v5, 0x10

    if-nez v4, :cond_7

    .line 2540
    new-array v4, v5, [F

    iput-object v4, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->transform:[F

    .line 2542
    :cond_7
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_7
    if-ge v4, v5, :cond_8

    .line 2543
    iget-object v6, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->transform:[F

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getFloat()F

    move-result v7

    aput v7, v6, v4

    .line 2542
    add-int/lit8 v4, v4, 0x1

    goto :goto_7

    .line 2545
    .end local v4    # "i":I
    :cond_8
    iput-boolean v0, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->inverseTransformDirty:Z

    .line 2546
    iput-boolean v0, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->globalGeometryDirty:Z

    .line 2548
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    .line 2549
    .local v0, "childCount":I
    iget-object v4, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->childrenInTraversalOrder:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->clear()V

    .line 2550
    iget-object v4, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->childrenInHitTestOrder:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->clear()V

    .line 2551
    const/4 v4, 0x0

    .restart local v4    # "i":I
    :goto_8
    if-ge v4, v0, :cond_9

    .line 2552
    iget-object v5, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->accessibilityBridge:Lio/flutter/view/AccessibilityBridge;

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v6

    invoke-static {v5, v6}, Lio/flutter/view/AccessibilityBridge;->access$7000(Lio/flutter/view/AccessibilityBridge;I)Lio/flutter/view/AccessibilityBridge$SemanticsNode;

    move-result-object v5

    .line 2553
    .local v5, "child":Lio/flutter/view/AccessibilityBridge$SemanticsNode;
    iput-object p0, v5, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->parent:Lio/flutter/view/AccessibilityBridge$SemanticsNode;

    .line 2554
    iget-object v6, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->childrenInTraversalOrder:Ljava/util/List;

    invoke-interface {v6, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 2551
    .end local v5    # "child":Lio/flutter/view/AccessibilityBridge$SemanticsNode;
    add-int/lit8 v4, v4, 0x1

    goto :goto_8

    .line 2556
    .end local v4    # "i":I
    :cond_9
    const/4 v4, 0x0

    .restart local v4    # "i":I
    :goto_9
    if-ge v4, v0, :cond_a

    .line 2557
    iget-object v5, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->accessibilityBridge:Lio/flutter/view/AccessibilityBridge;

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v6

    invoke-static {v5, v6}, Lio/flutter/view/AccessibilityBridge;->access$7000(Lio/flutter/view/AccessibilityBridge;I)Lio/flutter/view/AccessibilityBridge$SemanticsNode;

    move-result-object v5

    .line 2558
    .restart local v5    # "child":Lio/flutter/view/AccessibilityBridge$SemanticsNode;
    iput-object p0, v5, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->parent:Lio/flutter/view/AccessibilityBridge$SemanticsNode;

    .line 2559
    iget-object v6, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->childrenInHitTestOrder:Ljava/util/List;

    invoke-interface {v6, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 2556
    .end local v5    # "child":Lio/flutter/view/AccessibilityBridge$SemanticsNode;
    add-int/lit8 v4, v4, 0x1

    goto :goto_9

    .line 2562
    .end local v4    # "i":I
    :cond_a
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v4

    .line 2563
    .local v4, "actionCount":I
    if-nez v4, :cond_b

    .line 2564
    iput-object v2, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->customAccessibilityActions:Ljava/util/List;

    goto :goto_d

    .line 2566
    :cond_b
    iget-object v2, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->customAccessibilityActions:Ljava/util/List;

    if-nez v2, :cond_c

    .line 2567
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2, v4}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v2, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->customAccessibilityActions:Ljava/util/List;

    goto :goto_a

    .line 2568
    :cond_c
    invoke-interface {v2}, Ljava/util/List;->clear()V

    .line 2570
    :goto_a
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_b
    if-ge v2, v4, :cond_10

    .line 2571
    iget-object v5, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->accessibilityBridge:Lio/flutter/view/AccessibilityBridge;

    .line 2572
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v6

    invoke-static {v5, v6}, Lio/flutter/view/AccessibilityBridge;->access$7100(Lio/flutter/view/AccessibilityBridge;I)Lio/flutter/view/AccessibilityBridge$CustomAccessibilityAction;

    move-result-object v5

    .line 2573
    .local v5, "action":Lio/flutter/view/AccessibilityBridge$CustomAccessibilityAction;
    invoke-static {v5}, Lio/flutter/view/AccessibilityBridge$CustomAccessibilityAction;->access$4800(Lio/flutter/view/AccessibilityBridge$CustomAccessibilityAction;)I

    move-result v6

    sget-object v7, Lio/flutter/view/AccessibilityBridge$Action;->TAP:Lio/flutter/view/AccessibilityBridge$Action;

    iget v7, v7, Lio/flutter/view/AccessibilityBridge$Action;->value:I

    if-ne v6, v7, :cond_d

    .line 2574
    iput-object v5, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->onTapOverride:Lio/flutter/view/AccessibilityBridge$CustomAccessibilityAction;

    goto :goto_c

    .line 2575
    :cond_d
    invoke-static {v5}, Lio/flutter/view/AccessibilityBridge$CustomAccessibilityAction;->access$4800(Lio/flutter/view/AccessibilityBridge$CustomAccessibilityAction;)I

    move-result v6

    sget-object v7, Lio/flutter/view/AccessibilityBridge$Action;->LONG_PRESS:Lio/flutter/view/AccessibilityBridge$Action;

    iget v7, v7, Lio/flutter/view/AccessibilityBridge$Action;->value:I

    if-ne v6, v7, :cond_e

    .line 2576
    iput-object v5, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->onLongPressOverride:Lio/flutter/view/AccessibilityBridge$CustomAccessibilityAction;

    goto :goto_c

    .line 2580
    :cond_e
    invoke-static {v5}, Lio/flutter/view/AccessibilityBridge$CustomAccessibilityAction;->access$4800(Lio/flutter/view/AccessibilityBridge$CustomAccessibilityAction;)I

    move-result v6

    if-eq v6, v3, :cond_f

    .line 2581
    const-string v6, "AccessibilityBridge"

    const-string v7, "Expected action.overrideId to be -1."

    invoke-static {v6, v7}, Lio/flutter/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 2583
    :cond_f
    iget-object v6, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->customAccessibilityActions:Ljava/util/List;

    invoke-interface {v6, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 2585
    :goto_c
    iget-object v6, p0, Lio/flutter/view/AccessibilityBridge$SemanticsNode;->customAccessibilityActions:Ljava/util/List;

    invoke-interface {v6, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 2570
    .end local v5    # "action":Lio/flutter/view/AccessibilityBridge$CustomAccessibilityAction;
    add-int/lit8 v2, v2, 0x1

    goto :goto_b

    .line 2588
    .end local v2    # "i":I
    :cond_10
    :goto_d
    return-void
.end method
