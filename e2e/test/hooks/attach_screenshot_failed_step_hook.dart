import 'dart:convert';

import 'package:flutter_gherkin/flutter_gherkin.dart';
// ignore: depend_on_referenced_packages
import 'package:gherkin/gherkin.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:note_location_app/utils/debug.dart';

class AttachScreenhotOnFailedStepHook extends Hook {
  @override
  Future<void> onAfterStep(
      World world, String step, StepResult stepResult) async {
    if (stepResult.result == StepExecutionResult.error ||
        stepResult.result == StepExecutionResult.fail) {
      final screenshotData = await _takeScreenshot(world);
      world.attach(screenshotData, 'image/png', step);
    }
  }

  @protected
  Future<String> _takeScreenshot(World world) async {
    debug("TAKE a picture");
    final bytes = await (world as FlutterWorld).driver?.screenshot();
    return base64Encode(bytes ?? []);
  }
}
