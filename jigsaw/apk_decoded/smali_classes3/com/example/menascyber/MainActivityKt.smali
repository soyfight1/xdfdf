.class public final Lcom/example/menascyber/MainActivityKt;
.super Ljava/lang/Object;
.source "MainActivity.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0010\n\u0000\n\u0002\u0010$\n\u0002\u0010\u000e\n\u0002\u0010\u0012\n\u0000\u001a\u0014\u0010\u0000\u001a\u000e\u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\u00030\u0001H\u0002\u00a8\u0006\u0004"
    }
    d2 = {
        "get_parttwo",
        "",
        "",
        "",
        "app_debug"
    }
    k = 0x2
    mv = {
        0x1,
        0x8,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method public static final synthetic access$get_parttwo()Ljava/util/Map;
    .locals 1

    .line 1
    invoke-static {}, Lcom/example/menascyber/MainActivityKt;->get_parttwo()Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method private static final get_parttwo()Ljava/util/Map;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "[B>;"
        }
    .end annotation

    .line 38
    sget-object v0, Lcom/example/menascyber/piecesOf;->INSTANCE:Lcom/example/menascyber/piecesOf;

    invoke-virtual {v0}, Lcom/example/menascyber/piecesOf;->getParttwo_1()[B

    move-result-object v0

    const/16 v1, 0x12

    const/4 v2, 0x0

    invoke-static {v0, v2, v1}, Lkotlin/collections/ArraysKt;->copyOfRange([BII)[B

    move-result-object v0

    .line 39
    .local v0, "keyFirst18":[B
    sget-object v1, Lcom/example/menascyber/piecesOf;->INSTANCE:Lcom/example/menascyber/piecesOf;

    invoke-virtual {v1}, Lcom/example/menascyber/piecesOf;->getParttwo_2()[B

    move-result-object v1

    const/4 v3, 0x7

    invoke-static {v1, v2, v3}, Lkotlin/collections/ArraysKt;->copyOfRange([BII)[B

    move-result-object v1

    .line 40
    .local v1, "ivFirst18":[B
    const/4 v3, 0x2

    new-array v3, v3, [Lkotlin/Pair;

    const-string v4, "key"

    invoke-static {v4, v0}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v4

    aput-object v4, v3, v2

    const-string v2, "iv"

    invoke-static {v2, v1}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/4 v4, 0x1

    aput-object v2, v3, v4

    invoke-static {v3}, Lkotlin/collections/MapsKt;->mapOf([Lkotlin/Pair;)Ljava/util/Map;

    move-result-object v2

    return-object v2
.end method
