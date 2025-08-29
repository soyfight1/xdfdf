.class public Lio/flutter/plugin/common/ErrorLogResult;
.super Ljava/lang/Object;
.source "ErrorLogResult.java"

# interfaces
.implements Lio/flutter/plugin/common/MethodChannel$Result;


# instance fields
.field private level:I

.field private tag:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "tag"    # Ljava/lang/String;

    .line 19
    sget v0, Lio/flutter/Log;->WARN:I

    invoke-direct {p0, p1, v0}, Lio/flutter/plugin/common/ErrorLogResult;-><init>(Ljava/lang/String;I)V

    .line 20
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .param p1, "tag"    # Ljava/lang/String;
    .param p2, "level"    # I

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    iput-object p1, p0, Lio/flutter/plugin/common/ErrorLogResult;->tag:Ljava/lang/String;

    .line 24
    iput p2, p0, Lio/flutter/plugin/common/ErrorLogResult;->level:I

    .line 25
    return-void
.end method


# virtual methods
.method public error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 4
    .param p1, "errorCode"    # Ljava/lang/String;
    .param p2, "errorMessage"    # Ljava/lang/String;
    .param p3, "errorDetails"    # Ljava/lang/Object;

    .line 33
    if-eqz p3, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, " details: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_0
    const-string v0, ""

    .line 34
    .local v0, "details":Ljava/lang/String;
    :goto_0
    sget v1, Lio/flutter/Log;->WARN:I

    .line 35
    iget v1, p0, Lio/flutter/plugin/common/ErrorLogResult;->level:I

    iget-object v2, p0, Lio/flutter/plugin/common/ErrorLogResult;->tag:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lio/flutter/Log;->println(ILjava/lang/String;Ljava/lang/String;)V

    .line 37
    return-void
.end method

.method public notImplemented()V
    .locals 3

    .line 41
    sget v0, Lio/flutter/Log;->WARN:I

    .line 42
    iget v0, p0, Lio/flutter/plugin/common/ErrorLogResult;->level:I

    iget-object v1, p0, Lio/flutter/plugin/common/ErrorLogResult;->tag:Ljava/lang/String;

    const-string v2, "method not implemented"

    invoke-static {v0, v1, v2}, Lio/flutter/Log;->println(ILjava/lang/String;Ljava/lang/String;)V

    .line 44
    return-void
.end method

.method public success(Ljava/lang/Object;)V
    .locals 0
    .param p1, "result"    # Ljava/lang/Object;

    .line 28
    return-void
.end method
