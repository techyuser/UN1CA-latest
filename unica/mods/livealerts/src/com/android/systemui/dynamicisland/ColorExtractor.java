package com.android.systemui.dynamicisland;

import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffXfermode;
import android.graphics.Rect;
import android.graphics.RectF;

/**
 * Lightweight accent color extraction and rounded artwork clipping utilities.
 */
public final class ColorExtractor {

    private ColorExtractor() {
    }

    public static int extractVibrantAccent(Bitmap bmp, int fallback) {
        if (bmp == null || bmp.isRecycled() || bmp.getWidth() <= 0 || bmp.getHeight() <= 0) {
            return fallback;
        }
        try {
            Bitmap small = Bitmap.createScaledBitmap(bmp, 12, 12, false);
            float[] hsv = new float[3];
            float bestScore = -1f;
            int bestColor = fallback;

            int w = small.getWidth();
            int h = small.getHeight();
            for (int y = 0; y < h; y++) {
                for (int x = 0; x < w; x++) {
                    int px = small.getPixel(x, y);
                    if (Color.alpha(px) < 180) {
                        continue;
                    }
                    Color.colorToHSV(px, hsv);
                    float sat = hsv[1];
                    float val = hsv[2];
                    if (val < 0.2f || val > 0.96f) {
                        continue;
                    }
                    float score = (sat * 2.2f) + (val * 0.7f);
                    if (score > bestScore) {
                        bestScore = score;
                        bestColor = px;
                    }
                }
            }
            if (small != bmp) {
                small.recycle();
            }
            if (bestScore < 0f) {
                return fallback;
            }
            Color.colorToHSV(bestColor, hsv);
            hsv[1] = Math.max(0.45f, Math.min(0.88f, hsv[1]));
            hsv[2] = Math.max(0.72f, Math.min(0.95f, hsv[2]));
            return Color.HSVToColor(0xFF, hsv);
        } catch (Throwable ignored) {
            return fallback;
        }
    }

    public static Bitmap createRoundedSquare(Bitmap src, int sizePx, int radiusPx) {
        if (src == null || src.isRecycled() || sizePx <= 0) {
            return null;
        }
        Bitmap out = Bitmap.createBitmap(sizePx, sizePx, Bitmap.Config.ARGB_8888);
        Canvas canvas = new Canvas(out);
        Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG | Paint.FILTER_BITMAP_FLAG);
        RectF dst = new RectF(0f, 0f, sizePx, sizePx);
        canvas.drawRoundRect(dst, radiusPx, radiusPx, paint);
        paint.setXfermode(new PorterDuffXfermode(PorterDuff.Mode.SRC_IN));

        int sw = src.getWidth();
        int sh = src.getHeight();
        int min = Math.min(sw, sh);
        int left = (sw - min) / 2;
        int top = (sh - min) / 2;
        Rect srcRect = new Rect(left, top, left + min, top + min);
        canvas.drawBitmap(src, srcRect, dst, paint);
        return out;
    }
}
