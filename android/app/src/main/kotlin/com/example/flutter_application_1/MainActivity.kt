package com.example.flutter_application_1

import dev.flutter.example.NativeViewFactory
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine


class MainActivity: FlutterActivity() {
     override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        flutterEngine
                .platformViewsController
                .registry
                .registerViewFactory("<platform-view-type>", NativeViewFactory())
    }
}
