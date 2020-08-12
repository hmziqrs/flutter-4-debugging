import 'dart:async';

import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

main(List<String> args) async {
  group("MAIN", () {
    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      driver?.close();
    });

    // test("REAL TEST", () async {

    // }, timeout: Timeout.none);

    test('Chunk testing', () async {
      await driver.runUnsynchronized(() async {
        final addButton = find.byValueKey("button_add");
        final removeButton = find.byValueKey("button_remove");
        print("TEST 1");
        await Future.delayed(Duration(seconds: 5));
        print("AWAIT WORRKS");
        await Future.delayed(Duration(seconds: 5));
        await driver.tap(addButton);
        await driver.tap(addButton);
        await driver.tap(addButton);
        await Future.delayed(Duration(seconds: 5));
        await driver.tap(removeButton);
        await driver.tap(removeButton);
        await driver.tap(removeButton);
      });
    }, timeout: Timeout.none);
  });
}
