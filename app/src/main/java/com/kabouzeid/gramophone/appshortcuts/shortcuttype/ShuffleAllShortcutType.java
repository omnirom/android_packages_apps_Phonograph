package com.kabouzeid.gramophone.appshortcuts.shortcuttype;

import android.annotation.TargetApi;
import android.content.Context;
import android.content.pm.ShortcutInfo;

import com.kabouzeid.gramophone.appshortcuts.AppShortcutIconGenerator;
import com.kabouzeid.gramophone.appshortcuts.AppShortcutLauncherActivity;

import org.omnirom.gramophone.R;

/**
 * @author Adrian Campos
 */

@TargetApi(25)
public final class ShuffleAllShortcutType extends BaseShortcutType {
    public ShuffleAllShortcutType(Context context) {
        super(context);
    }

    public ShortcutInfo getShortcutInfo() {
        return new ShortcutInfo.Builder(context, getId())
                .setShortLabel(context.getString(R.string.app_shortcut_shuffle_all_short))
                .setLongLabel(context.getString(R.string.app_shortcut_shuffle_all_long))
                .setIcon(AppShortcutIconGenerator.generateThemedIcon(context, R.drawable.ic_app_shortcut_shuffle_all))
                .setIntent(getPlaySongsIntent(AppShortcutLauncherActivity.SHORTCUT_TYPE_SHUFFLE_ALL))
                .build();
    }

    public static String getId() {
        return ID_PREFIX + "shuffle_all";
    }
}
