package com.android.systemui.dynamicisland;

import android.content.ContentResolver;
import android.content.Context;
import android.provider.Settings;

/**
 * Live tunable configuration backed by Settings.Secure ("unica_live_alerts_*").
 * Falls back cleanly to pure OxygenOS 16 defaults on fresh ROM boot without setup.
 */
public final class LiveAlertsPrefs {

    public static final String PREFIX = "unica_live_alerts_";

    public static final String KEY_ENABLED = "unica_live_alerts_enabled";
    public static final String KEY_BLUR_RADIUS = "unica_live_alerts_blur_radius";
    public static final String KEY_GLASS_OPACITY = "unica_live_alerts_glass_opacity";
    public static final String KEY_RIM_ALPHA = "unica_live_alerts_rim_alpha";
    public static final String KEY_ANIM_SPEED = "unica_live_alerts_anim_speed";
    public static final String KEY_ANIM_BOUNCE = "unica_live_alerts_anim_bounce";
    public static final String KEY_HEIGHT_OFFSET_DP = "unica_live_alerts_height_offset_dp";
    public static final String KEY_GAP_OFFSET_DP = "unica_live_alerts_gap_offset_dp";
    public static final String KEY_TOP_OFFSET_DP = "unica_live_alerts_top_offset_dp";
    public static final String KEY_CENTER_OFFSET_DP = "unica_live_alerts_center_offset_dp";
    public static final String KEY_EXPANDED_WIDTH_DP = "unica_live_alerts_expanded_width_dp";

    public static final String KEY_CAT_MEDIA = "unica_live_alerts_cat_media";
    public static final String KEY_CAT_TIMER = "unica_live_alerts_cat_timer";
    public static final String KEY_CAT_HOTSPOT = "unica_live_alerts_cat_hotspot";
    public static final String KEY_CAT_DELIVERY = "unica_live_alerts_cat_delivery";
    public static final String KEY_CAT_CALLS = "unica_live_alerts_cat_calls";
    public static final String KEY_CAT_RECORDING = "unica_live_alerts_cat_recording";
    public static final String KEY_CAT_SYSTEM = "unica_live_alerts_cat_system";
    public static final String KEY_CAT_PEEK = "unica_live_alerts_cat_peek";

    public static final String KEY_PREVIEW_NONCE = "unica_live_alerts_preview_nonce";

    public boolean enabled = true;
    public int blurRadius = 280;
    public int glassOpacityPct = 55;
    public int rimAlphaPct = 85;
    public int animSpeedPct = 100;
    public int animBouncePct = 26;
    public int heightOffsetDp = 0;
    public int gapOffsetDp = 0;
    public int topOffsetDp = 0;
    public int centerOffsetDp = 0;
    public int expandedWidthDp = 336;

    public boolean catMedia = true;
    public boolean catTimer = true;
    public boolean catHotspot = true;
    public boolean catDelivery = true;
    public boolean catCalls = true;
    public boolean catRecording = true;
    public boolean catSystem = true;
    public boolean catPeek = true;

    public long previewNonce = 0L;

    public void reload(Context context) {
        if (context == null) {
            return;
        }
        ContentResolver cr = context.getContentResolver();
        enabled = getInt(cr, KEY_ENABLED, 1) != 0;
        blurRadius = clamp(getInt(cr, KEY_BLUR_RADIUS, 280), 0, 400);
        glassOpacityPct = clamp(getInt(cr, KEY_GLASS_OPACITY, 55), 25, 95);
        rimAlphaPct = clamp(getInt(cr, KEY_RIM_ALPHA, 85), 0, 100);
        animSpeedPct = clamp(getInt(cr, KEY_ANIM_SPEED, 100), 50, 160);
        animBouncePct = clamp(getInt(cr, KEY_ANIM_BOUNCE, 26), 0, 40);
        heightOffsetDp = clamp(getInt(cr, KEY_HEIGHT_OFFSET_DP, 0), -4, 8);
        gapOffsetDp = clamp(getInt(cr, KEY_GAP_OFFSET_DP, 0), -6, 10);
        topOffsetDp = clamp(getInt(cr, KEY_TOP_OFFSET_DP, 0), -6, 12);
        centerOffsetDp = clamp(getInt(cr, KEY_CENTER_OFFSET_DP, 0), -10, 10);
        expandedWidthDp = clamp(getInt(cr, KEY_EXPANDED_WIDTH_DP, 336), 290, 360);

        catMedia = getInt(cr, KEY_CAT_MEDIA, 1) != 0;
        catTimer = getInt(cr, KEY_CAT_TIMER, 1) != 0;
        catHotspot = getInt(cr, KEY_CAT_HOTSPOT, 1) != 0;
        catDelivery = getInt(cr, KEY_CAT_DELIVERY, 1) != 0;
        catCalls = getInt(cr, KEY_CAT_CALLS, 1) != 0;
        catRecording = getInt(cr, KEY_CAT_RECORDING, 1) != 0;
        catSystem = getInt(cr, KEY_CAT_SYSTEM, 1) != 0;
        catPeek = getInt(cr, KEY_CAT_PEEK, 1) != 0;

        previewNonce = getLong(cr, KEY_PREVIEW_NONCE, 0L);
    }

    public boolean isCategoryAllowed(IslandItem.Category cat) {
        if (cat == null) {
            return true;
        }
        switch (cat) {
            case MEDIA:
                return catMedia;
            case TIMER:
                return catTimer;
            case HOTSPOT:
                return catHotspot;
            case LIVE_DELIVERY:
            case LIVE_RIDE:
            case LIVE_GENERAL:
            case DOWNLOAD:
                return catDelivery;
            case CALL:
                return catCalls;
            case RECORDING:
                return catRecording;
            case FLASH_EVENT:
                return catSystem;
            case NOTIFICATION_PEEK:
                return catPeek;
            default:
                return true;
        }
    }

    private static int getInt(ContentResolver cr, String key, int defVal) {
        try {
            return Settings.Secure.getInt(cr, key, defVal);
        } catch (Throwable ignored) {
            return defVal;
        }
    }

    private static long getLong(ContentResolver cr, String key, long defVal) {
        try {
            return Settings.Secure.getLong(cr, key, defVal);
        } catch (Throwable ignored) {
            return defVal;
        }
    }

    private static int clamp(int val, int min, int max) {
        return Math.max(min, Math.min(max, val));
    }
}
