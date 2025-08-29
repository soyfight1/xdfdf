.class public Lio/flutter/plugin/editing/SpellCheckPlugin;
.super Ljava/lang/Object;
.source "SpellCheckPlugin.java"

# interfaces
.implements Lio/flutter/embedding/engine/systemchannels/SpellCheckChannel$SpellCheckMethodHandler;
.implements Landroid/view/textservice/SpellCheckerSession$SpellCheckerSessionListener;


# static fields
.field public static final END_INDEX_KEY:Ljava/lang/String; = "endIndex"

.field private static final MAX_SPELL_CHECK_SUGGESTIONS:I = 0x5

.field public static final START_INDEX_KEY:Ljava/lang/String; = "startIndex"

.field public static final SUGGESTIONS_KEY:Ljava/lang/String; = "suggestions"


# instance fields
.field private final mSpellCheckChannel:Lio/flutter/embedding/engine/systemchannels/SpellCheckChannel;

.field private mSpellCheckerSession:Landroid/view/textservice/SpellCheckerSession;

.field private final mTextServicesManager:Landroid/view/textservice/TextServicesManager;

.field pendingResult:Lio/flutter/plugin/common/MethodChannel$Result;


# direct methods
.method public constructor <init>(Landroid/view/textservice/TextServicesManager;Lio/flutter/embedding/engine/systemchannels/SpellCheckChannel;)V
    .locals 0
    .param p1, "textServicesManager"    # Landroid/view/textservice/TextServicesManager;
    .param p2, "spellCheckChannel"    # Lio/flutter/embedding/engine/systemchannels/SpellCheckChannel;

    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    iput-object p1, p0, Lio/flutter/plugin/editing/SpellCheckPlugin;->mTextServicesManager:Landroid/view/textservice/TextServicesManager;

    .line 52
    iput-object p2, p0, Lio/flutter/plugin/editing/SpellCheckPlugin;->mSpellCheckChannel:Lio/flutter/embedding/engine/systemchannels/SpellCheckChannel;

    .line 54
    invoke-virtual {p2, p0}, Lio/flutter/embedding/engine/systemchannels/SpellCheckChannel;->setSpellCheckMethodHandler(Lio/flutter/embedding/engine/systemchannels/SpellCheckChannel$SpellCheckMethodHandler;)V

    .line 55
    return-void
.end method


# virtual methods
.method public destroy()V
    .locals 2

    .line 66
    iget-object v0, p0, Lio/flutter/plugin/editing/SpellCheckPlugin;->mSpellCheckChannel:Lio/flutter/embedding/engine/systemchannels/SpellCheckChannel;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lio/flutter/embedding/engine/systemchannels/SpellCheckChannel;->setSpellCheckMethodHandler(Lio/flutter/embedding/engine/systemchannels/SpellCheckChannel$SpellCheckMethodHandler;)V

    .line 68
    iget-object v0, p0, Lio/flutter/plugin/editing/SpellCheckPlugin;->mSpellCheckerSession:Landroid/view/textservice/SpellCheckerSession;

    if-eqz v0, :cond_0

    .line 69
    invoke-virtual {v0}, Landroid/view/textservice/SpellCheckerSession;->close()V

    .line 71
    :cond_0
    return-void
.end method

.method public initiateSpellCheck(Ljava/lang/String;Ljava/lang/String;Lio/flutter/plugin/common/MethodChannel$Result;)V
    .locals 3
    .param p1, "locale"    # Ljava/lang/String;
    .param p2, "text"    # Ljava/lang/String;
    .param p3, "result"    # Lio/flutter/plugin/common/MethodChannel$Result;

    .line 80
    iget-object v0, p0, Lio/flutter/plugin/editing/SpellCheckPlugin;->pendingResult:Lio/flutter/plugin/common/MethodChannel$Result;

    if-eqz v0, :cond_0

    .line 81
    const-string v0, "Previous spell check request still pending."

    const/4 v1, 0x0

    const-string v2, "error"

    invoke-interface {p3, v2, v0, v1}, Lio/flutter/plugin/common/MethodChannel$Result;->error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 82
    return-void

    .line 85
    :cond_0
    iput-object p3, p0, Lio/flutter/plugin/editing/SpellCheckPlugin;->pendingResult:Lio/flutter/plugin/common/MethodChannel$Result;

    .line 87
    invoke-virtual {p0, p1, p2}, Lio/flutter/plugin/editing/SpellCheckPlugin;->performSpellCheck(Ljava/lang/String;Ljava/lang/String;)V

    .line 88
    return-void
.end method

.method public onGetSentenceSuggestions([Landroid/view/textservice/SentenceSuggestionsInfo;)V
    .locals 14
    .param p1, "results"    # [Landroid/view/textservice/SentenceSuggestionsInfo;

    .line 126
    array-length v0, p1

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 127
    iget-object v0, p0, Lio/flutter/plugin/editing/SpellCheckPlugin;->pendingResult:Lio/flutter/plugin/common/MethodChannel$Result;

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v0, v2}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V

    .line 128
    iput-object v1, p0, Lio/flutter/plugin/editing/SpellCheckPlugin;->pendingResult:Lio/flutter/plugin/common/MethodChannel$Result;

    .line 129
    return-void

    .line 132
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 134
    .local v0, "spellCheckerSuggestionSpans":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    const/4 v2, 0x0

    aget-object v2, p1, v2

    .line 135
    .local v2, "spellCheckResults":Landroid/view/textservice/SentenceSuggestionsInfo;
    if-nez v2, :cond_1

    .line 136
    iget-object v3, p0, Lio/flutter/plugin/editing/SpellCheckPlugin;->pendingResult:Lio/flutter/plugin/common/MethodChannel$Result;

    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v3, v4}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V

    .line 137
    iput-object v1, p0, Lio/flutter/plugin/editing/SpellCheckPlugin;->pendingResult:Lio/flutter/plugin/common/MethodChannel$Result;

    .line 138
    return-void

    .line 141
    :cond_1
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    invoke-virtual {v2}, Landroid/view/textservice/SentenceSuggestionsInfo;->getSuggestionsCount()I

    move-result v4

    if-ge v3, v4, :cond_6

    .line 142
    invoke-virtual {v2, v3}, Landroid/view/textservice/SentenceSuggestionsInfo;->getSuggestionsInfoAt(I)Landroid/view/textservice/SuggestionsInfo;

    move-result-object v4

    .line 143
    .local v4, "suggestionsInfo":Landroid/view/textservice/SuggestionsInfo;
    invoke-virtual {v4}, Landroid/view/textservice/SuggestionsInfo;->getSuggestionsCount()I

    move-result v5

    .line 145
    .local v5, "suggestionsCount":I
    if-gtz v5, :cond_2

    .line 146
    goto :goto_2

    .line 149
    :cond_2
    new-instance v6, Ljava/util/HashMap;

    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    .line 150
    .local v6, "spellCheckerSuggestionSpan":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-virtual {v2, v3}, Landroid/view/textservice/SentenceSuggestionsInfo;->getOffsetAt(I)I

    move-result v7

    .line 151
    .local v7, "start":I
    invoke-virtual {v2, v3}, Landroid/view/textservice/SentenceSuggestionsInfo;->getLengthAt(I)I

    move-result v8

    add-int/2addr v8, v7

    .line 153
    .local v8, "end":I
    const-string v9, "startIndex"

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    invoke-virtual {v6, v9, v10}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 154
    const-string v9, "endIndex"

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    invoke-virtual {v6, v9, v10}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 156
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    .line 157
    .local v9, "suggestions":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const/4 v10, 0x0

    .line 158
    .local v10, "validSuggestionsFound":Z
    const/4 v11, 0x0

    .local v11, "j":I
    :goto_1
    if-ge v11, v5, :cond_4

    .line 159
    invoke-virtual {v4, v11}, Landroid/view/textservice/SuggestionsInfo;->getSuggestionAt(I)Ljava/lang/String;

    move-result-object v12

    .line 162
    .local v12, "suggestion":Ljava/lang/String;
    const-string v13, ""

    invoke-virtual {v12, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-nez v13, :cond_3

    .line 163
    const/4 v10, 0x1

    .line 164
    invoke-virtual {v9, v12}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 158
    .end local v12    # "suggestion":Ljava/lang/String;
    :cond_3
    add-int/lit8 v11, v11, 0x1

    goto :goto_1

    .line 168
    .end local v11    # "j":I
    :cond_4
    if-nez v10, :cond_5

    .line 169
    goto :goto_2

    .line 171
    :cond_5
    const-string v11, "suggestions"

    invoke-virtual {v6, v11, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 172
    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 141
    .end local v4    # "suggestionsInfo":Landroid/view/textservice/SuggestionsInfo;
    .end local v5    # "suggestionsCount":I
    .end local v6    # "spellCheckerSuggestionSpan":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v7    # "start":I
    .end local v8    # "end":I
    .end local v9    # "suggestions":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v10    # "validSuggestionsFound":Z
    :goto_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 175
    .end local v3    # "i":I
    :cond_6
    iget-object v3, p0, Lio/flutter/plugin/editing/SpellCheckPlugin;->pendingResult:Lio/flutter/plugin/common/MethodChannel$Result;

    invoke-interface {v3, v0}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V

    .line 176
    iput-object v1, p0, Lio/flutter/plugin/editing/SpellCheckPlugin;->pendingResult:Lio/flutter/plugin/common/MethodChannel$Result;

    .line 177
    return-void
.end method

.method public onGetSuggestions([Landroid/view/textservice/SuggestionsInfo;)V
    .locals 0
    .param p1, "results"    # [Landroid/view/textservice/SuggestionsInfo;

    .line 182
    return-void
.end method

.method public performSpellCheck(Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .param p1, "locale"    # Ljava/lang/String;
    .param p2, "text"    # Ljava/lang/String;

    .line 92
    invoke-static {p1}, Lio/flutter/plugin/localization/LocalizationPlugin;->localeFromString(Ljava/lang/String;)Ljava/util/Locale;

    move-result-object v0

    .line 94
    .local v0, "localeFromString":Ljava/util/Locale;
    iget-object v1, p0, Lio/flutter/plugin/editing/SpellCheckPlugin;->mSpellCheckerSession:Landroid/view/textservice/SpellCheckerSession;

    const/4 v2, 0x1

    if-nez v1, :cond_0

    .line 95
    iget-object v1, p0, Lio/flutter/plugin/editing/SpellCheckPlugin;->mTextServicesManager:Landroid/view/textservice/TextServicesManager;

    .line 96
    const/4 v3, 0x0

    invoke-virtual {v1, v3, v0, p0, v2}, Landroid/view/textservice/TextServicesManager;->newSpellCheckerSession(Landroid/os/Bundle;Ljava/util/Locale;Landroid/view/textservice/SpellCheckerSession$SpellCheckerSessionListener;Z)Landroid/view/textservice/SpellCheckerSession;

    move-result-object v1

    iput-object v1, p0, Lio/flutter/plugin/editing/SpellCheckPlugin;->mSpellCheckerSession:Landroid/view/textservice/SpellCheckerSession;

    .line 104
    :cond_0
    new-array v1, v2, [Landroid/view/textservice/TextInfo;

    new-instance v2, Landroid/view/textservice/TextInfo;

    invoke-direct {v2, p2}, Landroid/view/textservice/TextInfo;-><init>(Ljava/lang/String;)V

    const/4 v3, 0x0

    aput-object v2, v1, v3

    .line 105
    .local v1, "textInfos":[Landroid/view/textservice/TextInfo;
    iget-object v2, p0, Lio/flutter/plugin/editing/SpellCheckPlugin;->mSpellCheckerSession:Landroid/view/textservice/SpellCheckerSession;

    const/4 v3, 0x5

    invoke-virtual {v2, v1, v3}, Landroid/view/textservice/SpellCheckerSession;->getSentenceSuggestions([Landroid/view/textservice/TextInfo;I)V

    .line 106
    return-void
.end method
