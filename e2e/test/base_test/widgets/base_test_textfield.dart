part of '../base_test.dart';

abstract class BaseTestTextField {
  Future<void> enterTextField(FlutterDriver driver, SerializableFinder finder,
      {required String text});
}
