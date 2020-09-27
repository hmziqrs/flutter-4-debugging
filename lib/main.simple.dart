import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart'
    show debugDefaultTargetPlatformOverride;

import 'package:wowo/simple/Navigator.dart';
import 'package:wowo/io/io.dart';

void main(List<String> args) {
  _main(null);
}

void mainTest(NavigatorObserver observer) {
  _main(observer);
}

void _main(NavigatorObserver observer) {
  FlutterError.onError = (FlutterErrorDetails err) {};
  final List<NavigatorObserver> observers = [];

  if (Platform.isWindows || Platform.isLinux) {
    debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  }

  if (observer != null) {
    observers.add(observer);
  }

  runApp(AppNavigator(observers));
}
