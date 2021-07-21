package com.wanshifu.app.wsf_flutter

import android.os.Build
import android.util.Log
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity(), MethodChannel.MethodCallHandler {

    companion object {
        const val TAG = "FlutterActivity";
        const val METHOD_CHANNEL_LABEL = "com.wshifu.app.method_channel_id"
    }

    private var methodChannel: MethodChannel? = null;

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        Log.e(TAG, "configureFlutterEngine()")
        methodChannel = MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            METHOD_CHANNEL_LABEL
        ).apply {
            setMethodCallHandler(this@MainActivity)
        }
    }

    override fun onDestroy() {
        super.onDestroy()
        methodChannel?.setMethodCallHandler(null)
    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        try {
            when (call.method) {
                "getSdkVersion" -> {
                    result.success(Build.VERSION.SDK_INT)
                }
                "test" -> {
                    val name = if (call.hasArgument("name")) call.argument<String>("name") else ""
                    val age = if (call.hasArgument("age")) call.argument<Int>("age") else 0
                    val gender: Boolean =
                        if (call.hasArgument("gender")) call.argument<Boolean>("gender") == true else false
                    val real = if (gender) "male" else "female"
                    val info = "Person : [name: $name,age: $age,gender: $real]"
                    result.success(info)
                }
                else -> {
                    Log.e(TAG, "method : ${call.method}  , arguments:  ${call.arguments}")
                }
            }

        } catch (e: Exception) {
            e.printStackTrace()
        }
    }
}
