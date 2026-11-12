# shellcheck disable=SC2034
SKIPUNZIP=1

LOG_STEP_IN "- Porting One UI 9.0 Status Bar + OxygenOS 16 Live Alerts"

DECODE_APK "system_ext" "priv-app/SystemUI/SystemUI.apk"

SYSUI_APK_DIR="$APKTOOL_DIR/system_ext/priv-app/SystemUI/SystemUI.apk"

# 1. Install compatible One UI 9.0 status bar drawables
if [ -d "$MODPATH/status_bar_res/drawable" ]; then
    EVAL "mkdir -p \"$SYSUI_APK_DIR/res/drawable\""
    EVAL "cp -f \"$MODPATH/status_bar_res/drawable/\"*.xml \"$SYSUI_APK_DIR/res/drawable/\""
fi

# 2. Apply One UI 9.0 status bar dimens, colors, and tabular clock digits
python3 - "$SYSUI_APK_DIR" <<'PYEOF'
import os
import sys

sysui_dir = sys.argv[1]


def replace_optional_exact(path: str, old: str, new: str):
    with open(path, "r", encoding="utf-8") as f:
        data = f.read()
    if new in data:
        return
    assert old in data, f"Target not found in {path}: {old!r}"
    assert data.count(old) == 1, f"Multiple matches in {path}: {old!r}"
    with open(path, "w", encoding="utf-8") as f:
        f.write(data.replace(old, new))


dimens_xml = os.path.join(sysui_dir, "res/values/dimens.xml")
for old, new in [
    ('<dimen name="samsung_status_bar_battery_icon_height">16.0dp</dimen>',
     '<dimen name="samsung_status_bar_battery_icon_height">14.0dp</dimen>'),
    ('<dimen name="signal_cluster_battery_padding">3.0dp</dimen>',
     '<dimen name="signal_cluster_battery_padding">4.0dp</dimen>'),
    ('<dimen name="status_bar_clock_end_padding">0.0dp</dimen>',
     '<dimen name="status_bar_clock_end_padding">4.0dp</dimen>'),
    ('<dimen name="status_bar_mobile_container_margin_end">2.0sp</dimen>',
     '<dimen name="status_bar_mobile_container_margin_end">3.0sp</dimen>'),
    ('<dimen name="status_bar_system_icon_padding_end">1.0dp</dimen>',
     '<dimen name="status_bar_system_icon_padding_end">2.0dp</dimen>'),
    ('<dimen name="status_bar_icon_drawing_alpha">90.0%</dimen>',
     '<dimen name="status_bar_icon_drawing_alpha">96.0%</dimen>'),
    ('<dimen name="status_bar_battery_dark_mode_alpha">0.7</dimen>',
     '<dimen name="status_bar_battery_dark_mode_alpha">0.85</dimen>'),
    ('<dimen name="status_bar_battery_light_mode_alpha">0.93</dimen>',
     '<dimen name="status_bar_battery_light_mode_alpha">0.96</dimen>'),
]:
    replace_optional_exact(dimens_xml, old, new)

colors_xml = os.path.join(sysui_dir, "res/values/colors.xml")
for old, new in [
    ('<color name="status_bar_battery_chip_text_color_dark">#010102</color>',
     '<color name="status_bar_battery_chip_text_color_dark">#4d4d52</color>'),
    ('<color name="status_bar_battery_chip_text_color_light">#fafaff</color>',
     '<color name="status_bar_battery_chip_text_color_light">#f1f1f3</color>'),
    ('<color name="dark_mode_icon_color_dual_tone_fill">#7a000000</color>',
     '<color name="dark_mode_icon_color_dual_tone_fill">#cc000000</color>'),
    ('<color name="dark_mode_icon_color_single_tone">#99000000</color>',
     '<color name="dark_mode_icon_color_single_tone">#d9000000</color>'),
    ('<color name="dark_mode_qs_icon_color_dual_tone_fill">#99000000</color>',
     '<color name="dark_mode_qs_icon_color_dual_tone_fill">#cc000000</color>'),
    ('<color name="dark_mode_qs_icon_color_single_tone">#b3000000</color>',
     '<color name="dark_mode_qs_icon_color_single_tone">#d9000000</color>'),
]:
    replace_optional_exact(colors_xml, old, new)

for layout_name in ("res/layout/status_bar.xml", "res/layout/shade_carrier_group.xml"):
    replace_optional_exact(
        os.path.join(sysui_dir, layout_name),
        'android:fontFamily="sec" android:textFontWeight="600" />',
        'android:fontFamily="sec" android:fontFeatureSettings="tnum" android:textFontWeight="600" />',
    )
PYEOF

# 3. Install pure OxygenOS 16 Live Alerts smali engine into smali_classes5
LOG "- Installing OxygenOS 16 Live Alerts smali classes"
EVAL "rm -rf \"$SYSUI_APK_DIR/smali_classes5/com/android/systemui/dynamicisland\""
EVAL "mkdir -p \"$SYSUI_APK_DIR/smali_classes5/com/android/systemui\""
EVAL "cp -a \"$MODPATH/smali_classes5/com/android/systemui/dynamicisland\" \"$SYSUI_APK_DIR/smali_classes5/com/android/systemui/dynamicisland\""

# 4. Inject static coordinator hooks into SystemUI
if ! grep -q "DynamicIslandController;->init" "$SYSUI_APK_DIR/smali/com/android/systemui/SystemUIApplication.smali"; then
    SMALI_PATCH "system_ext" "priv-app/SystemUI/SystemUI.apk" \
        "smali/com/android/systemui/SystemUIApplication.smali" "replace" \
        'startSystemUserServicesIfNeeded()V' \
        'invoke-virtual {p0, v2, v0, v1}, Lcom/android/systemui/SystemUIApplication;->startServicesIfNeeded(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V' \
        '    invoke-virtual {p0, v2, v0, v1}, Lcom/android/systemui/SystemUIApplication;->startServicesIfNeeded(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V\n\n    invoke-static {p0}, Lcom/android/systemui/dynamicisland/DynamicIslandController;->init(Landroid/content/Context;)V' \
        > /dev/null
fi

if ! grep -q "DynamicIslandController;->onNotificationPosted" "$SYSUI_APK_DIR/smali_classes3/com/android/systemui/statusbar/NotificationListener.smali"; then
    SMALI_PATCH "system_ext" "priv-app/SystemUI/SystemUI.apk" \
        "smali_classes3/com/android/systemui/statusbar/NotificationListener.smali" "replace" \
        'onNotificationPosted(Landroid/service/notification/StatusBarNotification;Landroid/service/notification/NotificationListenerService$RankingMap;)V' \
        'invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V' \
        '    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V\n\n    invoke-static {p1}, Lcom/android/systemui/dynamicisland/DynamicIslandController;->onNotificationPosted(Landroid/service/notification/StatusBarNotification;)V' \
        > /dev/null
fi

if ! grep -q "DynamicIslandController;->onNotificationRemoved" "$SYSUI_APK_DIR/smali_classes3/com/android/systemui/statusbar/NotificationListener.smali"; then
    SMALI_PATCH "system_ext" "priv-app/SystemUI/SystemUI.apk" \
        "smali_classes3/com/android/systemui/statusbar/NotificationListener.smali" "replace" \
        'onNotificationRemoved(Landroid/service/notification/StatusBarNotification;Landroid/service/notification/NotificationListenerService$RankingMap;I)V' \
        'invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V' \
        '    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V\n\n    invoke-static {p1}, Lcom/android/systemui/dynamicisland/DynamicIslandController;->onNotificationRemoved(Landroid/service/notification/StatusBarNotification;)V' \
        > /dev/null
fi

if ! grep -q "DynamicIslandController;->onStatusBarAttachedOrInsetsChanged" "$SYSUI_APK_DIR/smali_classes3/com/android/systemui/statusbar/phone/PhoneStatusBarView.smali"; then
    SMALI_PATCH "system_ext" "priv-app/SystemUI/SystemUI.apk" \
        "smali_classes3/com/android/systemui/statusbar/phone/PhoneStatusBarView.smali" "replace" \
        'onApplyWindowInsets(Landroid/view/WindowInsets;)Landroid/view/WindowInsets;' \
        'invoke-super {p0, p1}, Landroid/widget/FrameLayout;->onApplyWindowInsets(Landroid/view/WindowInsets;)Landroid/view/WindowInsets;' \
        '    invoke-static {p0}, Lcom/android/systemui/dynamicisland/DynamicIslandController;->onStatusBarAttachedOrInsetsChanged(Landroid/view/View;)V\n\n    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->onApplyWindowInsets(Landroid/view/WindowInsets;)Landroid/view/WindowInsets;' \
        > /dev/null
    SMALI_PATCH "system_ext" "priv-app/SystemUI/SystemUI.apk" \
        "smali_classes3/com/android/systemui/statusbar/phone/PhoneStatusBarView.smali" "replace" \
        'onAttachedToWindow()V' \
        'return-void' \
        '    invoke-static {p0}, Lcom/android/systemui/dynamicisland/DynamicIslandController;->onStatusBarAttachedOrInsetsChanged(Landroid/view/View;)V\n\n    return-void' \
        > /dev/null
    SMALI_PATCH "system_ext" "priv-app/SystemUI/SystemUI.apk" \
        "smali_classes3/com/android/systemui/statusbar/phone/PhoneStatusBarView.smali" "replace" \
        'onConfigurationChanged(Landroid/content/res/Configuration;)V' \
        'invoke-virtual {p0}, Lcom/android/systemui/statusbar/phone/PhoneStatusBarView;->updateWindowHeight()V' \
        '    invoke-virtual {p0}, Lcom/android/systemui/statusbar/phone/PhoneStatusBarView;->updateWindowHeight()V\n\n    invoke-static {p0}, Lcom/android/systemui/dynamicisland/DynamicIslandController;->onStatusBarAttachedOrInsetsChanged(Landroid/view/View;)V' \
        > /dev/null
fi

unset SYSUI_APK_DIR
LOG_STEP_OUT
