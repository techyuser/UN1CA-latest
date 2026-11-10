#!/system/bin/sh

WL_BLOCKER="/sys/class/misc/boeffla_wakelock_blocker/wakelock_blocker"
if [ -w "$WL_BLOCKER" ]; then
    printf '%s' "wlan_evt_wake;wlan_nan_wake;wlan_wd_wake;ssp_batch_wake_lock;patch_wake_lock;gps_geofence_wakelock;nfc_clk_wake_lock;star_wake_lock;ese_wake_lock;ese_spi_wake_lock" > "$WL_BLOCKER"
fi

[ -x /system/bin/cmd ] || exit 0

# Wait briefly until SettingsService and DeviceConfigService are registered in system_server
i=0
while [ "$i" -lt 15 ]; do
    if /system/bin/cmd settings get global device_provisioned </dev/null >/dev/null 2>&1; then
        break
    fi
    i=$((i + 1))
    sleep 2
done

_dc() {
    /system/bin/cmd -w device_config put device_idle "$1" "$2" </dev/null >/dev/null 2>&1
}

_gs() {
    /system/bin/cmd -w settings put global "$1" "$2" </dev/null >/dev/null 2>&1
}

# Fast Deep Doze parameters (AOSP DeviceIdleController Constants keys)
_dc light_after_inactive_to 30000
_dc light_idle_to 600000
_dc light_max_idle_to 1800000
_dc inactive_to 60000
_dc sensing_to 0
_dc locating_to 0
_dc motion_inactive_to 60000
_dc motion_inactive_to_flex 30000
_dc idle_after_inactive_to 60000
_dc idle_pending_to 60000
_dc max_idle_pending_to 120000
_dc quick_doze_delay_to 30000
_dc idle_to 1800000
_dc max_idle_to 21600000

# Apply scan/radio defaults once across clean and dirty flashes without overriding later user toggles
if [ "$(/system/bin/cmd -w settings get global unica_battery_applied_v1 </dev/null 2>/dev/null)" != "1" ]; then
    _gs wifi_scan_always_available 0
    _gs ble_scan_always_available 0
    _gs mobile_data_always_on 0
    _gs wifi_wakeup_enabled 0
    _gs adaptive_battery_management_enabled 1
    _gs unica_battery_applied_v1 1
fi


