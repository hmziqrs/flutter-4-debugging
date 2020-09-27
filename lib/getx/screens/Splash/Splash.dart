import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wowo/getx/AppIntl.dart';

class Splash extends StatelessWidget {
  static bool didInit = false;
  void init() async {
    if (didInit) {
      return;
    }
    didInit = true;

    Map strings = await AppIntl.load(Get.locale.languageCode);
    Get.translations.addAll({Get.locale.toString(): strings});
    if (Get.locale != AppIntl.fallback) {
      Map fallStrings = await AppIntl.load(AppIntl.fallback.languageCode);
      Get.translations.addAll({AppIntl.fallback.toString(): fallStrings});
    }
    print(Get.translations);

    await Future.delayed(Duration(milliseconds: 200));
    Get.toNamed("home");
  }

  @override
  Widget build(BuildContext context) {
    this.init();
    return Scaffold(
      body: Center(
        child: Text("SPLASH"),
      ),
    );
  }
}
