package com.android.systemui.dynamicisland;

import android.app.Notification;
import android.content.Context;
import android.content.pm.PackageManager;
import android.graphics.Bitmap;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.Icon;
import android.os.Bundle;
import android.os.SystemClock;
import android.service.notification.StatusBarNotification;
import android.text.TextUtils;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Chronometer;
import android.widget.FrameLayout;
import android.widget.ProgressBar;
import android.widget.RemoteViews;
import android.widget.TextView;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Full OxygenOS Live Alerts style StatusBarNotification parser.
 * Supports Samsung/Google Clock (Chronometer + custom RemoteViews),
 * Zomato / Swiggy / Blinkit / Zepto / Domino's / BigBasket delivery tracking,
 * Uber / Ola / Rapido / Google Maps / Flights / Promoted Ongoing Live Updates,
 * Ongoing Calls, Screen/Voice Recording, Downloads, and Smart Heads-Up Peeks.
 */
public final class NotificationIslandSource {

    public interface Listener {
        void onItemUpdated(IslandItem item);
        void onItemRemoved(String key);
    }

    private static final int FLAG_PROMOTED_ONGOING = 1 << 13; // Android 16 Live Updates flag
    private static final Pattern ETA_PATTERN = Pattern.compile(
            "\\b(\\d{1,3}\\s*(?:min(?:ute)?s?|hr(?:s)?|sec(?:ond)?s?|m|h))\\b",
            Pattern.CASE_INSENSITIVE
    );
    private static final Pattern TIME_PATTERN = Pattern.compile(
            "\\b(?:(\\d{1,2}):)?([0-5]?\\d):([0-5]\\d)\\b"
    );

    private static final Set<String> CLOCK_PACKAGES = new HashSet<>();
    private static final Map<String, BrandProfile> BRAND_PROFILES = new HashMap<>();
    private static final Set<String> SYSTEM_NOISE_PACKAGES = new HashSet<>();

    static {
        CLOCK_PACKAGES.add("com.sec.android.app.clockpackage");
        CLOCK_PACKAGES.add("com.google.android.deskclock");
        CLOCK_PACKAGES.add("com.android.deskclock");
        CLOCK_PACKAGES.add("com.oneplus.deskclock");
        CLOCK_PACKAGES.add("com.coloros.alarmclock");

        // Delivery & Food Live Alerts
        BRAND_PROFILES.put("com.application.zomato", new BrandProfile(IslandItem.Category.LIVE_DELIVERY, 0xFFE23744, "Zomato"));
        BRAND_PROFILES.put("in.swiggy.android", new BrandProfile(IslandItem.Category.LIVE_DELIVERY, 0xFFFC8019, "Swiggy"));
        BRAND_PROFILES.put("com.grofers.customerapp", new BrandProfile(IslandItem.Category.LIVE_DELIVERY, 0xFFF8CB46, "Blinkit"));
        BRAND_PROFILES.put("com.zeptoconsumerapp", new BrandProfile(IslandItem.Category.LIVE_DELIVERY, 0xFFB042FF, "Zepto"));
        BRAND_PROFILES.put("com.bigbasket.mobileapp", new BrandProfile(IslandItem.Category.LIVE_DELIVERY, 0xFF84C225, "BigBasket"));
        BRAND_PROFILES.put("com.Dominos", new BrandProfile(IslandItem.Category.LIVE_DELIVERY, 0xFF006491, "Domino's"));
        BRAND_PROFILES.put("in.co.mcdonalds.consumer", new BrandProfile(IslandItem.Category.LIVE_DELIVERY, 0xFFFFBC0D, "McDelivery"));
        BRAND_PROFILES.put("com.done.faasos", new BrandProfile(IslandItem.Category.LIVE_DELIVERY, 0xFF7B3CE9, "EatSure"));
        BRAND_PROFILES.put("com.magicpin.android", new BrandProfile(IslandItem.Category.LIVE_DELIVERY, 0xFF7C4DFF, "magicpin"));
        BRAND_PROFILES.put("com.flipkart.android", new BrandProfile(IslandItem.Category.LIVE_DELIVERY, 0xFF2874F0, "Flipkart"));
        BRAND_PROFILES.put("in.amazon.mShop.android.shopping", new BrandProfile(IslandItem.Category.LIVE_DELIVERY, 0xFFFF9900, "Amazon"));

        // Rides, Cabs, Transit, Flights & Navigation
        BRAND_PROFILES.put("com.ubercab", new BrandProfile(IslandItem.Category.LIVE_RIDE, 0xFF38C976, "Uber"));
        BRAND_PROFILES.put("com.olacabs.customer", new BrandProfile(IslandItem.Category.LIVE_RIDE, 0xFFC5E82E, "Ola"));
        BRAND_PROFILES.put("com.rapido.passenger", new BrandProfile(IslandItem.Category.LIVE_RIDE, 0xFFF9C935, "Rapido"));
        BRAND_PROFILES.put("in.juspay.nammayatri", new BrandProfile(IslandItem.Category.LIVE_RIDE, 0xFFFCC014, "Namma Yatri"));
        BRAND_PROFILES.put("sinet.startup.inDriver", new BrandProfile(IslandItem.Category.LIVE_RIDE, 0xFFC1F11D, "inDrive"));
        BRAND_PROFILES.put("com.blusmart.cab", new BrandProfile(IslandItem.Category.LIVE_RIDE, 0xFF00D084, "BluSmart"));
        BRAND_PROFILES.put("com.google.android.apps.maps", new BrandProfile(IslandItem.Category.LIVE_RIDE, 0xFF34A853, "Maps"));
        BRAND_PROFILES.put("com.waze", new BrandProfile(IslandItem.Category.LIVE_RIDE, 0xFF33CCFF, "Waze"));
        BRAND_PROFILES.put("com.whereismytrain.android", new BrandProfile(IslandItem.Category.LIVE_RIDE, 0xFF2F80ED, "Train"));
        BRAND_PROFILES.put("cris.org.in.prs.ima", new BrandProfile(IslandItem.Category.LIVE_RIDE, 0xFF2B6CB0, "IRCTC"));
        BRAND_PROFILES.put("com.makemytrip", new BrandProfile(IslandItem.Category.LIVE_RIDE, 0xFFE53E3E, "Trip"));

        // System Noise Exclusions for general fallback ongoing matcher
        SYSTEM_NOISE_PACKAGES.add("com.android.systemui");
        SYSTEM_NOISE_PACKAGES.add("android");
        SYSTEM_NOISE_PACKAGES.add("com.samsung.android.MtpApplication");
        SYSTEM_NOISE_PACKAGES.add("com.samsung.android.mdx");
        SYSTEM_NOISE_PACKAGES.add("com.samsung.android.app.sharelive");
        SYSTEM_NOISE_PACKAGES.add("com.google.android.gms");
        SYSTEM_NOISE_PACKAGES.add("com.sec.android.app.launcher");
    }

    private static final class BrandProfile {
        final IslandItem.Category category;
        final int accentColor;
        final String shortBrand;

        BrandProfile(IslandItem.Category category, int accentColor, String shortBrand) {
            this.category = category;
            this.accentColor = accentColor;
            this.shortBrand = shortBrand;
        }
    }

    private static final class ExtractedRemoteData {
        boolean hasChrono = false;
        long chronoBase = 0L;
        boolean chronoCountDown = false;
        boolean chronoStarted = true;
        long parsedChronoMs = -1L;
        int prog = -1;
        int maxProg = 0;
        final List<String> texts = new ArrayList<>();
    }

    private static boolean sActionsProbed = false;
    private static Field sActionsField;
    private static Field sChronoStartedField;

    private final Context mContext;
    private final Listener mListener;
    private final Map<String, Long> mRecentPeeks = new HashMap<>();
    private final Set<String> mActiveOngoingKeys = new HashSet<>();

    public NotificationIslandSource(Context context, Listener listener) {
        mContext = context.getApplicationContext();
        mListener = listener;
    }

    public void onPosted(StatusBarNotification sbn) {
        if (sbn == null || sbn.getNotification() == null) {
            return;
        }
        Notification n = sbn.getNotification();
        if ((n.flags & Notification.FLAG_GROUP_SUMMARY) != 0) {
            return;
        }

        String pkg = sbn.getPackageName();
        String key = "sbn:" + sbn.getKey();
        Bundle extras = n.extras != null ? n.extras : Bundle.EMPTY;

        // Media sessions are handled directly with high fidelity by MediaIslandSource
        if (extras.containsKey("android.mediaSession")) {
            return;
        }

        boolean isOngoing = sbn.isOngoing()
                || (n.flags & Notification.FLAG_ONGOING_EVENT) != 0
                || (n.flags & FLAG_PROMOTED_ONGOING) != 0;
        boolean alreadyTracked = mActiveOngoingKeys.contains(key);

        String title = safeString(extras.getCharSequence(Notification.EXTRA_TITLE));
        if (TextUtils.isEmpty(title)) {
            title = safeString(extras.getCharSequence(Notification.EXTRA_TITLE_BIG));
        }
        String text = safeString(extras.getCharSequence(Notification.EXTRA_TEXT));
        if (TextUtils.isEmpty(text)) {
            text = safeString(extras.getCharSequence(Notification.EXTRA_BIG_TEXT));
        }
        String subText = safeString(extras.getCharSequence(Notification.EXTRA_SUB_TEXT));
        String shortCritical = safeString(extras.getCharSequence("android.shortCriticalText"));

        boolean showChrono = extras.getBoolean(Notification.EXTRA_SHOW_CHRONOMETER, false) && n.when > 0L;
        boolean countDown = extras.getBoolean(Notification.EXTRA_CHRONOMETER_COUNT_DOWN, false);
        long chronoBaseElapsed = showChrono ? wallToElapsed(n.when) : 0L;
        boolean chronoRunning = true;

        int maxProg = extras.getInt(Notification.EXTRA_PROGRESS_MAX, 0);
        int prog = extras.getInt(Notification.EXTRA_PROGRESS, 0);
        boolean indeterminate = extras.getBoolean(Notification.EXTRA_PROGRESS_INDETERMINATE, false);

        boolean isClockPkg = isClockApp(pkg);
        BrandProfile profile = BRAND_PROFILES.get(pkg);

        // Extract standard RemoteViews (plus headless timer chronometer fallback for Clock apps only)
        RemoteViews clockChronoRv = isClockPkg
                ? getRemoteViewExtra(extras, "android.ongoingActivityNoti.chronometerRemoteView")
                : null;
        boolean hasAnyRv = clockChronoRv != null
                || n.contentView != null || n.bigContentView != null || n.headsUpContentView != null;
        if (isOngoing && hasAnyRv
                && (isClockPkg || profile != null || !showChrono || TextUtils.isEmpty(title) || TextUtils.isEmpty(text))) {
            ExtractedRemoteData rv = extractFromAllRemoteViews(pkg,
                    clockChronoRv, n.bigContentView, n.contentView, n.headsUpContentView);
            if (rv != null) {
                if (!showChrono && rv.hasChrono) {
                    showChrono = true;
                    countDown = rv.chronoCountDown;
                    chronoBaseElapsed = rv.chronoBase;
                    chronoRunning = rv.chronoStarted;
                }
                if (!showChrono && rv.parsedChronoMs >= 0L) {
                    showChrono = true;
                    String combinedClock = (title + " " + text + " " + TextUtils.join(" ", rv.texts)).toLowerCase();
                    countDown = isClockPkg ? (!combinedClock.contains("stopwatch") && !combinedClock.contains("elapsed")) : true;
                    chronoBaseElapsed = countDown
                            ? (SystemClock.elapsedRealtime() + rv.parsedChronoMs)
                            : (SystemClock.elapsedRealtime() - rv.parsedChronoMs);
                    chronoRunning = !combinedClock.contains("paused");
                }
                if (maxProg <= 0 && rv.maxProg > 0 && rv.prog >= 0) {
                    maxProg = rv.maxProg;
                    prog = rv.prog;
                    indeterminate = false;
                }
                if (TextUtils.isEmpty(title) && !rv.texts.isEmpty()) {
                    title = rv.texts.get(0);
                }
                if (TextUtils.isEmpty(text) && rv.texts.size() > 1) {
                    text = rv.texts.get(1);
                }
                if (isClockPkg && TextUtils.isEmpty(text) && !rv.texts.isEmpty()) {
                    text = TextUtils.join(" • ", rv.texts.subList(0, Math.min(2, rv.texts.size())));
                }
            }
        }

        // Parse "MM:SS" / "HH:MM:SS" out of Clock/Chip text if Chronometer object wasn't attached
        if (isOngoing && isClockPkg && !showChrono) {
            long parsed = parseTimeStringMs(title + " " + text + " " + shortCritical);
            if (parsed >= 0L) {
                showChrono = true;
                String lowClock = (title + " " + text + " " + shortCritical).toLowerCase();
                countDown = !lowClock.contains("stopwatch") && !lowClock.contains("elapsed");
                chronoBaseElapsed = countDown
                        ? (SystemClock.elapsedRealtime() + parsed)
                        : (SystemClock.elapsedRealtime() - parsed);
                chronoRunning = !lowClock.contains("paused");
            }
        }

        // 1. Ongoing Call
        if (Notification.CATEGORY_CALL.equals(n.category) && isOngoing) {
            IslandItem item = buildBase(key, IslandItem.Category.CALL, sbn, n, title, text);
            item.vectorKind = GlyphIconView.GLYPH_CALL;
            item.accentColor = 0xFF30D158;
            item.quietUpdate = alreadyTracked;
            if (showChrono) {
                item.hasChronometer = true;
                item.chronometerCountDown = false;
                item.chronometerBaseElapsedMs = chronoBaseElapsed;
            } else {
                item.compactRightText = !TextUtils.isEmpty(title) ? title : "In Call";
            }
            mActiveOngoingKeys.add(key);
            mListener.onItemUpdated(item);
            return;
        }

        // 2. Screen Recorder / Voice Recorder
        if (isOngoing && isRecorderPackageOrTag(pkg, sbn.getTag(), title, text)) {
            IslandItem item = buildBase(key, IslandItem.Category.RECORDING, sbn, n, title, text);
            item.vectorKind = GlyphIconView.GLYPH_REC;
            item.accentColor = 0xFFFF453A;
            item.quietUpdate = alreadyTracked;
            if (showChrono) {
                item.hasChronometer = true;
                item.chronometerCountDown = false;
                item.chronometerBaseElapsedMs = chronoBaseElapsed;
            } else {
                item.compactRightText = "REC";
            }
            mActiveOngoingKeys.add(key);
            mListener.onItemUpdated(item);
            return;
        }

        // 3. Samsung Clock / Google Clock Timers, Stopwatch & Alarms
        if (isOngoing && (isClockPkg || showChrono)) {
            String fallbackTitle = isClockPkg ? "Timer" : resolveAppName(pkg);
            String clockTitle = !TextUtils.isEmpty(title) ? title : fallbackTitle;
            String clockSub = !TextUtils.isEmpty(text) ? text : (!TextUtils.isEmpty(subText) ? subText : fallbackTitle);
            if (isClockPkg && !showChrono && TextUtils.isEmpty(title) && TextUtils.isEmpty(text)) {
                return; // skip empty dummy wake lock placeholder if Clock hasn't populated view yet
            }
            IslandItem item = buildBase(key, IslandItem.Category.TIMER, sbn, n, clockTitle, clockSub);
            item.accentColor = 0xFFFF9F0A;
            item.quietUpdate = alreadyTracked;
            if (isClockPkg || item.iconDrawable == null) {
                item.vectorKind = 14;
            }
            if (showChrono && chronoRunning) {
                item.hasChronometer = true;
                item.chronometerCountDown = countDown;
                item.chronometerBaseElapsedMs = chronoBaseElapsed;
                if (TextUtils.isEmpty(text)) {
                    item.subtitle = countDown ? "Countdown running" : "Stopwatch running";
                }
            } else if (showChrono) {
                long now = SystemClock.elapsedRealtime();
                long frozen = countDown ? Math.max(0L, chronoBaseElapsed - now) : Math.max(0L, now - chronoBaseElapsed);
                item.compactRightText = formatTimerMs(frozen);
                item.subtitle = !TextUtils.isEmpty(text) ? (text + " • Paused") : "Paused";
            } else {
                item.compactRightText = !TextUtils.isEmpty(shortCritical)
                        ? shortCritical
                        : (!TextUtils.isEmpty(text) ? text : clockTitle);
            }
            mActiveOngoingKeys.add(key);
            mListener.onItemUpdated(item);
            return;
        }

        // 4. Zomato / Swiggy / Blinkit / Zepto / Uber / Ola / Rapido / Maps (Full OxygenOS Live Alerts profiles!)
        if (isOngoing && profile != null) {
            String mainTitle = !TextUtils.isEmpty(title) ? title : profile.shortBrand;
            String mainSub = !TextUtils.isEmpty(text) ? text : (!TextUtils.isEmpty(subText) ? subText : "Live update");
            if (isIrrelevantLiveService(mainTitle + " " + mainSub)) {
                if (alreadyTracked) {
                    mActiveOngoingKeys.remove(key);
                    mListener.onItemRemoved(key);
                }
                return;
            }

            IslandItem item = buildBase(key, profile.category, sbn, n, mainTitle, mainSub);
            item.appName = profile.shortBrand;
            item.accentColor = profile.accentColor;
            item.quietUpdate = alreadyTracked;

            if (maxProg > 0 && !indeterminate) {
                item.hasProgress = true;
                item.progressValue = prog;
                item.progressMax = maxProg;
            }

            String badge = extractCompactLiveBadge(shortCritical, mainTitle, mainSub, profile.shortBrand);
            item.compactRightText = badge;

            mActiveOngoingKeys.add(key);
            mListener.onItemUpdated(item);
            return;
        }

        // 5. Downloads / Determinate Progress
        if (isOngoing && maxProg > 0 && !indeterminate && !isSystemNoise(pkg, title, text)) {
            int pct = Math.max(0, Math.min(100, Math.round((prog * 100f) / maxProg)));
            IslandItem item = buildBase(key, IslandItem.Category.DOWNLOAD, sbn, n, title, text);
            item.accentColor = 0xFF0A84FF;
            item.quietUpdate = alreadyTracked;
            item.hasProgress = true;
            item.progressValue = prog;
            item.progressMax = maxProg;
            item.compactRightText = pct + "%";
            mActiveOngoingKeys.add(key);
            mListener.onItemUpdated(item);
            return;
        }

        // 6. General Promoted Ongoing / Android 16 Live Updates / Ride / Delivery / Sports fallback
        if (isOngoing) {
            if (pkg != null && isSystemNoise(pkg, title, text) && (pkg.equals("android") || pkg.startsWith("com.android.") || pkg.startsWith("com.samsung.android."))) {
                if (alreadyTracked) {
                    mActiveOngoingKeys.remove(key);
                    mListener.onItemRemoved(key);
                }
                return;
            }
            boolean promoted = (n.flags & FLAG_PROMOTED_ONGOING) != 0
                    || !TextUtils.isEmpty(shortCritical)
                    || "navigation".equals(n.category)
                    || "progress".equals(n.category)
                    || "stopwatch".equals(n.category)
                    || "workout".equals(n.category)
                    || (!isSystemNoise(pkg, title, text) && looksLikeLiveDeliveryOrRide(title + " " + text));
            if (promoted && (!TextUtils.isEmpty(title) || !TextUtils.isEmpty(text) || showChrono)) {
                IslandItem item = buildBase(key, IslandItem.Category.LIVE_GENERAL, sbn, n, title, text);
                int fallbackColor = n.color != 0 ? (0xFF000000 | n.color) : 0xFF32ADE6;
                item.accentColor = fallbackColor;
                item.quietUpdate = alreadyTracked;
                if (showChrono && chronoRunning) {
                    item.hasChronometer = true;
                    item.chronometerCountDown = countDown;
                    item.chronometerBaseElapsedMs = chronoBaseElapsed;
                } else {
                    item.compactRightText = extractCompactLiveBadge(shortCritical, title, text, resolveAppName(pkg));
                }
                if (maxProg > 0 && !indeterminate) {
                    item.hasProgress = true;
                    item.progressValue = prog;
                    item.progressMax = maxProg;
                }
                mActiveOngoingKeys.add(key);
                mListener.onItemUpdated(item);
                return;
            }

            if (alreadyTracked) {
                mActiveOngoingKeys.remove(key);
                mListener.onItemRemoved(key);
            }
            return;
        }

        // 7. Non-ongoing fresh notification quick peek (Messages / WhatsApp / Alerts)
        if ("com.android.systemui".equals(pkg) || "android".equals(pkg)) {
            return;
        }
        if (Notification.CATEGORY_TRANSPORT.equals(n.category)
                || Notification.CATEGORY_SYSTEM.equals(n.category)
                || Notification.CATEGORY_SERVICE.equals(n.category)) {
            return;
        }
        if (TextUtils.isEmpty(title) && TextUtils.isEmpty(text)) {
            return;
        }

        long now = SystemClock.elapsedRealtime();
        Long last = mRecentPeeks.get(key);
        if (last != null && (now - last) < 10_000L) {
            return;
        }
        mRecentPeeks.put(key, now);
        if (mRecentPeeks.size() > 64) {
            mRecentPeeks.clear();
        }

        String appName = resolveAppName(pkg);
        IslandItem item = buildBase(key, IslandItem.Category.NOTIFICATION_PEEK, sbn, n,
                !TextUtils.isEmpty(title) ? title : (!TextUtils.isEmpty(subText) ? subText : appName),
                text);
        item.appName = appName;
        item.transientItem = true;
        item.expiresAtElapsedMs = now + 3800L;
        item.accentColor = n.color != 0 ? (0xFF000000 | n.color) : 0xFF64D2FF;
        item.compactRightText = !TextUtils.isEmpty(item.title) ? item.title : appName;
        mListener.onItemUpdated(item);
    }

    public void onRemoved(StatusBarNotification sbn) {
        if (sbn == null) {
            return;
        }
        String key = "sbn:" + sbn.getKey();
        mRecentPeeks.remove(key);
        mActiveOngoingKeys.remove(key);
        mListener.onItemRemoved(key);
    }

    @SuppressWarnings("deprecation")
    private static RemoteViews getRemoteViewExtra(Bundle extras, String key) {
        try {
            Object obj = extras.getParcelable(key);
            return obj instanceof RemoteViews ? (RemoteViews) obj : null;
        } catch (Throwable ignored) {
            return null;
        }
    }

    private ExtractedRemoteData extractFromAllRemoteViews(String pkg, RemoteViews... views) {
        ExtractedRemoteData out = new ExtractedRemoteData();
        Context rvCtx = mContext;
        try {
            if (!TextUtils.isEmpty(pkg) && !pkg.equals(mContext.getPackageName())) {
                rvCtx = mContext.createPackageContext(pkg, Context.CONTEXT_IGNORE_SECURITY);
            }
        } catch (Throwable ignored) {
            rvCtx = mContext;
        }
        FrameLayout container = new FrameLayout(rvCtx);

        for (RemoteViews rv : views) {
            if (rv == null) {
                continue;
            }
            inspectRemoteViewsActions(rv, out);
            try {
                View root = rv.apply(rvCtx, container);
                if (root == null && rvCtx != mContext) {
                    root = rv.apply(mContext, new FrameLayout(mContext));
                }
                if (root != null) {
                    walkViewTree(root, out);
                }
            } catch (Throwable ignored) {
                if (rvCtx != mContext) {
                    try {
                        View root2 = rv.apply(mContext, new FrameLayout(mContext));
                        if (root2 != null) {
                            walkViewTree(root2, out);
                        }
                    } catch (Throwable ignored2) {
                    }
                }
            }
        }
        return out;
    }

    private static void inspectRemoteViewsActions(RemoteViews rv, ExtractedRemoteData out) {
        if (rv == null || out == null) {
            return;
        }
        try {
            if (!sActionsProbed) {
                sActionsProbed = true;
                try {
                    sActionsField = RemoteViews.class.getDeclaredField("mActions");
                    sActionsField.setAccessible(true);
                } catch (Throwable ignored) {
                }
                try {
                    sChronoStartedField = Chronometer.class.getDeclaredField("mStarted");
                    sChronoStartedField.setAccessible(true);
                } catch (Throwable ignored) {
                }
            }
            if (sActionsField == null) {
                return;
            }
            Object rawList = sActionsField.get(rv);
            if (!(rawList instanceof List<?>)) {
                return;
            }
            List<?> actions = (List<?>) rawList;
            for (Object act : actions) {
                if (act == null) {
                    continue;
                }
                Class<?> cls = act.getClass();
                String methodName = readStringField(cls, act, "methodName");
                Object val = readObjectField(cls, act, "value");
                if (methodName != null) {
                    if ("setBase".equals(methodName) && val instanceof Number) {
                        out.hasChrono = true;
                        out.chronoBase = ((Number) val).longValue();
                    } else if ("setCountDown".equals(methodName) && val instanceof Boolean) {
                        out.chronoCountDown = ((Boolean) val).booleanValue();
                    } else if ("setStarted".equals(methodName) && val instanceof Boolean) {
                        out.chronoStarted = ((Boolean) val).booleanValue();
                    } else if (("setText".equals(methodName) || "setTextViewText".equals(methodName))
                            && val instanceof CharSequence) {
                        String s = val.toString().trim();
                        if (!s.isEmpty() && !out.texts.contains(s)) {
                            out.texts.add(s);
                            if (out.parsedChronoMs < 0L) {
                                long parsed = parseTimeStringMs(s);
                                if (parsed >= 0L) {
                                    out.parsedChronoMs = parsed;
                                }
                            }
                        }
                    } else if ("setMax".equals(methodName) && val instanceof Number) {
                        out.maxProg = ((Number) val).intValue();
                    } else if ("setProgress".equals(methodName) && val instanceof Number) {
                        out.prog = ((Number) val).intValue();
                    }
                }
            }
        } catch (Throwable ignored) {
        }
    }

    private static String readStringField(Class<?> cls, Object target, String fieldName) {
        Object v = readObjectField(cls, target, fieldName);
        return v instanceof String ? (String) v : null;
    }

    private static Object readObjectField(Class<?> cls, Object target, String fieldName) {
        Class<?> cur = cls;
        while (cur != null && cur != Object.class) {
            try {
                Field f = cur.getDeclaredField(fieldName);
                f.setAccessible(true);
                return f.get(target);
            } catch (Throwable ignored) {
                cur = cur.getSuperclass();
            }
        }
        return null;
    }

    private static void walkViewTree(View v, ExtractedRemoteData out) {
        if (v == null || v.getVisibility() == View.GONE) {
            return;
        }
        if (v instanceof Chronometer) {
            Chronometer ch = (Chronometer) v;
            out.hasChrono = true;
            if (ch.getBase() > 0L) {
                out.chronoBase = ch.getBase();
            }
            out.chronoCountDown = ch.isCountDown();
            if (sChronoStartedField != null) {
                try {
                    out.chronoStarted = sChronoStartedField.getBoolean(ch);
                } catch (Throwable ignored) {
                }
            }
            CharSequence ct = ch.getText();
            if (!TextUtils.isEmpty(ct)) {
                String cs = ct.toString().trim();
                if (!out.texts.contains(cs)) {
                    out.texts.add(cs);
                }
            }
        } else if (v instanceof ProgressBar && !(v instanceof android.widget.SeekBar)) {
            ProgressBar pb = (ProgressBar) v;
            if (!pb.isIndeterminate() && pb.getMax() > 0) {
                out.prog = pb.getProgress();
                out.maxProg = pb.getMax();
            }
        } else if (v instanceof TextView) {
            CharSequence cs = ((TextView) v).getText();
            if (cs != null) {
                String s = cs.toString().trim();
                if (!s.isEmpty() && !out.texts.contains(s)) {
                    out.texts.add(s);
                    if (out.parsedChronoMs < 0L) {
                        long tMs = parseTimeStringMs(s);
                        if (tMs >= 0L) {
                            out.parsedChronoMs = tMs;
                        }
                    }
                }
            }
        }
        if (v instanceof ViewGroup) {
            ViewGroup vg = (ViewGroup) v;
            for (int i = 0; i < vg.getChildCount(); i++) {
                walkViewTree(vg.getChildAt(i), out);
            }
        }
    }

    private static String formatTimerMs(long ms) {
        long totalSec = Math.max(0L, ms / 1000L);
        long h = totalSec / 3600L;
        long m = (totalSec % 3600L) / 60L;
        long s = totalSec % 60L;
        if (h > 0L) {
            return String.format("%d:%02d:%02d", h, m, s);
        }
        return String.format("%02d:%02d", m, s);
    }

    private static long parseTimeStringMs(String s) {
        if (TextUtils.isEmpty(s)) {
            return -1L;
        }
        Matcher m = TIME_PATTERN.matcher(s);
        if (!m.find()) {
            return -1L;
        }
        try {
            long h = m.group(1) != null ? Long.parseLong(m.group(1)) : 0L;
            long min = Long.parseLong(m.group(2));
            long sec = Long.parseLong(m.group(3));
            return ((h * 3600L) + (min * 60L) + sec) * 1000L;
        } catch (Throwable ignored) {
            return -1L;
        }
    }

    private static String extractCompactLiveBadge(String shortCritical, String title, String sub, String fallbackBrand) {
        if (!TextUtils.isEmpty(shortCritical)) {
            return shortCritical;
        }
        Matcher m = ETA_PATTERN.matcher(title + " " + sub);
        if (m.find()) {
            return m.group(1).replaceAll("\\s+", " ").trim();
        }
        Matcher tm = TIME_PATTERN.matcher(title + " " + sub);
        if (tm.find()) {
            return tm.group(0);
        }
        if (!TextUtils.isEmpty(title) && title.length() <= 16) {
            return title;
        }
        if (!TextUtils.isEmpty(sub) && sub.length() <= 16) {
            return sub;
        }
        return fallbackBrand;
    }

    private static boolean looksLikeLiveDeliveryOrRide(String s) {
        if (TextUtils.isEmpty(s)) {
            return false;
        }
        String low = s.toLowerCase();
        return low.contains("arriving")
                || low.contains("on the way")
                || low.contains("out for delivery")
                || low.contains("picked up")
                || low.contains("preparing")
                || low.contains("driver")
                || low.contains("mins away")
                || low.contains("eta");
    }

    private static boolean isIrrelevantLiveService(String s) {
        if (TextUtils.isEmpty(s)) {
            return false;
        }
        String low = s.toLowerCase();
        return low.contains("notification listener")
                || low.contains("running in background")
                || low.contains("displaying over other");
    }

    private static boolean isSystemNoise(String pkg, String title, String text) {
        if (pkg == null || SYSTEM_NOISE_PACKAGES.contains(pkg)) {
            return true;
        }
        if (pkg.startsWith("com.samsung.android.app.settings") || pkg.equals("com.android.settings")) {
            return true;
        }
        String low = ((title != null ? title : "") + " " + (text != null ? text : "")).toLowerCase();
        return low.contains("usb")
                || low.contains("vpn")
                || low.contains("hotspot")
                || low.contains("tethering")
                || low.contains("charging")
                || low.contains("keyboard")
                || low.contains("battery")
                || low.contains("tap for more options")
                || low.contains("running in the background");
    }

    private static boolean isClockApp(String pkg) {
        if (pkg == null) {
            return false;
        }
        if (CLOCK_PACKAGES.contains(pkg)) {
            return true;
        }
        String low = pkg.toLowerCase();
        return low.contains("clockpackage") || low.contains("deskclock");
    }

    private IslandItem buildBase(String key, IslandItem.Category cat, StatusBarNotification sbn,
                                 Notification n, String title, String subtitle) {
        IslandItem item = new IslandItem(key, cat);
        String pkg = sbn.getPackageName();
        String appName = resolveAppName(pkg);
        item.appName = appName;
        item.title = !TextUtils.isEmpty(title) ? title : appName;
        item.subtitle = !TextUtils.isEmpty(subtitle) ? subtitle : appName;
        item.contentIntent = n.contentIntent;
        item.iconDrawable = loadNotificationDrawable(sbn, n);

        if (n.actions != null) {
            int limit = Math.min(2, n.actions.length);
            for (int i = 0; i < limit; i++) {
                Notification.Action act = n.actions[i];
                if (act != null && !TextUtils.isEmpty(act.title) && act.actionIntent != null) {
                    item.actions.add(new IslandItem.ActionItem(
                            act.title.toString(),
                            act.actionIntent,
                            act.getIcon()
                    ));
                }
            }
        }
        return item;
    }

    @SuppressWarnings("deprecation")
    private Drawable loadNotificationDrawable(StatusBarNotification sbn, Notification n) {
        try {
            Icon large = n.getLargeIcon();
            if (large != null) {
                Drawable d = large.loadDrawable(mContext);
                if (d instanceof BitmapDrawable) {
                    Bitmap b = ((BitmapDrawable) d).getBitmap();
                    if (b != null) {
                        Bitmap rounded = ColorExtractor.createRoundedSquare(b, 128, 32);
                        if (rounded != null) {
                            return new BitmapDrawable(mContext.getResources(), rounded);
                        }
                    }
                }
                if (d != null) {
                    return d;
                }
            }
        } catch (Throwable ignored) {
        }
        try {
            return mContext.getPackageManager().getApplicationIcon(sbn.getPackageName());
        } catch (Throwable ignored) {
        }
        try {
            Icon small = n.getSmallIcon();
            if (small != null) {
                return small.loadDrawable(mContext);
            }
        } catch (Throwable ignored) {
        }
        return null;
    }

    private static boolean isRecorderPackageOrTag(String pkg, String tag, String title, String text) {
        String p = pkg != null ? pkg.toLowerCase() : "";
        String t = tag != null ? tag.toLowerCase() : "";
        String combined = ((title != null ? title : "") + " " + (text != null ? text : "")).toLowerCase();
        if (p.contains("screenrecorder") || p.contains("voicenote") || t.contains("screen_record")) {
            return true;
        }
        return p.contains("smartcapture") && (combined.contains("record") || t.contains("record"));
    }

    private static long wallToElapsed(long wallTimeMs) {
        long delta = wallTimeMs - System.currentTimeMillis();
        return SystemClock.elapsedRealtime() + delta;
    }

    private static String safeString(CharSequence cs) {
        return cs != null ? cs.toString().trim() : "";
    }

    private String resolveAppName(String pkg) {
        if (TextUtils.isEmpty(pkg)) {
            return "App";
        }
        try {
            PackageManager pm = mContext.getPackageManager();
            return String.valueOf(pm.getApplicationLabel(pm.getApplicationInfo(pkg, 0)));
        } catch (Throwable ignored) {
            return "App";
        }
    }
}
