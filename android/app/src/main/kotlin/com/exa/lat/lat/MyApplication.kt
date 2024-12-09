package com.exa.lat.lat

import com.moengage.core.DataCenter
import com.moengage.core.LogLevel
import com.moengage.core.MoEngage
import com.moengage.core.config.LogConfig
import com.moengage.core.config.NotificationConfig
import com.moengage.flutter.MoEInitializer
import io.flutter.app.FlutterApplication

class MyApplication: FlutterApplication() {

    override fun onCreate() {
        super.onCreate()
        val moengage: MoEngage.Builder = MoEngage.Builder(this, "8SIW681S80Z08KSHQFSTIZ8T", DataCenter.DATA_CENTER_1)
            .configureNotificationMetaData(NotificationConfig(R.mipmap.ic_launcher, R.mipmap.ic_launcher))
            .configureLogs(LogConfig(LogLevel.VERBOSE, true))

        MoEInitializer.initialiseDefaultInstance(this, moengage)
    }
}