.class public Lio/flutter/plugin/text/ProcessTextPlugin;
.super Ljava/lang/Object;
.source "ProcessTextPlugin.java"

# interfaces
.implements Lio/flutter/embedding/engine/plugins/FlutterPlugin;
.implements Lio/flutter/embedding/engine/plugins/activity/ActivityAware;
.implements Lio/flutter/plugin/common/PluginRegistry$ActivityResultListener;
.implements Lio/flutter/embedding/engine/systemchannels/ProcessTextChannel$ProcessTextMethodHandler;


# static fields
.field private static final TAG:Ljava/lang/String; = "ProcessTextPlugin"


# instance fields
.field private activityBinding:Lio/flutter/embedding/engine/plugins/activity/ActivityPluginBinding;

.field private final packageManager:Landroid/content/pm/PackageManager;

.field private final processTextChannel:Lio/flutter/embedding/engine/systemchannels/ProcessTextChannel;

.field private requestsByCode:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Lio/flutter/plugin/common/MethodChannel$Result;",
            ">;"
        }
    .end annotation
.end field

.field private resolveInfosById:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Landroid/content/pm/ResolveInfo;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lio/flutter/embedding/engine/systemchannels/ProcessTextChannel;)V
    .locals 1
    .param p1, "processTextChannel"    # Lio/flutter/embedding/engine/systemchannels/ProcessTextChannel;

    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lio/flutter/plugin/text/ProcessTextPlugin;->requestsByCode:Ljava/util/Map;

    .line 45
    iput-object p1, p0, Lio/flutter/plugin/text/ProcessTextPlugin;->processTextChannel:Lio/flutter/embedding/engine/systemchannels/ProcessTextChannel;

    .line 46
    iget-object v0, p1, Lio/flutter/embedding/engine/systemchannels/ProcessTextChannel;->packageManager:Landroid/content/pm/PackageManager;

    iput-object v0, p0, Lio/flutter/plugin/text/ProcessTextPlugin;->packageManager:Landroid/content/pm/PackageManager;

    .line 48
    invoke-virtual {p1, p0}, Lio/flutter/embedding/engine/systemchannels/ProcessTextChannel;->setMethodHandler(Lio/flutter/embedding/engine/systemchannels/ProcessTextChannel$ProcessTextMethodHandler;)V

    .line 49
    return-void
.end method

.method private cacheResolveInfos()V
    .locals 7

    .line 108
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lio/flutter/plugin/text/ProcessTextPlugin;->resolveInfosById:Ljava/util/Map;

    .line 110
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x17

    if-ge v0, v1, :cond_0

    .line 111
    return-void

    .line 114
    :cond_0
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    const-string v1, "android.intent.action.PROCESS_TEXT"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    const-string v1, "text/plain"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    .line 117
    .local v0, "intent":Landroid/content/Intent;
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x21

    if-lt v1, v2, :cond_1

    .line 118
    iget-object v1, p0, Lio/flutter/plugin/text/ProcessTextPlugin;->packageManager:Landroid/content/pm/PackageManager;

    const-wide/16 v2, 0x0

    invoke-static {v2, v3}, Landroid/content/pm/PackageManager$ResolveInfoFlags;->of(J)Landroid/content/pm/PackageManager$ResolveInfoFlags;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Landroid/content/pm/PackageManager;->queryIntentActivities(Landroid/content/Intent;Landroid/content/pm/PackageManager$ResolveInfoFlags;)Ljava/util/List;

    move-result-object v1

    .local v1, "infos":Ljava/util/List;, "Ljava/util/List<Landroid/content/pm/ResolveInfo;>;"
    goto :goto_0

    .line 120
    .end local v1    # "infos":Ljava/util/List;, "Ljava/util/List<Landroid/content/pm/ResolveInfo;>;"
    :cond_1
    iget-object v1, p0, Lio/flutter/plugin/text/ProcessTextPlugin;->packageManager:Landroid/content/pm/PackageManager;

    const/4 v2, 0x0

    invoke-virtual {v1, v0, v2}, Landroid/content/pm/PackageManager;->queryIntentActivities(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object v1

    .line 123
    .restart local v1    # "infos":Ljava/util/List;, "Ljava/util/List<Landroid/content/pm/ResolveInfo;>;"
    :goto_0
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/content/pm/ResolveInfo;

    .line 124
    .local v3, "info":Landroid/content/pm/ResolveInfo;
    iget-object v4, v3, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v4, v4, Landroid/content/pm/ActivityInfo;->name:Ljava/lang/String;

    .line 125
    .local v4, "id":Ljava/lang/String;
    iget-object v5, p0, Lio/flutter/plugin/text/ProcessTextPlugin;->packageManager:Landroid/content/pm/PackageManager;

    invoke-virtual {v3, v5}, Landroid/content/pm/ResolveInfo;->loadLabel(Landroid/content/pm/PackageManager;)Ljava/lang/CharSequence;

    move-result-object v5

    invoke-interface {v5}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v5

    .line 126
    .local v5, "label":Ljava/lang/String;
    iget-object v6, p0, Lio/flutter/plugin/text/ProcessTextPlugin;->resolveInfosById:Ljava/util/Map;

    invoke-interface {v6, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 127
    .end local v3    # "info":Landroid/content/pm/ResolveInfo;
    .end local v4    # "id":Ljava/lang/String;
    .end local v5    # "label":Ljava/lang/String;
    goto :goto_1

    .line 128
    :cond_2
    return-void
.end method


# virtual methods
.method public destroy()V
    .locals 2

    .line 163
    iget-object v0, p0, Lio/flutter/plugin/text/ProcessTextPlugin;->processTextChannel:Lio/flutter/embedding/engine/systemchannels/ProcessTextChannel;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lio/flutter/embedding/engine/systemchannels/ProcessTextChannel;->setMethodHandler(Lio/flutter/embedding/engine/systemchannels/ProcessTextChannel$ProcessTextMethodHandler;)V

    .line 164
    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)Z
    .locals 3
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "intent"    # Landroid/content/Intent;

    .line 143
    iget-object v0, p0, Lio/flutter/plugin/text/ProcessTextPlugin;->requestsByCode:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 144
    const/4 v0, 0x0

    return v0

    .line 147
    :cond_0
    const/4 v0, 0x0

    .line 148
    .local v0, "result":Ljava/lang/String;
    const/4 v1, -0x1

    if-ne p2, v1, :cond_1

    .line 149
    const-string v1, "android.intent.extra.PROCESS_TEXT"

    invoke-virtual {p3, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 151
    :cond_1
    iget-object v1, p0, Lio/flutter/plugin/text/ProcessTextPlugin;->requestsByCode:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/flutter/plugin/common/MethodChannel$Result;

    invoke-interface {v1, v0}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V

    .line 152
    const/4 v1, 0x1

    return v1
.end method

.method public onAttachedToActivity(Lio/flutter/embedding/engine/plugins/activity/ActivityPluginBinding;)V
    .locals 0
    .param p1, "binding"    # Lio/flutter/embedding/engine/plugins/activity/ActivityPluginBinding;

    .line 181
    iput-object p1, p0, Lio/flutter/plugin/text/ProcessTextPlugin;->activityBinding:Lio/flutter/embedding/engine/plugins/activity/ActivityPluginBinding;

    .line 182
    invoke-interface {p1, p0}, Lio/flutter/embedding/engine/plugins/activity/ActivityPluginBinding;->addActivityResultListener(Lio/flutter/plugin/common/PluginRegistry$ActivityResultListener;)V

    .line 183
    return-void
.end method

.method public onAttachedToEngine(Lio/flutter/embedding/engine/plugins/FlutterPlugin$FlutterPluginBinding;)V
    .locals 0
    .param p1, "binding"    # Lio/flutter/embedding/engine/plugins/FlutterPlugin$FlutterPluginBinding;

    .line 170
    return-void
.end method

.method public onDetachedFromActivity()V
    .locals 1

    .line 196
    iget-object v0, p0, Lio/flutter/plugin/text/ProcessTextPlugin;->activityBinding:Lio/flutter/embedding/engine/plugins/activity/ActivityPluginBinding;

    invoke-interface {v0, p0}, Lio/flutter/embedding/engine/plugins/activity/ActivityPluginBinding;->removeActivityResultListener(Lio/flutter/plugin/common/PluginRegistry$ActivityResultListener;)V

    .line 197
    const/4 v0, 0x0

    iput-object v0, p0, Lio/flutter/plugin/text/ProcessTextPlugin;->activityBinding:Lio/flutter/embedding/engine/plugins/activity/ActivityPluginBinding;

    .line 198
    return-void
.end method

.method public onDetachedFromActivityForConfigChanges()V
    .locals 1

    .line 186
    iget-object v0, p0, Lio/flutter/plugin/text/ProcessTextPlugin;->activityBinding:Lio/flutter/embedding/engine/plugins/activity/ActivityPluginBinding;

    invoke-interface {v0, p0}, Lio/flutter/embedding/engine/plugins/activity/ActivityPluginBinding;->removeActivityResultListener(Lio/flutter/plugin/common/PluginRegistry$ActivityResultListener;)V

    .line 187
    const/4 v0, 0x0

    iput-object v0, p0, Lio/flutter/plugin/text/ProcessTextPlugin;->activityBinding:Lio/flutter/embedding/engine/plugins/activity/ActivityPluginBinding;

    .line 188
    return-void
.end method

.method public onDetachedFromEngine(Lio/flutter/embedding/engine/plugins/FlutterPlugin$FlutterPluginBinding;)V
    .locals 0
    .param p1, "binding"    # Lio/flutter/embedding/engine/plugins/FlutterPlugin$FlutterPluginBinding;

    .line 174
    return-void
.end method

.method public onReattachedToActivityForConfigChanges(Lio/flutter/embedding/engine/plugins/activity/ActivityPluginBinding;)V
    .locals 0
    .param p1, "binding"    # Lio/flutter/embedding/engine/plugins/activity/ActivityPluginBinding;

    .line 191
    iput-object p1, p0, Lio/flutter/plugin/text/ProcessTextPlugin;->activityBinding:Lio/flutter/embedding/engine/plugins/activity/ActivityPluginBinding;

    .line 192
    invoke-interface {p1, p0}, Lio/flutter/embedding/engine/plugins/activity/ActivityPluginBinding;->addActivityResultListener(Lio/flutter/plugin/common/PluginRegistry$ActivityResultListener;)V

    .line 193
    return-void
.end method

.method public processTextAction(Ljava/lang/String;Ljava/lang/String;ZLio/flutter/plugin/common/MethodChannel$Result;)V
    .locals 5
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "text"    # Ljava/lang/String;
    .param p3, "readOnly"    # Z
    .param p4, "result"    # Lio/flutter/plugin/common/MethodChannel$Result;

    .line 70
    iget-object v0, p0, Lio/flutter/plugin/text/ProcessTextPlugin;->activityBinding:Lio/flutter/embedding/engine/plugins/activity/ActivityPluginBinding;

    const/4 v1, 0x0

    const-string v2, "error"

    if-nez v0, :cond_0

    .line 71
    const-string v0, "Plugin not bound to an Activity"

    invoke-interface {p4, v2, v0, v1}, Lio/flutter/plugin/common/MethodChannel$Result;->error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 72
    return-void

    .line 75
    :cond_0
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x17

    if-ge v0, v3, :cond_1

    .line 76
    const-string v0, "Android version not supported"

    invoke-interface {p4, v2, v0, v1}, Lio/flutter/plugin/common/MethodChannel$Result;->error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 77
    return-void

    .line 80
    :cond_1
    iget-object v0, p0, Lio/flutter/plugin/text/ProcessTextPlugin;->resolveInfosById:Ljava/util/Map;

    if-nez v0, :cond_2

    .line 81
    const-string v0, "Can not process text actions before calling queryTextActions"

    invoke-interface {p4, v2, v0, v1}, Lio/flutter/plugin/common/MethodChannel$Result;->error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 82
    return-void

    .line 85
    :cond_2
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/pm/ResolveInfo;

    .line 86
    .local v0, "info":Landroid/content/pm/ResolveInfo;
    if-nez v0, :cond_3

    .line 87
    const-string v3, "Text processing activity not found"

    invoke-interface {p4, v2, v3, v1}, Lio/flutter/plugin/common/MethodChannel$Result;->error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 88
    return-void

    .line 91
    :cond_3
    invoke-virtual {p4}, Ljava/lang/Object;->hashCode()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    .line 92
    .local v1, "requestCode":Ljava/lang/Integer;
    iget-object v2, p0, Lio/flutter/plugin/text/ProcessTextPlugin;->requestsByCode:Ljava/util/Map;

    invoke-interface {v2, v1, p4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 94
    new-instance v2, Landroid/content/Intent;

    invoke-direct {v2}, Landroid/content/Intent;-><init>()V

    .line 95
    .local v2, "intent":Landroid/content/Intent;
    iget-object v3, v0, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v3, v3, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    iget-object v4, v0, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v4, v4, Landroid/content/pm/ActivityInfo;->name:Ljava/lang/String;

    invoke-virtual {v2, v3, v4}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 96
    const-string v3, "android.intent.action.PROCESS_TEXT"

    invoke-virtual {v2, v3}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 97
    const-string v3, "text/plain"

    invoke-virtual {v2, v3}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 98
    const-string v3, "android.intent.extra.PROCESS_TEXT"

    invoke-virtual {v2, v3, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 99
    const-string v3, "android.intent.extra.PROCESS_TEXT_READONLY"

    invoke-virtual {v2, v3, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 104
    iget-object v3, p0, Lio/flutter/plugin/text/ProcessTextPlugin;->activityBinding:Lio/flutter/embedding/engine/plugins/activity/ActivityPluginBinding;

    invoke-interface {v3}, Lio/flutter/embedding/engine/plugins/activity/ActivityPluginBinding;->getActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v4

    invoke-virtual {v3, v2, v4}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 105
    return-void
.end method

.method public queryTextActions()Ljava/util/Map;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 53
    iget-object v0, p0, Lio/flutter/plugin/text/ProcessTextPlugin;->resolveInfosById:Ljava/util/Map;

    if-nez v0, :cond_0

    .line 54
    invoke-direct {p0}, Lio/flutter/plugin/text/ProcessTextPlugin;->cacheResolveInfos()V

    .line 56
    :cond_0
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 57
    .local v0, "result":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    iget-object v1, p0, Lio/flutter/plugin/text/ProcessTextPlugin;->resolveInfosById:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 58
    .local v2, "id":Ljava/lang/String;
    iget-object v3, p0, Lio/flutter/plugin/text/ProcessTextPlugin;->resolveInfosById:Ljava/util/Map;

    invoke-interface {v3, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/content/pm/ResolveInfo;

    .line 59
    .local v3, "info":Landroid/content/pm/ResolveInfo;
    iget-object v4, p0, Lio/flutter/plugin/text/ProcessTextPlugin;->packageManager:Landroid/content/pm/PackageManager;

    invoke-virtual {v3, v4}, Landroid/content/pm/ResolveInfo;->loadLabel(Landroid/content/pm/PackageManager;)Ljava/lang/CharSequence;

    move-result-object v4

    invoke-interface {v4}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v0, v2, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 60
    .end local v2    # "id":Ljava/lang/String;
    .end local v3    # "info":Landroid/content/pm/ResolveInfo;
    goto :goto_0

    .line 61
    :cond_1
    return-object v0
.end method
