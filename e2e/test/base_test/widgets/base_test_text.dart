part of '../base_test.dart';

abstract class BaseTestText {
  Future<String> getText(FlutterDriver driver, SerializableFinder finder);
}
