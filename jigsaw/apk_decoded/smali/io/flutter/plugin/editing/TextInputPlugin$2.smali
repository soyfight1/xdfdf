.class Lio/flutter/plugin/editing/TextInputPlugin$2;
.super Ljava/lang/Object;
.source "TextInputPlugin.java"

# interfaces
.implements Lio/flutter/plugin/editing/TextInputPlugin$MinMax;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/flutter/plugin/editing/TextInputPlugin;->saveEditableSizeAndTransform(DD[D)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lio/flutter/plugin/editing/TextInputPlugin;

.field final synthetic val$isAffine:Z

.field final synthetic val$matrix:[D

.field final synthetic val$minMax:[D


# direct methods
.method constructor <init>(Lio/flutter/plugin/editing/TextInputPlugin;Z[D[D)V
    .locals 0
    .param p1, "this$0"    # Lio/flutter/plugin/editing/TextInputPlugin;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 495
    iput-object p1, p0, Lio/flutter/plugin/editing/TextInputPlugin$2;->this$0:Lio/flutter/plugin/editing/TextInputPlugin;

    iput-boolean p2, p0, Lio/flutter/plugin/editing/TextInputPlugin$2;->val$isAffine:Z

    iput-object p3, p0, Lio/flutter/plugin/editing/TextInputPlugin$2;->val$matrix:[D

    iput-object p4, p0, Lio/flutter/plugin/editing/TextInputPlugin$2;->val$minMax:[D

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public inspect(DD)V
    .locals 14
    .param p1, "x"    # D
    .param p3, "y"    # D

    .line 498
    move-object v0, p0

    iget-boolean v1, v0, Lio/flutter/plugin/editing/TextInputPlugin$2;->val$isAffine:Z

    const-wide/high16 v2, 0x3ff0000000000000L    # 1.0

    const/4 v4, 0x3

    if-eqz v1, :cond_0

    goto :goto_0

    :cond_0
    iget-object v1, v0, Lio/flutter/plugin/editing/TextInputPlugin$2;->val$matrix:[D

    aget-wide v5, v1, v4

    mul-double v5, v5, p1

    const/4 v7, 0x7

    aget-wide v7, v1, v7

    mul-double v7, v7, p3

    add-double/2addr v5, v7

    const/16 v7, 0xf

    aget-wide v7, v1, v7

    add-double/2addr v5, v7

    div-double/2addr v2, v5

    :goto_0
    move-wide v1, v2

    .line 499
    .local v1, "w":D
    iget-object v3, v0, Lio/flutter/plugin/editing/TextInputPlugin$2;->val$matrix:[D

    const/4 v5, 0x0

    aget-wide v6, v3, v5

    mul-double v6, v6, p1

    const/4 v8, 0x4

    aget-wide v8, v3, v8

    mul-double v8, v8, p3

    add-double/2addr v6, v8

    const/16 v8, 0xc

    aget-wide v8, v3, v8

    add-double/2addr v6, v8

    mul-double v6, v6, v1

    .line 500
    .local v6, "tx":D
    const/4 v8, 0x1

    aget-wide v9, v3, v8

    mul-double v9, v9, p1

    const/4 v11, 0x5

    aget-wide v11, v3, v11

    mul-double v11, v11, p3

    add-double/2addr v9, v11

    const/16 v11, 0xd

    aget-wide v11, v3, v11

    add-double/2addr v9, v11

    mul-double v9, v9, v1

    .line 502
    .local v9, "ty":D
    iget-object v3, v0, Lio/flutter/plugin/editing/TextInputPlugin$2;->val$minMax:[D

    aget-wide v11, v3, v5

    cmpg-double v13, v6, v11

    if-gez v13, :cond_1

    .line 503
    aput-wide v6, v3, v5

    goto :goto_1

    .line 504
    :cond_1
    aget-wide v11, v3, v8

    cmpl-double v5, v6, v11

    if-lez v5, :cond_2

    .line 505
    aput-wide v6, v3, v8

    .line 508
    :cond_2
    :goto_1
    const/4 v5, 0x2

    aget-wide v11, v3, v5

    cmpg-double v8, v9, v11

    if-gez v8, :cond_3

    .line 509
    aput-wide v9, v3, v5

    goto :goto_2

    .line 510
    :cond_3
    aget-wide v11, v3, v4

    cmpl-double v5, v9, v11

    if-lez v5, :cond_4

    .line 511
    aput-wide v9, v3, v4

    .line 513
    :cond_4
    :goto_2
    return-void
.end method
