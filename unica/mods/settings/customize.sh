# Show battery regulatory info in Settings
# Requires SEM_BATTERY_PROPERTY_IC_AUTHENTICATION_RESULT support
if [ "$(GET_FLOATING_FEATURE_CONFIG "SEC_FLOATING_FEATURE_BATTERY_SUPPORT_BSOH_SETTINGS")" ]; then
    SET_FLOATING_FEATURE_CONFIG "SEC_FLOATING_FEATURE_BATTERY_SUPPORT_BSOH_SETTINGS" --delete
fi
SET_FLOATING_FEATURE_CONFIG "SEC_FLOATING_FEATURE_SETTINGS_ENABLE_EU_BATTERY_REGULATORY" "TRUE"

SMALI_PATCH "system" "system/framework/framework.jar" \
    "smali/android/app/Instrumentation.smali" "replace" \
    'newApplication(Ljava/lang/Class;Landroid/content/Context;)Landroid/app/Application;' \
    'invoke-virtual {p0, p1}, Landroid/app/Application;->attach(Landroid/content/Context;)V' \
    '    invoke-virtual {p0, p1}, Landroid/app/Application;->attach(Landroid/content/Context;)V\n\n    invoke-static {p1}, Lio/mesalabs/unica/SamsungPropsHooks;->init(Landroid/content/Context;)V' \
    > /dev/null
SMALI_PATCH "system" "system/framework/framework.jar" \
    "smali/android/app/Instrumentation.smali" "replace" \
    'newApplication(Ljava/lang/ClassLoader;Ljava/lang/String;Landroid/content/Context;)Landroid/app/Application;' \
    'invoke-virtual {p0, p3}, Landroid/app/Application;->attach(Landroid/content/Context;)V' \
    '    invoke-virtual {p0, p3}, Landroid/app/Application;->attach(Landroid/content/Context;)V\n\n    invoke-static {p3}, Lio/mesalabs/unica/SamsungPropsHooks;->init(Landroid/content/Context;)V' \
    > /dev/null

DECODE_APK "system" "system/priv-app/SecSettings/SecSettings.apk"

SECSETTINGS_DEC_DIR="$APKTOOL_DIR/system/priv-app/SecSettings/SecSettings.apk"
_FIND_SMALI_REL() {
    local rel="$1"
    local d
    for d in smali smali_classes2 smali_classes3 smali_classes4 smali_classes5; do
        if [ -f "$SECSETTINGS_DEC_DIR/$d/$rel" ]; then
            echo "$d/$rel"
            return 0
        fi
    done
    return 1
}

# Disable stock OTA references
if [ ! -f "$WORK_DIR/system/system/priv-app/ChoiDujour/ChoiDujour.apk" ]; then
    SU_SMALI="$(_FIND_SMALI_REL "com/samsung/android/settings/softwareupdate/SoftwareUpdateUtils.smali" || true)"
    if [ -n "$SU_SMALI" ] && grep -q "isOTAUpgradeAllowed(" "$SECSETTINGS_DEC_DIR/$SU_SMALI"; then
        SMALI_PATCH "system" "system/priv-app/SecSettings/SecSettings.apk" \
            "$SU_SMALI" "return" \
            'isOTAUpgradeAllowed(Landroid/content/Context;)Z' \
            'false'
    fi
fi

# Always show One UI minor version
OUV_SMALI="$(_FIND_SMALI_REL "com/samsung/android/settings/deviceinfo/softwareinfo/OneUIVersionPreferenceController.smali" || true)"
if [ -n "$OUV_SMALI" ]; then
    SMALI_PATCH "system" "system/priv-app/SecSettings/SecSettings.apk" \
        "$OUV_SMALI" "replace" \
        'isDeviceWithMicroVersion()Z' \
        'move-result p0' \
        'const/4 p0, 0x1'
fi

# Show real device model number
MNG_SMALI="$(_FIND_SMALI_REL "com/samsung/android/settings/deviceinfo/aboutphone/ModelNameGetter.smali" || true)"
if [ -n "$MNG_SMALI" ]; then
    SMALI_PATCH "system" "system/priv-app/SecSettings/SecSettings.apk" \
        "$MNG_SMALI" "replace" \
        'getModelName()Ljava/lang/String;' \
        'ro.product.model' \
        'ro.boot.em.model'
fi

LOG_STEP_IN "- Adding UN1CA Settings & Live Alerts Settings"

# Dynamically patch SecSettings
# - Add missing/non-xml files in place
# - Patch existing files
#   - Use the first line of the file to tell sed how to apply the rest of the content
#   - Exception made for files under *res/values* where the "resources" tag gets nuked
while IFS= read -r f; do
    f="${f//$MODPATH\/SecSettings.apk\//}"

    if [ ! -f "$SECSETTINGS_DEC_DIR/$f" ] || \
            [[ "$f" != *".xml" ]]; then
        LOG "- Adding \"$f\" to /system/system/priv-app/SecSettings.apk"
        EVAL "mkdir -p \"$(dirname "$SECSETTINGS_DEC_DIR/$f")\""
        EVAL "cp -a \"$MODPATH/SecSettings.apk/${f//\$/\\$}\" \"$SECSETTINGS_DEC_DIR/${f//\$/\\$}\""
    else
        LOG "- Patching \"$f\" in /system/system/priv-app/SecSettings.apk"
        if [[ "$f" == *"res/values"* ]]; then
            PATCH_INST="/<\/resources>/i"
            CONTENT="$(sed -e "/?xml/d" -e "/resources>/d" "$MODPATH/SecSettings.apk/$f")"
        else
            PATCH_INST="$(head -n 1 "$MODPATH/SecSettings.apk/$f")"
            CONTENT="$(tail -n +2 "$MODPATH/SecSettings.apk/$f")"
        fi
        CONTENT="$(sed -e "s/\"/\\\\\"/g" -e "s/\\$/\\\\$/g" -e "s/ /\\\ /g" -e "s/\\\\n/\\\\\\\\\n/g" <<< "$CONTENT")"
        CONTENT="$(sed -E ':a;N;$!ba;s/\r{0,1}\n/\\n/g' <<< "$CONTENT")"
        EVAL "sed -i \"$PATCH_INST $CONTENT\" \"$SECSETTINGS_DEC_DIR/$f\""
    fi
done < <(find "$MODPATH/SecSettings.apk" -type f)

# Add UN1CA Settings & Live Alerts SearchIndexableData registrations
SFE_SMALI="$(_FIND_SMALI_REL 'com/android/settings/search/SearchFeatureProviderImpl$$ExternalSyntheticLambda0.smali')"
if grep -q "invoke-direct {p0}, Lcom/android/settingslib/search/SearchIndexableResourcesBase;-><init>()V" "$SECSETTINGS_DEC_DIR/$SFE_SMALI"; then
    SIR_SMALI="$(_FIND_SMALI_REL "com/android/settingslib/search/SearchIndexableResourcesMobile.smali")"
    LOG "- Patching \"$SIR_SMALI\" in /system/system/priv-app/SecSettings.apk"
    SMALI_PATCH "system" "system/priv-app/SecSettings/SecSettings.apk" \
        "$SIR_SMALI" "replaceall" \
        '.class public final Lcom/android/settingslib/search/SearchIndexableResourcesMobile;' \
        '.class public Lcom/android/settingslib/search/SearchIndexableResourcesMobile;' \
        > /dev/null
    LOG "- Patching \"$SFE_SMALI\" in /system/system/priv-app/SecSettings.apk"
    SMALI_PATCH "system" "system/priv-app/SecSettings/SecSettings.apk" \
        "$SFE_SMALI" "replace" \
        'invoke()Ljava/lang/Object;' \
        'new-instance p0, Lcom/android/settingslib/search/SearchIndexableResourcesMobile;' \
        'new-instance p0, Lio/mesalabs/unica/search/UnicaSearchIndexableResources;' \
        > /dev/null
    SMALI_PATCH "system" "system/priv-app/SecSettings/SecSettings.apk" \
        "$SFE_SMALI" "replace" \
        'invoke()Ljava/lang/Object;' \
        'invoke-direct {p0}, Lcom/android/settingslib/search/SearchIndexableResourcesBase;-><init>()V' \
        'invoke-direct {p0}, Lio/mesalabs/unica/search/UnicaSearchIndexableResources;-><init>()V' \
        > /dev/null
else
    LOG "- Injecting UnicaSearchIndexableResources::registerInto into \"$SFE_SMALI\" in /system/system/priv-app/SecSettings.apk"
    SMALI_PATCH "system" "system/priv-app/SecSettings/SecSettings.apk" \
        "$SFE_SMALI" "replace" \
        'invoke()Ljava/lang/Object;' \
        'return-object p0' \
        '    invoke-static {p0}, Lio/mesalabs/unica/search/UnicaSearchIndexableResources;->registerInto(Lcom/android/settingslib/search/SearchIndexableResourcesBase;)V\n\n    return-object p0' \
        > /dev/null
fi

DECODE_APK "system" "system/priv-app/SecSettingsIntelligence/SecSettingsIntelligence.apk"
TLK_SMALI="smali_classes2/com/samsung/android/settings/intelligence/search/categorizing/TopLevelKeysCollector.smali"
TLK_FILE="$APKTOOL_DIR/system/priv-app/SecSettingsIntelligence/SecSettingsIntelligence.apk/$TLK_SMALI"
LOG "- Patching \"$TLK_SMALI\" in /system/system/priv-app/SecSettingsIntelligence/SecSettingsIntelligence.apk"
if grep -q "filled-new-array/range {v1 .. v36}, \[Ljava/lang/String;" "$TLK_FILE"; then
    SMALI_PATCH "system" "system/priv-app/SecSettingsIntelligence/SecSettingsIntelligence.apk" \
        "$TLK_SMALI" "replace" \
        '<init>(Landroid/content/Context;)V' \
        '.locals 37' \
        '.locals 39' \
        > /dev/null
    SMALI_PATCH "system" "system/priv-app/SecSettingsIntelligence/SecSettingsIntelligence.apk" \
        "$TLK_SMALI" "replace" \
        '<init>(Landroid/content/Context;)V' \
        'filled-new-array/range {v1 .. v36}, [Ljava/lang/String;' \
        '    const-string v37, "top_level_unica"\n\n    const-string v38, "top_level_live_alerts"\n\n    filled-new-array/range {v1 .. v38}, [Ljava/lang/String;' \
        > /dev/null
else
    SMALI_PATCH "system" "system/priv-app/SecSettingsIntelligence/SecSettingsIntelligence.apk" \
        "$TLK_SMALI" "replace" \
        '<init>(Landroid/content/Context;)V' \
        '.locals 36' \
        '.locals 38' \
        > /dev/null
    SMALI_PATCH "system" "system/priv-app/SecSettingsIntelligence/SecSettingsIntelligence.apk" \
        "$TLK_SMALI" "replace" \
        '<init>(Landroid/content/Context;)V' \
        'filled-new-array/range {v1 .. v35}, [Ljava/lang/String;' \
        '    const-string v36, "top_level_unica"\n\n    const-string v37, "top_level_live_alerts"\n\n    filled-new-array/range {v1 .. v37}, [Ljava/lang/String;' \
        > /dev/null
fi

# Show Vulkan renderer toggle if required
if [[ "$(GET_PROP "ro.hwui.use_vulkan")" != "true" ]] && [[ -z "$(GET_PROP "system" "persist.sys.unica.vulkan")" ]]; then
    SET_PROP "system" "persist.sys.unica.vulkan" "false"
fi

unset PATCH_INST CONTENT SECSETTINGS_DEC_DIR SU_SMALI OUV_SMALI MNG_SMALI SIR_SMALI SFE_SMALI TLK_SMALI TLK_FILE
unset -f _FIND_SMALI_REL

LOG_STEP_OUT
