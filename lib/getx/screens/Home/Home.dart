import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("RENDER");
    return Scaffold(
      body: ListView(
        children: [
          Container(
            child: Text("LMAO"),
          ),
          RaisedButton(
            child: Text("Change Theme"),
            onPressed: () => Get.changeThemeMode(
              Get.isDarkMode ? ThemeMode.light : ThemeMode.dark,
            ),
          ),
        ],
      ),
    );
  }
}
