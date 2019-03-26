package com.kabouzeid.gramophone.service.notification;

import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.os.Build;
import android.support.annotation.RequiresApi;

import com.kabouzeid.gramophone.service.MusicService;

import org.omnirom.gramophone.R;

import static android.content.Context.NOTIFICATION_SERVICE;

import org.omnirom.gramophone.R;

public abstract class PlayingNotification {

    private static final int NOTIFICATION_ID = 1;
    static final String NOTIFICATION_CHANNEL_ID = "playing_notification";

    private NotificationManager notificationManager;
    protected MusicService service;
    boolean stopped;

    public synchronized void init(MusicService service) {
        this.service = service;
        notificationManager = (NotificationManager) service.getSystemService(NOTIFICATION_SERVICE);
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            createNotificationChannel();
        }
    }

    public abstract void update(final boolean updateState);

    protected void updateContent(Notification notification) {
        notificationManager.notify(NOTIFICATION_ID, notification);
    }

    protected void updateState(Notification notification) {
        if (!service.isPlaying()) {
            service.stopForeground(false);
        } else {
            service.startForeground(NOTIFICATION_ID, notification);
        }
        notificationManager.notify(NOTIFICATION_ID, notification);
    }

    public synchronized void stop() {
        stopped = true;
        service.stopForeground(true);
    }

    @RequiresApi(26)
    private void createNotificationChannel() {
        NotificationChannel notificationChannel = notificationManager.getNotificationChannel(NOTIFICATION_CHANNEL_ID);
        if (notificationChannel == null) {
            notificationChannel = new NotificationChannel(NOTIFICATION_CHANNEL_ID, service.getString(R.string.playing_notification_name), NotificationManager.IMPORTANCE_LOW);
            notificationChannel.setDescription(service.getString(R.string.playing_notification_description));
            notificationChannel.enableLights(false);
            notificationChannel.enableVibration(false);
            notificationChannel.setShowBadge(false);

            notificationManager.createNotificationChannel(notificationChannel);
        }
    }
}
