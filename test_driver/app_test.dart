import 'dart:async';

import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

import 'actions.dart';
import 'screenshot.dart';
import 'utils.dart';

main(List<String> args) async {
  group("MAIN", () {
    FlutterDriver driver;
    double width;
    double height;

    setUpAll(() async {
      driver = await FlutterDriver.connect();

      final platform = await driver.requestData("platform");
      final dimensions = (await driver.requestData("dimensions")).split(",");

      width = double.parse(dimensions[0]);
      height = double.parse(dimensions[1]);

      Utils.driver = driver;
      TestActions.driver = driver;
      Screenshot.driver = driver;
      Screenshot.platform = platform;

      await Utils.init(platform);
      await TestActions.delay(1000);

      await driver.clearTimeline();
    });

    tearDownAll(() async {
      await TestActions.delay(8000);

      driver?.close();
    });

    test('Chunk testing', () async {
      await driver.runUnsynchronized(() async {
        final addButton = find.byValueKey("button_add");
        final removeButton = find.byValueKey("button_remove");

        await Screenshot.screenshot("Shot-1");
        await driver.tap(addButton);
        await driver.tap(addButton);
        await driver.tap(addButton);
        await Screenshot.screenshot("Shot-2");
        await driver.tap(removeButton);
        await driver.tap(removeButton);
        await driver.tap(removeButton);
        await driver.tap(removeButton);
        await driver.tap(removeButton);
        await Screenshot.screenshot("Shot-3", post: 2000);
        print("TEST ENDED");
      });
    }, timeout: Timeout.none);
  });
}
