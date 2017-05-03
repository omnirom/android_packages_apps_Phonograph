package com.kabouzeid.gramophone.ui.activities;

import android.content.Intent;
import android.content.SharedPreferences;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.media.audiofx.AudioEffect;
import android.os.Build;
import android.os.Bundle;
import android.preference.PreferenceActivity;
import android.preference.PreferenceFragment;
import android.support.annotation.ColorInt;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.app.ActionBar;
import android.app.DialogFragment;
import android.preference.ListPreference;
import android.preference.Preference;
import android.preference.Preference.OnPreferenceChangeListener;
import android.preference.PreferenceManager;
import android.preference.TwoStatePreference;
import android.view.MenuItem;
import android.view.View;

import com.kabouzeid.gramophone.helper.MusicPlayerRemote;
import com.kabouzeid.gramophone.preferences.NowPlayingScreenPreference;
import com.kabouzeid.gramophone.preferences.NowPlayingScreenPreferenceDialog;
import com.kabouzeid.gramophone.service.MusicService;
import com.kabouzeid.gramophone.ui.fragments.player.NowPlayingScreen;
import com.kabouzeid.gramophone.util.NavigationUtil;
import com.kabouzeid.gramophone.util.PreferenceUtil;

import org.omnirom.gramophone.R;

public class SettingsActivity extends PreferenceActivity implements OnPreferenceChangeListener {
    public static final String TAG = SettingsActivity.class.getSimpleName();

    ListPreference mNowPLaying;

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        getActionBar().setDisplayHomeAsUpEnabled(true);

        addPreferencesFromResource(R.xml.pref_general);
        addPreferencesFromResource(R.xml.pref_now_playing_screen);
        addPreferencesFromResource(R.xml.pref_images);
        addPreferencesFromResource(R.xml.pref_lockscreen);
        addPreferencesFromResource(R.xml.pref_audio);

        Preference equalizer = findPreference("equalizer");
        if (!hasEqualizer()) {
            equalizer.setEnabled(false);
            equalizer.setSummary(getResources().getString(R.string.no_equalizer));
        }
        equalizer.setOnPreferenceClickListener(new Preference.OnPreferenceClickListener() {
            @Override
            public boolean onPreferenceClick(Preference preference) {
                NavigationUtil.openEqualizer(SettingsActivity.this);
                return true;
            }
        });

        mNowPLaying = (ListPreference) findPreference("now_playing_screen_id");
        if (mNowPLaying != null) {
            updateNowPlayingScreenSummary();
            mNowPLaying.setOnPreferenceChangeListener(this);
        }
    }

    private boolean hasEqualizer() {
        final Intent effects = new Intent(AudioEffect.ACTION_DISPLAY_AUDIO_EFFECT_CONTROL_PANEL);
        PackageManager pm = getPackageManager();
        ResolveInfo ri = pm.resolveActivity(effects, 0);
        return ri != null;
    }

    @Override
    public boolean onPreferenceChange(Preference preference, Object newValue) {
        if (preference == mNowPLaying) {
            if (newValue.equals(String.valueOf(NowPlayingScreen.CARD.id))) {
                PreferenceUtil.getInstance(this).setNowPlayingScreen(NowPlayingScreen.CARD);
            } else{
                PreferenceUtil.getInstance(this).setNowPlayingScreen(NowPlayingScreen.FLAT);
            }
            updateNowPlayingScreenSummary();
        }

        return true;
    }

    private void updateNowPlayingScreenSummary() {
        if (mNowPLaying != null) {
            mNowPLaying.setSummary(mNowPLaying.getEntries()[PreferenceUtil.getInstance(this).getNowPlayingScreen().id]);
        }
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        switch (item.getItemId()) {
            case android.R.id.home:
                finish();
                return true;
            default:
                break;
        }
        return super.onOptionsItemSelected(item);
    }
}
