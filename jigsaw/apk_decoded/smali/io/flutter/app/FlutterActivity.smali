.class public Lio/flutter/app/FlutterActivity;
.super Landroid/app/Activity;
.source "FlutterActivity.java"

# interfaces
.implements Lio/flutter/view/FlutterView$Provider;
.implements Lio/flutter/plugin/common/PluginRegistry;
.implements Lio/flutter/app/FlutterActivityDelegate$ViewFactory;


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "FlutterActivity"


# instance fields
.field private final delegate:Lio/flutter/app/FlutterActivityDelegate;

.field private final eventDelegate:Lio/flutter/app/FlutterActivityEvents;

.field private final pluginRegistry:Lio/flutter/plugin/common/PluginRegistry;

.field private final viewProvider:Lio/flutter/view/FlutterView$Provider;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 25
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 29
    new-instance v0, Lio/flutter/app/FlutterActivityDelegate;

    invoke-direct {v0, p0, p0}, Lio/flutter/app/FlutterActivityDelegate;-><init>(Landroid/app/Activity;Lio/flutter/app/FlutterActivityDelegate$ViewFactory;)V

    iput-object v0, p0, Lio/flutter/app/FlutterActivity;->delegate:Lio/flutter/app/FlutterActivityDelegate;

    .line 33
    iput-object v0, p0, Lio/flutter/app/FlutterActivity;->eventDelegate:Lio/flutter/app/FlutterActivityEvents;

    .line 34
    iput-object v0, p0, Lio/flutter/app/FlutterActivity;->viewProvider:Lio/flutter/view/FlutterView$Provider;

    .line 35
    iput-object v0, p0, Lio/flutter/app/FlutterActivity;->pluginRegistry:Lio/flutter/plugin/common/PluginRegistry;

    return-void
.end method


# virtual methods
.method public createFlutterNativeView()Lio/flutter/view/FlutterNativeView;
    .locals 1

    .line 65
    const/4 v0, 0x0

    return-object v0
.end method

.method public createFlutterView(Landroid/content/Context;)Lio/flutter/view/FlutterView;
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .line 54
    const/4 v0, 0x0

    return-object v0
.end method

.method public getFlutterView()Lio/flutter/view/FlutterView;
    .locals 1

    .line 43
    iget-object v0, p0, Lio/flutter/app/FlutterActivity;->viewProvider:Lio/flutter/view/FlutterView$Provider;

    invoke-interface {v0}, Lio/flutter/view/FlutterView$Provider;->getFlutterView()Lio/flutter/view/FlutterView;

    move-result-object v0

    return-object v0
.end method

.method public final hasPlugin(Ljava/lang/String;)Z
    .locals 1
    .param p1, "key"    # Ljava/lang/String;

    .line 75
    iget-object v0, p0, Lio/flutter/app/FlutterActivity;->pluginRegistry:Lio/flutter/plugin/common/PluginRegistry;

    invoke-interface {v0, p1}, Lio/flutter/plugin/common/PluginRegistry;->hasPlugin(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 1
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .line 145
    iget-object v0, p0, Lio/flutter/app/FlutterActivity;->eventDelegate:Lio/flutter/app/FlutterActivityEvents;

    invoke-interface {v0, p1, p2, p3}, Lio/flutter/app/FlutterActivityEvents;->onActivityResult(IILandroid/content/Intent;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 146
    invoke-super {p0, p1, p2, p3}, Landroid/app/Activity;->onActivityResult(IILandroid/content/Intent;)V

    .line 148
    :cond_0
    return-void
.end method

.method public onBackPressed()V
    .locals 1

    .line 114
    iget-object v0, p0, Lio/flutter/app/FlutterActivity;->eventDelegate:Lio/flutter/app/FlutterActivityEvents;

    invoke-interface {v0}, Lio/flutter/app/FlutterActivityEvents;->onBackPressed()Z

    move-result v0

    if-nez v0, :cond_0

    .line 115
    invoke-super {p0}, Landroid/app/Activity;->onBackPressed()V

    .line 117
    :cond_0
    return-void
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 1
    .param p1, "newConfig"    # Landroid/content/res/Configuration;

    .line 178
    invoke-super {p0, p1}, Landroid/app/Activity;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 179
    iget-object v0, p0, Lio/flutter/app/FlutterActivity;->eventDelegate:Lio/flutter/app/FlutterActivityEvents;

    invoke-interface {v0, p1}, Lio/flutter/app/FlutterActivityEvents;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 180
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 1
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .line 90
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 91
    iget-object v0, p0, Lio/flutter/app/FlutterActivity;->eventDelegate:Lio/flutter/app/FlutterActivityEvents;

    invoke-interface {v0, p1}, Lio/flutter/app/FlutterActivityEvents;->onCreate(Landroid/os/Bundle;)V

    .line 92
    return-void
.end method

.method protected onDestroy()V
    .locals 1

    .line 108
    iget-object v0, p0, Lio/flutter/app/FlutterActivity;->eventDelegate:Lio/flutter/app/FlutterActivityEvents;

    invoke-interface {v0}, Lio/flutter/app/FlutterActivityEvents;->onDestroy()V

    .line 109
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 110
    return-void
.end method

.method public onLowMemory()V
    .locals 1

    .line 173
    iget-object v0, p0, Lio/flutter/app/FlutterActivity;->eventDelegate:Lio/flutter/app/FlutterActivityEvents;

    invoke-interface {v0}, Lio/flutter/app/FlutterActivityEvents;->onLowMemory()V

    .line 174
    return-void
.end method

.method protected onNewIntent(Landroid/content/Intent;)V
    .locals 1
    .param p1, "intent"    # Landroid/content/Intent;

    .line 152
    iget-object v0, p0, Lio/flutter/app/FlutterActivity;->eventDelegate:Lio/flutter/app/FlutterActivityEvents;

    invoke-interface {v0, p1}, Lio/flutter/app/FlutterActivityEvents;->onNewIntent(Landroid/content/Intent;)V

    .line 153
    return-void
.end method

.method protected onPause()V
    .locals 1

    .line 127
    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    .line 128
    iget-object v0, p0, Lio/flutter/app/FlutterActivity;->eventDelegate:Lio/flutter/app/FlutterActivityEvents;

    invoke-interface {v0}, Lio/flutter/app/FlutterActivityEvents;->onPause()V

    .line 129
    return-void
.end method

.method protected onPostResume()V
    .locals 1

    .line 133
    invoke-super {p0}, Landroid/app/Activity;->onPostResume()V

    .line 134
    iget-object v0, p0, Lio/flutter/app/FlutterActivity;->eventDelegate:Lio/flutter/app/FlutterActivityEvents;

    invoke-interface {v0}, Lio/flutter/app/FlutterActivityEvents;->onPostResume()V

    .line 135
    return-void
.end method

.method public onRequestPermissionsResult(I[Ljava/lang/String;[I)V
    .locals 1
    .param p1, "requestCode"    # I
    .param p2, "permissions"    # [Ljava/lang/String;
    .param p3, "grantResults"    # [I

    .line 140
    iget-object v0, p0, Lio/flutter/app/FlutterActivity;->eventDelegate:Lio/flutter/app/FlutterActivityEvents;

    invoke-interface {v0, p1, p2, p3}, Lio/flutter/app/FlutterActivityEvents;->onRequestPermissionsResult(I[Ljava/lang/String;[I)Z

    .line 141
    return-void
.end method

.method protected onResume()V
    .locals 1

    .line 102
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 103
    iget-object v0, p0, Lio/flutter/app/FlutterActivity;->eventDelegate:Lio/flutter/app/FlutterActivityEvents;

    invoke-interface {v0}, Lio/flutter/app/FlutterActivityEvents;->onResume()V

    .line 104
    return-void
.end method

.method protected onStart()V
    .locals 1

    .line 96
    invoke-super {p0}, Landroid/app/Activity;->onStart()V

    .line 97
    iget-object v0, p0, Lio/flutter/app/FlutterActivity;->eventDelegate:Lio/flutter/app/FlutterActivityEvents;

    invoke-interface {v0}, Lio/flutter/app/FlutterActivityEvents;->onStart()V

    .line 98
    return-void
.end method

.method protected onStop()V
    .locals 1

    .line 121
    iget-object v0, p0, Lio/flutter/app/FlutterActivity;->eventDelegate:Lio/flutter/app/FlutterActivityEvents;

    invoke-interface {v0}, Lio/flutter/app/FlutterActivityEvents;->onStop()V

    .line 122
    invoke-super {p0}, Landroid/app/Activity;->onStop()V

    .line 123
    return-void
.end method

.method public onTrimMemory(I)V
    .locals 1
    .param p1, "level"    # I

    .line 168
    iget-object v0, p0, Lio/flutter/app/FlutterActivity;->eventDelegate:Lio/flutter/app/FlutterActivityEvents;

    invoke-interface {v0, p1}, Lio/flutter/app/FlutterActivityEvents;->onTrimMemory(I)V

    .line 169
    return-void
.end method

.method public onUserLeaveHint()V
    .locals 1

    .line 157
    iget-object v0, p0, Lio/flutter/app/FlutterActivity;->eventDelegate:Lio/flutter/app/FlutterActivityEvents;

    invoke-interface {v0}, Lio/flutter/app/FlutterActivityEvents;->onUserLeaveHint()V

    .line 158
    return-void
.end method

.method public onWindowFocusChanged(Z)V
    .locals 1
    .param p1, "hasFocus"    # Z

    .line 162
    invoke-super {p0, p1}, Landroid/app/Activity;->onWindowFocusChanged(Z)V

    .line 163
    iget-object v0, p0, Lio/flutter/app/FlutterActivity;->eventDelegate:Lio/flutter/app/FlutterActivityEvents;

    invoke-interface {v0, p1}, Lio/flutter/app/FlutterActivityEvents;->onWindowFocusChanged(Z)V

    .line 164
    return-void
.end method

.method public final registrarFor(Ljava/lang/String;)Lio/flutter/plugin/common/PluginRegistry$Registrar;
    .locals 1
    .param p1, "pluginKey"    # Ljava/lang/String;

    .line 85
    iget-object v0, p0, Lio/flutter/app/FlutterActivity;->pluginRegistry:Lio/flutter/plugin/common/PluginRegistry;

    invoke-interface {v0, p1}, Lio/flutter/plugin/common/PluginRegistry;->registrarFor(Ljava/lang/String;)Lio/flutter/plugin/common/PluginRegistry$Registrar;

    move-result-object v0

    return-object v0
.end method

.method public retainFlutterNativeView()Z
    .locals 1

    .line 70
    const/4 v0, 0x0

    return v0
.end method

.method public final valuePublishedByPlugin(Ljava/lang/String;)Ljava/lang/Object;
    .locals 1
    .param p1, "pluginKey"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            ")TT;"
        }
    .end annotation

    .line 80
    iget-object v0, p0, Lio/flutter/app/FlutterActivity;->pluginRegistry:Lio/flutter/plugin/common/PluginRegistry;

    invoke-interface {v0, p1}, Lio/flutter/plugin/common/PluginRegistry;->valuePublishedByPlugin(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method
