.class public final Lio/flutter/util/TraceSection;
.super Ljava/lang/Object;
.source "TraceSection.java"

# interfaces
.implements Ljava/lang/AutoCloseable;


# direct methods
.method private constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;

    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    invoke-static {p1}, Lio/flutter/util/TraceSection;->begin(Ljava/lang/String;)V

    .line 29
    return-void
.end method

.method public static begin(Ljava/lang/String;)V
    .locals 1
    .param p0, "sectionName"    # Ljava/lang/String;

    .line 46
    invoke-static {p0}, Lio/flutter/util/TraceSection;->cropSectionName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroidx/tracing/Trace;->beginSection(Ljava/lang/String;)V

    .line 47
    return-void
.end method

.method public static beginAsyncSection(Ljava/lang/String;I)V
    .locals 1
    .param p0, "sectionName"    # Ljava/lang/String;
    .param p1, "cookie"    # I

    .line 61
    invoke-static {p0}, Lio/flutter/util/TraceSection;->cropSectionName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, p1}, Landroidx/tracing/Trace;->beginAsyncSection(Ljava/lang/String;I)V

    .line 62
    return-void
.end method

.method private static cropSectionName(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p0, "sectionName"    # Ljava/lang/String;

    .line 37
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0x7c

    if-ge v0, v1, :cond_0

    move-object v0, p0

    goto :goto_0

    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v2, 0x0

    invoke-virtual {p0, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "..."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0
.end method

.method public static end()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/RuntimeException;
        }
    .end annotation

    .line 51
    invoke-static {}, Landroidx/tracing/Trace;->endSection()V

    .line 52
    return-void
.end method

.method public static endAsyncSection(Ljava/lang/String;I)V
    .locals 1
    .param p0, "sectionName"    # Ljava/lang/String;
    .param p1, "cookie"    # I

    .line 66
    invoke-static {p0}, Lio/flutter/util/TraceSection;->cropSectionName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, p1}, Landroidx/tracing/Trace;->endAsyncSection(Ljava/lang/String;I)V

    .line 67
    return-void
.end method

.method public static scoped(Ljava/lang/String;)Lio/flutter/util/TraceSection;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .line 23
    new-instance v0, Lio/flutter/util/TraceSection;

    invoke-direct {v0, p0}, Lio/flutter/util/TraceSection;-><init>(Ljava/lang/String;)V

    return-object v0
.end method


# virtual methods
.method public close()V
    .locals 0

    .line 33
    invoke-static {}, Lio/flutter/util/TraceSection;->end()V

    .line 34
    return-void
.end method
