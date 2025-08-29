.class public final Landroidx/window/embedding/ExtensionEmbeddingBackend;
.super Ljava/lang/Object;
.source "ExtensionEmbeddingBackend.kt"

# interfaces
.implements Landroidx/window/embedding/EmbeddingBackend;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/window/embedding/ExtensionEmbeddingBackend$Api31Impl;,
        Landroidx/window/embedding/ExtensionEmbeddingBackend$Companion;,
        Landroidx/window/embedding/ExtensionEmbeddingBackend$EmbeddingCallbackImpl;,
        Landroidx/window/embedding/ExtensionEmbeddingBackend$RuleTracker;,
        Landroidx/window/embedding/ExtensionEmbeddingBackend$SplitListenerWrapper;
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nExtensionEmbeddingBackend.kt\nKotlin\n*S Kotlin\n*F\n+ 1 ExtensionEmbeddingBackend.kt\nandroidx/window/embedding/ExtensionEmbeddingBackend\n+ 2 fake.kt\nkotlin/jvm/internal/FakeKt\n*L\n1#1,433:1\n1#2:434\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0096\u0001\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\"\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\t\u0008\u0000\u0018\u0000 E2\u00020\u0001:\u0005DEFGHB\u0019\u0008\u0007\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0008\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u00a2\u0006\u0002\u0010\u0006J\u0010\u0010\u001c\u001a\u00020\u001d2\u0006\u0010\u001e\u001a\u00020\u001fH\u0017J,\u0010 \u001a\u00020\u001d2\u0006\u0010!\u001a\u00020\"2\u0006\u0010#\u001a\u00020$2\u0012\u0010%\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020(0\'0&H\u0016J\u0008\u0010)\u001a\u00020*H\u0002J\u0008\u0010+\u001a\u00020\u001dH\u0017J\u0012\u0010,\u001a\u0004\u0018\u00010-2\u0006\u0010!\u001a\u00020\"H\u0016J\u000e\u0010.\u001a\u0008\u0012\u0004\u0012\u00020\u001f0/H\u0017J\u0008\u00100\u001a\u00020\u001dH\u0017J\u0010\u00101\u001a\u00020*2\u0006\u0010!\u001a\u00020\"H\u0016J\u0010\u00102\u001a\u00020\u001d2\u0006\u0010\u001e\u001a\u00020\u001fH\u0017J\u001c\u00103\u001a\u00020\u001d2\u0012\u00104\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020(0\'0&H\u0016J\u0018\u00105\u001a\u0002062\u0006\u00107\u001a\u0002062\u0006\u00108\u001a\u000209H\u0017J\u0016\u0010:\u001a\u00020\u001d2\u000c\u0010;\u001a\u0008\u0012\u0004\u0012\u00020\u001f0/H\u0017J\u001c\u0010<\u001a\u00020\u001d2\u0012\u0010=\u001a\u000e\u0012\u0004\u0012\u00020?\u0012\u0004\u0012\u00020@0>H\u0017J\u0018\u0010A\u001a\u00020\u001d2\u0006\u0010B\u001a\u00020(2\u0006\u0010C\u001a\u00020@H\u0017R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000R \u0010\u0004\u001a\u0004\u0018\u00010\u00058\u0006@\u0006X\u0087\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0007\u0010\u0008\"\u0004\u0008\t\u0010\nR\u0010\u0010\u000b\u001a\u00020\u000c8\u0002X\u0083\u0004\u00a2\u0006\u0002\n\u0000R\"\u0010\r\u001a\u0008\u0012\u0004\u0012\u00020\u000f0\u000e8\u0006X\u0087\u0004\u00a2\u0006\u000e\n\u0000\u0012\u0004\u0008\u0010\u0010\u0011\u001a\u0004\u0008\u0012\u0010\u0013R\u0012\u0010\u0014\u001a\u00060\u0015R\u00020\u0000X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u001b\u0010\u0016\u001a\u00020\u00178VX\u0096\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008\u001a\u0010\u001b\u001a\u0004\u0008\u0018\u0010\u0019\u00a8\u0006I"
    }
    d2 = {
        "Landroidx/window/embedding/ExtensionEmbeddingBackend;",
        "Landroidx/window/embedding/EmbeddingBackend;",
        "applicationContext",
        "Landroid/content/Context;",
        "embeddingExtension",
        "Landroidx/window/embedding/EmbeddingInterfaceCompat;",
        "(Landroid/content/Context;Landroidx/window/embedding/EmbeddingInterfaceCompat;)V",
        "getEmbeddingExtension",
        "()Landroidx/window/embedding/EmbeddingInterfaceCompat;",
        "setEmbeddingExtension",
        "(Landroidx/window/embedding/EmbeddingInterfaceCompat;)V",
        "ruleTracker",
        "Landroidx/window/embedding/ExtensionEmbeddingBackend$RuleTracker;",
        "splitChangeCallbacks",
        "Ljava/util/concurrent/CopyOnWriteArrayList;",
        "Landroidx/window/embedding/ExtensionEmbeddingBackend$SplitListenerWrapper;",
        "getSplitChangeCallbacks$annotations",
        "()V",
        "getSplitChangeCallbacks",
        "()Ljava/util/concurrent/CopyOnWriteArrayList;",
        "splitInfoEmbeddingCallback",
        "Landroidx/window/embedding/ExtensionEmbeddingBackend$EmbeddingCallbackImpl;",
        "splitSupportStatus",
        "Landroidx/window/embedding/SplitController$SplitSupportStatus;",
        "getSplitSupportStatus",
        "()Landroidx/window/embedding/SplitController$SplitSupportStatus;",
        "splitSupportStatus$delegate",
        "Lkotlin/Lazy;",
        "addRule",
        "",
        "rule",
        "Landroidx/window/embedding/EmbeddingRule;",
        "addSplitListenerForActivity",
        "activity",
        "Landroid/app/Activity;",
        "executor",
        "Ljava/util/concurrent/Executor;",
        "callback",
        "Landroidx/core/util/Consumer;",
        "",
        "Landroidx/window/embedding/SplitInfo;",
        "areExtensionsAvailable",
        "",
        "clearSplitAttributesCalculator",
        "getActivityStack",
        "Landroidx/window/embedding/ActivityStack;",
        "getRules",
        "",
        "invalidateTopVisibleSplitAttributes",
        "isActivityEmbedded",
        "removeRule",
        "removeSplitListenerForActivity",
        "consumer",
        "setLaunchingActivityStack",
        "Landroid/app/ActivityOptions;",
        "options",
        "token",
        "Landroid/os/IBinder;",
        "setRules",
        "rules",
        "setSplitAttributesCalculator",
        "calculator",
        "Lkotlin/Function1;",
        "Landroidx/window/embedding/SplitAttributesCalculatorParams;",
        "Landroidx/window/embedding/SplitAttributes;",
        "updateSplitAttributes",
        "splitInfo",
        "splitAttributes",
        "Api31Impl",
        "Companion",
        "EmbeddingCallbackImpl",
        "RuleTracker",
        "SplitListenerWrapper",
        "window_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x8,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final Companion:Landroidx/window/embedding/ExtensionEmbeddingBackend$Companion;

.field private static final TAG:Ljava/lang/String; = "EmbeddingBackend"

.field private static volatile globalInstance:Landroidx/window/embedding/ExtensionEmbeddingBackend;

.field private static final globalLock:Ljava/util/concurrent/locks/ReentrantLock;


# instance fields
.field private final applicationContext:Landroid/content/Context;

.field private embeddingExtension:Landroidx/window/embedding/EmbeddingInterfaceCompat;

.field private final ruleTracker:Landroidx/window/embedding/ExtensionEmbeddingBackend$RuleTracker;

.field private final splitChangeCallbacks:Ljava/util/concurrent/CopyOnWriteArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/CopyOnWriteArrayList<",
            "Landroidx/window/embedding/ExtensionEmbeddingBackend$SplitListenerWrapper;",
            ">;"
        }
    .end annotation
.end field

.field private final splitInfoEmbeddingCallback:Landroidx/window/embedding/ExtensionEmbeddingBackend$EmbeddingCallbackImpl;

.field private final splitSupportStatus$delegate:Lkotlin/Lazy;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Landroidx/window/embedding/ExtensionEmbeddingBackend$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Landroidx/window/embedding/ExtensionEmbeddingBackend$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Landroidx/window/embedding/ExtensionEmbeddingBackend;->Companion:Landroidx/window/embedding/ExtensionEmbeddingBackend$Companion;

    .line 65
    new-instance v0, Ljava/util/concurrent/locks/ReentrantLock;

    invoke-direct {v0}, Ljava/util/concurrent/locks/ReentrantLock;-><init>()V

    sput-object v0, Landroidx/window/embedding/ExtensionEmbeddingBackend;->globalLock:Ljava/util/concurrent/locks/ReentrantLock;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroidx/window/embedding/EmbeddingInterfaceCompat;)V
    .locals 2
    .param p1, "applicationContext"    # Landroid/content/Context;
    .param p2, "embeddingExtension"    # Landroidx/window/embedding/EmbeddingInterfaceCompat;

    const-string v0, "applicationContext"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    iput-object p1, p0, Landroidx/window/embedding/ExtensionEmbeddingBackend;->applicationContext:Landroid/content/Context;

    .line 48
    iput-object p2, p0, Landroidx/window/embedding/ExtensionEmbeddingBackend;->embeddingExtension:Landroidx/window/embedding/EmbeddingInterfaceCompat;

    .line 55
    new-instance v0, Landroidx/window/embedding/ExtensionEmbeddingBackend$EmbeddingCallbackImpl;

    invoke-direct {v0, p0}, Landroidx/window/embedding/ExtensionEmbeddingBackend$EmbeddingCallbackImpl;-><init>(Landroidx/window/embedding/ExtensionEmbeddingBackend;)V

    iput-object v0, p0, Landroidx/window/embedding/ExtensionEmbeddingBackend;->splitInfoEmbeddingCallback:Landroidx/window/embedding/ExtensionEmbeddingBackend$EmbeddingCallbackImpl;

    .line 57
    nop

    .line 58
    new-instance v1, Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-direct {v1}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    iput-object v1, p0, Landroidx/window/embedding/ExtensionEmbeddingBackend;->splitChangeCallbacks:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 59
    iget-object v1, p0, Landroidx/window/embedding/ExtensionEmbeddingBackend;->embeddingExtension:Landroidx/window/embedding/EmbeddingInterfaceCompat;

    if-eqz v1, :cond_0

    check-cast v0, Landroidx/window/embedding/EmbeddingInterfaceCompat$EmbeddingCallbackInterface;

    invoke-interface {v1, v0}, Landroidx/window/embedding/EmbeddingInterfaceCompat;->setEmbeddingCallback(Landroidx/window/embedding/EmbeddingInterfaceCompat$EmbeddingCallbackInterface;)V

    .line 60
    :cond_0
    nop

    .line 136
    new-instance v0, Landroidx/window/embedding/ExtensionEmbeddingBackend$RuleTracker;

    invoke-direct {v0}, Landroidx/window/embedding/ExtensionEmbeddingBackend$RuleTracker;-><init>()V

    iput-object v0, p0, Landroidx/window/embedding/ExtensionEmbeddingBackend;->ruleTracker:Landroidx/window/embedding/ExtensionEmbeddingBackend$RuleTracker;

    .line 320
    new-instance v0, Landroidx/window/embedding/ExtensionEmbeddingBackend$splitSupportStatus$2;

    invoke-direct {v0, p0}, Landroidx/window/embedding/ExtensionEmbeddingBackend$splitSupportStatus$2;-><init>(Landroidx/window/embedding/ExtensionEmbeddingBackend;)V

    check-cast v0, Lkotlin/jvm/functions/Function0;

    invoke-static {v0}, Lkotlin/LazyKt;->lazy(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    move-result-object v0

    iput-object v0, p0, Landroidx/window/embedding/ExtensionEmbeddingBackend;->splitSupportStatus$delegate:Lkotlin/Lazy;

    .line 46
    return-void
.end method

.method public static final synthetic access$areExtensionsAvailable(Landroidx/window/embedding/ExtensionEmbeddingBackend;)Z
    .locals 1
    .param p0, "$this"    # Landroidx/window/embedding/ExtensionEmbeddingBackend;

    .line 46
    invoke-direct {p0}, Landroidx/window/embedding/ExtensionEmbeddingBackend;->areExtensionsAvailable()Z

    move-result v0

    return v0
.end method

.method public static final synthetic access$getApplicationContext$p(Landroidx/window/embedding/ExtensionEmbeddingBackend;)Landroid/content/Context;
    .locals 1
    .param p0, "$this"    # Landroidx/window/embedding/ExtensionEmbeddingBackend;

    .line 46
    iget-object v0, p0, Landroidx/window/embedding/ExtensionEmbeddingBackend;->applicationContext:Landroid/content/Context;

    return-object v0
.end method

.method public static final synthetic access$getGlobalInstance$cp()Landroidx/window/embedding/ExtensionEmbeddingBackend;
    .locals 1

    .line 46
    sget-object v0, Landroidx/window/embedding/ExtensionEmbeddingBackend;->globalInstance:Landroidx/window/embedding/ExtensionEmbeddingBackend;

    return-object v0
.end method

.method public static final synthetic access$getGlobalLock$cp()Ljava/util/concurrent/locks/ReentrantLock;
    .locals 1

    .line 46
    sget-object v0, Landroidx/window/embedding/ExtensionEmbeddingBackend;->globalLock:Ljava/util/concurrent/locks/ReentrantLock;

    return-object v0
.end method

.method public static final synthetic access$setGlobalInstance$cp(Landroidx/window/embedding/ExtensionEmbeddingBackend;)V
    .locals 0
    .param p0, "<set-?>"    # Landroidx/window/embedding/ExtensionEmbeddingBackend;

    .line 46
    sput-object p0, Landroidx/window/embedding/ExtensionEmbeddingBackend;->globalInstance:Landroidx/window/embedding/ExtensionEmbeddingBackend;

    return-void
.end method

.method private final areExtensionsAvailable()Z
    .locals 1

    .line 317
    iget-object v0, p0, Landroidx/window/embedding/ExtensionEmbeddingBackend;->embeddingExtension:Landroidx/window/embedding/EmbeddingInterfaceCompat;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public static synthetic getSplitChangeCallbacks$annotations()V
    .locals 0

    return-void
.end method


# virtual methods
.method public addRule(Landroidx/window/embedding/EmbeddingRule;)V
    .locals 6
    .param p1, "rule"    # Landroidx/window/embedding/EmbeddingRule;

    const-string v0, "rule"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 153
    sget-object v0, Landroidx/window/embedding/ExtensionEmbeddingBackend;->globalLock:Ljava/util/concurrent/locks/ReentrantLock;

    check-cast v0, Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    const/4 v1, 0x0

    .line 154
    .local v1, "$i$a$-withLock-ExtensionEmbeddingBackend$addRule$1":I
    :try_start_0
    iget-object v2, p0, Landroidx/window/embedding/ExtensionEmbeddingBackend;->ruleTracker:Landroidx/window/embedding/ExtensionEmbeddingBackend$RuleTracker;

    invoke-virtual {v2, p1}, Landroidx/window/embedding/ExtensionEmbeddingBackend$RuleTracker;->contains(Landroidx/window/embedding/EmbeddingRule;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 155
    iget-object v2, p0, Landroidx/window/embedding/ExtensionEmbeddingBackend;->ruleTracker:Landroidx/window/embedding/ExtensionEmbeddingBackend$RuleTracker;

    const/4 v3, 0x2

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-static {v2, p1, v5, v3, v4}, Landroidx/window/embedding/ExtensionEmbeddingBackend$RuleTracker;->addOrUpdateRule$default(Landroidx/window/embedding/ExtensionEmbeddingBackend$RuleTracker;Landroidx/window/embedding/EmbeddingRule;ZILjava/lang/Object;)V

    .line 156
    iget-object v2, p0, Landroidx/window/embedding/ExtensionEmbeddingBackend;->embeddingExtension:Landroidx/window/embedding/EmbeddingInterfaceCompat;

    if-eqz v2, :cond_0

    invoke-virtual {p0}, Landroidx/window/embedding/ExtensionEmbeddingBackend;->getRules()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v2, v3}, Landroidx/window/embedding/EmbeddingInterfaceCompat;->setRules(Ljava/util/Set;)V

    .line 158
    :cond_0
    nop

    .end local v1    # "$i$a$-withLock-ExtensionEmbeddingBackend$addRule$1":I
    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 153
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 159
    return-void

    .line 153
    :catchall_0
    move-exception v1

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v1
.end method

.method public addSplitListenerForActivity(Landroid/app/Activity;Ljava/util/concurrent/Executor;Landroidx/core/util/Consumer;)V
    .locals 4
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "executor"    # Ljava/util/concurrent/Executor;
    .param p3, "callback"    # Landroidx/core/util/Consumer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            "Ljava/util/concurrent/Executor;",
            "Landroidx/core/util/Consumer<",
            "Ljava/util/List<",
            "Landroidx/window/embedding/SplitInfo;",
            ">;>;)V"
        }
    .end annotation

    const-string v0, "activity"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "executor"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "callback"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 270
    sget-object v0, Landroidx/window/embedding/ExtensionEmbeddingBackend;->globalLock:Ljava/util/concurrent/locks/ReentrantLock;

    check-cast v0, Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    const/4 v1, 0x0

    .line 271
    .local v1, "$i$a$-withLock-ExtensionEmbeddingBackend$addSplitListenerForActivity$1":I
    :try_start_0
    iget-object v2, p0, Landroidx/window/embedding/ExtensionEmbeddingBackend;->embeddingExtension:Landroidx/window/embedding/EmbeddingInterfaceCompat;

    if-nez v2, :cond_0

    .line 272
    nop

    .line 273
    const-string v2, "EmbeddingBackend"

    const-string v3, "Extension not loaded, skipping callback registration."

    invoke-static {v2, v3}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 275
    invoke-static {}, Lkotlin/collections/CollectionsKt;->emptyList()Ljava/util/List;

    move-result-object v2

    invoke-interface {p3, v2}, Landroidx/core/util/Consumer;->accept(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 276
    nop

    .end local v1    # "$i$a$-withLock-ExtensionEmbeddingBackend$addSplitListenerForActivity$1":I
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return-void

    .line 279
    .restart local v1    # "$i$a$-withLock-ExtensionEmbeddingBackend$addSplitListenerForActivity$1":I
    :cond_0
    :try_start_1
    new-instance v2, Landroidx/window/embedding/ExtensionEmbeddingBackend$SplitListenerWrapper;

    invoke-direct {v2, p1, p2, p3}, Landroidx/window/embedding/ExtensionEmbeddingBackend$SplitListenerWrapper;-><init>(Landroid/app/Activity;Ljava/util/concurrent/Executor;Landroidx/core/util/Consumer;)V

    .line 280
    .local v2, "callbackWrapper":Landroidx/window/embedding/ExtensionEmbeddingBackend$SplitListenerWrapper;
    iget-object v3, p0, Landroidx/window/embedding/ExtensionEmbeddingBackend;->splitChangeCallbacks:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v3, v2}, Ljava/util/concurrent/CopyOnWriteArrayList;->add(Ljava/lang/Object;)Z

    .line 281
    iget-object v3, p0, Landroidx/window/embedding/ExtensionEmbeddingBackend;->splitInfoEmbeddingCallback:Landroidx/window/embedding/ExtensionEmbeddingBackend$EmbeddingCallbackImpl;

    invoke-virtual {v3}, Landroidx/window/embedding/ExtensionEmbeddingBackend$EmbeddingCallbackImpl;->getLastInfo()Ljava/util/List;

    move-result-object v3

    if-eqz v3, :cond_1

    .line 282
    iget-object v3, p0, Landroidx/window/embedding/ExtensionEmbeddingBackend;->splitInfoEmbeddingCallback:Landroidx/window/embedding/ExtensionEmbeddingBackend$EmbeddingCallbackImpl;

    invoke-virtual {v3}, Landroidx/window/embedding/ExtensionEmbeddingBackend$EmbeddingCallbackImpl;->getLastInfo()Ljava/util/List;

    move-result-object v3

    invoke-static {v3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {v2, v3}, Landroidx/window/embedding/ExtensionEmbeddingBackend$SplitListenerWrapper;->accept(Ljava/util/List;)V

    goto :goto_0

    .line 284
    :cond_1
    invoke-static {}, Lkotlin/collections/CollectionsKt;->emptyList()Ljava/util/List;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroidx/window/embedding/ExtensionEmbeddingBackend$SplitListenerWrapper;->accept(Ljava/util/List;)V

    .line 286
    :goto_0
    nop

    .end local v1    # "$i$a$-withLock-ExtensionEmbeddingBackend$addSplitListenerForActivity$1":I
    .end local v2    # "callbackWrapper":Landroidx/window/embedding/ExtensionEmbeddingBackend$SplitListenerWrapper;
    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 270
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 287
    return-void

    .line 270
    :catchall_0
    move-exception v1

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v1
.end method

.method public clearSplitAttributesCalculator()V
    .locals 3

    .line 351
    sget-object v0, Landroidx/window/embedding/ExtensionEmbeddingBackend;->globalLock:Ljava/util/concurrent/locks/ReentrantLock;

    check-cast v0, Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    const/4 v1, 0x0

    .line 352
    .local v1, "$i$a$-withLock-ExtensionEmbeddingBackend$clearSplitAttributesCalculator$1":I
    :try_start_0
    iget-object v2, p0, Landroidx/window/embedding/ExtensionEmbeddingBackend;->embeddingExtension:Landroidx/window/embedding/EmbeddingInterfaceCompat;

    if-eqz v2, :cond_0

    invoke-interface {v2}, Landroidx/window/embedding/EmbeddingInterfaceCompat;->clearSplitAttributesCalculator()V

    sget-object v2, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 351
    .end local v1    # "$i$a$-withLock-ExtensionEmbeddingBackend$clearSplitAttributesCalculator$1":I
    :cond_0
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 354
    return-void

    .line 351
    :catchall_0
    move-exception v1

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v1
.end method

.method public getActivityStack(Landroid/app/Activity;)Landroidx/window/embedding/ActivityStack;
    .locals 7
    .param p1, "activity"    # Landroid/app/Activity;

    const-string v0, "activity"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 357
    sget-object v0, Landroidx/window/embedding/ExtensionEmbeddingBackend;->globalLock:Ljava/util/concurrent/locks/ReentrantLock;

    check-cast v0, Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    const/4 v1, 0x0

    .line 358
    .local v1, "$i$a$-withLock-ExtensionEmbeddingBackend$getActivityStack$1":I
    :try_start_0
    iget-object v2, p0, Landroidx/window/embedding/ExtensionEmbeddingBackend;->splitInfoEmbeddingCallback:Landroidx/window/embedding/ExtensionEmbeddingBackend$EmbeddingCallbackImpl;

    invoke-virtual {v2}, Landroidx/window/embedding/ExtensionEmbeddingBackend$EmbeddingCallbackImpl;->getLastInfo()Ljava/util/List;

    move-result-object v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 v3, 0x0

    if-nez v2, :cond_0

    .end local v1    # "$i$a$-withLock-ExtensionEmbeddingBackend$getActivityStack$1":I
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return-object v3

    .line 359
    .restart local v1    # "$i$a$-withLock-ExtensionEmbeddingBackend$getActivityStack$1":I
    .local v2, "lastInfo":Ljava/util/List;
    :cond_0
    :try_start_1
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_1
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_4

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroidx/window/embedding/SplitInfo;

    .line 360
    .local v5, "info":Landroidx/window/embedding/SplitInfo;
    invoke-virtual {v5, p1}, Landroidx/window/embedding/SplitInfo;->contains(Landroid/app/Activity;)Z

    move-result v6

    if-nez v6, :cond_2

    .line 361
    goto :goto_0

    .line 363
    :cond_2
    invoke-virtual {v5}, Landroidx/window/embedding/SplitInfo;->getPrimaryActivityStack()Landroidx/window/embedding/ActivityStack;

    move-result-object v6

    invoke-virtual {v6, p1}, Landroidx/window/embedding/ActivityStack;->contains(Landroid/app/Activity;)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 364
    invoke-virtual {v5}, Landroidx/window/embedding/SplitInfo;->getPrimaryActivityStack()Landroidx/window/embedding/ActivityStack;

    move-result-object v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .end local v1    # "$i$a$-withLock-ExtensionEmbeddingBackend$getActivityStack$1":I
    .end local v2    # "lastInfo":Ljava/util/List;
    .end local v5    # "info":Landroidx/window/embedding/SplitInfo;
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return-object v3

    .line 366
    .restart local v1    # "$i$a$-withLock-ExtensionEmbeddingBackend$getActivityStack$1":I
    .restart local v2    # "lastInfo":Ljava/util/List;
    .restart local v5    # "info":Landroidx/window/embedding/SplitInfo;
    :cond_3
    :try_start_2
    invoke-virtual {v5}, Landroidx/window/embedding/SplitInfo;->getSecondaryActivityStack()Landroidx/window/embedding/ActivityStack;

    move-result-object v6

    invoke-virtual {v6, p1}, Landroidx/window/embedding/ActivityStack;->contains(Landroid/app/Activity;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 367
    invoke-virtual {v5}, Landroidx/window/embedding/SplitInfo;->getSecondaryActivityStack()Landroidx/window/embedding/ActivityStack;

    move-result-object v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .end local v1    # "$i$a$-withLock-ExtensionEmbeddingBackend$getActivityStack$1":I
    .end local v2    # "lastInfo":Ljava/util/List;
    .end local v5    # "info":Landroidx/window/embedding/SplitInfo;
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return-object v3

    .line 370
    .restart local v1    # "$i$a$-withLock-ExtensionEmbeddingBackend$getActivityStack$1":I
    .restart local v2    # "lastInfo":Ljava/util/List;
    :cond_4
    nop

    .end local v1    # "$i$a$-withLock-ExtensionEmbeddingBackend$getActivityStack$1":I
    .end local v2    # "lastInfo":Ljava/util/List;
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return-object v3

    :catchall_0
    move-exception v1

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v1
.end method

.method public final getEmbeddingExtension()Landroidx/window/embedding/EmbeddingInterfaceCompat;
    .locals 1

    .line 50
    iget-object v0, p0, Landroidx/window/embedding/ExtensionEmbeddingBackend;->embeddingExtension:Landroidx/window/embedding/EmbeddingInterfaceCompat;

    return-object v0
.end method

.method public getRules()Ljava/util/Set;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Landroidx/window/embedding/EmbeddingRule;",
            ">;"
        }
    .end annotation

    .line 140
    sget-object v0, Landroidx/window/embedding/ExtensionEmbeddingBackend;->globalLock:Ljava/util/concurrent/locks/ReentrantLock;

    check-cast v0, Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 434
    const/4 v1, 0x0

    .line 140
    .local v1, "$i$a$-withLock-ExtensionEmbeddingBackend$getRules$1":I
    :try_start_0
    iget-object v2, p0, Landroidx/window/embedding/ExtensionEmbeddingBackend;->ruleTracker:Landroidx/window/embedding/ExtensionEmbeddingBackend$RuleTracker;

    invoke-virtual {v2}, Landroidx/window/embedding/ExtensionEmbeddingBackend$RuleTracker;->getSplitRules()Landroidx/collection/ArraySet;

    move-result-object v2

    check-cast v2, Ljava/lang/Iterable;

    invoke-static {v2}, Lkotlin/collections/CollectionsKt;->toSet(Ljava/lang/Iterable;)Ljava/util/Set;

    move-result-object v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .end local v1    # "$i$a$-withLock-ExtensionEmbeddingBackend$getRules$1":I
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return-object v2

    :catchall_0
    move-exception v1

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v1
.end method

.method public final getSplitChangeCallbacks()Ljava/util/concurrent/CopyOnWriteArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/concurrent/CopyOnWriteArrayList<",
            "Landroidx/window/embedding/ExtensionEmbeddingBackend$SplitListenerWrapper;",
            ">;"
        }
    .end annotation

    .line 54
    iget-object v0, p0, Landroidx/window/embedding/ExtensionEmbeddingBackend;->splitChangeCallbacks:Ljava/util/concurrent/CopyOnWriteArrayList;

    return-object v0
.end method

.method public getSplitSupportStatus()Landroidx/window/embedding/SplitController$SplitSupportStatus;
    .locals 1

    .line 320
    iget-object v0, p0, Landroidx/window/embedding/ExtensionEmbeddingBackend;->splitSupportStatus$delegate:Lkotlin/Lazy;

    invoke-interface {v0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/window/embedding/SplitController$SplitSupportStatus;

    return-object v0
.end method

.method public invalidateTopVisibleSplitAttributes()V
    .locals 1

    .line 382
    iget-object v0, p0, Landroidx/window/embedding/ExtensionEmbeddingBackend;->embeddingExtension:Landroidx/window/embedding/EmbeddingInterfaceCompat;

    if-eqz v0, :cond_0

    invoke-interface {v0}, Landroidx/window/embedding/EmbeddingInterfaceCompat;->invalidateTopVisibleSplitAttributes()V

    .line 383
    :cond_0
    return-void
.end method

.method public isActivityEmbedded(Landroid/app/Activity;)Z
    .locals 1
    .param p1, "activity"    # Landroid/app/Activity;

    const-string v0, "activity"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 337
    iget-object v0, p0, Landroidx/window/embedding/ExtensionEmbeddingBackend;->embeddingExtension:Landroidx/window/embedding/EmbeddingInterfaceCompat;

    if-eqz v0, :cond_0

    invoke-interface {v0, p1}, Landroidx/window/embedding/EmbeddingInterfaceCompat;->isActivityEmbedded(Landroid/app/Activity;)Z

    move-result v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public removeRule(Landroidx/window/embedding/EmbeddingRule;)V
    .locals 4
    .param p1, "rule"    # Landroidx/window/embedding/EmbeddingRule;

    const-string v0, "rule"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 163
    sget-object v0, Landroidx/window/embedding/ExtensionEmbeddingBackend;->globalLock:Ljava/util/concurrent/locks/ReentrantLock;

    check-cast v0, Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    const/4 v1, 0x0

    .line 164
    .local v1, "$i$a$-withLock-ExtensionEmbeddingBackend$removeRule$1":I
    :try_start_0
    iget-object v2, p0, Landroidx/window/embedding/ExtensionEmbeddingBackend;->ruleTracker:Landroidx/window/embedding/ExtensionEmbeddingBackend$RuleTracker;

    invoke-virtual {v2, p1}, Landroidx/window/embedding/ExtensionEmbeddingBackend$RuleTracker;->contains(Landroidx/window/embedding/EmbeddingRule;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 165
    iget-object v2, p0, Landroidx/window/embedding/ExtensionEmbeddingBackend;->ruleTracker:Landroidx/window/embedding/ExtensionEmbeddingBackend$RuleTracker;

    invoke-virtual {v2, p1}, Landroidx/window/embedding/ExtensionEmbeddingBackend$RuleTracker;->removeRule(Landroidx/window/embedding/EmbeddingRule;)V

    .line 166
    iget-object v2, p0, Landroidx/window/embedding/ExtensionEmbeddingBackend;->embeddingExtension:Landroidx/window/embedding/EmbeddingInterfaceCompat;

    if-eqz v2, :cond_0

    invoke-virtual {p0}, Landroidx/window/embedding/ExtensionEmbeddingBackend;->getRules()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v2, v3}, Landroidx/window/embedding/EmbeddingInterfaceCompat;->setRules(Ljava/util/Set;)V

    .line 168
    :cond_0
    nop

    .end local v1    # "$i$a$-withLock-ExtensionEmbeddingBackend$removeRule$1":I
    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 163
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 169
    return-void

    .line 163
    :catchall_0
    move-exception v1

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v1
.end method

.method public removeSplitListenerForActivity(Landroidx/core/util/Consumer;)V
    .locals 5
    .param p1, "consumer"    # Landroidx/core/util/Consumer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/core/util/Consumer<",
            "Ljava/util/List<",
            "Landroidx/window/embedding/SplitInfo;",
            ">;>;)V"
        }
    .end annotation

    const-string v0, "consumer"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 292
    sget-object v0, Landroidx/window/embedding/ExtensionEmbeddingBackend;->globalLock:Ljava/util/concurrent/locks/ReentrantLock;

    check-cast v0, Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    const/4 v1, 0x0

    .line 293
    .local v1, "$i$a$-withLock-ExtensionEmbeddingBackend$removeSplitListenerForActivity$1":I
    :try_start_0
    iget-object v2, p0, Landroidx/window/embedding/ExtensionEmbeddingBackend;->splitChangeCallbacks:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v2}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/window/embedding/ExtensionEmbeddingBackend$SplitListenerWrapper;

    .line 294
    .local v3, "callbackWrapper":Landroidx/window/embedding/ExtensionEmbeddingBackend$SplitListenerWrapper;
    invoke-virtual {v3}, Landroidx/window/embedding/ExtensionEmbeddingBackend$SplitListenerWrapper;->getCallback()Landroidx/core/util/Consumer;

    move-result-object v4

    invoke-static {v4, p1}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 295
    iget-object v2, p0, Landroidx/window/embedding/ExtensionEmbeddingBackend;->splitChangeCallbacks:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v2, v3}, Ljava/util/concurrent/CopyOnWriteArrayList;->remove(Ljava/lang/Object;)Z

    .line 296
    nop

    .line 299
    .end local v3    # "callbackWrapper":Landroidx/window/embedding/ExtensionEmbeddingBackend$SplitListenerWrapper;
    :cond_1
    nop

    .end local v1    # "$i$a$-withLock-ExtensionEmbeddingBackend$removeSplitListenerForActivity$1":I
    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 292
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 300
    return-void

    .line 292
    :catchall_0
    move-exception v1

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v1
.end method

.method public final setEmbeddingExtension(Landroidx/window/embedding/EmbeddingInterfaceCompat;)V
    .locals 0
    .param p1, "<set-?>"    # Landroidx/window/embedding/EmbeddingInterfaceCompat;

    .line 50
    iput-object p1, p0, Landroidx/window/embedding/ExtensionEmbeddingBackend;->embeddingExtension:Landroidx/window/embedding/EmbeddingInterfaceCompat;

    return-void
.end method

.method public setLaunchingActivityStack(Landroid/app/ActivityOptions;Landroid/os/IBinder;)Landroid/app/ActivityOptions;
    .locals 1
    .param p1, "options"    # Landroid/app/ActivityOptions;
    .param p2, "token"    # Landroid/os/IBinder;

    const-string v0, "options"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "token"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 378
    iget-object v0, p0, Landroidx/window/embedding/ExtensionEmbeddingBackend;->embeddingExtension:Landroidx/window/embedding/EmbeddingInterfaceCompat;

    if-eqz v0, :cond_0

    invoke-interface {v0, p1, p2}, Landroidx/window/embedding/EmbeddingInterfaceCompat;->setLaunchingActivityStack(Landroid/app/ActivityOptions;Landroid/os/IBinder;)Landroid/app/ActivityOptions;

    move-result-object v0

    if-nez v0, :cond_1

    :cond_0
    move-object v0, p1

    :cond_1
    return-object v0
.end method

.method public setRules(Ljava/util/Set;)V
    .locals 4
    .param p1, "rules"    # Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "+",
            "Landroidx/window/embedding/EmbeddingRule;",
            ">;)V"
        }
    .end annotation

    const-string v0, "rules"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 145
    sget-object v0, Landroidx/window/embedding/ExtensionEmbeddingBackend;->globalLock:Ljava/util/concurrent/locks/ReentrantLock;

    check-cast v0, Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    const/4 v1, 0x0

    .line 146
    .local v1, "$i$a$-withLock-ExtensionEmbeddingBackend$setRules$1":I
    :try_start_0
    iget-object v2, p0, Landroidx/window/embedding/ExtensionEmbeddingBackend;->ruleTracker:Landroidx/window/embedding/ExtensionEmbeddingBackend$RuleTracker;

    invoke-virtual {v2, p1}, Landroidx/window/embedding/ExtensionEmbeddingBackend$RuleTracker;->setRules(Ljava/util/Set;)V

    .line 147
    iget-object v2, p0, Landroidx/window/embedding/ExtensionEmbeddingBackend;->embeddingExtension:Landroidx/window/embedding/EmbeddingInterfaceCompat;

    if-eqz v2, :cond_0

    invoke-virtual {p0}, Landroidx/window/embedding/ExtensionEmbeddingBackend;->getRules()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v2, v3}, Landroidx/window/embedding/EmbeddingInterfaceCompat;->setRules(Ljava/util/Set;)V

    sget-object v2, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 145
    .end local v1    # "$i$a$-withLock-ExtensionEmbeddingBackend$setRules$1":I
    :cond_0
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 149
    return-void

    .line 145
    :catchall_0
    move-exception v1

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v1
.end method

.method public setSplitAttributesCalculator(Lkotlin/jvm/functions/Function1;)V
    .locals 3
    .param p1, "calculator"    # Lkotlin/jvm/functions/Function1;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Landroidx/window/embedding/SplitAttributesCalculatorParams;",
            "Landroidx/window/embedding/SplitAttributes;",
            ">;)V"
        }
    .end annotation

    const-string v0, "calculator"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 344
    sget-object v0, Landroidx/window/embedding/ExtensionEmbeddingBackend;->globalLock:Ljava/util/concurrent/locks/ReentrantLock;

    check-cast v0, Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    const/4 v1, 0x0

    .line 345
    .local v1, "$i$a$-withLock-ExtensionEmbeddingBackend$setSplitAttributesCalculator$1":I
    :try_start_0
    iget-object v2, p0, Landroidx/window/embedding/ExtensionEmbeddingBackend;->embeddingExtension:Landroidx/window/embedding/EmbeddingInterfaceCompat;

    if-eqz v2, :cond_0

    invoke-interface {v2, p1}, Landroidx/window/embedding/EmbeddingInterfaceCompat;->setSplitAttributesCalculator(Lkotlin/jvm/functions/Function1;)V

    sget-object v2, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 344
    .end local v1    # "$i$a$-withLock-ExtensionEmbeddingBackend$setSplitAttributesCalculator$1":I
    :cond_0
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 347
    return-void

    .line 344
    :catchall_0
    move-exception v1

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v1
.end method

.method public updateSplitAttributes(Landroidx/window/embedding/SplitInfo;Landroidx/window/embedding/SplitAttributes;)V
    .locals 1
    .param p1, "splitInfo"    # Landroidx/window/embedding/SplitInfo;
    .param p2, "splitAttributes"    # Landroidx/window/embedding/SplitAttributes;

    const-string v0, "splitInfo"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "splitAttributes"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 390
    iget-object v0, p0, Landroidx/window/embedding/ExtensionEmbeddingBackend;->embeddingExtension:Landroidx/window/embedding/EmbeddingInterfaceCompat;

    if-eqz v0, :cond_0

    invoke-interface {v0, p1, p2}, Landroidx/window/embedding/EmbeddingInterfaceCompat;->updateSplitAttributes(Landroidx/window/embedding/SplitInfo;Landroidx/window/embedding/SplitAttributes;)V

    .line 391
    :cond_0
    return-void
.end method
