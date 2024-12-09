package com.exa.lat.lat

import android.app.Application
import com.moengage.core.LogLevel
import com.moengage.core.MoEngage
import com.moengage.core.config.LogConfig
import com.moengage.core.config.*
import com.moengage.core.config.NotificationConfig
// import com.moengage.core.internal.global.GlobalState
// import com.moengage.adncore.model.SdkState
import com.moengage.flutter.MoEInitializer
import com.moengage.pushbase.MoEPushHelper
import com.moengage.core.*
import android.app.Notification
import android.app.NotificationChannel
import android.app.NotificationManager
import androidx.core.app.NotificationCompat
import android.net.Uri
import android.media.AudioAttributes
import android.os.Build
import android.util.Log
import com.moengage.core.enableAllLogs



class App: Application() {

    override fun onCreate() {
        super.onCreate()
        val moengage =
            MoEngage.Builder(this, "8SIW681S80Z08KSHQFSTIZ8T", DataCenter.DATA_CENTER_1)
                .configureLogs(LogConfig(LogLevel.VERBOSE, true))
                .configureNotificationMetaData(
                    NotificationConfig(
                        R.mipmap.ic_launcher,
                        R.mipmap.ic_launcher
                    )
                )
//                    .configureDataSync(DataSyncConfig())
                .configureCards(CardConfig(false))
//                .configureInApps(InAppConfig(inAppOptOut))

        MoEInitializer.initialiseDefaultInstance(context = this, builder = moengage, lifecycleAwareCallbackEnabled = true)
        enableAllLogs()
    }
}