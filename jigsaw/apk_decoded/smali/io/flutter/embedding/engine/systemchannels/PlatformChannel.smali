.class public Lio/flutter/embedding/engine/systemchannels/PlatformChannel;
.super Ljava/lang/Object;
.source "PlatformChannel.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/flutter/embedding/engine/systemchannels/PlatformChannel$SystemChromeStyle;,
        Lio/flutter/embedding/engine/systemchannels/PlatformChannel$SystemUiMode;,
        Lio/flutter/embedding/engine/systemchannels/PlatformChannel$AppSwitcherDescription;,
        Lio/flutter/embedding/engine/systemchannels/PlatformChannel$PlatformMessageHandler;,
        Lio/flutter/embedding/engine/systemchannels/PlatformChannel$DeviceOrientation;,
        Lio/flutter/embedding/engine/systemchannels/PlatformChannel$SystemUiOverlay;,
        Lio/flutter/embedding/engine/systemchannels/PlatformChannel$Brightness;,
        Lio/flutter/embedding/engine/systemchannels/PlatformChannel$ClipboardContentFormat;,
        Lio/flutter/embedding/engine/systemchannels/PlatformChannel$HapticFeedbackType;,
        Lio/flutter/embedding/engine/systemchannels/PlatformChannel$SoundType;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "PlatformChannel"


# instance fields
.field public final channel:Lio/flutter/plugin/common/MethodChannel;

.field final parsingMethodCallHandler:Lio/flutter/plugin/common/MethodChannel$MethodCallHandler;

.field private platformMessageHandler:Lio/flutter/embedding/engine/systemchannels/PlatformChannel$PlatformMessageHandler;


# direct methods
.method public constructor <init>(Lio/flutter/embedding/engine/dart/DartExecutor;)V
    .locals 4
    .param p1, "dartExecutor"    # Lio/flutter/embedding/engine/dart/DartExecutor;

    .line 213
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    new-instance v0, Lio/flutter/embedding/engine/systemchannels/PlatformChannel$1;

    invoke-direct {v0, p0}, Lio/flutter/embedding/engine/systemchannels/PlatformChannel$1;-><init>(Lio/flutter/embedding/engine/systemchannels/PlatformChannel;)V

    iput-object v0, p0, Lio/flutter/embedding/engine/systemchannels/PlatformChannel;->parsingMethodCallHandler:Lio/flutter/plugin/common/MethodChannel$MethodCallHandler;

    .line 214
    new-instance v1, Lio/flutter/plugin/common/MethodChannel;

    const-string v2, "flutter/platform"

    sget-object v3, Lio/flutter/plugin/common/JSONMethodCodec;->INSTANCE:Lio/flutter/plugin/common/JSONMethodCodec;

    invoke-direct {v1, p1, v2, v3}, Lio/flutter/plugin/common/MethodChannel;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;Lio/flutter/plugin/common/MethodCodec;)V

    iput-object v1, p0, Lio/flutter/embedding/engine/systemchannels/PlatformChannel;->channel:Lio/flutter/plugin/common/MethodChannel;

    .line 215
    invoke-virtual {v1, v0}, Lio/flutter/plugin/common/MethodChannel;->setMethodCallHandler(Lio/flutter/plugin/common/MethodChannel$MethodCallHandler;)V

    .line 216
    return-void
.end method

.method static synthetic access$000(Lio/flutter/embedding/engine/systemchannels/PlatformChannel;)Lio/flutter/embedding/engine/systemchannels/PlatformChannel$PlatformMessageHandler;
    .locals 1
    .param p0, "x0"    # Lio/flutter/embedding/engine/systemchannels/PlatformChannel;

    .line 27
    iget-object v0, p0, Lio/flutter/embedding/engine/systemchannels/PlatformChannel;->platformMessageHandler:Lio/flutter/embedding/engine/systemchannels/PlatformChannel$PlatformMessageHandler;

    return-object v0
.end method

.method static synthetic access$100(Lio/flutter/embedding/engine/systemchannels/PlatformChannel;Lorg/json/JSONArray;)I
    .locals 1
    .param p0, "x0"    # Lio/flutter/embedding/engine/systemchannels/PlatformChannel;
    .param p1, "x1"    # Lorg/json/JSONArray;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;,
            Ljava/lang/NoSuchFieldException;
        }
    .end annotation

    .line 27
    invoke-direct {p0, p1}, Lio/flutter/embedding/engine/systemchannels/PlatformChannel;->decodeOrientations(Lorg/json/JSONArray;)I

    move-result v0

    return v0
.end method

.method static synthetic access$200(Lio/flutter/embedding/engine/systemchannels/PlatformChannel;Lorg/json/JSONObject;)Lio/flutter/embedding/engine/systemchannels/PlatformChannel$AppSwitcherDescription;
    .locals 1
    .param p0, "x0"    # Lio/flutter/embedding/engine/systemchannels/PlatformChannel;
    .param p1, "x1"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 27
    invoke-direct {p0, p1}, Lio/flutter/embedding/engine/systemchannels/PlatformChannel;->decodeAppSwitcherDescription(Lorg/json/JSONObject;)Lio/flutter/embedding/engine/systemchannels/PlatformChannel$AppSwitcherDescription;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$300(Lio/flutter/embedding/engine/systemchannels/PlatformChannel;Lorg/json/JSONArray;)Ljava/util/List;
    .locals 1
    .param p0, "x0"    # Lio/flutter/embedding/engine/systemchannels/PlatformChannel;
    .param p1, "x1"    # Lorg/json/JSONArray;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;,
            Ljava/lang/NoSuchFieldException;
        }
    .end annotation

    .line 27
    invoke-direct {p0, p1}, Lio/flutter/embedding/engine/systemchannels/PlatformChannel;->decodeSystemUiOverlays(Lorg/json/JSONArray;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$400(Lio/flutter/embedding/engine/systemchannels/PlatformChannel;Ljava/lang/String;)Lio/flutter/embedding/engine/systemchannels/PlatformChannel$SystemUiMode;
    .locals 1
    .param p0, "x0"    # Lio/flutter/embedding/engine/systemchannels/PlatformChannel;
    .param p1, "x1"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;,
            Ljava/lang/NoSuchFieldException;
        }
    .end annotation

    .line 27
    invoke-direct {p0, p1}, Lio/flutter/embedding/engine/systemchannels/PlatformChannel;->decodeSystemUiMode(Ljava/lang/String;)Lio/flutter/embedding/engine/systemchannels/PlatformChannel$SystemUiMode;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$500(Lio/flutter/embedding/engine/systemchannels/PlatformChannel;Lorg/json/JSONObject;)Lio/flutter/embedding/engine/systemchannels/PlatformChannel$SystemChromeStyle;
    .locals 1
    .param p0, "x0"    # Lio/flutter/embedding/engine/systemchannels/PlatformChannel;
    .param p1, "x1"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;,
            Ljava/lang/NoSuchFieldException;
        }
    .end annotation

    .line 27
    invoke-direct {p0, p1}, Lio/flutter/embedding/engine/systemchannels/PlatformChannel;->decodeSystemChromeStyle(Lorg/json/JSONObject;)Lio/flutter/embedding/engine/systemchannels/PlatformChannel$SystemChromeStyle;

    move-result-object v0

    return-object v0
.end method

.method private decodeAppSwitcherDescription(Lorg/json/JSONObject;)Lio/flutter/embedding/engine/systemchannels/PlatformChannel$AppSwitcherDescription;
    .locals 3
    .param p1, "encodedDescription"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 317
    const-string v0, "primaryColor"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v0

    .line 318
    .local v0, "color":I
    if-eqz v0, :cond_0

    .line 319
    const/high16 v1, -0x1000000

    or-int/2addr v0, v1

    .line 321
    :cond_0
    const-string v1, "label"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 322
    .local v1, "label":Ljava/lang/String;
    new-instance v2, Lio/flutter/embedding/engine/systemchannels/PlatformChannel$AppSwitcherDescription;

    invoke-direct {v2, v0, v1}, Lio/flutter/embedding/engine/systemchannels/PlatformChannel$AppSwitcherDescription;-><init>(ILjava/lang/String;)V

    return-object v2
.end method

.method private decodeOrientations(Lorg/json/JSONArray;)I
    .locals 7
    .param p1, "encodedOrientations"    # Lorg/json/JSONArray;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;,
            Ljava/lang/NoSuchFieldException;
        }
    .end annotation

    .line 243
    const/4 v0, 0x0

    .line 244
    .local v0, "requestedOrientation":I
    const/4 v1, 0x0

    .line 245
    .local v1, "firstRequestedOrientation":I
    const/4 v2, 0x0

    .local v2, "index":I
    :goto_0
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result v3

    if-ge v2, v3, :cond_1

    .line 246
    invoke-virtual {p1, v2}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 247
    .local v3, "encodedOrientation":Ljava/lang/String;
    invoke-static {v3}, Lio/flutter/embedding/engine/systemchannels/PlatformChannel$DeviceOrientation;->fromValue(Ljava/lang/String;)Lio/flutter/embedding/engine/systemchannels/PlatformChannel$DeviceOrientation;

    move-result-object v4

    .line 249
    .local v4, "orientation":Lio/flutter/embedding/engine/systemchannels/PlatformChannel$DeviceOrientation;
    sget-object v5, Lio/flutter/embedding/engine/systemchannels/PlatformChannel$2;->$SwitchMap$io$flutter$embedding$engine$systemchannels$PlatformChannel$DeviceOrientation:[I

    invoke-virtual {v4}, Lio/flutter/embedding/engine/systemchannels/PlatformChannel$DeviceOrientation;->ordinal()I

    move-result v6

    aget v5, v5, v6

    packed-switch v5, :pswitch_data_0

    goto :goto_1

    .line 260
    :pswitch_0
    or-int/lit8 v0, v0, 0x8

    goto :goto_1

    .line 257
    :pswitch_1
    or-int/lit8 v0, v0, 0x2

    .line 258
    goto :goto_1

    .line 254
    :pswitch_2
    or-int/lit8 v0, v0, 0x4

    .line 255
    goto :goto_1

    .line 251
    :pswitch_3
    or-int/lit8 v0, v0, 0x1

    .line 252
    nop

    .line 264
    :goto_1
    if-nez v1, :cond_0

    .line 265
    move v1, v0

    .line 245
    .end local v3    # "encodedOrientation":Ljava/lang/String;
    .end local v4    # "orientation":Lio/flutter/embedding/engine/systemchannels/PlatformChannel$DeviceOrientation;
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 269
    .end local v2    # "index":I
    :cond_1
    const/16 v2, 0x9

    const/4 v3, 0x0

    const/16 v4, 0x8

    const/4 v5, 0x1

    packed-switch v0, :pswitch_data_1

    goto :goto_2

    .line 287
    :pswitch_4
    const/16 v2, 0xd

    return v2

    .line 285
    :pswitch_5
    const/4 v2, 0x2

    return v2

    .line 283
    :pswitch_6
    const/16 v2, 0xb

    return v2

    .line 281
    :pswitch_7
    return v4

    .line 279
    :pswitch_8
    const/16 v2, 0xc

    return v2

    .line 277
    :pswitch_9
    return v2

    .line 297
    :pswitch_a
    sparse-switch v1, :sswitch_data_0

    goto :goto_2

    .line 305
    :sswitch_0
    return v4

    .line 303
    :sswitch_1
    return v2

    .line 301
    :sswitch_2
    return v3

    .line 299
    :sswitch_3
    return v5

    .line 275
    :pswitch_b
    return v3

    .line 273
    :pswitch_c
    return v5

    .line 271
    :pswitch_d
    const/4 v2, -0x1

    return v2

    .line 311
    :goto_2
    return v5

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x0
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_a
        :pswitch_a
        :pswitch_7
        :pswitch_a
        :pswitch_6
        :pswitch_5
        :pswitch_a
        :pswitch_a
        :pswitch_a
        :pswitch_4
    .end packed-switch

    :sswitch_data_0
    .sparse-switch
        0x1 -> :sswitch_3
        0x2 -> :sswitch_2
        0x4 -> :sswitch_1
        0x8 -> :sswitch_0
    .end sparse-switch
.end method

.method private decodeSystemChromeStyle(Lorg/json/JSONObject;)Lio/flutter/embedding/engine/systemchannels/PlatformChannel$SystemChromeStyle;
    .locals 17
    .param p1, "encodedStyle"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;,
            Ljava/lang/NoSuchFieldException;
        }
    .end annotation

    .line 387
    move-object/from16 v0, p1

    const/4 v1, 0x0

    .line 388
    .local v1, "statusBarColor":Ljava/lang/Integer;
    const/4 v2, 0x0

    .line 389
    .local v2, "statusBarIconBrightness":Lio/flutter/embedding/engine/systemchannels/PlatformChannel$Brightness;
    const/4 v3, 0x0

    .line 391
    .local v3, "systemStatusBarContrastEnforced":Ljava/lang/Boolean;
    const/4 v4, 0x0

    .line 392
    .local v4, "systemNavigationBarColor":Ljava/lang/Integer;
    const/4 v5, 0x0

    .line 394
    .local v5, "systemNavigationBarIconBrightness":Lio/flutter/embedding/engine/systemchannels/PlatformChannel$Brightness;
    const/4 v6, 0x0

    .line 395
    .local v6, "systemNavigationBarDividerColor":Ljava/lang/Integer;
    const/4 v7, 0x0

    .line 397
    .local v7, "systemNavigationBarContrastEnforced":Ljava/lang/Boolean;
    const-string v8, "statusBarColor"

    invoke-virtual {v0, v8}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v9

    if-nez v9, :cond_0

    .line 398
    invoke-virtual {v0, v8}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v8

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    .line 401
    :cond_0
    const-string v8, "statusBarIconBrightness"

    invoke-virtual {v0, v8}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v9

    if-nez v9, :cond_1

    .line 402
    nop

    .line 403
    invoke-virtual {v0, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Lio/flutter/embedding/engine/systemchannels/PlatformChannel$Brightness;->fromValue(Ljava/lang/String;)Lio/flutter/embedding/engine/systemchannels/PlatformChannel$Brightness;

    move-result-object v2

    .line 406
    :cond_1
    const-string v8, "systemStatusBarContrastEnforced"

    invoke-virtual {v0, v8}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v9

    if-nez v9, :cond_2

    .line 407
    invoke-virtual {v0, v8}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result v8

    invoke-static {v8}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    .line 410
    :cond_2
    const-string v8, "systemNavigationBarColor"

    invoke-virtual {v0, v8}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v9

    if-nez v9, :cond_3

    .line 411
    invoke-virtual {v0, v8}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v8

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    .line 414
    :cond_3
    const-string v8, "systemNavigationBarIconBrightness"

    invoke-virtual {v0, v8}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v9

    if-nez v9, :cond_4

    .line 415
    nop

    .line 416
    invoke-virtual {v0, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Lio/flutter/embedding/engine/systemchannels/PlatformChannel$Brightness;->fromValue(Ljava/lang/String;)Lio/flutter/embedding/engine/systemchannels/PlatformChannel$Brightness;

    move-result-object v5

    .line 419
    :cond_4
    const-string v8, "systemNavigationBarDividerColor"

    invoke-virtual {v0, v8}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v9

    if-nez v9, :cond_5

    .line 420
    invoke-virtual {v0, v8}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v8

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    .line 423
    :cond_5
    const-string v8, "systemNavigationBarContrastEnforced"

    invoke-virtual {v0, v8}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v9

    if-nez v9, :cond_6

    .line 424
    nop

    .line 425
    invoke-virtual {v0, v8}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result v8

    invoke-static {v8}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v7

    .line 428
    :cond_6
    new-instance v16, Lio/flutter/embedding/engine/systemchannels/PlatformChannel$SystemChromeStyle;

    move-object/from16 v8, v16

    move-object v9, v1

    move-object v10, v2

    move-object v11, v3

    move-object v12, v4

    move-object v13, v5

    move-object v14, v6

    move-object v15, v7

    invoke-direct/range {v8 .. v15}, Lio/flutter/embedding/engine/systemchannels/PlatformChannel$SystemChromeStyle;-><init>(Ljava/lang/Integer;Lio/flutter/embedding/engine/systemchannels/PlatformChannel$Brightness;Ljava/lang/Boolean;Ljava/lang/Integer;Lio/flutter/embedding/engine/systemchannels/PlatformChannel$Brightness;Ljava/lang/Integer;Ljava/lang/Boolean;)V

    return-object v16
.end method

.method private decodeSystemUiMode(Ljava/lang/String;)Lio/flutter/embedding/engine/systemchannels/PlatformChannel$SystemUiMode;
    .locals 3
    .param p1, "encodedSystemUiMode"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;,
            Ljava/lang/NoSuchFieldException;
        }
    .end annotation

    .line 361
    invoke-static {p1}, Lio/flutter/embedding/engine/systemchannels/PlatformChannel$SystemUiMode;->fromValue(Ljava/lang/String;)Lio/flutter/embedding/engine/systemchannels/PlatformChannel$SystemUiMode;

    move-result-object v0

    .line 362
    .local v0, "mode":Lio/flutter/embedding/engine/systemchannels/PlatformChannel$SystemUiMode;
    sget-object v1, Lio/flutter/embedding/engine/systemchannels/PlatformChannel$2;->$SwitchMap$io$flutter$embedding$engine$systemchannels$PlatformChannel$SystemUiMode:[I

    invoke-virtual {v0}, Lio/flutter/embedding/engine/systemchannels/PlatformChannel$SystemUiMode;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_0

    .line 374
    sget-object v1, Lio/flutter/embedding/engine/systemchannels/PlatformChannel$SystemUiMode;->EDGE_TO_EDGE:Lio/flutter/embedding/engine/systemchannels/PlatformChannel$SystemUiMode;

    return-object v1

    .line 370
    :pswitch_0
    sget-object v1, Lio/flutter/embedding/engine/systemchannels/PlatformChannel$SystemUiMode;->EDGE_TO_EDGE:Lio/flutter/embedding/engine/systemchannels/PlatformChannel$SystemUiMode;

    return-object v1

    .line 368
    :pswitch_1
    sget-object v1, Lio/flutter/embedding/engine/systemchannels/PlatformChannel$SystemUiMode;->IMMERSIVE_STICKY:Lio/flutter/embedding/engine/systemchannels/PlatformChannel$SystemUiMode;

    return-object v1

    .line 366
    :pswitch_2
    sget-object v1, Lio/flutter/embedding/engine/systemchannels/PlatformChannel$SystemUiMode;->IMMERSIVE:Lio/flutter/embedding/engine/systemchannels/PlatformChannel$SystemUiMode;

    return-object v1

    .line 364
    :pswitch_3
    sget-object v1, Lio/flutter/embedding/engine/systemchannels/PlatformChannel$SystemUiMode;->LEAN_BACK:Lio/flutter/embedding/engine/systemchannels/PlatformChannel$SystemUiMode;

    return-object v1

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private decodeSystemUiOverlays(Lorg/json/JSONArray;)Ljava/util/List;
    .locals 6
    .param p1, "encodedSystemUiOverlay"    # Lorg/json/JSONArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONArray;",
            ")",
            "Ljava/util/List<",
            "Lio/flutter/embedding/engine/systemchannels/PlatformChannel$SystemUiOverlay;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;,
            Ljava/lang/NoSuchFieldException;
        }
    .end annotation

    .line 335
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 336
    .local v0, "overlays":Ljava/util/List;, "Ljava/util/List<Lio/flutter/embedding/engine/systemchannels/PlatformChannel$SystemUiOverlay;>;"
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-ge v1, v2, :cond_0

    .line 337
    invoke-virtual {p1, v1}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 338
    .local v2, "encodedOverlay":Ljava/lang/String;
    invoke-static {v2}, Lio/flutter/embedding/engine/systemchannels/PlatformChannel$SystemUiOverlay;->fromValue(Ljava/lang/String;)Lio/flutter/embedding/engine/systemchannels/PlatformChannel$SystemUiOverlay;

    move-result-object v3

    .line 339
    .local v3, "overlay":Lio/flutter/embedding/engine/systemchannels/PlatformChannel$SystemUiOverlay;
    sget-object v4, Lio/flutter/embedding/engine/systemchannels/PlatformChannel$2;->$SwitchMap$io$flutter$embedding$engine$systemchannels$PlatformChannel$SystemUiOverlay:[I

    invoke-virtual {v3}, Lio/flutter/embedding/engine/systemchannels/PlatformChannel$SystemUiOverlay;->ordinal()I

    move-result v5

    aget v4, v4, v5

    packed-switch v4, :pswitch_data_0

    goto :goto_1

    .line 344
    :pswitch_0
    sget-object v4, Lio/flutter/embedding/engine/systemchannels/PlatformChannel$SystemUiOverlay;->BOTTOM_OVERLAYS:Lio/flutter/embedding/engine/systemchannels/PlatformChannel$SystemUiOverlay;

    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 341
    :pswitch_1
    sget-object v4, Lio/flutter/embedding/engine/systemchannels/PlatformChannel$SystemUiOverlay;->TOP_OVERLAYS:Lio/flutter/embedding/engine/systemchannels/PlatformChannel$SystemUiOverlay;

    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 342
    nop

    .line 336
    .end local v2    # "encodedOverlay":Ljava/lang/String;
    .end local v3    # "overlay":Lio/flutter/embedding/engine/systemchannels/PlatformChannel$SystemUiOverlay;
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 348
    .end local v1    # "i":I
    :cond_0
    return-object v0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method public setPlatformMessageHandler(Lio/flutter/embedding/engine/systemchannels/PlatformChannel$PlatformMessageHandler;)V
    .locals 0
    .param p1, "platformMessageHandler"    # Lio/flutter/embedding/engine/systemchannels/PlatformChannel$PlatformMessageHandler;

    .line 223
    iput-object p1, p0, Lio/flutter/embedding/engine/systemchannels/PlatformChannel;->platformMessageHandler:Lio/flutter/embedding/engine/systemchannels/PlatformChannel$PlatformMessageHandler;

    .line 224
    return-void
.end method

.method public systemChromeChanged(Z)V
    .locals 4
    .param p1, "overlaysAreVisible"    # Z

    .line 228
    const-string v0, "PlatformChannel"

    const-string v1, "Sending \'systemUIChange\' message."

    invoke-static {v0, v1}, Lio/flutter/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 229
    iget-object v0, p0, Lio/flutter/embedding/engine/systemchannels/PlatformChannel;->channel:Lio/flutter/plugin/common/MethodChannel;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Boolean;

    const/4 v2, 0x0

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    const-string v2, "SystemChrome.systemUIChange"

    invoke-virtual {v0, v2, v1}, Lio/flutter/plugin/common/MethodChannel;->invokeMethod(Ljava/lang/String;Ljava/lang/Object;)V

    .line 230
    return-void
.end method
