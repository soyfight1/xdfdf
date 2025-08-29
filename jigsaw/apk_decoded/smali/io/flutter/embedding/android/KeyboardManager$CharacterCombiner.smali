.class public Lio/flutter/embedding/android/KeyboardManager$CharacterCombiner;
.super Ljava/lang/Object;
.source "KeyboardManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/embedding/android/KeyboardManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "CharacterCombiner"
.end annotation


# instance fields
.field private combiningCharacter:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 59
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 57
    const/4 v0, 0x0

    iput v0, p0, Lio/flutter/embedding/android/KeyboardManager$CharacterCombiner;->combiningCharacter:I

    .line 59
    return-void
.end method


# virtual methods
.method applyCombiningCharacterToBaseCharacter(I)Ljava/lang/Character;
    .locals 4
    .param p1, "newCharacterCodePoint"    # I

    .line 85
    int-to-char v0, p1

    .line 86
    .local v0, "complexCharacter":C
    const/high16 v1, -0x80000000

    and-int/2addr v1, p1

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    .line 88
    .local v1, "isNewCodePointACombiningCharacter":Z
    :goto_0
    if-eqz v1, :cond_2

    .line 90
    const v2, 0x7fffffff

    and-int/2addr v2, p1

    .line 91
    .local v2, "plainCodePoint":I
    iget v3, p0, Lio/flutter/embedding/android/KeyboardManager$CharacterCombiner;->combiningCharacter:I

    if-eqz v3, :cond_1

    .line 92
    invoke-static {v3, v2}, Landroid/view/KeyCharacterMap;->getDeadChar(II)I

    move-result v3

    iput v3, p0, Lio/flutter/embedding/android/KeyboardManager$CharacterCombiner;->combiningCharacter:I

    goto :goto_1

    .line 94
    :cond_1
    iput v2, p0, Lio/flutter/embedding/android/KeyboardManager$CharacterCombiner;->combiningCharacter:I

    .line 96
    .end local v2    # "plainCodePoint":I
    :goto_1
    goto :goto_2

    .line 99
    :cond_2
    iget v3, p0, Lio/flutter/embedding/android/KeyboardManager$CharacterCombiner;->combiningCharacter:I

    if-eqz v3, :cond_4

    .line 100
    invoke-static {v3, p1}, Landroid/view/KeyCharacterMap;->getDeadChar(II)I

    move-result v3

    .line 101
    .local v3, "combinedChar":I
    if-lez v3, :cond_3

    .line 102
    int-to-char v0, v3

    .line 104
    :cond_3
    iput v2, p0, Lio/flutter/embedding/android/KeyboardManager$CharacterCombiner;->combiningCharacter:I

    .line 108
    .end local v3    # "combinedChar":I
    :cond_4
    :goto_2
    invoke-static {v0}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v2

    return-object v2
.end method
