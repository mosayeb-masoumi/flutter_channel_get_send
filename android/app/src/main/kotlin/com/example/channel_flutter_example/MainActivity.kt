package com.example.channel_flutter_example

import android.widget.Toast
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel


class MainActivity : FlutterActivity() {


    private val CHANNEL = "your_channel_name"


    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
            .setMethodCallHandler { call, result ->
                when (call.method) {
                    "stringNativeMethod" -> {
                        val value = prepareStringMethod()
                        result.success(value)
                    }
                    "intNativeMethod" -> {
                        val value = prepareIntMethod()
                        result.success(value)
                    }
                    "mapNativeMethod" -> {
                        val value = prepareMapMethod()
                        result.success(value)
                    }

                    "listNativeMethod" -> {
                        val value = prepareListMethod()
                        result.success(value)
                    }



                    "getStringFromDart" -> {
                        val message = call.arguments as String? // Retrieve the string from Flutter

                        Toast.makeText(applicationContext, message, Toast.LENGTH_SHORT).show()
                        result.success("String received by native:${message}")
                    }

                    "getIntFromDart" -> {
                        val message = call.arguments as Int? // Retrieve the string from Flutter

                        Toast.makeText(applicationContext, message.toString(), Toast.LENGTH_SHORT).show()
                        result.success("int received by native:${message}")
                    }

                    "getMapFromDart" -> {
                        val message = call.arguments  as? Map<*, *>? // Retrieve the string from Flutter

                        Toast.makeText(applicationContext, message.toString(), Toast.LENGTH_SHORT).show()
                        result.success("map received by native:${message}")
                    }


                    "getListFromDart" -> {
                         // Retrieve the list from Flutter
                        val message = call.arguments as List<String>?
                        Toast.makeText(applicationContext, message.toString(), Toast.LENGTH_SHORT).show()
                        result.success(message)
                    }



                    else -> {
                        result.notImplemented()
                    }
                }
            }
    }



    private fun prepareStringMethod(): String {
        return "Success"
    }

    private fun prepareIntMethod(): Int {
        return 20
    }


    private fun prepareMapMethod(): Map<String, Any> {
        val map = HashMap<String, Any>()
        map["key1"] = "Value 1"
        map["key2"] = 42
        // Add more key-value pairs as needed
        return map
    }


    private fun prepareListMethod(): List<String> {
        return listOf("item 1" , "item 2", "item 3")
    }

}
