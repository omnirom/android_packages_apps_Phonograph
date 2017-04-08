package org.omnirom.gramophone;

import android.app.Application;
import android.os.Build;

import com.kabouzeid.gramophone.appshortcuts.DynamicShortcutManager;

public class OmniApp extends Application {
    public static final String TAG = OmniApp.class.getSimpleName();

    @Override
    public void onCreate() {
        super.onCreate();

        //Set up dynamic shortcuts
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.N_MR1) {
            new DynamicShortcutManager(this).initDynamicShortcuts();
        }
    }
}
