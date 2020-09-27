import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'AppIntl.dart';
import 'screens/Home/Home.dart';
import 'screens/Splash/Splash.dart';

class AppNavigator extends StatelessWidget {
  AppNavigator(this.observers);
  final List<NavigatorObserver> observers;

  @override
  Widget build(BuildContext context) {
    print("x ${ui.window.locale}");
    return GetMaterialApp(
      title: 'Flutter Demo',
      locale: ui.window.locale,
      fallbackLocale: AppIntl.locales[0],
      navigatorObservers: this.observers,
      darkTheme: ThemeData.dark().copyWith(
        primaryColor: Colors.purple,
        accentColor: Colors.red,
      ),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Splash(),
      getPages: [
        GetPage(
          name: "home",
          page: () => Home(),
        ),
      ],
    );
  }
}
