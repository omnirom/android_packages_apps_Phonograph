package com.kabouzeid.gramophone;

import android.app.Application;

/**
 * @author Karim Abou Zeid (kabouzeid)
 */
public class App extends Application {
    private static App app;

    @Override
    public void onCreate() {
        super.onCreate();
        app = this;
    }

    public static App getInstance() {
        return app;
    }
}
