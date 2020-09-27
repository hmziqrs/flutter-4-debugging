import 'dart:convert' show utf8, json;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

abstract class AppIntl {
  static List<Locale> locales = [
    Locale('en', 'US'),
    Locale('zh', 'CN'),
    Locale('ar', 'SA'),
    Locale('ur', 'PK'),
    Locale('ja', 'JP'),
    Locale('ko', 'KO'),
    Locale('fr', 'FR'),
  ];

  static final fallback = AppIntl.locales[0];
  // static final fallback = Locale('en', 'US');

  static Future<Map> load(String languageCode) async {
    final ByteData file =
        await rootBundle.load('assets/langs/$languageCode.json');
    final raw = file.buffer.asUint8List(file.offsetInBytes, file.lengthInBytes);
    final string = utf8.decode(raw);
    Map<String, String> jsonMap = (json.decode(string)).cast<String, String>();
    final localizedStrings = jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });

    return localizedStrings;
  }

  static Future<void> changeLocale(Locale newLocale) async {
    if (newLocale == Get.locale) {
      return;
    }
    final slocale = newLocale.toString();
    final stringsCheck = Get.translations[slocale];
    if (stringsCheck == null) {
      final strings = await AppIntl.load(newLocale.languageCode);
      Get.translations.addAll({slocale: strings});
    }
    print(Get.translations);
    Get.updateLocale(newLocale);
  }
}
