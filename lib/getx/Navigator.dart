import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pigment/pigment.dart';

import 'Home.dart';

class AppNavigator extends StatelessWidget {
  AppNavigator(this.observers);
  final List<NavigatorObserver> observers;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      navigatorObservers: this.observers,
      darkTheme: ThemeData.dark().copyWith(primaryColor: Colors.purple),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Home(),
    );
  }
}
