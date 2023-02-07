import 'dart:async';
import 'dart:developer';
import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
part 'widgets/base_test_button.dart';
part 'widgets/base_test_text.dart';
part 'widgets/base_test_textfield.dart';

abstract class BaseTest {
  SerializableFinder findElementByKey(String key);

  Future<void> waitFor(FlutterDriver driver, SerializableFinder finder,
      {Duration timeout = const Duration(seconds: 30)});
}

class BaseTestPage extends FlutterWorld
    implements BaseTest, BaseTestText, BaseTestTextField, BaseTestButton {
  static const timeout = Duration(seconds: 30);

  // BaseTestPage(FlutterDriver driver) {
  //   log(driver.toString());
  // }

  // BASE TEST
  @override
  SerializableFinder findElementByKey(String key) {
    return find.byValueKey(key);
  }

  @override
  Future<void> waitFor(FlutterDriver driver, SerializableFinder finder,
      {Duration timeout = const Duration(seconds: 30)}) async {
    try {
      await driver.waitFor(finder, timeout: timeout);
      await driver.waitUntilNoTransientCallbacks(timeout: timeout);
    } catch (error) {
      log('Element ${finder.serialize()} does not exists => $error');
    }
  }

  // TEXT FIELD
  @override
  Future<void> enterTextField(FlutterDriver driver, SerializableFinder finder,
      {required String text}) async {
    try {
      await driver.tap(finder); // acquire focus
      await driver.enterText(text, timeout: timeout); // enter text
      await driver.waitFor(find.text(text)); // verify text appears on UI
    } catch (error) {
      log('Element ${finder.serialize()} does not exists => $error)');
    }
  }

  // BUTTON
  @override
  Future<void> tap(FlutterDriver driver, SerializableFinder finder,
      FlutterWorld world) async {
    try {
      await driver.tap(finder, timeout: timeout);
    } catch (error) {
      log('Element ${finder.serialize()} does not exists => $error)');
    }
  }

  // TEXT
  @override
  Future<String> getText(
      FlutterDriver driver, SerializableFinder finder) async {
    await driver.waitUntilNoTransientCallbacks(timeout: timeout);
    final text = driver.getText(finder, timeout: timeout);
    return text;
  }
}
