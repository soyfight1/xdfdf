.class public Lio/flutter/embedding/android/KeyEmbedderResponder;
.super Ljava/lang/Object;
.source "KeyEmbedderResponder.java"

# interfaces
.implements Lio/flutter/embedding/android/KeyboardManager$Responder;


# static fields
.field private static final TAG:Ljava/lang/String; = "KeyEmbedderResponder"


# instance fields
.field private final characterCombiner:Lio/flutter/embedding/android/KeyboardManager$CharacterCombiner;

.field private final messenger:Lio/flutter/plugin/common/BinaryMessenger;

.field private final pressingRecords:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/Long;",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field private final togglingGoals:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/Long;",
            "Lio/flutter/embedding/android/KeyboardMap$TogglingGoal;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lio/flutter/plugin/common/BinaryMessenger;)V
    .locals 7
    .param p1, "messenger"    # Lio/flutter/plugin/common/BinaryMessenger;

    .line 59
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lio/flutter/embedding/android/KeyEmbedderResponder;->pressingRecords:Ljava/util/HashMap;

    .line 53
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lio/flutter/embedding/android/KeyEmbedderResponder;->togglingGoals:Ljava/util/HashMap;

    .line 55
    new-instance v0, Lio/flutter/embedding/android/KeyboardManager$CharacterCombiner;

    invoke-direct {v0}, Lio/flutter/embedding/android/KeyboardManager$CharacterCombiner;-><init>()V

    iput-object v0, p0, Lio/flutter/embedding/android/KeyEmbedderResponder;->characterCombiner:Lio/flutter/embedding/android/KeyboardManager$CharacterCombiner;

    .line 60
    iput-object p1, p0, Lio/flutter/embedding/android/KeyEmbedderResponder;->messenger:Lio/flutter/plugin/common/BinaryMessenger;

    .line 61
    invoke-static {}, Lio/flutter/embedding/android/KeyboardMap;->getTogglingGoals()[Lio/flutter/embedding/android/KeyboardMap$TogglingGoal;

    move-result-object v0

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    aget-object v3, v0, v2

    .line 62
    .local v3, "goal":Lio/flutter/embedding/android/KeyboardMap$TogglingGoal;
    iget-object v4, p0, Lio/flutter/embedding/android/KeyEmbedderResponder;->togglingGoals:Ljava/util/HashMap;

    iget-wide v5, v3, Lio/flutter/embedding/android/KeyboardMap$TogglingGoal;->logicalKey:J

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-virtual {v4, v5, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 61
    .end local v3    # "goal":Lio/flutter/embedding/android/KeyboardMap$TogglingGoal;
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 64
    :cond_0
    return-void
.end method

.method private static getEventType(Landroid/view/KeyEvent;)Lio/flutter/embedding/android/KeyData$Type;
    .locals 3
    .param p0, "event"    # Landroid/view/KeyEvent;

    .line 31
    invoke-virtual {p0}, Landroid/view/KeyEvent;->getRepeatCount()I

    move-result v0

    if-lez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 32
    .local v0, "isRepeatEvent":Z
    :goto_0
    invoke-virtual {p0}, Landroid/view/KeyEvent;->getAction()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    .line 38
    new-instance v1, Ljava/lang/AssertionError;

    const-string v2, "Unexpected event type"

    invoke-direct {v1, v2}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1

    .line 36
    :pswitch_0
    sget-object v1, Lio/flutter/embedding/android/KeyData$Type;->kUp:Lio/flutter/embedding/android/KeyData$Type;

    return-object v1

    .line 34
    :pswitch_1
    if-eqz v0, :cond_1

    sget-object v1, Lio/flutter/embedding/android/KeyData$Type;->kRepeat:Lio/flutter/embedding/android/KeyData$Type;

    goto :goto_1

    :cond_1
    sget-object v1, Lio/flutter/embedding/android/KeyData$Type;->kDown:Lio/flutter/embedding/android/KeyData$Type;

    :goto_1
    return-object v1

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private getLogicalKey(Landroid/view/KeyEvent;)Ljava/lang/Long;
    .locals 5
    .param p1, "event"    # Landroid/view/KeyEvent;

    .line 93
    sget-object v0, Lio/flutter/embedding/android/KeyboardMap;->keyCodeToLogical:Ljava/util/HashMap;

    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v1

    int-to-long v1, v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    .line 94
    .local v0, "byMapping":Ljava/lang/Long;
    if-eqz v0, :cond_0

    .line 95
    return-object v0

    .line 97
    :cond_0
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v1

    int-to-long v1, v1

    const-wide v3, 0x1100000000L

    invoke-static {v1, v2, v3, v4}, Lio/flutter/embedding/android/KeyEmbedderResponder;->keyOfPlane(JJ)J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    return-object v1
.end method

.method private getPhysicalKey(Landroid/view/KeyEvent;)Ljava/lang/Long;
    .locals 8
    .param p1, "event"    # Landroid/view/KeyEvent;

    .line 75
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getScanCode()I

    move-result v0

    int-to-long v0, v0

    .line 78
    .local v0, "scancode":J
    const-wide/16 v2, 0x0

    const-wide v4, 0x1100000000L

    cmp-long v6, v0, v2

    if-nez v6, :cond_0

    .line 80
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v2

    int-to-long v2, v2

    invoke-static {v2, v3, v4, v5}, Lio/flutter/embedding/android/KeyEmbedderResponder;->keyOfPlane(JJ)J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    return-object v2

    .line 82
    :cond_0
    sget-object v2, Lio/flutter/embedding/android/KeyboardMap;->scanCodeToPhysical:Ljava/util/HashMap;

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Long;

    .line 83
    .local v2, "byMapping":Ljava/lang/Long;
    if-eqz v2, :cond_1

    .line 84
    return-object v2

    .line 86
    :cond_1
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getScanCode()I

    move-result v3

    int-to-long v6, v3

    invoke-static {v6, v7, v4, v5}, Lio/flutter/embedding/android/KeyEmbedderResponder;->keyOfPlane(JJ)J

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    return-object v3
.end method

.method private handleEventImpl(Landroid/view/KeyEvent;Lio/flutter/embedding/android/KeyboardManager$Responder$OnKeyEventHandledCallback;)Z
    .locals 17
    .param p1, "event"    # Landroid/view/KeyEvent;
    .param p2, "onKeyEventHandledCallback"    # Lio/flutter/embedding/android/KeyboardManager$Responder$OnKeyEventHandledCallback;

    .line 272
    move-object/from16 v9, p0

    invoke-virtual/range {p1 .. p1}, Landroid/view/KeyEvent;->getScanCode()I

    move-result v0

    const/4 v10, 0x0

    if-nez v0, :cond_0

    invoke-virtual/range {p1 .. p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v0

    if-nez v0, :cond_0

    .line 273
    return v10

    .line 275
    :cond_0
    invoke-direct/range {p0 .. p1}, Lio/flutter/embedding/android/KeyEmbedderResponder;->getPhysicalKey(Landroid/view/KeyEvent;)Ljava/lang/Long;

    move-result-object v11

    .line 276
    .local v11, "physicalKey":Ljava/lang/Long;
    invoke-direct/range {p0 .. p1}, Lio/flutter/embedding/android/KeyEmbedderResponder;->getLogicalKey(Landroid/view/KeyEvent;)Ljava/lang/Long;

    move-result-object v12

    .line 278
    .local v12, "logicalKey":Ljava/lang/Long;
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 279
    .local v8, "postSynchronizeEvents":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Runnable;>;"
    sget-object v13, Lio/flutter/embedding/android/KeyboardMap;->pressingGoals:[Lio/flutter/embedding/android/KeyboardMap$PressingGoal;

    array-length v14, v13

    const/4 v15, 0x0

    :goto_0
    const/4 v6, 0x1

    if-ge v15, v14, :cond_2

    aget-object v7, v13, v15

    .line 280
    .local v7, "goal":Lio/flutter/embedding/android/KeyboardMap$PressingGoal;
    nop

    .line 282
    invoke-virtual/range {p1 .. p1}, Landroid/view/KeyEvent;->getMetaState()I

    move-result v0

    iget v1, v7, Lio/flutter/embedding/android/KeyboardMap$PressingGoal;->mask:I

    and-int/2addr v0, v1

    if-eqz v0, :cond_1

    const/4 v2, 0x1

    goto :goto_1

    :cond_1
    const/4 v2, 0x0

    .line 283
    :goto_1
    invoke-virtual {v12}, Ljava/lang/Long;->longValue()J

    move-result-wide v3

    .line 284
    invoke-virtual {v11}, Ljava/lang/Long;->longValue()J

    move-result-wide v5

    .line 280
    move-object/from16 v0, p0

    move-object v1, v7

    move-object/from16 v16, v7

    .end local v7    # "goal":Lio/flutter/embedding/android/KeyboardMap$PressingGoal;
    .local v16, "goal":Lio/flutter/embedding/android/KeyboardMap$PressingGoal;
    move-object/from16 v7, p1

    invoke-virtual/range {v0 .. v8}, Lio/flutter/embedding/android/KeyEmbedderResponder;->synchronizePressingKey(Lio/flutter/embedding/android/KeyboardMap$PressingGoal;ZJJLandroid/view/KeyEvent;Ljava/util/ArrayList;)V

    .line 279
    .end local v16    # "goal":Lio/flutter/embedding/android/KeyboardMap$PressingGoal;
    add-int/lit8 v15, v15, 0x1

    goto :goto_0

    .line 289
    :cond_2
    iget-object v0, v9, Lio/flutter/embedding/android/KeyEmbedderResponder;->togglingGoals:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_2
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    move-object v13, v0

    check-cast v13, Lio/flutter/embedding/android/KeyboardMap$TogglingGoal;

    .line 290
    .local v13, "goal":Lio/flutter/embedding/android/KeyboardMap$TogglingGoal;
    invoke-virtual/range {p1 .. p1}, Landroid/view/KeyEvent;->getMetaState()I

    move-result v0

    iget v1, v13, Lio/flutter/embedding/android/KeyboardMap$TogglingGoal;->mask:I

    and-int/2addr v0, v1

    if-eqz v0, :cond_3

    const/4 v2, 0x1

    goto :goto_3

    :cond_3
    const/4 v2, 0x0

    :goto_3
    invoke-virtual {v12}, Ljava/lang/Long;->longValue()J

    move-result-wide v3

    move-object/from16 v0, p0

    move-object v1, v13

    move-object/from16 v5, p1

    invoke-virtual/range {v0 .. v5}, Lio/flutter/embedding/android/KeyEmbedderResponder;->synchronizeTogglingKey(Lio/flutter/embedding/android/KeyboardMap$TogglingGoal;ZJLandroid/view/KeyEvent;)V

    .line 291
    .end local v13    # "goal":Lio/flutter/embedding/android/KeyboardMap$TogglingGoal;
    goto :goto_2

    .line 294
    :cond_4
    invoke-virtual/range {p1 .. p1}, Landroid/view/KeyEvent;->getAction()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 302
    move-object/from16 v2, p2

    return v10

    .line 299
    :pswitch_0
    const/4 v0, 0x0

    .line 300
    .local v0, "isDownEvent":Z
    move v7, v0

    goto :goto_4

    .line 296
    .end local v0    # "isDownEvent":Z
    :pswitch_1
    const/4 v0, 0x1

    .line 297
    .restart local v0    # "isDownEvent":Z
    move v7, v0

    .line 306
    .end local v0    # "isDownEvent":Z
    .local v7, "isDownEvent":Z
    :goto_4
    const/4 v13, 0x0

    .line 307
    .local v13, "character":Ljava/lang/String;
    iget-object v0, v9, Lio/flutter/embedding/android/KeyEmbedderResponder;->pressingRecords:Ljava/util/HashMap;

    invoke-virtual {v0, v11}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    move-object v14, v0

    check-cast v14, Ljava/lang/Long;

    .line 308
    .local v14, "lastLogicalRecord":Ljava/lang/Long;
    if-eqz v7, :cond_8

    .line 309
    if-nez v14, :cond_5

    .line 310
    sget-object v0, Lio/flutter/embedding/android/KeyData$Type;->kDown:Lio/flutter/embedding/android/KeyData$Type;

    .local v0, "type":Lio/flutter/embedding/android/KeyData$Type;
    goto :goto_5

    .line 314
    .end local v0    # "type":Lio/flutter/embedding/android/KeyData$Type;
    :cond_5
    invoke-virtual/range {p1 .. p1}, Landroid/view/KeyEvent;->getRepeatCount()I

    move-result v0

    if-lez v0, :cond_6

    .line 315
    sget-object v0, Lio/flutter/embedding/android/KeyData$Type;->kRepeat:Lio/flutter/embedding/android/KeyData$Type;

    .restart local v0    # "type":Lio/flutter/embedding/android/KeyData$Type;
    goto :goto_5

    .line 317
    .end local v0    # "type":Lio/flutter/embedding/android/KeyData$Type;
    :cond_6
    const/4 v1, 0x0

    invoke-virtual/range {p1 .. p1}, Landroid/view/KeyEvent;->getEventTime()J

    move-result-wide v4

    move-object/from16 v0, p0

    move-object v2, v14

    move-object v3, v11

    invoke-direct/range {v0 .. v5}, Lio/flutter/embedding/android/KeyEmbedderResponder;->synthesizeEvent(ZLjava/lang/Long;Ljava/lang/Long;J)V

    .line 318
    sget-object v0, Lio/flutter/embedding/android/KeyData$Type;->kDown:Lio/flutter/embedding/android/KeyData$Type;

    .line 321
    .restart local v0    # "type":Lio/flutter/embedding/android/KeyData$Type;
    :goto_5
    iget-object v1, v9, Lio/flutter/embedding/android/KeyEmbedderResponder;->characterCombiner:Lio/flutter/embedding/android/KeyboardManager$CharacterCombiner;

    .line 322
    invoke-virtual/range {p1 .. p1}, Landroid/view/KeyEvent;->getUnicodeChar()I

    move-result v2

    invoke-virtual {v1, v2}, Lio/flutter/embedding/android/KeyboardManager$CharacterCombiner;->applyCombiningCharacterToBaseCharacter(I)Ljava/lang/Character;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Character;->charValue()C

    move-result v1

    .line 323
    .local v1, "complexChar":C
    if-eqz v1, :cond_7

    .line 324
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    .line 326
    .end local v1    # "complexChar":C
    :cond_7
    goto :goto_6

    .line 327
    .end local v0    # "type":Lio/flutter/embedding/android/KeyData$Type;
    :cond_8
    if-nez v14, :cond_9

    .line 329
    return v10

    .line 331
    :cond_9
    sget-object v0, Lio/flutter/embedding/android/KeyData$Type;->kUp:Lio/flutter/embedding/android/KeyData$Type;

    .line 335
    .restart local v0    # "type":Lio/flutter/embedding/android/KeyData$Type;
    :goto_6
    sget-object v1, Lio/flutter/embedding/android/KeyData$Type;->kRepeat:Lio/flutter/embedding/android/KeyData$Type;

    if-eq v0, v1, :cond_b

    .line 336
    if-eqz v7, :cond_a

    move-object v1, v12

    goto :goto_7

    :cond_a
    const/4 v1, 0x0

    :goto_7
    invoke-virtual {v9, v11, v1}, Lio/flutter/embedding/android/KeyEmbedderResponder;->updatePressingState(Ljava/lang/Long;Ljava/lang/Long;)V

    .line 338
    :cond_b
    sget-object v1, Lio/flutter/embedding/android/KeyData$Type;->kDown:Lio/flutter/embedding/android/KeyData$Type;

    if-ne v0, v1, :cond_c

    .line 339
    iget-object v1, v9, Lio/flutter/embedding/android/KeyEmbedderResponder;->togglingGoals:Ljava/util/HashMap;

    invoke-virtual {v1, v12}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/flutter/embedding/android/KeyboardMap$TogglingGoal;

    .line 340
    .local v1, "maybeTogglingGoal":Lio/flutter/embedding/android/KeyboardMap$TogglingGoal;
    if-eqz v1, :cond_c

    .line 341
    iget-boolean v2, v1, Lio/flutter/embedding/android/KeyboardMap$TogglingGoal;->enabled:Z

    xor-int/2addr v2, v6

    iput-boolean v2, v1, Lio/flutter/embedding/android/KeyboardMap$TogglingGoal;->enabled:Z

    .line 345
    .end local v1    # "maybeTogglingGoal":Lio/flutter/embedding/android/KeyboardMap$TogglingGoal;
    :cond_c
    new-instance v1, Lio/flutter/embedding/android/KeyData;

    invoke-direct {v1}, Lio/flutter/embedding/android/KeyData;-><init>()V

    .line 347
    .local v1, "output":Lio/flutter/embedding/android/KeyData;
    invoke-virtual/range {p1 .. p1}, Landroid/view/KeyEvent;->getSource()I

    move-result v2

    sparse-switch v2, :sswitch_data_0

    .line 350
    sget-object v2, Lio/flutter/embedding/android/KeyData$DeviceType;->kKeyboard:Lio/flutter/embedding/android/KeyData$DeviceType;

    iput-object v2, v1, Lio/flutter/embedding/android/KeyData;->deviceType:Lio/flutter/embedding/android/KeyData$DeviceType;

    .line 351
    goto :goto_8

    .line 362
    :sswitch_0
    sget-object v2, Lio/flutter/embedding/android/KeyData$DeviceType;->kHdmi:Lio/flutter/embedding/android/KeyData$DeviceType;

    iput-object v2, v1, Lio/flutter/embedding/android/KeyData;->deviceType:Lio/flutter/embedding/android/KeyData$DeviceType;

    goto :goto_8

    .line 359
    :sswitch_1
    sget-object v2, Lio/flutter/embedding/android/KeyData$DeviceType;->kJoystick:Lio/flutter/embedding/android/KeyData$DeviceType;

    iput-object v2, v1, Lio/flutter/embedding/android/KeyData;->deviceType:Lio/flutter/embedding/android/KeyData$DeviceType;

    .line 360
    goto :goto_8

    .line 356
    :sswitch_2
    sget-object v2, Lio/flutter/embedding/android/KeyData$DeviceType;->kGamepad:Lio/flutter/embedding/android/KeyData$DeviceType;

    iput-object v2, v1, Lio/flutter/embedding/android/KeyData;->deviceType:Lio/flutter/embedding/android/KeyData$DeviceType;

    .line 357
    goto :goto_8

    .line 353
    :sswitch_3
    sget-object v2, Lio/flutter/embedding/android/KeyData$DeviceType;->kDirectionalPad:Lio/flutter/embedding/android/KeyData$DeviceType;

    iput-object v2, v1, Lio/flutter/embedding/android/KeyData;->deviceType:Lio/flutter/embedding/android/KeyData$DeviceType;

    .line 354
    nop

    .line 366
    :goto_8
    invoke-virtual/range {p1 .. p1}, Landroid/view/KeyEvent;->getEventTime()J

    move-result-wide v2

    iput-wide v2, v1, Lio/flutter/embedding/android/KeyData;->timestamp:J

    .line 367
    iput-object v0, v1, Lio/flutter/embedding/android/KeyData;->type:Lio/flutter/embedding/android/KeyData$Type;

    .line 368
    invoke-virtual {v12}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    iput-wide v2, v1, Lio/flutter/embedding/android/KeyData;->logicalKey:J

    .line 369
    invoke-virtual {v11}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    iput-wide v2, v1, Lio/flutter/embedding/android/KeyData;->physicalKey:J

    .line 370
    iput-object v13, v1, Lio/flutter/embedding/android/KeyData;->character:Ljava/lang/String;

    .line 371
    iput-boolean v10, v1, Lio/flutter/embedding/android/KeyData;->synthesized:Z

    .line 373
    move-object/from16 v2, p2

    invoke-direct {v9, v1, v2}, Lio/flutter/embedding/android/KeyEmbedderResponder;->sendKeyEvent(Lio/flutter/embedding/android/KeyData;Lio/flutter/embedding/android/KeyboardManager$Responder$OnKeyEventHandledCallback;)V

    .line 374
    invoke-virtual {v8}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_9
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_d

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Runnable;

    .line 375
    .local v4, "postSyncEvent":Ljava/lang/Runnable;
    invoke-interface {v4}, Ljava/lang/Runnable;->run()V

    .line 376
    .end local v4    # "postSyncEvent":Ljava/lang/Runnable;
    goto :goto_9

    .line 377
    :cond_d
    return v6

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch

    :sswitch_data_0
    .sparse-switch
        0x201 -> :sswitch_3
        0x401 -> :sswitch_2
        0x1000010 -> :sswitch_1
        0x2000001 -> :sswitch_0
    .end sparse-switch
.end method

.method private static keyOfPlane(JJ)J
    .locals 2
    .param p0, "key"    # J
    .param p2, "plane"    # J

    .line 68
    const-wide v0, 0xffffffffL

    and-long/2addr v0, p0

    or-long/2addr v0, p2

    return-wide v0
.end method

.method static synthetic lambda$sendKeyEvent$2(Lio/flutter/embedding/android/KeyboardManager$Responder$OnKeyEventHandledCallback;Ljava/nio/ByteBuffer;)V
    .locals 3
    .param p0, "onKeyEventHandledCallback"    # Lio/flutter/embedding/android/KeyboardManager$Responder$OnKeyEventHandledCallback;
    .param p1, "message"    # Ljava/nio/ByteBuffer;

    .line 400
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    .line 401
    .local v1, "handled":Ljava/lang/Boolean;
    if-eqz p1, :cond_1

    .line 402
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 403
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v2

    if-eqz v2, :cond_2

    .line 404
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->get()B

    move-result v2

    if-eqz v2, :cond_0

    const/4 v0, 0x1

    :cond_0
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    goto :goto_0

    .line 407
    :cond_1
    const-string v0, "KeyEmbedderResponder"

    const-string v2, "A null reply was received when sending a key event to the framework."

    invoke-static {v0, v2}, Lio/flutter/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 409
    :cond_2
    :goto_0
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    invoke-interface {p0, v0}, Lio/flutter/embedding/android/KeyboardManager$Responder$OnKeyEventHandledCallback;->onKeyEventHandled(Z)V

    .line 410
    return-void
.end method

.method private sendKeyEvent(Lio/flutter/embedding/android/KeyData;Lio/flutter/embedding/android/KeyboardManager$Responder$OnKeyEventHandledCallback;)V
    .locals 4
    .param p1, "data"    # Lio/flutter/embedding/android/KeyData;
    .param p2, "onKeyEventHandledCallback"    # Lio/flutter/embedding/android/KeyboardManager$Responder$OnKeyEventHandledCallback;

    .line 397
    if-nez p2, :cond_0

    .line 398
    const/4 v0, 0x0

    goto :goto_0

    .line 399
    :cond_0
    new-instance v0, Lio/flutter/embedding/android/KeyEmbedderResponder$$ExternalSyntheticLambda0;

    invoke-direct {v0, p2}, Lio/flutter/embedding/android/KeyEmbedderResponder$$ExternalSyntheticLambda0;-><init>(Lio/flutter/embedding/android/KeyboardManager$Responder$OnKeyEventHandledCallback;)V

    :goto_0
    nop

    .line 412
    .local v0, "handleMessageReply":Lio/flutter/plugin/common/BinaryMessenger$BinaryReply;
    iget-object v1, p0, Lio/flutter/embedding/android/KeyEmbedderResponder;->messenger:Lio/flutter/plugin/common/BinaryMessenger;

    const-string v2, "flutter/keydata"

    invoke-virtual {p1}, Lio/flutter/embedding/android/KeyData;->toBytes()Ljava/nio/ByteBuffer;

    move-result-object v3

    invoke-interface {v1, v2, v3, v0}, Lio/flutter/plugin/common/BinaryMessenger;->send(Ljava/lang/String;Ljava/nio/ByteBuffer;Lio/flutter/plugin/common/BinaryMessenger$BinaryReply;)V

    .line 413
    return-void
.end method

.method private synthesizeEvent(ZLjava/lang/Long;Ljava/lang/Long;J)V
    .locals 7
    .param p1, "isDown"    # Z
    .param p2, "logicalKey"    # Ljava/lang/Long;
    .param p3, "physicalKey"    # Ljava/lang/Long;
    .param p4, "timestamp"    # J

    .line 381
    new-instance v0, Lio/flutter/embedding/android/KeyData;

    invoke-direct {v0}, Lio/flutter/embedding/android/KeyData;-><init>()V

    .line 382
    .local v0, "output":Lio/flutter/embedding/android/KeyData;
    iput-wide p4, v0, Lio/flutter/embedding/android/KeyData;->timestamp:J

    .line 383
    if-eqz p1, :cond_0

    sget-object v1, Lio/flutter/embedding/android/KeyData$Type;->kDown:Lio/flutter/embedding/android/KeyData$Type;

    goto :goto_0

    :cond_0
    sget-object v1, Lio/flutter/embedding/android/KeyData$Type;->kUp:Lio/flutter/embedding/android/KeyData$Type;

    :goto_0
    iput-object v1, v0, Lio/flutter/embedding/android/KeyData;->type:Lio/flutter/embedding/android/KeyData$Type;

    .line 384
    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    iput-wide v1, v0, Lio/flutter/embedding/android/KeyData;->logicalKey:J

    .line 385
    invoke-virtual {p3}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    iput-wide v1, v0, Lio/flutter/embedding/android/KeyData;->physicalKey:J

    .line 386
    const/4 v1, 0x0

    iput-object v1, v0, Lio/flutter/embedding/android/KeyData;->character:Ljava/lang/String;

    .line 387
    const/4 v2, 0x1

    iput-boolean v2, v0, Lio/flutter/embedding/android/KeyData;->synthesized:Z

    .line 388
    sget-object v2, Lio/flutter/embedding/android/KeyData$DeviceType;->kKeyboard:Lio/flutter/embedding/android/KeyData$DeviceType;

    iput-object v2, v0, Lio/flutter/embedding/android/KeyData;->deviceType:Lio/flutter/embedding/android/KeyData$DeviceType;

    .line 389
    invoke-virtual {p3}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    const-wide/16 v4, 0x0

    cmp-long v6, v2, v4

    if-eqz v6, :cond_2

    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    cmp-long v6, v2, v4

    if-eqz v6, :cond_2

    .line 390
    if-eqz p1, :cond_1

    move-object v2, p2

    goto :goto_1

    :cond_1
    move-object v2, v1

    :goto_1
    invoke-virtual {p0, p3, v2}, Lio/flutter/embedding/android/KeyEmbedderResponder;->updatePressingState(Ljava/lang/Long;Ljava/lang/Long;)V

    .line 392
    :cond_2
    invoke-direct {p0, v0, v1}, Lio/flutter/embedding/android/KeyEmbedderResponder;->sendKeyEvent(Lio/flutter/embedding/android/KeyData;Lio/flutter/embedding/android/KeyboardManager$Responder$OnKeyEventHandledCallback;)V

    .line 393
    return-void
.end method


# virtual methods
.method public getPressedState()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/Long;",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    .line 445
    iget-object v0, p0, Lio/flutter/embedding/android/KeyEmbedderResponder;->pressingRecords:Ljava/util/HashMap;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method public handleEvent(Landroid/view/KeyEvent;Lio/flutter/embedding/android/KeyboardManager$Responder$OnKeyEventHandledCallback;)V
    .locals 8
    .param p1, "event"    # Landroid/view/KeyEvent;
    .param p2, "onKeyEventHandledCallback"    # Lio/flutter/embedding/android/KeyboardManager$Responder$OnKeyEventHandledCallback;

    .line 431
    invoke-direct {p0, p1, p2}, Lio/flutter/embedding/android/KeyEmbedderResponder;->handleEventImpl(Landroid/view/KeyEvent;Lio/flutter/embedding/android/KeyboardManager$Responder$OnKeyEventHandledCallback;)Z

    move-result v0

    .line 432
    .local v0, "sentAny":Z
    if-nez v0, :cond_0

    .line 433
    const/4 v2, 0x1

    const-wide/16 v3, 0x0

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    const-wide/16 v6, 0x0

    move-object v1, p0

    move-object v3, v5

    move-wide v5, v6

    invoke-direct/range {v1 .. v6}, Lio/flutter/embedding/android/KeyEmbedderResponder;->synthesizeEvent(ZLjava/lang/Long;Ljava/lang/Long;J)V

    .line 434
    const/4 v1, 0x1

    invoke-interface {p2, v1}, Lio/flutter/embedding/android/KeyboardManager$Responder$OnKeyEventHandledCallback;->onKeyEventHandled(Z)V

    .line 436
    :cond_0
    return-void
.end method

.method synthetic lambda$synchronizePressingKey$0$io-flutter-embedding-android-KeyEmbedderResponder(Lio/flutter/embedding/android/KeyboardMap$KeyPair;JLandroid/view/KeyEvent;)V
    .locals 6
    .param p1, "key"    # Lio/flutter/embedding/android/KeyboardMap$KeyPair;
    .param p2, "eventPhysicalKey"    # J
    .param p4, "event"    # Landroid/view/KeyEvent;

    .line 168
    const/4 v1, 0x0

    iget-wide v2, p1, Lio/flutter/embedding/android/KeyboardMap$KeyPair;->logicalKey:J

    .line 169
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {p4}, Landroid/view/KeyEvent;->getEventTime()J

    move-result-wide v4

    .line 168
    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lio/flutter/embedding/android/KeyEmbedderResponder;->synthesizeEvent(ZLjava/lang/Long;Ljava/lang/Long;J)V

    return-void
.end method

.method synthetic lambda$synchronizePressingKey$1$io-flutter-embedding-android-KeyEmbedderResponder(Lio/flutter/embedding/android/KeyboardMap$KeyPair;Landroid/view/KeyEvent;)V
    .locals 6
    .param p1, "key"    # Lio/flutter/embedding/android/KeyboardMap$KeyPair;
    .param p2, "event"    # Landroid/view/KeyEvent;

    .line 185
    const/4 v1, 0x0

    iget-wide v2, p1, Lio/flutter/embedding/android/KeyboardMap$KeyPair;->logicalKey:J

    .line 186
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    iget-wide v3, p1, Lio/flutter/embedding/android/KeyboardMap$KeyPair;->physicalKey:J

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {p2}, Landroid/view/KeyEvent;->getEventTime()J

    move-result-wide v4

    .line 185
    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lio/flutter/embedding/android/KeyEmbedderResponder;->synthesizeEvent(ZLjava/lang/Long;Ljava/lang/Long;J)V

    return-void
.end method

.method synchronizePressingKey(Lio/flutter/embedding/android/KeyboardMap$PressingGoal;ZJJLandroid/view/KeyEvent;Ljava/util/ArrayList;)V
    .locals 16
    .param p1, "goal"    # Lio/flutter/embedding/android/KeyboardMap$PressingGoal;
    .param p2, "truePressed"    # Z
    .param p3, "eventLogicalKey"    # J
    .param p5, "eventPhysicalKey"    # J
    .param p7, "event"    # Landroid/view/KeyEvent;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/flutter/embedding/android/KeyboardMap$PressingGoal;",
            "ZJJ",
            "Landroid/view/KeyEvent;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Runnable;",
            ">;)V"
        }
    .end annotation

    .line 152
    .local p8, "postSynchronize":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Runnable;>;"
    move-object/from16 v6, p0

    move-object/from16 v7, p1

    move-object/from16 v8, p8

    iget-object v0, v7, Lio/flutter/embedding/android/KeyboardMap$PressingGoal;->keys:[Lio/flutter/embedding/android/KeyboardMap$KeyPair;

    array-length v0, v0

    new-array v9, v0, [Z

    .line 153
    .local v9, "nowStates":[Z
    iget-object v0, v7, Lio/flutter/embedding/android/KeyboardMap$PressingGoal;->keys:[Lio/flutter/embedding/android/KeyboardMap$KeyPair;

    array-length v0, v0

    new-array v10, v0, [Ljava/lang/Boolean;

    .line 154
    .local v10, "preEventStates":[Ljava/lang/Boolean;
    const/4 v0, 0x0

    .line 157
    .local v0, "postEventAnyPressed":Z
    const/4 v1, 0x0

    move v11, v1

    .local v11, "keyIdx":I
    :goto_0
    iget-object v1, v7, Lio/flutter/embedding/android/KeyboardMap$PressingGoal;->keys:[Lio/flutter/embedding/android/KeyboardMap$KeyPair;

    array-length v1, v1

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-ge v11, v1, :cond_5

    .line 158
    iget-object v1, v7, Lio/flutter/embedding/android/KeyboardMap$PressingGoal;->keys:[Lio/flutter/embedding/android/KeyboardMap$KeyPair;

    aget-object v12, v1, v11

    .line 159
    .local v12, "key":Lio/flutter/embedding/android/KeyboardMap$KeyPair;
    iget-object v1, v6, Lio/flutter/embedding/android/KeyEmbedderResponder;->pressingRecords:Ljava/util/HashMap;

    iget-wide v4, v12, Lio/flutter/embedding/android/KeyboardMap$KeyPair;->physicalKey:J

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    aput-boolean v1, v9, v11

    .line 160
    iget-wide v4, v12, Lio/flutter/embedding/android/KeyboardMap$KeyPair;->logicalKey:J

    cmp-long v1, v4, p3

    if-nez v1, :cond_2

    .line 161
    sget-object v1, Lio/flutter/embedding/android/KeyEmbedderResponder$1;->$SwitchMap$io$flutter$embedding$android$KeyData$Type:[I

    invoke-static/range {p7 .. p7}, Lio/flutter/embedding/android/KeyEmbedderResponder;->getEventType(Landroid/view/KeyEvent;)Lio/flutter/embedding/android/KeyData$Type;

    move-result-object v3

    invoke-virtual {v3}, Lio/flutter/embedding/android/KeyData$Type;->ordinal()I

    move-result v3

    aget v1, v1, v3

    packed-switch v1, :pswitch_data_0

    move-object/from16 v13, p7

    goto :goto_2

    .line 182
    :pswitch_0
    if-nez p2, :cond_0

    .line 183
    new-instance v1, Lio/flutter/embedding/android/KeyEmbedderResponder$$ExternalSyntheticLambda2;

    move-object/from16 v13, p7

    invoke-direct {v1, v6, v12, v13}, Lio/flutter/embedding/android/KeyEmbedderResponder$$ExternalSyntheticLambda2;-><init>(Lio/flutter/embedding/android/KeyEmbedderResponder;Lio/flutter/embedding/android/KeyboardMap$KeyPair;Landroid/view/KeyEvent;)V

    invoke-virtual {v8, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 182
    :cond_0
    move-object/from16 v13, p7

    .line 188
    :goto_1
    aget-boolean v1, v9, v11

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    aput-object v1, v10, v11

    .line 189
    const/4 v0, 0x1

    goto :goto_2

    .line 176
    :pswitch_1
    move-object/from16 v13, p7

    aget-boolean v1, v9, v11

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    aput-object v1, v10, v11

    .line 177
    goto :goto_2

    .line 163
    :pswitch_2
    move-object/from16 v13, p7

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    aput-object v1, v10, v11

    .line 164
    const/4 v14, 0x1

    .line 165
    .end local v0    # "postEventAnyPressed":Z
    .local v14, "postEventAnyPressed":Z
    if-nez p2, :cond_1

    .line 166
    new-instance v15, Lio/flutter/embedding/android/KeyEmbedderResponder$$ExternalSyntheticLambda1;

    move-object v0, v15

    move-object/from16 v1, p0

    move-object v2, v12

    move-wide/from16 v3, p5

    move-object/from16 v5, p7

    invoke-direct/range {v0 .. v5}, Lio/flutter/embedding/android/KeyEmbedderResponder$$ExternalSyntheticLambda1;-><init>(Lio/flutter/embedding/android/KeyEmbedderResponder;Lio/flutter/embedding/android/KeyboardMap$KeyPair;JLandroid/view/KeyEvent;)V

    invoke-virtual {v8, v15}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 190
    :cond_1
    move v0, v14

    .end local v14    # "postEventAnyPressed":Z
    .restart local v0    # "postEventAnyPressed":Z
    :goto_2
    goto :goto_3

    .line 193
    :cond_2
    move-object/from16 v13, p7

    if-nez v0, :cond_3

    aget-boolean v1, v9, v11

    if-eqz v1, :cond_4

    :cond_3
    const/4 v2, 0x1

    :cond_4
    move v0, v2

    .line 157
    .end local v12    # "key":Lio/flutter/embedding/android/KeyboardMap$KeyPair;
    :goto_3
    add-int/lit8 v11, v11, 0x1

    goto :goto_0

    :cond_5
    move-object/from16 v13, p7

    .line 198
    .end local v11    # "keyIdx":I
    if-eqz p2, :cond_a

    .line 200
    const/4 v1, 0x0

    .local v1, "keyIdx":I
    :goto_4
    iget-object v4, v7, Lio/flutter/embedding/android/KeyboardMap$PressingGoal;->keys:[Lio/flutter/embedding/android/KeyboardMap$KeyPair;

    array-length v4, v4

    if-ge v1, v4, :cond_8

    .line 201
    aget-object v4, v10, v1

    if-eqz v4, :cond_6

    .line 202
    goto :goto_5

    .line 204
    :cond_6
    if-eqz v0, :cond_7

    .line 205
    aget-boolean v4, v9, v1

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    aput-object v4, v10, v1

    goto :goto_5

    .line 207
    :cond_7
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    aput-object v4, v10, v1

    .line 208
    const/4 v0, 0x1

    .line 200
    :goto_5
    add-int/lit8 v1, v1, 0x1

    goto :goto_4

    .line 211
    .end local v1    # "keyIdx":I
    :cond_8
    if-nez v0, :cond_9

    .line 212
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    aput-object v1, v10, v2

    .line 224
    :cond_9
    move v11, v0

    goto :goto_8

    .line 215
    :cond_a
    const/4 v1, 0x0

    .restart local v1    # "keyIdx":I
    :goto_6
    iget-object v3, v7, Lio/flutter/embedding/android/KeyboardMap$PressingGoal;->keys:[Lio/flutter/embedding/android/KeyboardMap$KeyPair;

    array-length v3, v3

    if-ge v1, v3, :cond_c

    .line 216
    aget-object v3, v10, v1

    if-eqz v3, :cond_b

    .line 217
    goto :goto_7

    .line 219
    :cond_b
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    aput-object v3, v10, v1

    .line 215
    :goto_7
    add-int/lit8 v1, v1, 0x1

    goto :goto_6

    :cond_c
    move v11, v0

    .line 224
    .end local v0    # "postEventAnyPressed":Z
    .end local v1    # "keyIdx":I
    .local v11, "postEventAnyPressed":Z
    :goto_8
    const/4 v0, 0x0

    move v12, v0

    .local v12, "keyIdx":I
    :goto_9
    iget-object v0, v7, Lio/flutter/embedding/android/KeyboardMap$PressingGoal;->keys:[Lio/flutter/embedding/android/KeyboardMap$KeyPair;

    array-length v0, v0

    if-ge v12, v0, :cond_e

    .line 225
    aget-boolean v0, v9, v12

    aget-object v1, v10, v12

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eq v0, v1, :cond_d

    .line 226
    iget-object v0, v7, Lio/flutter/embedding/android/KeyboardMap$PressingGoal;->keys:[Lio/flutter/embedding/android/KeyboardMap$KeyPair;

    aget-object v14, v0, v12

    .line 227
    .local v14, "key":Lio/flutter/embedding/android/KeyboardMap$KeyPair;
    aget-object v0, v10, v12

    .line 228
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    iget-wide v2, v14, Lio/flutter/embedding/android/KeyboardMap$KeyPair;->logicalKey:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    iget-wide v3, v14, Lio/flutter/embedding/android/KeyboardMap$KeyPair;->physicalKey:J

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual/range {p7 .. p7}, Landroid/view/KeyEvent;->getEventTime()J

    move-result-wide v4

    .line 227
    move-object/from16 v0, p0

    invoke-direct/range {v0 .. v5}, Lio/flutter/embedding/android/KeyEmbedderResponder;->synthesizeEvent(ZLjava/lang/Long;Ljava/lang/Long;J)V

    .line 224
    .end local v14    # "key":Lio/flutter/embedding/android/KeyboardMap$KeyPair;
    :cond_d
    add-int/lit8 v12, v12, 0x1

    goto :goto_9

    .line 231
    .end local v12    # "keyIdx":I
    :cond_e
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method synchronizeTogglingKey(Lio/flutter/embedding/android/KeyboardMap$TogglingGoal;ZJLandroid/view/KeyEvent;)V
    .locals 8
    .param p1, "goal"    # Lio/flutter/embedding/android/KeyboardMap$TogglingGoal;
    .param p2, "trueEnabled"    # Z
    .param p3, "eventLogicalKey"    # J
    .param p5, "event"    # Landroid/view/KeyEvent;

    .line 248
    iget-wide v0, p1, Lio/flutter/embedding/android/KeyboardMap$TogglingGoal;->logicalKey:J

    cmp-long v2, v0, p3

    if-nez v2, :cond_0

    .line 251
    return-void

    .line 253
    :cond_0
    iget-boolean v0, p1, Lio/flutter/embedding/android/KeyboardMap$TogglingGoal;->enabled:Z

    if-eq v0, p2, :cond_4

    .line 254
    iget-object v0, p0, Lio/flutter/embedding/android/KeyEmbedderResponder;->pressingRecords:Ljava/util/HashMap;

    iget-wide v1, p1, Lio/flutter/embedding/android/KeyboardMap$TogglingGoal;->physicalKey:J

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x1

    xor-int/2addr v0, v1

    .line 255
    .local v0, "firstIsDown":Z
    if-eqz v0, :cond_1

    .line 256
    iget-boolean v2, p1, Lio/flutter/embedding/android/KeyboardMap$TogglingGoal;->enabled:Z

    xor-int/2addr v2, v1

    iput-boolean v2, p1, Lio/flutter/embedding/android/KeyboardMap$TogglingGoal;->enabled:Z

    .line 258
    :cond_1
    iget-wide v2, p1, Lio/flutter/embedding/android/KeyboardMap$TogglingGoal;->logicalKey:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    iget-wide v2, p1, Lio/flutter/embedding/android/KeyboardMap$TogglingGoal;->physicalKey:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-virtual {p5}, Landroid/view/KeyEvent;->getEventTime()J

    move-result-wide v6

    move-object v2, p0

    move v3, v0

    invoke-direct/range {v2 .. v7}, Lio/flutter/embedding/android/KeyEmbedderResponder;->synthesizeEvent(ZLjava/lang/Long;Ljava/lang/Long;J)V

    .line 259
    if-nez v0, :cond_2

    .line 260
    iget-boolean v2, p1, Lio/flutter/embedding/android/KeyboardMap$TogglingGoal;->enabled:Z

    xor-int/2addr v2, v1

    iput-boolean v2, p1, Lio/flutter/embedding/android/KeyboardMap$TogglingGoal;->enabled:Z

    .line 262
    :cond_2
    if-nez v0, :cond_3

    const/4 v3, 0x1

    goto :goto_0

    :cond_3
    const/4 v1, 0x0

    const/4 v3, 0x0

    :goto_0
    iget-wide v1, p1, Lio/flutter/embedding/android/KeyboardMap$TogglingGoal;->logicalKey:J

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    iget-wide v1, p1, Lio/flutter/embedding/android/KeyboardMap$TogglingGoal;->physicalKey:J

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-virtual {p5}, Landroid/view/KeyEvent;->getEventTime()J

    move-result-wide v6

    move-object v2, p0

    invoke-direct/range {v2 .. v7}, Lio/flutter/embedding/android/KeyEmbedderResponder;->synthesizeEvent(ZLjava/lang/Long;Ljava/lang/Long;J)V

    .line 264
    .end local v0    # "firstIsDown":Z
    :cond_4
    return-void
.end method

.method updatePressingState(Ljava/lang/Long;Ljava/lang/Long;)V
    .locals 3
    .param p1, "physicalKey"    # Ljava/lang/Long;
    .param p2, "logicalKey"    # Ljava/lang/Long;

    .line 108
    if-eqz p2, :cond_1

    .line 109
    iget-object v0, p0, Lio/flutter/embedding/android/KeyEmbedderResponder;->pressingRecords:Ljava/util/HashMap;

    invoke-virtual {v0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    .line 110
    .local v0, "previousValue":Ljava/lang/Long;
    if-nez v0, :cond_0

    .line 113
    .end local v0    # "previousValue":Ljava/lang/Long;
    goto :goto_0

    .line 111
    .restart local v0    # "previousValue":Ljava/lang/Long;
    :cond_0
    new-instance v1, Ljava/lang/AssertionError;

    const-string v2, "The key was not empty"

    invoke-direct {v1, v2}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1

    .line 114
    .end local v0    # "previousValue":Ljava/lang/Long;
    :cond_1
    iget-object v0, p0, Lio/flutter/embedding/android/KeyEmbedderResponder;->pressingRecords:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    .line 115
    .restart local v0    # "previousValue":Ljava/lang/Long;
    if-eqz v0, :cond_2

    .line 119
    .end local v0    # "previousValue":Ljava/lang/Long;
    :goto_0
    return-void

    .line 116
    .restart local v0    # "previousValue":Ljava/lang/Long;
    :cond_2
    new-instance v1, Ljava/lang/AssertionError;

    const-string v2, "The key was empty"

    invoke-direct {v1, v2}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1
.end method
