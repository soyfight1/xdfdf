.class public final enum Lio/flutter/embedding/engine/systemchannels/PlatformChannel$SoundType;
.super Ljava/lang/Enum;
.source "PlatformChannel.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/embedding/engine/systemchannels/PlatformChannel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "SoundType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lio/flutter/embedding/engine/systemchannels/PlatformChannel$SoundType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lio/flutter/embedding/engine/systemchannels/PlatformChannel$SoundType;

.field public static final enum ALERT:Lio/flutter/embedding/engine/systemchannels/PlatformChannel$SoundType;

.field public static final enum CLICK:Lio/flutter/embedding/engine/systemchannels/PlatformChannel$SoundType;


# instance fields
.field private final encodedName:Ljava/lang/String;


# direct methods
.method private static synthetic $values()[Lio/flutter/embedding/engine/systemchannels/PlatformChannel$SoundType;
    .locals 3

    .line 567
    const/4 v0, 0x2

    new-array v0, v0, [Lio/flutter/embedding/engine/systemchannels/PlatformChannel$SoundType;

    const/4 v1, 0x0

    sget-object v2, Lio/flutter/embedding/engine/systemchannels/PlatformChannel$SoundType;->CLICK:Lio/flutter/embedding/engine/systemchannels/PlatformChannel$SoundType;

    aput-object v2, v0, v1

    const/4 v1, 0x1

    sget-object v2, Lio/flutter/embedding/engine/systemchannels/PlatformChannel$SoundType;->ALERT:Lio/flutter/embedding/engine/systemchannels/PlatformChannel$SoundType;

    aput-object v2, v0, v1

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 4

    .line 568
    new-instance v0, Lio/flutter/embedding/engine/systemchannels/PlatformChannel$SoundType;

    const/4 v1, 0x0

    const-string v2, "SystemSoundType.click"

    const-string v3, "CLICK"

    invoke-direct {v0, v3, v1, v2}, Lio/flutter/embedding/engine/systemchannels/PlatformChannel$SoundType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lio/flutter/embedding/engine/systemchannels/PlatformChannel$SoundType;->CLICK:Lio/flutter/embedding/engine/systemchannels/PlatformChannel$SoundType;

    .line 569
    new-instance v0, Lio/flutter/embedding/engine/systemchannels/PlatformChannel$SoundType;

    const/4 v1, 0x1

    const-string v2, "SystemSoundType.alert"

    const-string v3, "ALERT"

    invoke-direct {v0, v3, v1, v2}, Lio/flutter/embedding/engine/systemchannels/PlatformChannel$SoundType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lio/flutter/embedding/engine/systemchannels/PlatformChannel$SoundType;->ALERT:Lio/flutter/embedding/engine/systemchannels/PlatformChannel$SoundType;

    .line 567
    invoke-static {}, Lio/flutter/embedding/engine/systemchannels/PlatformChannel$SoundType;->$values()[Lio/flutter/embedding/engine/systemchannels/PlatformChannel$SoundType;

    move-result-object v0

    sput-object v0, Lio/flutter/embedding/engine/systemchannels/PlatformChannel$SoundType;->$VALUES:[Lio/flutter/embedding/engine/systemchannels/PlatformChannel$SoundType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .locals 0
    .param p3, "encodedName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 583
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 584
    iput-object p3, p0, Lio/flutter/embedding/engine/systemchannels/PlatformChannel$SoundType;->encodedName:Ljava/lang/String;

    .line 585
    return-void
.end method

.method static fromValue(Ljava/lang/String;)Lio/flutter/embedding/engine/systemchannels/PlatformChannel$SoundType;
    .locals 5
    .param p0, "encodedName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NoSuchFieldException;
        }
    .end annotation

    .line 573
    invoke-static {}, Lio/flutter/embedding/engine/systemchannels/PlatformChannel$SoundType;->values()[Lio/flutter/embedding/engine/systemchannels/PlatformChannel$SoundType;

    move-result-object v0

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-object v3, v0, v2

    .line 574
    .local v3, "soundType":Lio/flutter/embedding/engine/systemchannels/PlatformChannel$SoundType;
    iget-object v4, v3, Lio/flutter/embedding/engine/systemchannels/PlatformChannel$SoundType;->encodedName:Ljava/lang/String;

    invoke-virtual {v4, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 575
    return-object v3

    .line 573
    .end local v3    # "soundType":Lio/flutter/embedding/engine/systemchannels/PlatformChannel$SoundType;
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 578
    :cond_1
    new-instance v0, Ljava/lang/NoSuchFieldException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "No such SoundType: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/NoSuchFieldException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static valueOf(Ljava/lang/String;)Lio/flutter/embedding/engine/systemchannels/PlatformChannel$SoundType;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .line 567
    const-class v0, Lio/flutter/embedding/engine/systemchannels/PlatformChannel$SoundType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lio/flutter/embedding/engine/systemchannels/PlatformChannel$SoundType;

    return-object v0
.end method

.method public static values()[Lio/flutter/embedding/engine/systemchannels/PlatformChannel$SoundType;
    .locals 1

    .line 567
    sget-object v0, Lio/flutter/embedding/engine/systemchannels/PlatformChannel$SoundType;->$VALUES:[Lio/flutter/embedding/engine/systemchannels/PlatformChannel$SoundType;

    invoke-virtual {v0}, [Lio/flutter/embedding/engine/systemchannels/PlatformChannel$SoundType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/flutter/embedding/engine/systemchannels/PlatformChannel$SoundType;

    return-object v0
.end method
