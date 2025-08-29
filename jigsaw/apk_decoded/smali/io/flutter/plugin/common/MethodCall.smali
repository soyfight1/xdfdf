.class public final Lio/flutter/plugin/common/MethodCall;
.super Ljava/lang/Object;
.source "MethodCall.java"


# instance fields
.field public final arguments:Ljava/lang/Object;

.field public final method:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 2
    .param p1, "method"    # Ljava/lang/String;
    .param p2, "arguments"    # Ljava/lang/Object;

    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    if-eqz p1, :cond_0

    .line 38
    iput-object p1, p0, Lio/flutter/plugin/common/MethodCall;->method:Ljava/lang/String;

    .line 39
    iput-object p2, p0, Lio/flutter/plugin/common/MethodCall;->arguments:Ljava/lang/Object;

    .line 40
    return-void

    .line 36
    :cond_0
    new-instance v0, Ljava/lang/AssertionError;

    const-string v1, "Parameter method must not be null."

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0
.end method


# virtual methods
.method public argument(Ljava/lang/String;)Ljava/lang/Object;
    .locals 2
    .param p1, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            ")TT;"
        }
    .end annotation

    .line 69
    iget-object v0, p0, Lio/flutter/plugin/common/MethodCall;->arguments:Ljava/lang/Object;

    if-nez v0, :cond_0

    .line 70
    const/4 v0, 0x0

    return-object v0

    .line 71
    :cond_0
    instance-of v1, v0, Ljava/util/Map;

    if-eqz v1, :cond_1

    .line 72
    check-cast v0, Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    .line 73
    :cond_1
    instance-of v1, v0, Lorg/json/JSONObject;

    if-eqz v1, :cond_2

    .line 74
    check-cast v0, Lorg/json/JSONObject;

    invoke-virtual {v0, p1}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    .line 76
    :cond_2
    new-instance v0, Ljava/lang/ClassCastException;

    invoke-direct {v0}, Ljava/lang/ClassCastException;-><init>()V

    throw v0
.end method

.method public arguments()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">()TT;"
        }
    .end annotation

    .line 51
    iget-object v0, p0, Lio/flutter/plugin/common/MethodCall;->arguments:Ljava/lang/Object;

    return-object v0
.end method

.method public hasArgument(Ljava/lang/String;)Z
    .locals 2
    .param p1, "key"    # Ljava/lang/String;

    .line 92
    iget-object v0, p0, Lio/flutter/plugin/common/MethodCall;->arguments:Ljava/lang/Object;

    if-nez v0, :cond_0

    .line 93
    const/4 v0, 0x0

    return v0

    .line 94
    :cond_0
    instance-of v1, v0, Ljava/util/Map;

    if-eqz v1, :cond_1

    .line 95
    check-cast v0, Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    return v0

    .line 96
    :cond_1
    instance-of v1, v0, Lorg/json/JSONObject;

    if-eqz v1, :cond_2

    .line 97
    check-cast v0, Lorg/json/JSONObject;

    invoke-virtual {v0, p1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    return v0

    .line 99
    :cond_2
    new-instance v0, Ljava/lang/ClassCastException;

    invoke-direct {v0}, Ljava/lang/ClassCastException;-><init>()V

    throw v0
.end method
