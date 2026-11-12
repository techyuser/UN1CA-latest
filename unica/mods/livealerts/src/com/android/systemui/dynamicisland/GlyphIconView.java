package com.android.systemui.dynamicisland;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.RectF;
import android.view.View;

/**
 * Self-contained procedural vector glyph renderer (no external R.drawable ID dependency).
 */
public final class GlyphIconView extends View {

    public static final int GLYPH_BOLT = 1;
    public static final int GLYPH_BLUETOOTH = 2;
    public static final int GLYPH_SOUND = 3;
    public static final int GLYPH_VIBRATE = 4;
    public static final int GLYPH_SILENT = 5;
    public static final int GLYPH_HOTSPOT = 6;
    public static final int GLYPH_REC = 7;
    public static final int GLYPH_CALL = 8;
    public static final int GLYPH_PREV = 9;
    public static final int GLYPH_PLAY = 10;
    public static final int GLYPH_PAUSE = 11;
    public static final int GLYPH_NEXT = 12;
    public static final int GLYPH_CHEVRON_UP = 13;
    public static final int GLYPH_TIMER = 14;

    private final Paint mFillPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint mStrokePaint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Path mPath = new Path();
    private final RectF mRect = new RectF();

    private int mKind = 0;
    private int mColor = 0xFFFFFFFF;

    public GlyphIconView(Context context) {
        super(context);
        mFillPaint.setStyle(Paint.Style.FILL);
        mFillPaint.setColor(mColor);
        mStrokePaint.setStyle(Paint.Style.STROKE);
        mStrokePaint.setStrokeCap(Paint.Cap.ROUND);
        mStrokePaint.setStrokeJoin(Paint.Join.ROUND);
        mStrokePaint.setColor(mColor);
    }

    public void setGlyph(int kind, int color) {
        if (mKind != kind || mColor != color) {
            mKind = kind;
            mColor = color;
            mFillPaint.setColor(color);
            mStrokePaint.setColor(color);
            invalidate();
        }
    }

    @Override
    protected void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        int w = getWidth();
        int h = getHeight();
        if (w <= 0 || h <= 0 || mKind == 0) {
            return;
        }
        float s = Math.min(w, h);
        float ox = (w - s) * 0.5f;
        float oy = (h - s) * 0.5f;
        mStrokePaint.setStrokeWidth(Math.max(1.8f, s * 0.11f));

        switch (mKind) {
            case GLYPH_BOLT: {
                mPath.reset();
                mPath.moveTo(ox + s * 0.58f, oy + s * 0.10f);
                mPath.lineTo(ox + s * 0.24f, oy + s * 0.54f);
                mPath.lineTo(ox + s * 0.48f, oy + s * 0.54f);
                mPath.lineTo(ox + s * 0.40f, oy + s * 0.90f);
                mPath.lineTo(ox + s * 0.76f, oy + s * 0.44f);
                mPath.lineTo(ox + s * 0.52f, oy + s * 0.44f);
                mPath.close();
                canvas.drawPath(mPath, mFillPaint);
                break;
            }
            case GLYPH_BLUETOOTH: {
                mPath.reset();
                float cx = ox + s * 0.50f;
                mPath.moveTo(cx - s * 0.18f, oy + s * 0.30f);
                mPath.lineTo(cx + s * 0.20f, oy + s * 0.68f);
                mPath.lineTo(cx, oy + s * 0.86f);
                mPath.lineTo(cx, oy + s * 0.14f);
                mPath.lineTo(cx + s * 0.20f, oy + s * 0.32f);
                mPath.lineTo(cx - s * 0.18f, oy + s * 0.70f);
                canvas.drawPath(mPath, mStrokePaint);
                break;
            }
            case GLYPH_SOUND: {
                float cx = ox + s * 0.5f;
                float cy = oy + s * 0.5f;
                canvas.drawCircle(cx, cy, s * 0.16f, mFillPaint);
                mRect.set(cx - s * 0.36f, cy - s * 0.36f, cx + s * 0.36f, cy + s * 0.36f);
                canvas.drawArc(mRect, -40f, 80f, false, mStrokePaint);
                canvas.drawArc(mRect, 140f, 80f, false, mStrokePaint);
                break;
            }
            case GLYPH_VIBRATE: {
                mRect.set(ox + s * 0.34f, oy + s * 0.20f, ox + s * 0.66f, oy + s * 0.80f);
                canvas.drawRoundRect(mRect, s * 0.08f, s * 0.08f, mStrokePaint);
                canvas.drawLine(ox + s * 0.18f, oy + s * 0.34f, ox + s * 0.18f, oy + s * 0.66f, mStrokePaint);
                canvas.drawLine(ox + s * 0.82f, oy + s * 0.34f, ox + s * 0.82f, oy + s * 0.66f, mStrokePaint);
                break;
            }
            case GLYPH_SILENT: {
                canvas.drawCircle(ox + s * 0.5f, oy + s * 0.5f, s * 0.30f, mStrokePaint);
                canvas.drawLine(ox + s * 0.24f, oy + s * 0.24f, ox + s * 0.76f, oy + s * 0.76f, mStrokePaint);
                break;
            }
            case GLYPH_HOTSPOT: {
                float cx = ox + s * 0.5f;
                float cy = oy + s * 0.54f;
                canvas.drawCircle(cx, cy, s * 0.11f, mFillPaint);
                mRect.set(cx - s * 0.25f, cy - s * 0.25f, cx + s * 0.25f, cy + s * 0.25f);
                canvas.drawArc(mRect, -220f, 260f, false, mStrokePaint);
                mRect.set(cx - s * 0.40f, cy - s * 0.40f, cx + s * 0.40f, cy + s * 0.40f);
                canvas.drawArc(mRect, -210f, 240f, false, mStrokePaint);
                break;
            }
            case GLYPH_REC: {
                float cx = ox + s * 0.5f;
                float cy = oy + s * 0.5f;
                canvas.drawCircle(cx, cy, s * 0.36f, mStrokePaint);
                canvas.drawCircle(cx, cy, s * 0.19f, mFillPaint);
                break;
            }
            case GLYPH_CALL: {
                mPath.reset();
                mPath.moveTo(ox + s * 0.28f, oy + s * 0.22f);
                mPath.quadTo(ox + s * 0.20f, oy + s * 0.45f, ox + s * 0.40f, oy + s * 0.64f);
                mPath.quadTo(ox + s * 0.58f, oy + s * 0.82f, ox + s * 0.78f, oy + s * 0.72f);
                canvas.drawPath(mPath, mStrokePaint);
                canvas.drawCircle(ox + s * 0.30f, oy + s * 0.24f, s * 0.09f, mFillPaint);
                canvas.drawCircle(ox + s * 0.76f, oy + s * 0.70f, s * 0.09f, mFillPaint);
                break;
            }
            case GLYPH_PLAY: {
                mPath.reset();
                mPath.moveTo(ox + s * 0.30f, oy + s * 0.20f);
                mPath.lineTo(ox + s * 0.80f, oy + s * 0.50f);
                mPath.lineTo(ox + s * 0.30f, oy + s * 0.80f);
                mPath.close();
                canvas.drawPath(mPath, mFillPaint);
                break;
            }
            case GLYPH_PAUSE: {
                float r = s * 0.05f;
                mRect.set(ox + s * 0.27f, oy + s * 0.22f, ox + s * 0.43f, oy + s * 0.78f);
                canvas.drawRoundRect(mRect, r, r, mFillPaint);
                mRect.set(ox + s * 0.57f, oy + s * 0.22f, ox + s * 0.73f, oy + s * 0.78f);
                canvas.drawRoundRect(mRect, r, r, mFillPaint);
                break;
            }
            case GLYPH_PREV: {
                float r = s * 0.04f;
                mRect.set(ox + s * 0.20f, oy + s * 0.24f, ox + s * 0.30f, oy + s * 0.76f);
                canvas.drawRoundRect(mRect, r, r, mFillPaint);
                mPath.reset();
                mPath.moveTo(ox + s * 0.76f, oy + s * 0.24f);
                mPath.lineTo(ox + s * 0.34f, oy + s * 0.50f);
                mPath.lineTo(ox + s * 0.76f, oy + s * 0.76f);
                mPath.close();
                canvas.drawPath(mPath, mFillPaint);
                break;
            }
            case GLYPH_NEXT: {
                float r = s * 0.04f;
                mRect.set(ox + s * 0.70f, oy + s * 0.24f, ox + s * 0.80f, oy + s * 0.76f);
                canvas.drawRoundRect(mRect, r, r, mFillPaint);
                mPath.reset();
                mPath.moveTo(ox + s * 0.24f, oy + s * 0.24f);
                mPath.lineTo(ox + s * 0.66f, oy + s * 0.50f);
                mPath.lineTo(ox + s * 0.24f, oy + s * 0.76f);
                mPath.close();
                canvas.drawPath(mPath, mFillPaint);
                break;
            }
            case GLYPH_CHEVRON_UP: {
                mPath.reset();
                mPath.moveTo(ox + s * 0.26f, oy + s * 0.60f);
                mPath.lineTo(ox + s * 0.50f, oy + s * 0.36f);
                mPath.lineTo(ox + s * 0.74f, oy + s * 0.60f);
                canvas.drawPath(mPath, mStrokePaint);
                break;
            }
            case GLYPH_TIMER: {
                float cx = ox + s * 0.5f;
                float cy = oy + s * 0.54f;
                canvas.drawCircle(cx, cy, s * 0.33f, mStrokePaint);
                canvas.drawLine(cx, cy, cx, oy + s * 0.34f, mStrokePaint);
                canvas.drawLine(cx, cy, cx + s * 0.17f, cy + s * 0.11f, mStrokePaint);
                canvas.drawLine(cx - s * 0.12f, oy + s * 0.14f, cx + s * 0.12f, oy + s * 0.14f, mStrokePaint);
                break;
            }
        }
    }
}
