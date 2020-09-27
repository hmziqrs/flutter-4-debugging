import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wowo/getx/AppIntl.dart';
import 'package:wowo/getx/screens/Home/messages/keys.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("RENDER ${Get.locale}");
    return Scaffold(
      body: ListView(
        children: [
          Container(
            child: Text("LMAO"),
          ),
          Container(
            child: Text("LMAO"),
          ),
          ...AppIntl.locales.map(
            (e) => RaisedButton(
              child: Text(
                e.toString(),
              ),
              onPressed: () => AppIntl.changeLocale(e),
            ),
          ),
          RaisedButton(
            child: Text(GetXHomeMessages.changeTheme.tr),
            onPressed: () => Get.changeThemeMode(
              Get.isDarkMode ? ThemeMode.light : ThemeMode.dark,
            ),
          ),
        ],
      ),
    );
  }
}
