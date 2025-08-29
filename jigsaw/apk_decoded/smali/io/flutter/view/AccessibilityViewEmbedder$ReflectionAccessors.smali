.class Lio/flutter/view/AccessibilityViewEmbedder$ReflectionAccessors;
.super Ljava/lang/Object;
.source "AccessibilityViewEmbedder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/view/AccessibilityViewEmbedder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ReflectionAccessors"
.end annotation


# instance fields
.field private final childNodeIdsField:Ljava/lang/reflect/Field;

.field private final getChildId:Ljava/lang/reflect/Method;

.field private final getParentNodeId:Ljava/lang/reflect/Method;

.field private final getRecordSourceNodeId:Ljava/lang/reflect/Method;

.field private final getSourceNodeId:Ljava/lang/reflect/Method;

.field private final longArrayGetIndex:Ljava/lang/reflect/Method;


# direct methods
.method private constructor <init>()V
    .locals 12

    .line 434
    const-string v0, "getSourceNodeId"

    const-string v1, "AccessibilityBridge"

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 435
    const/4 v2, 0x0

    .line 436
    .local v2, "getSourceNodeId":Ljava/lang/reflect/Method;
    const/4 v3, 0x0

    .line 437
    .local v3, "getParentNodeId":Ljava/lang/reflect/Method;
    const/4 v4, 0x0

    .line 438
    .local v4, "getRecordSourceNodeId":Ljava/lang/reflect/Method;
    const/4 v5, 0x0

    .line 439
    .local v5, "getChildId":Ljava/lang/reflect/Method;
    const/4 v6, 0x0

    .line 440
    .local v6, "childNodeIdsField":Ljava/lang/reflect/Field;
    const/4 v7, 0x0

    .line 442
    .local v7, "longArrayGetIndex":Ljava/lang/reflect/Method;
    const/4 v8, 0x0

    :try_start_0
    const-class v9, Landroid/view/accessibility/AccessibilityNodeInfo;

    new-array v10, v8, [Ljava/lang/Class;

    invoke-virtual {v9, v0, v10}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v9
    :try_end_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_0

    move-object v2, v9

    .line 445
    goto :goto_0

    .line 443
    :catch_0
    move-exception v9

    .line 444
    .local v9, "e":Ljava/lang/NoSuchMethodException;
    const-string v10, "can\'t invoke AccessibilityNodeInfo#getSourceNodeId with reflection"

    invoke-static {v1, v10}, Lio/flutter/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 447
    .end local v9    # "e":Ljava/lang/NoSuchMethodException;
    :goto_0
    :try_start_1
    const-class v9, Landroid/view/accessibility/AccessibilityRecord;

    new-array v10, v8, [Ljava/lang/Class;

    invoke-virtual {v9, v0, v10}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0
    :try_end_1
    .catch Ljava/lang/NoSuchMethodException; {:try_start_1 .. :try_end_1} :catch_1

    move-object v4, v0

    .line 450
    goto :goto_1

    .line 448
    :catch_1
    move-exception v0

    .line 449
    .local v0, "e":Ljava/lang/NoSuchMethodException;
    const-string v9, "can\'t invoke AccessibiiltyRecord#getSourceNodeId with reflection"

    invoke-static {v1, v9}, Lio/flutter/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 452
    .end local v0    # "e":Ljava/lang/NoSuchMethodException;
    :goto_1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v9, 0x1a

    const/4 v10, 0x1

    if-gt v0, v9, :cond_0

    .line 454
    :try_start_2
    const-class v0, Landroid/view/accessibility/AccessibilityNodeInfo;

    const-string v9, "getParentNodeId"

    new-array v11, v8, [Ljava/lang/Class;

    invoke-virtual {v0, v9, v11}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0
    :try_end_2
    .catch Ljava/lang/NoSuchMethodException; {:try_start_2 .. :try_end_2} :catch_2

    move-object v3, v0

    .line 457
    goto :goto_2

    .line 455
    :catch_2
    move-exception v0

    .line 456
    .restart local v0    # "e":Ljava/lang/NoSuchMethodException;
    const-string v9, "can\'t invoke getParentNodeId with reflection"

    invoke-static {v1, v9}, Lio/flutter/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 461
    .end local v0    # "e":Ljava/lang/NoSuchMethodException;
    :goto_2
    :try_start_3
    const-class v0, Landroid/view/accessibility/AccessibilityNodeInfo;

    const-string v9, "getChildId"

    new-array v10, v10, [Ljava/lang/Class;

    sget-object v11, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v11, v10, v8

    invoke-virtual {v0, v9, v10}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0
    :try_end_3
    .catch Ljava/lang/NoSuchMethodException; {:try_start_3 .. :try_end_3} :catch_3

    move-object v5, v0

    goto :goto_3

    .line 462
    :catch_3
    move-exception v0

    .line 463
    .restart local v0    # "e":Ljava/lang/NoSuchMethodException;
    const-string v8, "can\'t invoke getChildId with reflection"

    invoke-static {v1, v8}, Lio/flutter/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 464
    .end local v0    # "e":Ljava/lang/NoSuchMethodException;
    :goto_3
    goto :goto_5

    .line 467
    :cond_0
    :try_start_4
    const-class v0, Landroid/view/accessibility/AccessibilityNodeInfo;

    const-string v9, "mChildNodeIds"

    invoke-virtual {v0, v9}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    move-object v6, v0

    .line 468
    invoke-virtual {v6, v10}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 471
    const-string v0, "android.util.LongArray"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    const-string v9, "get"

    new-array v10, v10, [Ljava/lang/Class;

    sget-object v11, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v11, v10, v8

    invoke-virtual {v0, v9, v10}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0
    :try_end_4
    .catch Ljava/lang/NoSuchFieldException; {:try_start_4 .. :try_end_4} :catch_7
    .catch Ljava/lang/ClassNotFoundException; {:try_start_4 .. :try_end_4} :catch_6
    .catch Ljava/lang/NoSuchMethodException; {:try_start_4 .. :try_end_4} :catch_5
    .catch Ljava/lang/NullPointerException; {:try_start_4 .. :try_end_4} :catch_4

    move-object v7, v0

    .line 478
    goto :goto_5

    .line 472
    :catch_4
    move-exception v0

    goto :goto_4

    :catch_5
    move-exception v0

    goto :goto_4

    :catch_6
    move-exception v0

    goto :goto_4

    :catch_7
    move-exception v0

    .line 476
    .local v0, "e":Ljava/lang/Exception;
    :goto_4
    const-string v8, "can\'t access childNodeIdsField with reflection"

    invoke-static {v1, v8}, Lio/flutter/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 477
    const/4 v6, 0x0

    .line 480
    .end local v0    # "e":Ljava/lang/Exception;
    :goto_5
    iput-object v2, p0, Lio/flutter/view/AccessibilityViewEmbedder$ReflectionAccessors;->getSourceNodeId:Ljava/lang/reflect/Method;

    .line 481
    iput-object v3, p0, Lio/flutter/view/AccessibilityViewEmbedder$ReflectionAccessors;->getParentNodeId:Ljava/lang/reflect/Method;

    .line 482
    iput-object v4, p0, Lio/flutter/view/AccessibilityViewEmbedder$ReflectionAccessors;->getRecordSourceNodeId:Ljava/lang/reflect/Method;

    .line 483
    iput-object v5, p0, Lio/flutter/view/AccessibilityViewEmbedder$ReflectionAccessors;->getChildId:Ljava/lang/reflect/Method;

    .line 484
    iput-object v6, p0, Lio/flutter/view/AccessibilityViewEmbedder$ReflectionAccessors;->childNodeIdsField:Ljava/lang/reflect/Field;

    .line 485
    iput-object v7, p0, Lio/flutter/view/AccessibilityViewEmbedder$ReflectionAccessors;->longArrayGetIndex:Ljava/lang/reflect/Method;

    .line 486
    return-void
.end method

.method synthetic constructor <init>(Lio/flutter/view/AccessibilityViewEmbedder$1;)V
    .locals 0
    .param p1, "x0"    # Lio/flutter/view/AccessibilityViewEmbedder$1;

    .line 425
    invoke-direct {p0}, Lio/flutter/view/AccessibilityViewEmbedder$ReflectionAccessors;-><init>()V

    return-void
.end method

.method static synthetic access$100(Lio/flutter/view/AccessibilityViewEmbedder$ReflectionAccessors;Landroid/view/accessibility/AccessibilityNodeInfo;)Ljava/lang/Long;
    .locals 1
    .param p0, "x0"    # Lio/flutter/view/AccessibilityViewEmbedder$ReflectionAccessors;
    .param p1, "x1"    # Landroid/view/accessibility/AccessibilityNodeInfo;

    .line 425
    invoke-direct {p0, p1}, Lio/flutter/view/AccessibilityViewEmbedder$ReflectionAccessors;->getSourceNodeId(Landroid/view/accessibility/AccessibilityNodeInfo;)Ljava/lang/Long;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$200(J)I
    .locals 1
    .param p0, "x0"    # J

    .line 425
    invoke-static {p0, p1}, Lio/flutter/view/AccessibilityViewEmbedder$ReflectionAccessors;->getVirtualNodeId(J)I

    move-result v0

    return v0
.end method

.method static synthetic access$300(Lio/flutter/view/AccessibilityViewEmbedder$ReflectionAccessors;Landroid/view/accessibility/AccessibilityNodeInfo;)Ljava/lang/Long;
    .locals 1
    .param p0, "x0"    # Lio/flutter/view/AccessibilityViewEmbedder$ReflectionAccessors;
    .param p1, "x1"    # Landroid/view/accessibility/AccessibilityNodeInfo;

    .line 425
    invoke-direct {p0, p1}, Lio/flutter/view/AccessibilityViewEmbedder$ReflectionAccessors;->getParentNodeId(Landroid/view/accessibility/AccessibilityNodeInfo;)Ljava/lang/Long;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$500(Lio/flutter/view/AccessibilityViewEmbedder$ReflectionAccessors;Landroid/view/accessibility/AccessibilityNodeInfo;I)Ljava/lang/Long;
    .locals 1
    .param p0, "x0"    # Lio/flutter/view/AccessibilityViewEmbedder$ReflectionAccessors;
    .param p1, "x1"    # Landroid/view/accessibility/AccessibilityNodeInfo;
    .param p2, "x2"    # I

    .line 425
    invoke-direct {p0, p1, p2}, Lio/flutter/view/AccessibilityViewEmbedder$ReflectionAccessors;->getChildId(Landroid/view/accessibility/AccessibilityNodeInfo;I)Ljava/lang/Long;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$600(Lio/flutter/view/AccessibilityViewEmbedder$ReflectionAccessors;Landroid/view/accessibility/AccessibilityRecord;)Ljava/lang/Long;
    .locals 1
    .param p0, "x0"    # Lio/flutter/view/AccessibilityViewEmbedder$ReflectionAccessors;
    .param p1, "x1"    # Landroid/view/accessibility/AccessibilityRecord;

    .line 425
    invoke-direct {p0, p1}, Lio/flutter/view/AccessibilityViewEmbedder$ReflectionAccessors;->getRecordSourceNodeId(Landroid/view/accessibility/AccessibilityRecord;)Ljava/lang/Long;

    move-result-object v0

    return-object v0
.end method

.method private getChildId(Landroid/view/accessibility/AccessibilityNodeInfo;I)Ljava/lang/Long;
    .locals 7
    .param p1, "node"    # Landroid/view/accessibility/AccessibilityNodeInfo;
    .param p2, "child"    # I

    .line 510
    iget-object v0, p0, Lio/flutter/view/AccessibilityViewEmbedder$ReflectionAccessors;->getChildId:Ljava/lang/reflect/Method;

    const/4 v1, 0x0

    if-nez v0, :cond_1

    iget-object v2, p0, Lio/flutter/view/AccessibilityViewEmbedder$ReflectionAccessors;->childNodeIdsField:Ljava/lang/reflect/Field;

    if-eqz v2, :cond_0

    iget-object v2, p0, Lio/flutter/view/AccessibilityViewEmbedder$ReflectionAccessors;->longArrayGetIndex:Ljava/lang/reflect/Method;

    if-nez v2, :cond_1

    .line 511
    :cond_0
    return-object v1

    .line 513
    :cond_1
    const/4 v2, 0x0

    const/4 v3, 0x1

    const-string v4, "AccessibilityBridge"

    if-eqz v0, :cond_2

    .line 515
    :try_start_0
    new-array v3, v3, [Ljava/lang/Object;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v2

    invoke-virtual {v0, p1, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;
    :try_end_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 523
    :catch_0
    move-exception v0

    .line 524
    .local v0, "e":Ljava/lang/reflect/InvocationTargetException;
    const-string v2, "The getChildId method threw an exception when invoked."

    invoke-static {v4, v2, v0}, Lio/flutter/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .end local v0    # "e":Ljava/lang/reflect/InvocationTargetException;
    goto :goto_0

    .line 521
    :catch_1
    move-exception v0

    .line 522
    .local v0, "e":Ljava/lang/IllegalAccessException;
    const-string v2, "Failed to access getChildId method."

    invoke-static {v4, v2, v0}, Lio/flutter/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 525
    .end local v0    # "e":Ljava/lang/IllegalAccessException;
    :goto_0
    goto :goto_2

    .line 528
    :cond_2
    :try_start_1
    iget-object v0, p0, Lio/flutter/view/AccessibilityViewEmbedder$ReflectionAccessors;->longArrayGetIndex:Ljava/lang/reflect/Method;

    iget-object v5, p0, Lio/flutter/view/AccessibilityViewEmbedder$ReflectionAccessors;->childNodeIdsField:Ljava/lang/reflect/Field;

    invoke-virtual {v5, p1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    new-array v3, v3, [Ljava/lang/Object;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v3, v2

    invoke-virtual {v0, v5, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0
    :try_end_1
    .catch Ljava/lang/IllegalAccessException; {:try_start_1 .. :try_end_1} :catch_4
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_1 .. :try_end_1} :catch_3
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_1 .. :try_end_1} :catch_2

    return-object v0

    .line 536
    :catch_2
    move-exception v0

    goto :goto_1

    :catch_3
    move-exception v0

    .line 537
    .local v0, "e":Ljava/lang/Exception;
    :goto_1
    const-string v2, "The longArrayGetIndex method threw an exception when invoked."

    invoke-static {v4, v2, v0}, Lio/flutter/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_2

    .line 534
    .end local v0    # "e":Ljava/lang/Exception;
    :catch_4
    move-exception v0

    .line 535
    .local v0, "e":Ljava/lang/IllegalAccessException;
    const-string v2, "Failed to access longArrayGetIndex method or the childNodeId field."

    invoke-static {v4, v2, v0}, Lio/flutter/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 538
    .end local v0    # "e":Ljava/lang/IllegalAccessException;
    nop

    .line 540
    :goto_2
    return-object v1
.end method

.method private getParentNodeId(Landroid/view/accessibility/AccessibilityNodeInfo;)Ljava/lang/Long;
    .locals 3
    .param p1, "node"    # Landroid/view/accessibility/AccessibilityNodeInfo;

    .line 545
    const-string v0, "AccessibilityBridge"

    iget-object v1, p0, Lio/flutter/view/AccessibilityViewEmbedder$ReflectionAccessors;->getParentNodeId:Ljava/lang/reflect/Method;

    if-eqz v1, :cond_0

    .line 547
    const/4 v2, 0x0

    :try_start_0
    new-array v2, v2, [Ljava/lang/Object;

    invoke-virtual {v1, p1, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Long;

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 555
    :catch_0
    move-exception v1

    .line 556
    .local v1, "e":Ljava/lang/reflect/InvocationTargetException;
    const-string v2, "The getParentNodeId method threw an exception when invoked."

    invoke-static {v0, v2, v1}, Lio/flutter/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 553
    .end local v1    # "e":Ljava/lang/reflect/InvocationTargetException;
    :catch_1
    move-exception v1

    .line 554
    .local v1, "e":Ljava/lang/IllegalAccessException;
    const-string v2, "Failed to access getParentNodeId method."

    invoke-static {v0, v2, v1}, Lio/flutter/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 557
    .end local v1    # "e":Ljava/lang/IllegalAccessException;
    nop

    .line 561
    :cond_0
    :goto_0
    invoke-static {p1}, Lio/flutter/view/AccessibilityViewEmbedder$ReflectionAccessors;->yoinkParentIdFromParcel(Landroid/view/accessibility/AccessibilityNodeInfo;)Ljava/lang/Long;

    move-result-object v0

    return-object v0
.end method

.method private getRecordSourceNodeId(Landroid/view/accessibility/AccessibilityRecord;)Ljava/lang/Long;
    .locals 4
    .param p1, "node"    # Landroid/view/accessibility/AccessibilityRecord;

    .line 613
    const-string v0, "AccessibilityBridge"

    iget-object v1, p0, Lio/flutter/view/AccessibilityViewEmbedder$ReflectionAccessors;->getRecordSourceNodeId:Ljava/lang/reflect/Method;

    const/4 v2, 0x0

    if-nez v1, :cond_0

    .line 614
    return-object v2

    .line 617
    :cond_0
    const/4 v3, 0x0

    :try_start_0
    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual {v1, p1, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Long;
    :try_end_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    .line 620
    :catch_0
    move-exception v1

    .line 621
    .local v1, "e":Ljava/lang/reflect/InvocationTargetException;
    const-string v3, "The getRecordSourceNodeId method threw an exception when invoked."

    invoke-static {v0, v3, v1}, Lio/flutter/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 618
    .end local v1    # "e":Ljava/lang/reflect/InvocationTargetException;
    :catch_1
    move-exception v1

    .line 619
    .local v1, "e":Ljava/lang/IllegalAccessException;
    const-string v3, "Failed to access the getRecordSourceNodeId method."

    invoke-static {v0, v3, v1}, Lio/flutter/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 622
    .end local v1    # "e":Ljava/lang/IllegalAccessException;
    nop

    .line 623
    :goto_0
    return-object v2
.end method

.method private getSourceNodeId(Landroid/view/accessibility/AccessibilityNodeInfo;)Ljava/lang/Long;
    .locals 4
    .param p1, "node"    # Landroid/view/accessibility/AccessibilityNodeInfo;

    .line 495
    const-string v0, "AccessibilityBridge"

    iget-object v1, p0, Lio/flutter/view/AccessibilityViewEmbedder$ReflectionAccessors;->getSourceNodeId:Ljava/lang/reflect/Method;

    const/4 v2, 0x0

    if-nez v1, :cond_0

    .line 496
    return-object v2

    .line 499
    :cond_0
    const/4 v3, 0x0

    :try_start_0
    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual {v1, p1, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Long;
    :try_end_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    .line 502
    :catch_0
    move-exception v1

    .line 503
    .local v1, "e":Ljava/lang/reflect/InvocationTargetException;
    const-string v3, "The getSourceNodeId method threw an exception when invoked."

    invoke-static {v0, v3, v1}, Lio/flutter/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 500
    .end local v1    # "e":Ljava/lang/reflect/InvocationTargetException;
    :catch_1
    move-exception v1

    .line 501
    .local v1, "e":Ljava/lang/IllegalAccessException;
    const-string v3, "Failed to access getSourceNodeId method."

    invoke-static {v0, v3, v1}, Lio/flutter/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 504
    .end local v1    # "e":Ljava/lang/IllegalAccessException;
    nop

    .line 505
    :goto_0
    return-object v2
.end method

.method private static getVirtualNodeId(J)I
    .locals 2
    .param p0, "nodeId"    # J

    .line 490
    const/16 v0, 0x20

    shr-long v0, p0, v0

    long-to-int v1, v0

    return v1
.end method

.method private static isBitSet(JI)Z
    .locals 5
    .param p0, "flags"    # J
    .param p2, "bitIndex"    # I

    .line 608
    const-wide/16 v0, 0x1

    shl-long/2addr v0, p2

    and-long/2addr v0, p0

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-eqz v4, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private static yoinkParentIdFromParcel(Landroid/view/accessibility/AccessibilityNodeInfo;)Ljava/lang/Long;
    .locals 8
    .param p0, "node"    # Landroid/view/accessibility/AccessibilityNodeInfo;

    .line 570
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1a

    if-ge v0, v1, :cond_0

    .line 571
    const-string v0, "AccessibilityBridge"

    const-string v1, "Unexpected Android version. Unable to find the parent ID."

    invoke-static {v0, v1}, Lio/flutter/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 572
    const/4 v0, 0x0

    return-object v0

    .line 579
    :cond_0
    invoke-static {p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->obtain(Landroid/view/accessibility/AccessibilityNodeInfo;)Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v0

    .line 580
    .local v0, "copy":Landroid/view/accessibility/AccessibilityNodeInfo;
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v1

    .line 581
    .local v1, "parcel":Landroid/os/Parcel;
    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/os/Parcel;->setDataPosition(I)V

    .line 582
    invoke-virtual {v0, v1, v2}, Landroid/view/accessibility/AccessibilityNodeInfo;->writeToParcel(Landroid/os/Parcel;I)V

    .line 583
    const/4 v3, 0x0

    .line 587
    .local v3, "parentNodeId":Ljava/lang/Long;
    invoke-virtual {v1, v2}, Landroid/os/Parcel;->setDataPosition(I)V

    .line 588
    invoke-virtual {v1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v4

    .line 589
    .local v4, "nonDefaultFields":J
    const/4 v2, 0x0

    .line 590
    .local v2, "fieldIndex":I
    add-int/lit8 v6, v2, 0x1

    .end local v2    # "fieldIndex":I
    .local v6, "fieldIndex":I
    invoke-static {v4, v5, v2}, Lio/flutter/view/AccessibilityViewEmbedder$ReflectionAccessors;->isBitSet(JI)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 591
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    .line 593
    :cond_1
    add-int/lit8 v2, v6, 0x1

    .end local v6    # "fieldIndex":I
    .restart local v2    # "fieldIndex":I
    invoke-static {v4, v5, v6}, Lio/flutter/view/AccessibilityViewEmbedder$ReflectionAccessors;->isBitSet(JI)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 594
    invoke-virtual {v1}, Landroid/os/Parcel;->readLong()J

    .line 596
    :cond_2
    add-int/lit8 v6, v2, 0x1

    .end local v2    # "fieldIndex":I
    .restart local v6    # "fieldIndex":I
    invoke-static {v4, v5, v2}, Lio/flutter/view/AccessibilityViewEmbedder$ReflectionAccessors;->isBitSet(JI)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 597
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    .line 599
    :cond_3
    add-int/lit8 v2, v6, 0x1

    .end local v6    # "fieldIndex":I
    .restart local v2    # "fieldIndex":I
    invoke-static {v4, v5, v6}, Lio/flutter/view/AccessibilityViewEmbedder$ReflectionAccessors;->isBitSet(JI)Z

    move-result v6

    if-eqz v6, :cond_4

    .line 600
    invoke-virtual {v1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    .line 603
    :cond_4
    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    .line 604
    return-object v3
.end method
