package com.android.systemui.dynamicisland;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.os.SystemClock;
import android.view.Choreographer;
import android.view.View;

/**
 * 120Hz Choreographer-synced 5-bar OxygenOS fluid audio spectrum visualizer.
 * Pauses frame callbacks immediately when stopped or hidden.
 */
public final class WaveformView extends View {

    private final Paint mPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final float[] mPhaseOffsets = {0.2f, 1.85f, 3.3f, 0.95f, 2.4f};
    private final float[] mSpeeds = {5.2f, 7.1f, 6.0f, 7.8f, 4.9f};

    private int mAccentColor = 0xFF1ED760;
    private boolean mAnimating = false;
    private boolean mAttached = false;
    private long mLastFrameMs = 0L;

    private final Choreographer.FrameCallback mFrameCallback = new Choreographer.FrameCallback() {
        @Override
        public void doFrame(long frameTimeNanos) {
            if (!mAnimating || !mAttached || getVisibility() != VISIBLE) {
                return;
            }
            long now = SystemClock.uptimeMillis();
            if (now - mLastFrameMs >= 24L) {
                mLastFrameMs = now;
                invalidate();
            }
            Choreographer.getInstance().postFrameCallback(this);
        }
    };

    public WaveformView(Context context) {
        super(context);
        mPaint.setStyle(Paint.Style.FILL);
        mPaint.setColor(mAccentColor);
    }

    public void setAccentColor(int color) {
        if (mAccentColor != color) {
            mAccentColor = color;
            mPaint.setColor(color);
            invalidate();
        }
    }

    public void setAnimating(boolean animating) {
        if (mAnimating == animating) {
            return;
        }
        mAnimating = animating;
        Choreographer.getInstance().removeFrameCallback(mFrameCallback);
        if (mAnimating && mAttached && getVisibility() == VISIBLE) {
            Choreographer.getInstance().postFrameCallback(mFrameCallback);
        }
        invalidate();
    }

    @Override
    protected void onAttachedToWindow() {
        super.onAttachedToWindow();
        mAttached = true;
        if (mAnimating && getVisibility() == VISIBLE) {
            Choreographer.getInstance().postFrameCallback(mFrameCallback);
        }
    }

    @Override
    protected void onDetachedFromWindow() {
        mAttached = false;
        Choreographer.getInstance().removeFrameCallback(mFrameCallback);
        super.onDetachedFromWindow();
    }

    @Override
    public void setVisibility(int visibility) {
        super.setVisibility(visibility);
        Choreographer.getInstance().removeFrameCallback(mFrameCallback);
        if (visibility == VISIBLE && mAnimating && mAttached) {
            Choreographer.getInstance().postFrameCallback(mFrameCallback);
        }
    }

    @Override
    protected void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        int w = getWidth();
        int h = getHeight();
        if (w <= 0 || h <= 0) {
            return;
        }
        int bars = 5;
        float barWidth = Math.max(2f, w / 11.5f);
        float totalBarsWidth = bars * barWidth;
        float gap = (w - totalBarsWidth) / (bars - 1);
        float minH = Math.max(barWidth * 1.15f, h * 0.22f);
        float maxH = h * 0.92f;
        float centerY = h * 0.5f;
        float radius = barWidth * 0.5f;

        float t = SystemClock.uptimeMillis() / 1000.0f;
        for (int i = 0; i < bars; i++) {
            float factor;
            if (mAnimating) {
                double s = Math.sin(t * mSpeeds[i] + mPhaseOffsets[i]);
                float env = (i == 0 || i == 4) ? 0.72f : 1.0f;
                factor = (0.18f + 0.82f * (float) (0.5 + 0.5 * s)) * env;
            } else {
                factor = (i == 2) ? 0.42f : ((i == 1 || i == 3) ? 0.30f : 0.20f);
            }
            float bh = minH + (maxH - minH) * factor;
            float left = i * (barWidth + gap);
            float top = centerY - bh * 0.5f;
            float right = left + barWidth;
            float bottom = centerY + bh * 0.5f;
            canvas.drawRoundRect(left, top, right, bottom, radius, radius, mPaint);
        }
    }
}
