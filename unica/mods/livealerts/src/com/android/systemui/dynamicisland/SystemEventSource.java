package com.android.systemui.dynamicisland;

import android.app.PendingIntent;
import android.bluetooth.BluetoothA2dp;
import android.bluetooth.BluetoothDevice;
import android.bluetooth.BluetoothHeadset;
import android.bluetooth.BluetoothProfile;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.media.AudioManager;
import android.os.BatteryManager;
import android.os.SystemClock;
import android.provider.Settings;
import android.text.TextUtils;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.ArrayList;
import java.util.List;

/**
 * Emits OxygenOS-style system pills for charging, Bluetooth audio connect,
 * ringer mode changes, and persistent mobile hotspot with live connected device count.
 */
public final class SystemEventSource {

    public interface Listener {
        void onItemUpdated(IslandItem item);
        void onItemRemoved(String key);
    }

    private static final String KEY_FLASH_CHARGING = "island:flash:charging";
    private static final String KEY_FLASH_BT = "island:flash:bluetooth";
    private static final String KEY_FLASH_RINGER = "island:flash:ringer";
    private static final String KEY_HOTSPOT = "island:hotspot";

    private static final String ACTION_WIFI_AP_STATE_CHANGED = "android.net.wifi.WIFI_AP_STATE_CHANGED";
    private static final String ACTION_SAMSUNG_WIFI_AP_STA_CHANGED = "com.samsung.android.net.wifi.WIFI_AP_STA_STATE_CHANGED";
    private static final String ACTION_TETHER_STATE_CHANGED = "android.net.conn.TETHER_STATE_CHANGED";

    private final Context mContext;
    private final Listener mListener;
    private boolean mRegistered = false;

    private int mLastPlugged = -1;
    private int mLastRingerMode = -1;
    private boolean mRingerSeeded = false;
    private String mLastBtAddress = "";
    private long mLastBtTimeMs = 0L;

    private boolean mHotspotActive = false;
    private int mHotspotClientCount = -1;
    private Object mWifiManagerRef = null;
    private Object mSoftApCallbackProxy = null;

    private final BroadcastReceiver mReceiver = new BroadcastReceiver() {
        @Override
        public void onReceive(Context context, Intent intent) {
            if (intent == null || intent.getAction() == null) {
                return;
            }
            String action = intent.getAction();
            switch (action) {
                case Intent.ACTION_BATTERY_CHANGED:
                    handleBatteryChanged(intent);
                    break;
                case AudioManager.RINGER_MODE_CHANGED_ACTION:
                    handleRingerChanged(intent);
                    break;
                case BluetoothDevice.ACTION_ACL_CONNECTED:
                    handleBluetoothAcl(intent);
                    break;
                case BluetoothA2dp.ACTION_CONNECTION_STATE_CHANGED:
                case BluetoothHeadset.ACTION_CONNECTION_STATE_CHANGED:
                    handleBluetoothProfileState(intent);
                    break;
                case ACTION_WIFI_AP_STATE_CHANGED:
                    handleHotspotChanged(intent);
                    break;
                case ACTION_SAMSUNG_WIFI_AP_STA_CHANGED: {
                    int staCount = intent.getIntExtra("STA_COUNT", -1);
                    if (mHotspotActive || isHotspotSystemEnabled()) {
                        emitHotspotUpdate(staCount, true);
                    }
                    break;
                }
                case ACTION_TETHER_STATE_CHANGED:
                    if (mHotspotActive || isHotspotSystemEnabled()) {
                        emitHotspotUpdate(-1, true);
                    }
                    break;
            }
        }
    };

    public SystemEventSource(Context context, Listener listener) {
        mContext = context.getApplicationContext();
        mListener = listener;
    }

    public void start() {
        if (mRegistered) {
            return;
        }
        IntentFilter filter = new IntentFilter();
        filter.addAction(Intent.ACTION_BATTERY_CHANGED);
        filter.addAction(AudioManager.RINGER_MODE_CHANGED_ACTION);
        filter.addAction(BluetoothDevice.ACTION_ACL_CONNECTED);
        filter.addAction(BluetoothA2dp.ACTION_CONNECTION_STATE_CHANGED);
        filter.addAction(BluetoothHeadset.ACTION_CONNECTION_STATE_CHANGED);
        filter.addAction(ACTION_WIFI_AP_STATE_CHANGED);
        filter.addAction(ACTION_SAMSUNG_WIFI_AP_STA_CHANGED);
        filter.addAction(ACTION_TETHER_STATE_CHANGED);
        mContext.registerReceiver(mReceiver, filter, Context.RECEIVER_EXPORTED);
        mRegistered = true;

        registerSoftApCallback();
        if (isHotspotSystemEnabled()) {
            emitHotspotUpdate(-1, false);
        }
    }

    public void stop() {
        if (!mRegistered) {
            return;
        }
        unregisterSoftApCallback();
        try {
            mContext.unregisterReceiver(mReceiver);
        } catch (Throwable ignored) {
        }
        mRegistered = false;
    }

    private void handleBatteryChanged(Intent intent) {
        int plugged = intent.getIntExtra(BatteryManager.EXTRA_PLUGGED, 0);
        if (mLastPlugged == -1) {
            mLastPlugged = plugged;
            return;
        }
        int prevPlugged = mLastPlugged;
        mLastPlugged = plugged;

        if (prevPlugged == 0 && plugged != 0) {
            int level = intent.getIntExtra(BatteryManager.EXTRA_LEVEL, -1);
            int scale = intent.getIntExtra(BatteryManager.EXTRA_SCALE, 100);
            int pct = (level >= 0 && scale > 0) ? Math.round((level * 100f) / scale) : 0;

            String label;
            int chargeType = intent.getIntExtra("charge_type", -1);
            if (plugged == BatteryManager.BATTERY_PLUGGED_WIRELESS) {
                label = "AirVOOC charging";
            } else if (chargeType >= 2) {
                label = "SUPERVOOC";
            } else if (chargeType == 1) {
                label = "Fast charging";
            } else {
                label = "Charging";
            }

            IslandItem item = new IslandItem(KEY_FLASH_CHARGING, IslandItem.Category.FLASH_EVENT);
            item.transientItem = true;
            item.expiresAtElapsedMs = SystemClock.elapsedRealtime() + 3400L;
            item.vectorKind = 1;
            item.accentColor = 0xFF30D158;
            item.title = label;
            item.subtitle = pct + "% Battery";
            item.compactRightText = pct + "%";
            item.hasProgress = true;
            item.progressValue = pct;
            item.progressMax = 100L;
            mListener.onItemUpdated(item);
        }
    }

    private void handleRingerChanged(Intent intent) {
        int mode = intent.getIntExtra(AudioManager.EXTRA_RINGER_MODE, -1);
        if (mode == -1) {
            return;
        }
        if (!mRingerSeeded) {
            mRingerSeeded = true;
            mLastRingerMode = mode;
            return;
        }
        if (mode == mLastRingerMode) {
            return;
        }
        mLastRingerMode = mode;

        IslandItem item = new IslandItem(KEY_FLASH_RINGER, IslandItem.Category.FLASH_EVENT);
        item.transientItem = true;
        item.expiresAtElapsedMs = SystemClock.elapsedRealtime() + 2400L;
        if (mode == AudioManager.RINGER_MODE_SILENT) {
            item.vectorKind = 5;
            item.accentColor = 0xFFFF453A;
            item.title = "Silent";
            item.subtitle = "Alerts muted";
            item.compactRightText = "Silent";
        } else if (mode == AudioManager.RINGER_MODE_VIBRATE) {
            item.vectorKind = 4;
            item.accentColor = 0xFFFF9F0A;
            item.title = "Vibrate";
            item.subtitle = "Ringer vibrate";
            item.compactRightText = "Vibrate";
        } else {
            item.vectorKind = 3;
            item.accentColor = 0xFF30D158;
            item.title = "Ring";
            item.subtitle = "Ringtone enabled";
            item.compactRightText = "Ring";
        }
        mListener.onItemUpdated(item);
    }

    private void handleBluetoothAcl(Intent intent) {
        BluetoothDevice device = intent.getParcelableExtra(BluetoothDevice.EXTRA_DEVICE, BluetoothDevice.class);
        if (device != null) {
            emitBluetoothConnected(device);
        }
    }

    private void handleBluetoothProfileState(Intent intent) {
        int state = intent.getIntExtra(BluetoothProfile.EXTRA_STATE, -1);
        if (state == BluetoothProfile.STATE_CONNECTED) {
            BluetoothDevice device = intent.getParcelableExtra(BluetoothDevice.EXTRA_DEVICE, BluetoothDevice.class);
            if (device != null) {
                emitBluetoothConnected(device);
            }
        }
    }

    private void emitBluetoothConnected(BluetoothDevice device) {
        try {
            String addr = device.getAddress();
            long now = SystemClock.elapsedRealtime();
            if (!TextUtils.isEmpty(addr) && addr.equals(mLastBtAddress) && (now - mLastBtTimeMs) < 5000L) {
                return;
            }
            mLastBtAddress = addr != null ? addr : "";
            mLastBtTimeMs = now;

            String name = null;
            try {
                name = device.getAlias();
            } catch (Throwable ignored) {
            }
            if (TextUtils.isEmpty(name)) {
                name = device.getName();
            }
            if (TextUtils.isEmpty(name)) {
                name = "Bluetooth Device";
            }

            int bat = getBluetoothBatteryReflection(device);
            IslandItem item = new IslandItem(KEY_FLASH_BT, IslandItem.Category.FLASH_EVENT);
            item.transientItem = true;
            item.expiresAtElapsedMs = now + 3500L;
            item.vectorKind = 2;
            item.accentColor = 0xFF0A84FF;
            item.title = name;
            if (bat >= 0 && bat <= 100) {
                item.subtitle = "Connected • " + bat + "%";
                item.compactRightText = bat + "%";
            } else {
                item.subtitle = "Connected";
                item.compactRightText = name;
            }
            mListener.onItemUpdated(item);
        } catch (SecurityException ignored) {
        }
    }

    private static int getBluetoothBatteryReflection(BluetoothDevice device) {
        try {
            Method m = BluetoothDevice.class.getMethod("getBatteryLevel");
            Object res = m.invoke(device);
            if (res instanceof Integer) {
                return (Integer) res;
            }
        } catch (Throwable ignored) {
        }
        return -1;
    }

    private void handleHotspotChanged(Intent intent) {
        int state = intent.getIntExtra("wifi_state", 11);
        handleHotspotState(state);
    }

    private void handleHotspotState(int state) {
        // WIFI_AP_STATE_ENABLED == 13
        if (state == 13) {
            emitHotspotUpdate(-1, mHotspotActive);
        } else if (state == 11 || state == 10 || state == 14) {
            mHotspotActive = false;
            mHotspotClientCount = -1;
            mListener.onItemRemoved(KEY_HOTSPOT);
        }
    }

    private void emitHotspotUpdate(int hintCount, boolean allowQuiet) {
        int count = hintCount >= 0 ? hintCount : queryHotspotConnectedCount();
        List<String> deviceNames = queryHotspotDeviceNames();
        if (count <= 0 && !deviceNames.isEmpty()) {
            count = deviceNames.size();
        }
        count = Math.max(0, count);

        String ssid = queryHotspotSsid();

        IslandItem item = new IslandItem(KEY_HOTSPOT, IslandItem.Category.HOTSPOT);
        item.vectorKind = GlyphIconView.GLYPH_HOTSPOT;
        item.accentColor = 0xFF30D158;
        item.quietUpdate = allowQuiet && mHotspotActive;
        item.title = !TextUtils.isEmpty(ssid) ? ssid : "Personal hotspot";
        if (!deviceNames.isEmpty()) {
            item.subtitle = TextUtils.join(", ", deviceNames);
        } else if (count > 0) {
            item.subtitle = count + (count == 1 ? " device connected" : " devices connected");
        } else {
            item.subtitle = "No devices connected";
        }
        // OxygenOS Live Alerts compact Hotspot pill: Hotspot logo on left, connected device count on right (never "Hotspot" text)
        item.compactRightText = String.valueOf(count);
        item.contentIntent = buildHotspotSettingsIntent();

        mHotspotActive = true;
        mHotspotClientCount = count;
        mListener.onItemUpdated(item);
    }

    private void registerSoftApCallback() {
        try {
            Object wifiMgr = mContext.getSystemService(Context.WIFI_SERVICE);
            if (wifiMgr == null) {
                return;
            }
            Class<?> cbCls = Class.forName("android.net.wifi.WifiManager$SoftApCallback");
            InvocationHandler handler = (proxy, method, args) -> {
                String mName = method.getName();
                if ("equals".equals(mName)) {
                    return args != null && args.length == 1 && proxy == args[0];
                }
                if ("hashCode".equals(mName)) {
                    return System.identityHashCode(proxy);
                }
                if ("toString".equals(mName)) {
                    return "DynamicIslandSoftApCallback";
                }
                if ("onStateChanged".equals(mName) && args != null && args.length >= 1 && args[0] instanceof Integer) {
                    handleHotspotState((Integer) args[0]);
                } else if ("onConnectedClientsChanged".equals(mName) && args != null && args.length >= 1 && args[0] instanceof List<?>) {
                    int n = ((List<?>) args[0]).size();
                    if (mHotspotActive || isHotspotSystemEnabled()) {
                        emitHotspotUpdate(n, true);
                    }
                }
                return null;
            };
            Object proxy = Proxy.newProxyInstance(cbCls.getClassLoader(), new Class<?>[]{cbCls}, handler);
            Method reg = wifiMgr.getClass().getMethod("registerSoftApCallback", java.util.concurrent.Executor.class, cbCls);
            reg.invoke(wifiMgr, mContext.getMainExecutor(), proxy);
            mWifiManagerRef = wifiMgr;
            mSoftApCallbackProxy = proxy;
        } catch (Throwable ignored) {
        }
    }

    private void unregisterSoftApCallback() {
        if (mWifiManagerRef == null || mSoftApCallbackProxy == null) {
            return;
        }
        try {
            Class<?> cbCls = Class.forName("android.net.wifi.WifiManager$SoftApCallback");
            Method unreg = mWifiManagerRef.getClass().getMethod("unregisterSoftApCallback", cbCls);
            unreg.invoke(mWifiManagerRef, mSoftApCallbackProxy);
        } catch (Throwable ignored) {
        }
        mSoftApCallbackProxy = null;
    }

    private boolean isHotspotSystemEnabled() {
        try {
            Object semWifi = mContext.getSystemService("sem_wifi");
            if (semWifi != null) {
                Method m = semWifi.getClass().getMethod("getWifiApState");
                Object res = m.invoke(semWifi);
                if (res instanceof Integer && ((Integer) res) == 13) {
                    return true;
                }
            }
        } catch (Throwable ignored) {
        }
        try {
            Object wifiMgr = mContext.getSystemService(Context.WIFI_SERVICE);
            if (wifiMgr != null) {
                Method m = wifiMgr.getClass().getMethod("getWifiApState");
                Object res = m.invoke(wifiMgr);
                if (res instanceof Integer && ((Integer) res) == 13) {
                    return true;
                }
            }
        } catch (Throwable ignored) {
        }
        return false;
    }

    private int queryHotspotConnectedCount() {
        try {
            Object semWifi = mContext.getSystemService("sem_wifi");
            if (semWifi != null) {
                Method m = semWifi.getClass().getMethod("getWifiApConnectedStationCount");
                Object res = m.invoke(semWifi);
                if (res instanceof Integer) {
                    return Math.max(0, (Integer) res);
                }
            }
        } catch (Throwable ignored) {
        }
        return Math.max(0, mHotspotClientCount);
    }

    private List<String> queryHotspotDeviceNames() {
        List<String> names = new ArrayList<>();
        try {
            Object semWifi = mContext.getSystemService("sem_wifi");
            if (semWifi != null) {
                Method m = semWifi.getClass().getMethod("getWifiApStaListDetail");
                Object res = m.invoke(semWifi);
                if (res instanceof List<?>) {
                    for (Object entry : (List<?>) res) {
                        if (!(entry instanceof String)) {
                            continue;
                        }
                        String[] parts = ((String) entry).split("\n");
                        String devName = parts.length > 2 ? parts[2].trim() : "";
                        if (!TextUtils.isEmpty(devName) && !"*".equals(devName) && !"null".equalsIgnoreCase(devName)) {
                            names.add(devName);
                        } else if (parts.length > 1 && !TextUtils.isEmpty(parts[1].trim())) {
                            names.add(parts[1].trim());
                        }
                    }
                }
            }
        } catch (Throwable ignored) {
        }
        return names;
    }

    private String queryHotspotSsid() {
        try {
            Object semWifi = mContext.getSystemService("sem_wifi");
            if (semWifi != null) {
                Method getCfg = semWifi.getClass().getMethod("getSoftApConfiguration");
                Object cfg = getCfg.invoke(semWifi);
                if (cfg != null) {
                    Method getSsid = cfg.getClass().getMethod("getSsid");
                    Object ssid = getSsid.invoke(cfg);
                    if (ssid != null) {
                        return ssid.toString();
                    }
                }
            }
        } catch (Throwable ignored) {
        }
        try {
            Object wifiMgr = mContext.getSystemService(Context.WIFI_SERVICE);
            if (wifiMgr != null) {
                Method getCfg = wifiMgr.getClass().getMethod("getSoftApConfiguration");
                Object cfg = getCfg.invoke(wifiMgr);
                if (cfg != null) {
                    Method getSsid = cfg.getClass().getMethod("getSsid");
                    Object ssid = getSsid.invoke(cfg);
                    if (ssid != null) {
                        return ssid.toString();
                    }
                }
            }
        } catch (Throwable ignored) {
        }
        return "";
    }

    private PendingIntent buildHotspotSettingsIntent() {
        try {
            Intent i = new Intent("android.settings.TETHER_SETTINGS");
            i.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            if (i.resolveActivity(mContext.getPackageManager()) == null) {
                i = new Intent(Settings.ACTION_WIRELESS_SETTINGS);
                i.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            }
            return PendingIntent.getActivity(
                    mContext,
                    4006,
                    i,
                    PendingIntent.FLAG_UPDATE_CURRENT | PendingIntent.FLAG_IMMUTABLE
            );
        } catch (Throwable ignored) {
            return null;
        }
    }
}
