import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Widget currentWidget = IOSWidget();
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        currentWidget = AndroidWidget();
        break;
      case TargetPlatform.iOS:
        currentWidget = IOSWidget();
        break;
      default:
        IOSWidget();
    }

    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
            body: SafeArea(
          child: currentWidget,
        )));
  }
}

class IOSWidget extends StatelessWidget {
  const IOSWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String viewType = '<platform-view-type>';

    final Map<String, dynamic> creationParams = <String, dynamic>{};

    return UiKitView(
      viewType: viewType,
      layoutDirection: TextDirection.ltr,
      creationParams: creationParams,
      creationParamsCodec: const StandardMessageCodec(),
    );
  }
}

class AndroidWidget extends StatelessWidget {
  const AndroidWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String viewType = '<platform-view-type>';
    final Map<String, dynamic> creationParams = <String, dynamic>{};

    return AndroidView(
      viewType: viewType,
      layoutDirection: TextDirection.ltr,
      creationParams: creationParams,
      creationParamsCodec: const StandardMessageCodec(),
    );
  }
}
