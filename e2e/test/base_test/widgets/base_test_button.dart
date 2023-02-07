part of '../base_test.dart';

abstract class BaseTestButton {
  Future<void> tap(
      FlutterDriver driver, SerializableFinder finder, FlutterWorld world);
}
