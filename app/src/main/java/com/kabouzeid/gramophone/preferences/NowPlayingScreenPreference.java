package com.kabouzeid.gramophone.preferences;

import android.content.Context;
import android.util.AttributeSet;

import android.preference.DialogPreference;

/**
 * @author Karim Abou Zeid (kabouzeid)
 */
public class NowPlayingScreenPreference extends DialogPreference  {
    public NowPlayingScreenPreference(Context context) {
        super(context);
    }

    public NowPlayingScreenPreference(Context context, AttributeSet attrs) {
        super(context, attrs);
    }

    public NowPlayingScreenPreference(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
    }

    public NowPlayingScreenPreference(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        super(context, attrs, defStyleAttr, defStyleRes);
    }
}
