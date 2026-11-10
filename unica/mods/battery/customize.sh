# shellcheck disable=SC2034
SKIPUNZIP=1

# Enable GMS Doze by removing power-save Doze exemptions for Google Play Services
LOG_STEP_IN "- Applying GMS Doze optimizations"
for DIR in \
    "$WORK_DIR/system/system/etc/sysconfig" \
    "$WORK_DIR/product/etc/sysconfig" \
    "$WORK_DIR/system_ext/etc/sysconfig" \
    "$WORK_DIR/vendor/etc/sysconfig"; do
    [ -d "$DIR" ] || continue
    while IFS= read -r f; do
        if grep -qE '<allow-in-power-save(-except-idle)?[[:space:]]+[^>]*package="com\.google\.android\.gms"' "$f"; then
            LOG "- Patching ${f//$WORK_DIR/}"
            if grep -qE '<allow-in-data-usage-save[[:space:]]+[^>]*package="com\.google\.android\.gms"' "$f"; then
                EVAL "sed -i -E '/<allow-in-power-save(-except-idle)?[[:space:]]+[^>]*package=\"com\\.google\\.android\\.gms\"/d' \"$f\""
            elif grep -qE '<allow-in-power-save[[:space:]]+[^>]*package="com\.google\.android\.gms"' "$f"; then
                EVAL "sed -i -E \
                    -e 's/<allow-in-power-save([[:space:]]+[^>]*package=\"com\\.google\\.android\\.gms\")/<allow-in-data-usage-save\\1/g' \
                    -e '/<allow-in-power-save-except-idle[[:space:]]+[^>]*package=\"com\\.google\\.android\\.gms\"/d' \
                    \"$f\""
            else
                EVAL "sed -i -E 's/<allow-in-power-save-except-idle([[:space:]]+[^>]*package=\"com\\.google\\.android\\.gms\")/<allow-in-data-usage-save\\1/g' \"$f\""
            fi
        fi
    done < <(find "$DIR" -type f -name "*.xml")
done
LOG_STEP_OUT

# Disable always-on background Wi-Fi/BLE scanning, Wi-Fi auto-wakeup, and always-on mobile data defaults
DECODE_APK "system" "system/priv-app/SettingsProvider/SettingsProvider.apk"
DEFAULTS_XML="$APKTOOL_DIR/system/priv-app/SettingsProvider/SettingsProvider.apk/res/values/defaults.xml"
if [ -f "$DEFAULTS_XML" ]; then
    LOG "- Updating idle scan/radio defaults in SettingsProvider.apk"
    EVAL "sed -i \
        -e 's/\\(<bool name=\"def_wifi_scan_always_available\">\\)true\\(<\\/bool>\\)/\\1false\\2/g' \
        -e 's/\\(<integer name=\"def_wifi_scan_always_available\">\\)1\\(<\\/integer>\\)/\\10\\2/g' \
        -e 's/\\(<bool name=\"def_ble_scan_always_available\">\\)true\\(<\\/bool>\\)/\\1false\\2/g' \
        -e 's/\\(<integer name=\"def_ble_scan_always_available\">\\)1\\(<\\/integer>\\)/\\10\\2/g' \
        -e 's/\\(<bool name=\"def_mobile_data_always_on\">\\)true\\(<\\/bool>\\)/\\1false\\2/g' \
        -e 's/\\(<integer name=\"def_mobile_data_always_on\">\\)1\\(<\\/integer>\\)/\\10\\2/g' \
        -e 's/\\(<bool name=\"def_wifi_wakeup_enabled\">\\)true\\(<\\/bool>\\)/\\1false\\2/g' \
        -e 's/\\(<integer name=\"def_wifi_wakeup_enabled\">\\)1\\(<\\/integer>\\)/\\10\\2/g' \
        -e 's/\\(<bool name=\"def_adaptive_battery_management_enabled\">\\)false\\(<\\/bool>\\)/\\1true\\2/g' \
        -e 's/\\(<integer name=\"def_adaptive_battery_management_enabled\">\\)0\\(<\\/integer>\\)/\\11\\2/g' \
        \"$DEFAULTS_XML\""
fi
unset DIR DEFAULTS_XML

# Install inbuilt boot-time wakelock blocker, Doze tuning, and idle settings service
LOG_STEP_IN "- Adding inbuilt Deep Doze and wakelock boot service"
ADD_TO_WORK_DIR "$MODPATH" "system" "." 0 0 755 "u:object_r:system_file:s0"

SEPOLICY="$WORK_DIR/system/system/etc/selinux/plat_sepolicy.cil"
if [ -f "$SEPOLICY" ] && ! grep -q "unica_wl_exec" "$SEPOLICY"; then
    sed -i \
        -e "/^(typeattributeset exec_type[[:space:]]/ s/))/ unica_wl_exec ))/" \
        -e "/^(typeattributeset file_type[[:space:]]/ s/))/ unica_wl_exec ))/" \
        -e "/^(typeattributeset system_file_type[[:space:]]/ s/))/ unica_wl_exec ))/" \
        -e "/^(typeattributeset domain[[:space:]]/ s/))/ unica_wl ))/" \
        "$SEPOLICY"

    cat <<'EOF' >> "$SEPOLICY"
; Added by unica/mods/battery/customize.sh
(type unica_wl)
(roletype object_r unica_wl)
(type unica_wl_exec)
(roletype object_r unica_wl_exec)
(typetransition init unica_wl_exec process unica_wl)
(allow init unica_wl (process (transition)))
(allow init unica_wl (process (noatsecure rlimitinh siginh)))
(allow init unica_wl (fd (use)))
(allow init unica_wl_exec (file (read open execute getattr map)))
(allow unica_wl shell_exec (file (read open execute getattr map execute_no_trans)))
(allow unica_wl system_file (file (read open execute getattr map execute_no_trans)))
(allow unica_wl toolbox_exec (file (read open execute getattr map execute_no_trans)))
(allow unica_wl unica_wl_exec (file (entrypoint read open execute getattr map)))
(allow unica_wl sysfs (dir (search read open getattr)))
(allow unica_wl sysfs (lnk_file (read getattr)))
(allow unica_wl sysfs (file (read write open getattr)))
(allow unica_wl servicemanager (binder (call transfer)))
(allow servicemanager unica_wl (binder (call transfer)))
(allow servicemanager unica_wl (dir (search)))
(allow servicemanager unica_wl (file (read open)))
(allow servicemanager unica_wl (process (getattr)))
(allow unica_wl system_server (binder (call transfer)))
(allow system_server unica_wl (binder (call transfer)))
(allow unica_wl system_server (fd (use)))
(allow system_server unica_wl (fd (use)))
(allow system_server unica_wl (dir (search)))
(allow system_server unica_wl (file (read open)))
(allow system_server unica_wl (process (getattr)))
(allow system_server unica_wl (fifo_file (read write getattr)))
EOF

    _HAS_CIL_TYPE()
    {
        local TYPE="$1"
        local F
        for F in \
            "$SEPOLICY" \
            "$WORK_DIR/system_ext/etc/selinux/system_ext_sepolicy.cil" \
            "$WORK_DIR/system/system/system_ext/etc/selinux/system_ext_sepolicy.cil" \
            "$WORK_DIR/product/etc/selinux/product_sepolicy.cil"; do
            [ -f "$F" ] || continue
            if grep -q -E "^\\(type[[:space:]]+${TYPE}([[:space:]]|\\))" "$F"; then
                return 0
            fi
        done
        return 1
    }

    CMD_TYPE="$(awk '$1 == "/system/bin/cmd" {print $2; exit}' "$WORK_DIR/system/system/etc/selinux/plat_file_contexts" 2> /dev/null | cut -d ":" -f 3)"
    if [ "$CMD_TYPE" ] && \
            [[ "$CMD_TYPE" != "system_file" ]] && \
            [[ "$CMD_TYPE" != "shell_exec" ]] && \
            [[ "$CMD_TYPE" != "toolbox_exec" ]] && \
            _HAS_CIL_TYPE "$CMD_TYPE"; then
        echo "(allow unica_wl ${CMD_TYPE} (file (read open execute getattr map execute_no_trans)))" >> "$SEPOLICY"
    fi

    SERVICE_TYPES="$(
        for SC in \
            "$WORK_DIR/system/system/etc/selinux/plat_service_contexts" \
            "$WORK_DIR/system_ext/etc/selinux/system_ext_service_contexts" \
            "$WORK_DIR/system/system/system_ext/etc/selinux/system_ext_service_contexts"; do
            [ -f "$SC" ] || continue
            awk '$1 == "device_config" || $1 == "device_config_updatable" || $1 == "settings" || $1 == "deviceidle" {print $2}' "$SC" \
                | cut -d ":" -f 3
        done | sort -u
    )"
    for SVC_TYPE in $SERVICE_TYPES; do
        [ "$SVC_TYPE" ] || continue
        _HAS_CIL_TYPE "$SVC_TYPE" && echo "(allow unica_wl ${SVC_TYPE} (service_manager (find)))" >> "$SEPOLICY"
    done

    unset CMD_TYPE SERVICE_TYPES SVC_TYPE
    unset -f _HAS_CIL_TYPE
fi
unset SEPOLICY
LOG_STEP_OUT
