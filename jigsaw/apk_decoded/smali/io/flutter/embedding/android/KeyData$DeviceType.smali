.class public final enum Lio/flutter/embedding/android/KeyData$DeviceType;
.super Ljava/lang/Enum;
.source "KeyData.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/embedding/android/KeyData;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "DeviceType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lio/flutter/embedding/android/KeyData$DeviceType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lio/flutter/embedding/android/KeyData$DeviceType;

.field public static final enum kDirectionalPad:Lio/flutter/embedding/android/KeyData$DeviceType;

.field public static final enum kGamepad:Lio/flutter/embedding/android/KeyData$DeviceType;

.field public static final enum kHdmi:Lio/flutter/embedding/android/KeyData$DeviceType;

.field public static final enum kJoystick:Lio/flutter/embedding/android/KeyData$DeviceType;

.field public static final enum kKeyboard:Lio/flutter/embedding/android/KeyData$DeviceType;


# instance fields
.field private final value:J


# direct methods
.method private static synthetic $values()[Lio/flutter/embedding/android/KeyData$DeviceType;
    .locals 3

    .line 71
    const/4 v0, 0x5

    new-array v0, v0, [Lio/flutter/embedding/android/KeyData$DeviceType;

    const/4 v1, 0x0

    sget-object v2, Lio/flutter/embedding/android/KeyData$DeviceType;->kKeyboard:Lio/flutter/embedding/android/KeyData$DeviceType;

    aput-object v2, v0, v1

    const/4 v1, 0x1

    sget-object v2, Lio/flutter/embedding/android/KeyData$DeviceType;->kDirectionalPad:Lio/flutter/embedding/android/KeyData$DeviceType;

    aput-object v2, v0, v1

    const/4 v1, 0x2

    sget-object v2, Lio/flutter/embedding/android/KeyData$DeviceType;->kGamepad:Lio/flutter/embedding/android/KeyData$DeviceType;

    aput-object v2, v0, v1

    const/4 v1, 0x3

    sget-object v2, Lio/flutter/embedding/android/KeyData$DeviceType;->kJoystick:Lio/flutter/embedding/android/KeyData$DeviceType;

    aput-object v2, v0, v1

    const/4 v1, 0x4

    sget-object v2, Lio/flutter/embedding/android/KeyData$DeviceType;->kHdmi:Lio/flutter/embedding/android/KeyData$DeviceType;

    aput-object v2, v0, v1

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 5

    .line 72
    new-instance v0, Lio/flutter/embedding/android/KeyData$DeviceType;

    const/4 v1, 0x0

    const-wide/16 v2, 0x0

    const-string v4, "kKeyboard"

    invoke-direct {v0, v4, v1, v2, v3}, Lio/flutter/embedding/android/KeyData$DeviceType;-><init>(Ljava/lang/String;IJ)V

    sput-object v0, Lio/flutter/embedding/android/KeyData$DeviceType;->kKeyboard:Lio/flutter/embedding/android/KeyData$DeviceType;

    .line 73
    new-instance v0, Lio/flutter/embedding/android/KeyData$DeviceType;

    const/4 v1, 0x1

    const-wide/16 v2, 0x1

    const-string v4, "kDirectionalPad"

    invoke-direct {v0, v4, v1, v2, v3}, Lio/flutter/embedding/android/KeyData$DeviceType;-><init>(Ljava/lang/String;IJ)V

    sput-object v0, Lio/flutter/embedding/android/KeyData$DeviceType;->kDirectionalPad:Lio/flutter/embedding/android/KeyData$DeviceType;

    .line 74
    new-instance v0, Lio/flutter/embedding/android/KeyData$DeviceType;

    const/4 v1, 0x2

    const-wide/16 v2, 0x2

    const-string v4, "kGamepad"

    invoke-direct {v0, v4, v1, v2, v3}, Lio/flutter/embedding/android/KeyData$DeviceType;-><init>(Ljava/lang/String;IJ)V

    sput-object v0, Lio/flutter/embedding/android/KeyData$DeviceType;->kGamepad:Lio/flutter/embedding/android/KeyData$DeviceType;

    .line 75
    new-instance v0, Lio/flutter/embedding/android/KeyData$DeviceType;

    const/4 v1, 0x3

    const-wide/16 v2, 0x3

    const-string v4, "kJoystick"

    invoke-direct {v0, v4, v1, v2, v3}, Lio/flutter/embedding/android/KeyData$DeviceType;-><init>(Ljava/lang/String;IJ)V

    sput-object v0, Lio/flutter/embedding/android/KeyData$DeviceType;->kJoystick:Lio/flutter/embedding/android/KeyData$DeviceType;

    .line 76
    new-instance v0, Lio/flutter/embedding/android/KeyData$DeviceType;

    const/4 v1, 0x4

    const-wide/16 v2, 0x4

    const-string v4, "kHdmi"

    invoke-direct {v0, v4, v1, v2, v3}, Lio/flutter/embedding/android/KeyData$DeviceType;-><init>(Ljava/lang/String;IJ)V

    sput-object v0, Lio/flutter/embedding/android/KeyData$DeviceType;->kHdmi:Lio/flutter/embedding/android/KeyData$DeviceType;

    .line 71
    invoke-static {}, Lio/flutter/embedding/android/KeyData$DeviceType;->$values()[Lio/flutter/embedding/android/KeyData$DeviceType;

    move-result-object v0

    sput-object v0, Lio/flutter/embedding/android/KeyData$DeviceType;->$VALUES:[Lio/flutter/embedding/android/KeyData$DeviceType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;IJ)V
    .locals 0
    .param p3, "value"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J)V"
        }
    .end annotation

    .line 80
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 81
    iput-wide p3, p0, Lio/flutter/embedding/android/KeyData$DeviceType;->value:J

    .line 82
    return-void
.end method

.method static fromLong(J)Lio/flutter/embedding/android/KeyData$DeviceType;
    .locals 2
    .param p0, "value"    # J

    .line 89
    long-to-int v0, p0

    packed-switch v0, :pswitch_data_0

    .line 101
    new-instance v0, Ljava/lang/AssertionError;

    const-string v1, "Unexpected DeviceType value"

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0

    .line 99
    :pswitch_0
    sget-object v0, Lio/flutter/embedding/android/KeyData$DeviceType;->kHdmi:Lio/flutter/embedding/android/KeyData$DeviceType;

    return-object v0

    .line 97
    :pswitch_1
    sget-object v0, Lio/flutter/embedding/android/KeyData$DeviceType;->kJoystick:Lio/flutter/embedding/android/KeyData$DeviceType;

    return-object v0

    .line 95
    :pswitch_2
    sget-object v0, Lio/flutter/embedding/android/KeyData$DeviceType;->kGamepad:Lio/flutter/embedding/android/KeyData$DeviceType;

    return-object v0

    .line 93
    :pswitch_3
    sget-object v0, Lio/flutter/embedding/android/KeyData$DeviceType;->kDirectionalPad:Lio/flutter/embedding/android/KeyData$DeviceType;

    return-object v0

    .line 91
    :pswitch_4
    sget-object v0, Lio/flutter/embedding/android/KeyData$DeviceType;->kKeyboard:Lio/flutter/embedding/android/KeyData$DeviceType;

    return-object v0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static valueOf(Ljava/lang/String;)Lio/flutter/embedding/android/KeyData$DeviceType;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .line 71
    const-class v0, Lio/flutter/embedding/android/KeyData$DeviceType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lio/flutter/embedding/android/KeyData$DeviceType;

    return-object v0
.end method

.method public static values()[Lio/flutter/embedding/android/KeyData$DeviceType;
    .locals 1

    .line 71
    sget-object v0, Lio/flutter/embedding/android/KeyData$DeviceType;->$VALUES:[Lio/flutter/embedding/android/KeyData$DeviceType;

    invoke-virtual {v0}, [Lio/flutter/embedding/android/KeyData$DeviceType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/flutter/embedding/android/KeyData$DeviceType;

    return-object v0
.end method


# virtual methods
.method public getValue()J
    .locals 2

    .line 85
    iget-wide v0, p0, Lio/flutter/embedding/android/KeyData$DeviceType;->value:J

    return-wide v0
.end method
