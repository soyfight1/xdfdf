.class public Lio/flutter/embedding/android/AndroidTouchProcessor;
.super Ljava/lang/Object;
.source "AndroidTouchProcessor.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/flutter/embedding/android/AndroidTouchProcessor$PointerChange;,
        Lio/flutter/embedding/android/AndroidTouchProcessor$PointerDeviceKind;,
        Lio/flutter/embedding/android/AndroidTouchProcessor$PointerSignalKind;
    }
.end annotation


# static fields
.field static final BYTES_PER_FIELD:I = 0x8

.field static final DEFAULT_HORIZONTAL_SCROLL_FACTOR:I = 0x30

.field static final DEFAULT_VERTICAL_SCROLL_FACTOR:I = 0x30

.field private static final IDENTITY_TRANSFORM:Landroid/graphics/Matrix;

.field private static final IMPLICIT_VIEW_ID:I = 0x0

.field static final POINTER_DATA_FIELD_COUNT:I = 0x24

.field private static final POINTER_DATA_FLAG_BATCHED:I = 0x1

.field private static final TAG:Ljava/lang/String; = "AndroidTouchProcessor"


# instance fields
.field private cachedVerticalScrollFactor:I

.field private final motionEventTracker:Lio/flutter/embedding/android/MotionEventTracker;

.field private final ongoingPans:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "[F>;"
        }
    .end annotation
.end field

.field private final renderer:Lio/flutter/embedding/engine/renderer/FlutterRenderer;

.field private final trackMotionEvents:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 104
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    sput-object v0, Lio/flutter/embedding/android/AndroidTouchProcessor;->IDENTITY_TRANSFORM:Landroid/graphics/Matrix;

    return-void
.end method

.method public constructor <init>(Lio/flutter/embedding/engine/renderer/FlutterRenderer;Z)V
    .locals 1
    .param p1, "renderer"    # Lio/flutter/embedding/engine/renderer/FlutterRenderer;
    .param p2, "trackMotionEvents"    # Z

    .line 122
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 108
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lio/flutter/embedding/android/AndroidTouchProcessor;->ongoingPans:Ljava/util/Map;

    .line 123
    iput-object p1, p0, Lio/flutter/embedding/android/AndroidTouchProcessor;->renderer:Lio/flutter/embedding/engine/renderer/FlutterRenderer;

    .line 124
    invoke-static {}, Lio/flutter/embedding/android/MotionEventTracker;->getInstance()Lio/flutter/embedding/android/MotionEventTracker;

    move-result-object v0

    iput-object v0, p0, Lio/flutter/embedding/android/AndroidTouchProcessor;->motionEventTracker:Lio/flutter/embedding/android/MotionEventTracker;

    .line 125
    iput-boolean p2, p0, Lio/flutter/embedding/android/AndroidTouchProcessor;->trackMotionEvents:Z

    .line 126
    return-void
.end method

.method private addPointerForIndex(Landroid/view/MotionEvent;IIILandroid/graphics/Matrix;Ljava/nio/ByteBuffer;)V
    .locals 8
    .param p1, "event"    # Landroid/view/MotionEvent;
    .param p2, "pointerIndex"    # I
    .param p3, "pointerChange"    # I
    .param p4, "pointerData"    # I
    .param p5, "transformMatrix"    # Landroid/graphics/Matrix;
    .param p6, "packet"    # Ljava/nio/ByteBuffer;

    .line 265
    const/4 v7, 0x0

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move-object v5, p5

    move-object v6, p6

    invoke-direct/range {v0 .. v7}, Lio/flutter/embedding/android/AndroidTouchProcessor;->addPointerForIndex(Landroid/view/MotionEvent;IIILandroid/graphics/Matrix;Ljava/nio/ByteBuffer;Landroid/content/Context;)V

    .line 267
    return-void
.end method

.method private addPointerForIndex(Landroid/view/MotionEvent;IIILandroid/graphics/Matrix;Ljava/nio/ByteBuffer;Landroid/content/Context;)V
    .locals 37
    .param p1, "event"    # Landroid/view/MotionEvent;
    .param p2, "pointerIndex"    # I
    .param p3, "pointerChange"    # I
    .param p4, "pointerData"    # I
    .param p5, "transformMatrix"    # Landroid/graphics/Matrix;
    .param p6, "packet"    # Ljava/nio/ByteBuffer;
    .param p7, "context"    # Landroid/content/Context;

    .line 279
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, p2

    move/from16 v3, p3

    move-object/from16 v4, p6

    move-object/from16 v5, p7

    const/4 v6, -0x1

    if-ne v3, v6, :cond_0

    .line 280
    return-void

    .line 285
    :cond_0
    const/4 v7, 0x0

    .line 286
    .local v7, "viewId":I
    invoke-virtual/range {p1 .. p2}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v8

    .line 288
    .local v8, "pointerId":I
    invoke-virtual/range {p1 .. p2}, Landroid/view/MotionEvent;->getToolType(I)I

    move-result v9

    invoke-direct {v0, v9}, Lio/flutter/embedding/android/AndroidTouchProcessor;->getPointerDeviceTypeForToolType(I)I

    move-result v9

    .line 291
    .local v9, "pointerKind":I
    const/4 v10, 0x2

    new-array v11, v10, [F

    invoke-virtual/range {p1 .. p2}, Landroid/view/MotionEvent;->getX(I)F

    move-result v12

    const/4 v13, 0x0

    aput v12, v11, v13

    invoke-virtual/range {p1 .. p2}, Landroid/view/MotionEvent;->getY(I)F

    move-result v12

    const/4 v14, 0x1

    aput v12, v11, v14

    .line 292
    .local v11, "viewToScreenCoords":[F
    move-object/from16 v12, p5

    invoke-virtual {v12, v11}, Landroid/graphics/Matrix;->mapPoints([F)V

    .line 294
    const/4 v15, 0x4

    move/from16 v17, v7

    .end local v7    # "viewId":I
    .local v17, "viewId":I
    const-wide/16 v6, 0x0

    if-ne v9, v14, :cond_1

    .line 295
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getButtonState()I

    move-result v18

    and-int/lit8 v14, v18, 0x1f

    int-to-long v13, v14

    .line 296
    .local v13, "buttons":J
    cmp-long v19, v13, v6

    if-nez v19, :cond_3

    .line 297
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getSource()I

    move-result v6

    const/16 v7, 0x2002

    if-ne v6, v7, :cond_3

    if-ne v3, v15, :cond_3

    .line 302
    iget-object v6, v0, Lio/flutter/embedding/android/AndroidTouchProcessor;->ongoingPans:Ljava/util/Map;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-interface {v6, v7, v11}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 304
    .end local v13    # "buttons":J
    :cond_1
    if-ne v9, v10, :cond_2

    .line 310
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getButtonState()I

    move-result v6

    shr-int/2addr v6, v15

    and-int/lit8 v6, v6, 0xf

    int-to-long v13, v6

    .restart local v13    # "buttons":J
    goto :goto_0

    .line 312
    .end local v13    # "buttons":J
    :cond_2
    const-wide/16 v13, 0x0

    .line 315
    .restart local v13    # "buttons":J
    :cond_3
    :goto_0
    const/4 v6, -0x1

    .line 316
    .local v6, "panZoomType":I
    iget-object v7, v0, Lio/flutter/embedding/android/AndroidTouchProcessor;->ongoingPans:Ljava/util/Map;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    invoke-interface {v7, v15}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v7

    .line 317
    .local v7, "isTrackpadPan":Z
    if-eqz v7, :cond_4

    .line 318
    invoke-direct {v0, v3}, Lio/flutter/embedding/android/AndroidTouchProcessor;->getPointerChangeForPanZoom(I)I

    move-result v6

    .line 319
    const/4 v15, -0x1

    if-ne v6, v15, :cond_4

    .line 320
    return-void

    .line 324
    :cond_4
    const-wide/16 v15, 0x0

    .line 325
    .local v15, "motionEventId":J
    iget-boolean v10, v0, Lio/flutter/embedding/android/AndroidTouchProcessor;->trackMotionEvents:Z

    if-eqz v10, :cond_5

    .line 326
    iget-object v10, v0, Lio/flutter/embedding/android/AndroidTouchProcessor;->motionEventTracker:Lio/flutter/embedding/android/MotionEventTracker;

    invoke-virtual {v10, v1}, Lio/flutter/embedding/android/MotionEventTracker;->track(Landroid/view/MotionEvent;)Lio/flutter/embedding/android/MotionEventTracker$MotionEventId;

    move-result-object v10

    .line 327
    .local v10, "trackedEvent":Lio/flutter/embedding/android/MotionEventTracker$MotionEventId;
    invoke-virtual {v10}, Lio/flutter/embedding/android/MotionEventTracker$MotionEventId;->getId()J

    move-result-wide v15

    move-wide v1, v15

    goto :goto_1

    .line 325
    .end local v10    # "trackedEvent":Lio/flutter/embedding/android/MotionEventTracker$MotionEventId;
    :cond_5
    move-wide v1, v15

    .line 331
    .end local v15    # "motionEventId":J
    .local v1, "motionEventId":J
    :goto_1
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v10

    const/16 v15, 0x8

    if-ne v10, v15, :cond_6

    .line 332
    const/4 v10, 0x1

    goto :goto_2

    .line 333
    :cond_6
    const/4 v10, 0x0

    :goto_2
    nop

    .line 335
    .local v10, "signalKind":I
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getEventTime()J

    move-result-wide v21

    const-wide/16 v23, 0x3e8

    move-wide/from16 v25, v13

    .end local v13    # "buttons":J
    .local v25, "buttons":J
    mul-long v12, v21, v23

    .line 337
    .local v12, "timeStamp":J
    invoke-virtual {v4, v1, v2}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    .line 338
    invoke-virtual {v4, v12, v13}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    .line 339
    if-eqz v7, :cond_7

    .line 340
    move-wide/from16 v21, v1

    .end local v1    # "motionEventId":J
    .local v21, "motionEventId":J
    int-to-long v1, v6

    invoke-virtual {v4, v1, v2}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    .line 341
    const-wide/16 v1, 0x4

    invoke-virtual {v4, v1, v2}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    goto :goto_3

    .line 343
    .end local v21    # "motionEventId":J
    .restart local v1    # "motionEventId":J
    :cond_7
    move-wide/from16 v21, v1

    .end local v1    # "motionEventId":J
    .restart local v21    # "motionEventId":J
    int-to-long v1, v3

    invoke-virtual {v4, v1, v2}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    .line 344
    int-to-long v1, v9

    invoke-virtual {v4, v1, v2}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    .line 346
    :goto_3
    int-to-long v1, v10

    invoke-virtual {v4, v1, v2}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    .line 347
    int-to-long v1, v8

    invoke-virtual {v4, v1, v2}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    .line 348
    const-wide/16 v1, 0x0

    invoke-virtual {v4, v1, v2}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    .line 350
    if-eqz v7, :cond_8

    .line 351
    iget-object v1, v0, Lio/flutter/embedding/android/AndroidTouchProcessor;->ongoingPans:Ljava/util/Map;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [F

    .line 352
    .local v1, "panStart":[F
    const/4 v2, 0x0

    aget v14, v1, v2

    float-to-double v2, v14

    invoke-virtual {v4, v2, v3}, Ljava/nio/ByteBuffer;->putDouble(D)Ljava/nio/ByteBuffer;

    .line 353
    const/4 v2, 0x1

    aget v3, v1, v2

    float-to-double v2, v3

    invoke-virtual {v4, v2, v3}, Ljava/nio/ByteBuffer;->putDouble(D)Ljava/nio/ByteBuffer;

    .line 354
    .end local v1    # "panStart":[F
    goto :goto_4

    .line 355
    :cond_8
    const/4 v1, 0x0

    aget v2, v11, v1

    float-to-double v1, v2

    invoke-virtual {v4, v1, v2}, Ljava/nio/ByteBuffer;->putDouble(D)Ljava/nio/ByteBuffer;

    .line 356
    const/4 v1, 0x1

    aget v2, v11, v1

    float-to-double v1, v2

    invoke-virtual {v4, v1, v2}, Ljava/nio/ByteBuffer;->putDouble(D)Ljava/nio/ByteBuffer;

    .line 359
    :goto_4
    const-wide/16 v1, 0x0

    invoke-virtual {v4, v1, v2}, Ljava/nio/ByteBuffer;->putDouble(D)Ljava/nio/ByteBuffer;

    .line 361
    invoke-virtual {v4, v1, v2}, Ljava/nio/ByteBuffer;->putDouble(D)Ljava/nio/ByteBuffer;

    .line 364
    move-wide/from16 v1, v25

    .end local v25    # "buttons":J
    .local v1, "buttons":J
    invoke-virtual {v4, v1, v2}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    .line 366
    const-wide/16 v1, 0x0

    .end local v1    # "buttons":J
    .restart local v25    # "buttons":J
    invoke-virtual {v4, v1, v2}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    .line 368
    invoke-virtual {v4, v1, v2}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    .line 370
    invoke-virtual/range {p1 .. p2}, Landroid/view/MotionEvent;->getPressure(I)F

    move-result v1

    float-to-double v1, v1

    invoke-virtual {v4, v1, v2}, Ljava/nio/ByteBuffer;->putDouble(D)Ljava/nio/ByteBuffer;

    .line 371
    const-wide/16 v1, 0x0

    .line 372
    .local v1, "pressureMin":D
    const-wide/high16 v27, 0x3ff0000000000000L    # 1.0

    .line 373
    .local v27, "pressureMax":D
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getDevice()Landroid/view/InputDevice;

    move-result-object v3

    if-eqz v3, :cond_9

    .line 374
    nop

    .line 375
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getDevice()Landroid/view/InputDevice;

    move-result-object v3

    const/4 v14, 0x2

    invoke-virtual {v3, v14}, Landroid/view/InputDevice;->getMotionRange(I)Landroid/view/InputDevice$MotionRange;

    move-result-object v3

    .line 376
    .local v3, "pressureRange":Landroid/view/InputDevice$MotionRange;
    if-eqz v3, :cond_9

    .line 377
    invoke-virtual {v3}, Landroid/view/InputDevice$MotionRange;->getMin()F

    move-result v14

    float-to-double v1, v14

    .line 378
    invoke-virtual {v3}, Landroid/view/InputDevice$MotionRange;->getMax()F

    move-result v14

    move-wide/from16 v29, v1

    .end local v1    # "pressureMin":D
    .local v29, "pressureMin":D
    float-to-double v1, v14

    move-wide/from16 v27, v12

    move-wide v12, v1

    move-wide/from16 v1, v29

    .end local v27    # "pressureMax":D
    .local v1, "pressureMax":D
    goto :goto_5

    .line 381
    .end local v3    # "pressureRange":Landroid/view/InputDevice$MotionRange;
    .end local v29    # "pressureMin":D
    .local v1, "pressureMin":D
    .restart local v27    # "pressureMax":D
    :cond_9
    move-wide/from16 v35, v12

    move-wide/from16 v12, v27

    move-wide/from16 v27, v35

    .local v12, "pressureMax":D
    .local v27, "timeStamp":J
    :goto_5
    invoke-virtual {v4, v1, v2}, Ljava/nio/ByteBuffer;->putDouble(D)Ljava/nio/ByteBuffer;

    .line 382
    invoke-virtual {v4, v12, v13}, Ljava/nio/ByteBuffer;->putDouble(D)Ljava/nio/ByteBuffer;

    .line 384
    const/4 v3, 0x2

    if-ne v9, v3, :cond_a

    .line 385
    const/16 v3, 0x18

    move-object/from16 v14, p1

    move/from16 v15, p2

    invoke-virtual {v14, v3, v15}, Landroid/view/MotionEvent;->getAxisValue(II)F

    move-result v3

    move-wide/from16 v29, v1

    .end local v1    # "pressureMin":D
    .restart local v29    # "pressureMin":D
    float-to-double v1, v3

    invoke-virtual {v4, v1, v2}, Ljava/nio/ByteBuffer;->putDouble(D)Ljava/nio/ByteBuffer;

    .line 386
    const-wide/16 v1, 0x0

    invoke-virtual {v4, v1, v2}, Ljava/nio/ByteBuffer;->putDouble(D)Ljava/nio/ByteBuffer;

    goto :goto_6

    .line 388
    .end local v29    # "pressureMin":D
    .restart local v1    # "pressureMin":D
    :cond_a
    move-object/from16 v14, p1

    move/from16 v15, p2

    move-wide/from16 v29, v1

    const-wide/16 v1, 0x0

    .end local v1    # "pressureMin":D
    .restart local v29    # "pressureMin":D
    invoke-virtual {v4, v1, v2}, Ljava/nio/ByteBuffer;->putDouble(D)Ljava/nio/ByteBuffer;

    .line 389
    invoke-virtual {v4, v1, v2}, Ljava/nio/ByteBuffer;->putDouble(D)Ljava/nio/ByteBuffer;

    .line 392
    :goto_6
    invoke-virtual/range {p1 .. p2}, Landroid/view/MotionEvent;->getSize(I)F

    move-result v1

    float-to-double v1, v1

    invoke-virtual {v4, v1, v2}, Ljava/nio/ByteBuffer;->putDouble(D)Ljava/nio/ByteBuffer;

    .line 394
    invoke-virtual/range {p1 .. p2}, Landroid/view/MotionEvent;->getToolMajor(I)F

    move-result v1

    float-to-double v1, v1

    invoke-virtual {v4, v1, v2}, Ljava/nio/ByteBuffer;->putDouble(D)Ljava/nio/ByteBuffer;

    .line 395
    invoke-virtual/range {p1 .. p2}, Landroid/view/MotionEvent;->getToolMinor(I)F

    move-result v1

    float-to-double v1, v1

    invoke-virtual {v4, v1, v2}, Ljava/nio/ByteBuffer;->putDouble(D)Ljava/nio/ByteBuffer;

    .line 397
    const-wide/16 v1, 0x0

    invoke-virtual {v4, v1, v2}, Ljava/nio/ByteBuffer;->putDouble(D)Ljava/nio/ByteBuffer;

    .line 398
    invoke-virtual {v4, v1, v2}, Ljava/nio/ByteBuffer;->putDouble(D)Ljava/nio/ByteBuffer;

    .line 400
    const/16 v1, 0x8

    invoke-virtual {v14, v1, v15}, Landroid/view/MotionEvent;->getAxisValue(II)F

    move-result v1

    float-to-double v1, v1

    invoke-virtual {v4, v1, v2}, Ljava/nio/ByteBuffer;->putDouble(D)Ljava/nio/ByteBuffer;

    .line 402
    const/4 v1, 0x2

    if-ne v9, v1, :cond_b

    .line 403
    const/16 v1, 0x19

    invoke-virtual {v14, v1, v15}, Landroid/view/MotionEvent;->getAxisValue(II)F

    move-result v1

    float-to-double v1, v1

    invoke-virtual {v4, v1, v2}, Ljava/nio/ByteBuffer;->putDouble(D)Ljava/nio/ByteBuffer;

    goto :goto_7

    .line 405
    :cond_b
    const-wide/16 v1, 0x0

    invoke-virtual {v4, v1, v2}, Ljava/nio/ByteBuffer;->putDouble(D)Ljava/nio/ByteBuffer;

    .line 408
    :goto_7
    move/from16 v1, p4

    int-to-long v2, v1

    invoke-virtual {v4, v2, v3}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    .line 412
    const/4 v3, 0x1

    if-ne v10, v3, :cond_d

    .line 413
    const-wide/high16 v31, 0x4048000000000000L    # 48.0

    .line 414
    .local v31, "horizontalScaleFactor":D
    const-wide/high16 v33, 0x4048000000000000L    # 48.0

    .line 415
    .local v33, "verticalScaleFactor":D
    if-eqz v5, :cond_c

    .line 416
    invoke-direct {v0, v5}, Lio/flutter/embedding/android/AndroidTouchProcessor;->getHorizontalScrollFactor(Landroid/content/Context;)F

    move-result v3

    float-to-double v2, v3

    .line 417
    .end local v31    # "horizontalScaleFactor":D
    .local v2, "horizontalScaleFactor":D
    invoke-direct {v0, v5}, Lio/flutter/embedding/android/AndroidTouchProcessor;->getVerticalScrollFactor(Landroid/content/Context;)F

    move-result v1

    move-wide/from16 v31, v2

    .end local v2    # "horizontalScaleFactor":D
    .restart local v31    # "horizontalScaleFactor":D
    float-to-double v1, v1

    move-wide/from16 v33, v1

    .line 421
    :cond_c
    nop

    .line 422
    const/16 v1, 0xa

    invoke-virtual {v14, v1, v15}, Landroid/view/MotionEvent;->getAxisValue(II)F

    move-result v1

    neg-float v1, v1

    float-to-double v1, v1

    mul-double v1, v1, v31

    .line 423
    .local v1, "horizontalScrollPixels":D
    nop

    .line 424
    const/16 v3, 0x9

    invoke-virtual {v14, v3, v15}, Landroid/view/MotionEvent;->getAxisValue(II)F

    move-result v5

    neg-float v3, v5

    move v5, v9

    move/from16 v20, v10

    .end local v9    # "pointerKind":I
    .end local v10    # "signalKind":I
    .local v5, "pointerKind":I
    .local v20, "signalKind":I
    float-to-double v9, v3

    mul-double v9, v9, v33

    .line 425
    .local v9, "verticalScrollPixels":D
    invoke-virtual {v4, v1, v2}, Ljava/nio/ByteBuffer;->putDouble(D)Ljava/nio/ByteBuffer;

    .line 426
    invoke-virtual {v4, v9, v10}, Ljava/nio/ByteBuffer;->putDouble(D)Ljava/nio/ByteBuffer;

    .line 427
    .end local v1    # "horizontalScrollPixels":D
    .end local v9    # "verticalScrollPixels":D
    .end local v31    # "horizontalScaleFactor":D
    .end local v33    # "verticalScaleFactor":D
    goto :goto_8

    .line 428
    .end local v5    # "pointerKind":I
    .end local v20    # "signalKind":I
    .local v9, "pointerKind":I
    .restart local v10    # "signalKind":I
    :cond_d
    move v5, v9

    move/from16 v20, v10

    .end local v9    # "pointerKind":I
    .end local v10    # "signalKind":I
    .restart local v5    # "pointerKind":I
    .restart local v20    # "signalKind":I
    const-wide/16 v1, 0x0

    invoke-virtual {v4, v1, v2}, Ljava/nio/ByteBuffer;->putDouble(D)Ljava/nio/ByteBuffer;

    .line 429
    invoke-virtual {v4, v1, v2}, Ljava/nio/ByteBuffer;->putDouble(D)Ljava/nio/ByteBuffer;

    .line 432
    :goto_8
    if-eqz v7, :cond_e

    .line 433
    iget-object v1, v0, Lio/flutter/embedding/android/AndroidTouchProcessor;->ongoingPans:Ljava/util/Map;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [F

    .line 434
    .local v1, "panStart":[F
    const/4 v2, 0x0

    aget v3, v11, v2

    aget v2, v1, v2

    sub-float/2addr v3, v2

    float-to-double v2, v3

    invoke-virtual {v4, v2, v3}, Ljava/nio/ByteBuffer;->putDouble(D)Ljava/nio/ByteBuffer;

    .line 435
    const/4 v2, 0x1

    aget v3, v11, v2

    aget v2, v1, v2

    sub-float/2addr v3, v2

    float-to-double v2, v3

    invoke-virtual {v4, v2, v3}, Ljava/nio/ByteBuffer;->putDouble(D)Ljava/nio/ByteBuffer;

    .line 436
    .end local v1    # "panStart":[F
    const-wide/16 v1, 0x0

    goto :goto_9

    .line 437
    :cond_e
    const-wide/16 v1, 0x0

    invoke-virtual {v4, v1, v2}, Ljava/nio/ByteBuffer;->putDouble(D)Ljava/nio/ByteBuffer;

    .line 438
    invoke-virtual {v4, v1, v2}, Ljava/nio/ByteBuffer;->putDouble(D)Ljava/nio/ByteBuffer;

    .line 440
    :goto_9
    invoke-virtual {v4, v1, v2}, Ljava/nio/ByteBuffer;->putDouble(D)Ljava/nio/ByteBuffer;

    .line 441
    invoke-virtual {v4, v1, v2}, Ljava/nio/ByteBuffer;->putDouble(D)Ljava/nio/ByteBuffer;

    .line 442
    const-wide/high16 v9, 0x3ff0000000000000L    # 1.0

    invoke-virtual {v4, v9, v10}, Ljava/nio/ByteBuffer;->putDouble(D)Ljava/nio/ByteBuffer;

    .line 443
    invoke-virtual {v4, v1, v2}, Ljava/nio/ByteBuffer;->putDouble(D)Ljava/nio/ByteBuffer;

    .line 444
    const-wide/16 v1, 0x0

    invoke-virtual {v4, v1, v2}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    .line 446
    if-eqz v7, :cond_f

    const/16 v1, 0x9

    if-ne v6, v1, :cond_f

    .line 447
    iget-object v1, v0, Lio/flutter/embedding/android/AndroidTouchProcessor;->ongoingPans:Ljava/util/Map;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 449
    :cond_f
    return-void
.end method

.method private getHorizontalScrollFactor(Landroid/content/Context;)F
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .line 452
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1a

    if-lt v0, v1, :cond_0

    .line 453
    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledHorizontalScrollFactor()F

    move-result v0

    return v0

    .line 456
    :cond_0
    invoke-direct {p0, p1}, Lio/flutter/embedding/android/AndroidTouchProcessor;->getVerticalScrollFactorPre26(Landroid/content/Context;)I

    move-result v0

    int-to-float v0, v0

    return v0
.end method

.method private getPointerChangeForAction(I)I
    .locals 3
    .param p1, "maskedAction"    # I

    .line 492
    const/4 v0, 0x4

    if-nez p1, :cond_0

    .line 493
    return v0

    .line 495
    :cond_0
    const/4 v1, 0x1

    const/4 v2, 0x6

    if-ne p1, v1, :cond_1

    .line 496
    return v2

    .line 499
    :cond_1
    const/4 v1, 0x5

    if-ne p1, v1, :cond_2

    .line 500
    return v0

    .line 502
    :cond_2
    if-ne p1, v2, :cond_3

    .line 503
    return v2

    .line 506
    :cond_3
    const/4 v0, 0x2

    if-ne p1, v0, :cond_4

    .line 507
    return v1

    .line 509
    :cond_4
    const/4 v0, 0x7

    const/4 v1, 0x3

    if-ne p1, v0, :cond_5

    .line 510
    return v1

    .line 512
    :cond_5
    if-ne p1, v1, :cond_6

    .line 513
    const/4 v0, 0x0

    return v0

    .line 515
    :cond_6
    const/16 v0, 0x8

    if-ne p1, v0, :cond_7

    .line 516
    return v1

    .line 518
    :cond_7
    const/4 v0, -0x1

    return v0
.end method

.method private getPointerChangeForPanZoom(I)I
    .locals 1
    .param p1, "pointerChange"    # I

    .line 523
    const/4 v0, 0x4

    if-ne p1, v0, :cond_0

    .line 524
    const/4 v0, 0x7

    return v0

    .line 525
    :cond_0
    const/4 v0, 0x5

    if-ne p1, v0, :cond_1

    .line 526
    const/16 v0, 0x8

    return v0

    .line 527
    :cond_1
    const/4 v0, 0x6

    if-eq p1, v0, :cond_3

    if-nez p1, :cond_2

    goto :goto_0

    .line 530
    :cond_2
    const/4 v0, -0x1

    return v0

    .line 528
    :cond_3
    :goto_0
    const/16 v0, 0x9

    return v0
.end method

.method private getPointerDeviceTypeForToolType(I)I
    .locals 1
    .param p1, "toolType"    # I

    .line 535
    packed-switch p1, :pswitch_data_0

    .line 546
    const/4 v0, 0x5

    return v0

    .line 543
    :pswitch_0
    const/4 v0, 0x3

    return v0

    .line 541
    :pswitch_1
    const/4 v0, 0x1

    return v0

    .line 539
    :pswitch_2
    const/4 v0, 0x2

    return v0

    .line 537
    :pswitch_3
    const/4 v0, 0x0

    return v0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private getVerticalScrollFactor(Landroid/content/Context;)F
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .line 461
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1a

    if-lt v0, v1, :cond_0

    .line 462
    invoke-direct {p0, p1}, Lio/flutter/embedding/android/AndroidTouchProcessor;->getVerticalScrollFactorAbove26(Landroid/content/Context;)F

    move-result v0

    return v0

    .line 464
    :cond_0
    invoke-direct {p0, p1}, Lio/flutter/embedding/android/AndroidTouchProcessor;->getVerticalScrollFactorPre26(Landroid/content/Context;)I

    move-result v0

    int-to-float v0, v0

    return v0
.end method

.method private getVerticalScrollFactorAbove26(Landroid/content/Context;)F
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .line 470
    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledVerticalScrollFactor()F

    move-result v0

    return v0
.end method

.method private getVerticalScrollFactorPre26(Landroid/content/Context;)I
    .locals 4
    .param p1, "context"    # Landroid/content/Context;

    .line 476
    iget v0, p0, Lio/flutter/embedding/android/AndroidTouchProcessor;->cachedVerticalScrollFactor:I

    if-nez v0, :cond_1

    .line 477
    new-instance v0, Landroid/util/TypedValue;

    invoke-direct {v0}, Landroid/util/TypedValue;-><init>()V

    .line 478
    .local v0, "outValue":Landroid/util/TypedValue;
    nop

    .line 479
    invoke-virtual {p1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v1

    .line 480
    const v2, 0x101004d

    const/4 v3, 0x1

    invoke-virtual {v1, v2, v0, v3}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    move-result v1

    if-nez v1, :cond_0

    .line 481
    const/16 v1, 0x30

    return v1

    .line 483
    :cond_0
    nop

    .line 484
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/util/TypedValue;->getDimension(Landroid/util/DisplayMetrics;)F

    move-result v1

    float-to-int v1, v1

    iput v1, p0, Lio/flutter/embedding/android/AndroidTouchProcessor;->cachedVerticalScrollFactor:I

    .line 486
    .end local v0    # "outValue":Landroid/util/TypedValue;
    :cond_1
    iget v0, p0, Lio/flutter/embedding/android/AndroidTouchProcessor;->cachedVerticalScrollFactor:I

    return v0
.end method


# virtual methods
.method public onGenericMotionEvent(Landroid/view/MotionEvent;Landroid/content/Context;)Z
    .locals 15
    .param p1, "event"    # Landroid/view/MotionEvent;
    .param p2, "context"    # Landroid/content/Context;

    .line 229
    move-object v8, p0

    const/4 v0, 0x2

    move-object/from16 v9, p1

    invoke-virtual {v9, v0}, Landroid/view/MotionEvent;->isFromSource(I)Z

    move-result v10

    .line 230
    .local v10, "isPointerEvent":Z
    nop

    .line 231
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    const/4 v1, 0x7

    const/4 v2, 0x0

    const/16 v3, 0x8

    const/4 v11, 0x1

    if-eq v0, v1, :cond_1

    .line 232
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    if-ne v0, v3, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    move v12, v0

    .line 233
    .local v12, "isMovementEvent":Z
    if-eqz v10, :cond_3

    if-eqz v12, :cond_3

    .line 239
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    invoke-direct {p0, v0}, Lio/flutter/embedding/android/AndroidTouchProcessor;->getPointerChangeForAction(I)I

    move-result v13

    .line 240
    .local v13, "pointerChange":I
    nop

    .line 242
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v0

    mul-int/lit8 v0, v0, 0x24

    mul-int/lit8 v0, v0, 0x8

    .line 241
    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v14

    .line 243
    .local v14, "packet":Ljava/nio/ByteBuffer;
    sget-object v0, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {v14, v0}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 246
    nop

    .line 247
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getActionIndex()I

    move-result v2

    const/4 v4, 0x0

    sget-object v5, Lio/flutter/embedding/android/AndroidTouchProcessor;->IDENTITY_TRANSFORM:Landroid/graphics/Matrix;

    .line 246
    move-object v0, p0

    move-object/from16 v1, p1

    move v3, v13

    move-object v6, v14

    move-object/from16 v7, p2

    invoke-direct/range {v0 .. v7}, Lio/flutter/embedding/android/AndroidTouchProcessor;->addPointerForIndex(Landroid/view/MotionEvent;IIILandroid/graphics/Matrix;Ljava/nio/ByteBuffer;Landroid/content/Context;)V

    .line 248
    invoke-virtual {v14}, Ljava/nio/ByteBuffer;->position()I

    move-result v0

    rem-int/lit16 v0, v0, 0x120

    if-nez v0, :cond_2

    .line 251
    iget-object v0, v8, Lio/flutter/embedding/android/AndroidTouchProcessor;->renderer:Lio/flutter/embedding/engine/renderer/FlutterRenderer;

    invoke-virtual {v14}, Ljava/nio/ByteBuffer;->position()I

    move-result v1

    invoke-virtual {v0, v14, v1}, Lio/flutter/embedding/engine/renderer/FlutterRenderer;->dispatchPointerDataPacket(Ljava/nio/ByteBuffer;I)V

    .line 252
    return v11

    .line 249
    :cond_2
    new-instance v0, Ljava/lang/AssertionError;

    const-string v1, "Packet position is not on field boundary."

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0

    .line 236
    .end local v13    # "pointerChange":I
    .end local v14    # "packet":Ljava/nio/ByteBuffer;
    :cond_3
    return v2
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1
    .param p1, "event"    # Landroid/view/MotionEvent;

    .line 129
    sget-object v0, Lio/flutter/embedding/android/AndroidTouchProcessor;->IDENTITY_TRANSFORM:Landroid/graphics/Matrix;

    invoke-virtual {p0, p1, v0}, Lio/flutter/embedding/android/AndroidTouchProcessor;->onTouchEvent(Landroid/view/MotionEvent;Landroid/graphics/Matrix;)Z

    move-result v0

    return v0
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;Landroid/graphics/Matrix;)Z
    .locals 19
    .param p1, "event"    # Landroid/view/MotionEvent;
    .param p2, "transformMatrix"    # Landroid/graphics/Matrix;

    .line 141
    move-object/from16 v7, p0

    move-object/from16 v8, p1

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v9

    .line 142
    .local v9, "maskedAction":I
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    invoke-direct {v7, v0}, Lio/flutter/embedding/android/AndroidTouchProcessor;->getPointerChangeForAction(I)I

    move-result v10

    .line 143
    .local v10, "pointerChange":I
    const/4 v0, 0x0

    const/4 v11, 0x1

    if-eqz v9, :cond_1

    const/4 v1, 0x5

    if-ne v9, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v1, 0x1

    :goto_1
    move v12, v1

    .line 145
    .local v12, "updateForSinglePointer":Z
    if-nez v12, :cond_3

    if-eq v9, v11, :cond_2

    const/4 v1, 0x6

    if-ne v9, v1, :cond_3

    :cond_2
    const/4 v1, 0x1

    goto :goto_2

    :cond_3
    const/4 v1, 0x0

    :goto_2
    move v13, v1

    .line 150
    .local v13, "updateForMultiplePointers":Z
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getActionIndex()I

    move-result v1

    invoke-virtual {v8, v1}, Landroid/view/MotionEvent;->getToolType(I)I

    move-result v1

    invoke-direct {v7, v1}, Lio/flutter/embedding/android/AndroidTouchProcessor;->getPointerDeviceTypeForToolType(I)I

    move-result v14

    .line 151
    .local v14, "deviceType":I
    if-eqz v13, :cond_4

    if-nez v14, :cond_4

    const/4 v1, 0x1

    goto :goto_3

    :cond_4
    const/4 v1, 0x0

    :goto_3
    move v15, v1

    .line 153
    .local v15, "shouldRemovePointer":Z
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v6

    .line 160
    .local v6, "originalPointerCount":I
    if-eqz v15, :cond_5

    const/4 v0, 0x1

    :cond_5
    add-int v16, v6, v0

    .line 161
    .local v16, "totalPointerCount":I
    mul-int/lit8 v0, v16, 0x24

    mul-int/lit8 v0, v0, 0x8

    .line 162
    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v5

    .line 163
    .local v5, "packet":Ljava/nio/ByteBuffer;
    sget-object v0, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {v5, v0}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 165
    if-eqz v12, :cond_6

    .line 167
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getActionIndex()I

    move-result v2

    const/4 v4, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move v3, v10

    move-object/from16 v17, v5

    .end local v5    # "packet":Ljava/nio/ByteBuffer;
    .local v17, "packet":Ljava/nio/ByteBuffer;
    move-object/from16 v5, p2

    move v11, v6

    .end local v6    # "originalPointerCount":I
    .local v11, "originalPointerCount":I
    move-object/from16 v6, v17

    invoke-direct/range {v0 .. v6}, Lio/flutter/embedding/android/AndroidTouchProcessor;->addPointerForIndex(Landroid/view/MotionEvent;IIILandroid/graphics/Matrix;Ljava/nio/ByteBuffer;)V

    goto/16 :goto_7

    .line 168
    .end local v11    # "originalPointerCount":I
    .end local v17    # "packet":Ljava/nio/ByteBuffer;
    .restart local v5    # "packet":Ljava/nio/ByteBuffer;
    .restart local v6    # "originalPointerCount":I
    :cond_6
    move-object/from16 v17, v5

    move v11, v6

    .end local v5    # "packet":Ljava/nio/ByteBuffer;
    .end local v6    # "originalPointerCount":I
    .restart local v11    # "originalPointerCount":I
    .restart local v17    # "packet":Ljava/nio/ByteBuffer;
    if-eqz v13, :cond_9

    .line 173
    const/4 v0, 0x0

    move v6, v0

    .local v6, "p":I
    :goto_4
    if-ge v6, v11, :cond_8

    .line 174
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getActionIndex()I

    move-result v0

    if-eq v6, v0, :cond_7

    invoke-virtual {v8, v6}, Landroid/view/MotionEvent;->getToolType(I)I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_7

    .line 175
    const/4 v3, 0x5

    const/4 v4, 0x1

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move v2, v6

    move-object/from16 v5, p2

    move/from16 v18, v6

    .end local v6    # "p":I
    .local v18, "p":I
    move-object/from16 v6, v17

    invoke-direct/range {v0 .. v6}, Lio/flutter/embedding/android/AndroidTouchProcessor;->addPointerForIndex(Landroid/view/MotionEvent;IIILandroid/graphics/Matrix;Ljava/nio/ByteBuffer;)V

    goto :goto_5

    .line 174
    .end local v18    # "p":I
    .restart local v6    # "p":I
    :cond_7
    move/from16 v18, v6

    .line 173
    .end local v6    # "p":I
    .restart local v18    # "p":I
    :goto_5
    add-int/lit8 v6, v18, 0x1

    .end local v18    # "p":I
    .restart local v6    # "p":I
    goto :goto_4

    :cond_8
    move/from16 v18, v6

    .line 181
    .end local v6    # "p":I
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getActionIndex()I

    move-result v2

    const/4 v4, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move v3, v10

    move-object/from16 v5, p2

    move-object/from16 v6, v17

    invoke-direct/range {v0 .. v6}, Lio/flutter/embedding/android/AndroidTouchProcessor;->addPointerForIndex(Landroid/view/MotionEvent;IIILandroid/graphics/Matrix;Ljava/nio/ByteBuffer;)V

    .line 183
    if-eqz v15, :cond_b

    .line 192
    nop

    .line 193
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getActionIndex()I

    move-result v2

    const/4 v3, 0x2

    const/4 v4, 0x0

    .line 192
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v5, p2

    move-object/from16 v6, v17

    invoke-direct/range {v0 .. v6}, Lio/flutter/embedding/android/AndroidTouchProcessor;->addPointerForIndex(Landroid/view/MotionEvent;IIILandroid/graphics/Matrix;Ljava/nio/ByteBuffer;)V

    goto :goto_7

    .line 199
    :cond_9
    const/4 v0, 0x0

    move v6, v0

    .restart local v6    # "p":I
    :goto_6
    if-ge v6, v11, :cond_a

    .line 200
    const/4 v4, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move v2, v6

    move v3, v10

    move-object/from16 v5, p2

    move/from16 v18, v6

    .end local v6    # "p":I
    .restart local v18    # "p":I
    move-object/from16 v6, v17

    invoke-direct/range {v0 .. v6}, Lio/flutter/embedding/android/AndroidTouchProcessor;->addPointerForIndex(Landroid/view/MotionEvent;IIILandroid/graphics/Matrix;Ljava/nio/ByteBuffer;)V

    .line 199
    add-int/lit8 v6, v18, 0x1

    .end local v18    # "p":I
    .restart local v6    # "p":I
    goto :goto_6

    :cond_a
    move/from16 v18, v6

    .line 205
    .end local v6    # "p":I
    :cond_b
    :goto_7
    invoke-virtual/range {v17 .. v17}, Ljava/nio/ByteBuffer;->position()I

    move-result v0

    rem-int/lit16 v0, v0, 0x120

    if-nez v0, :cond_c

    .line 210
    iget-object v0, v7, Lio/flutter/embedding/android/AndroidTouchProcessor;->renderer:Lio/flutter/embedding/engine/renderer/FlutterRenderer;

    invoke-virtual/range {v17 .. v17}, Ljava/nio/ByteBuffer;->position()I

    move-result v1

    move-object/from16 v2, v17

    .end local v17    # "packet":Ljava/nio/ByteBuffer;
    .local v2, "packet":Ljava/nio/ByteBuffer;
    invoke-virtual {v0, v2, v1}, Lio/flutter/embedding/engine/renderer/FlutterRenderer;->dispatchPointerDataPacket(Ljava/nio/ByteBuffer;I)V

    .line 212
    const/4 v0, 0x1

    return v0

    .line 206
    .end local v2    # "packet":Ljava/nio/ByteBuffer;
    .restart local v17    # "packet":Ljava/nio/ByteBuffer;
    :cond_c
    new-instance v0, Ljava/lang/AssertionError;

    const-string v1, "Packet position is not on field boundary"

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0
.end method
