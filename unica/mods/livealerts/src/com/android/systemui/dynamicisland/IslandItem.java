package com.android.systemui.dynamicisland;

import android.app.PendingIntent;
import android.graphics.Bitmap;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.Icon;
import android.media.session.MediaController;

import java.util.ArrayList;
import java.util.List;

/**
 * Unified state snapshot for an OxygenOS-style Live Alert / Dynamic Island entry.
 */
public final class IslandItem {

    public enum Category {
        CALL(100),
        FLASH_EVENT(90),
        TIMER(80),
        RECORDING(76),
        LIVE_DELIVERY(72),   // Zomato, Swiggy, Blinkit, Zepto, Domino's, BigBasket
        LIVE_RIDE(70),       // Uber, Ola, Rapido, Maps navigation
        HOTSPOT(65),
        LIVE_GENERAL(62),    // Promoted ongoing, flights, sports, custom ongoing progress
        DOWNLOAD(58),
        MEDIA(50),
        NOTIFICATION_PEEK(40);

        public final int priority;

        Category(int priority) {
            this.priority = priority;
        }
    }

    public static final class ActionItem {
        public final String label;
        public final PendingIntent intent;
        public final Icon icon;

        public ActionItem(String label, PendingIntent intent, Icon icon) {
            this.label = label;
            this.intent = intent;
            this.icon = icon;
        }
    }

    public String key;
    public Category category;
    public int accentColor = 0xFF30D158;
    public boolean transientItem;
    public boolean quietUpdate;
    public long expiresAtElapsedMs;

    public String appName = "";
    public String title = "";
    public String subtitle = "";
    public String compactRightText = "";

    public Bitmap artwork;
    public Drawable iconDrawable;
    public int vectorKind; // 0=none/icon, 1=bolt, 2=bt, 3=sound, 4=vibrate, 5=silent, 6=hotspot, 7=rec, 8=call, 14=timer, 15=delivery, 16=ride

    public boolean showWaveform;
    public boolean waveformPlaying;

    public boolean hasChronometer;
    public boolean chronometerCountDown;
    public long chronometerBaseElapsedMs;

    public boolean hasProgress;
    public long progressValue;
    public long progressMax;
    public boolean canSeekMedia;
    public float mediaSpeed = 1.0f;
    public long mediaPositionUpdateElapsedMs;

    public PendingIntent contentIntent;
    public MediaController mediaController;
    public final List<ActionItem> actions = new ArrayList<>(3);

    public IslandItem(String key, Category category) {
        this.key = key;
        this.category = category;
    }

    public int priority() {
        return category != null ? category.priority : 0;
    }
}
