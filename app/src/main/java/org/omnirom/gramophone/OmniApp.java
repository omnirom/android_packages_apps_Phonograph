package org.omnirom.gramophone;

import android.app.Application;
import android.os.Build;

import com.kabouzeid.gramophone.appshortcuts.DynamicShortcutManager;

public class OmniApp extends Application {
    public static final String TAG = OmniApp.class.getSimpleName();
    private static OmniApp app;

    @Override
    public void onCreate() {
        super.onCreate();
        app = this;

        //Set up dynamic shortcuts
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.N_MR1) {
            new DynamicShortcutManager(this).initDynamicShortcuts();
        }
    }

    public static OmniApp getInstance() {
        return app;
    }
}
