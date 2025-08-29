.class Lio/flutter/FlutterInjector$Builder$NamedThreadFactory;
.super Ljava/lang/Object;
.source "FlutterInjector.java"

# interfaces
.implements Ljava/util/concurrent/ThreadFactory;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/FlutterInjector$Builder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "NamedThreadFactory"
.end annotation


# instance fields
.field final synthetic this$0:Lio/flutter/FlutterInjector$Builder;

.field private threadId:I


# direct methods
.method private constructor <init>(Lio/flutter/FlutterInjector$Builder;)V
    .locals 0

    .line 119
    iput-object p1, p0, Lio/flutter/FlutterInjector$Builder$NamedThreadFactory;->this$0:Lio/flutter/FlutterInjector$Builder;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 120
    const/4 p1, 0x0

    iput p1, p0, Lio/flutter/FlutterInjector$Builder$NamedThreadFactory;->threadId:I

    return-void
.end method

.method synthetic constructor <init>(Lio/flutter/FlutterInjector$Builder;Lio/flutter/FlutterInjector$1;)V
    .locals 0
    .param p1, "x0"    # Lio/flutter/FlutterInjector$Builder;
    .param p2, "x1"    # Lio/flutter/FlutterInjector$1;

    .line 119
    invoke-direct {p0, p1}, Lio/flutter/FlutterInjector$Builder$NamedThreadFactory;-><init>(Lio/flutter/FlutterInjector$Builder;)V

    return-void
.end method


# virtual methods
.method public newThread(Ljava/lang/Runnable;)Ljava/lang/Thread;
    .locals 4
    .param p1, "command"    # Ljava/lang/Runnable;

    .line 123
    new-instance v0, Ljava/lang/Thread;

    invoke-direct {v0, p1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 124
    .local v0, "thread":Ljava/lang/Thread;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "flutter-worker-"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lio/flutter/FlutterInjector$Builder$NamedThreadFactory;->threadId:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lio/flutter/FlutterInjector$Builder$NamedThreadFactory;->threadId:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    .line 125
    return-object v0
.end method
