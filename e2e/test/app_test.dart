import 'dart:async';
import 'package:flutter_gherkin/flutter_gherkin.dart';
// ignore: depend_on_referenced_packages
import 'package:gherkin/gherkin.dart';
import 'package:glob/glob.dart';
// import 'package:glob/glob.dart';
import 'hooks/attach_screenshot_failed_step_hook.dart';
import 'hooks/init_hook.dart';
import 'steps/step_definition.dart';

Future<void> main() {
  final config = FlutterTestConfiguration()
    ..features = [Glob(r"e2e/test/features/*.feature")]
    ..reporters = [
      ProgressReporter(),
      TestRunSummaryReporter(),
      JsonReporter(path: 'e2e/report/report.json')
    ] // you can include the "StdoutReporter()" without the message level parameter for verbose log information
    ..hooks = [
      InitHook(),
      AttachScreenhotOnFailedStepHook()
    ] // you can include "AttachScreenhotOnFailedStepHook()" to take a screenshot of each step failure and attach it to the world object
    ..stepDefinitions = [EnterFormLoginStep(), CheckFormLoginStep()]
    // ..customStepParameterDefinitions = [ColourParameter()]
    ..restartAppBetweenScenarios = true
    ..targetAppPath = "e2e/test/app.dart"
    // ..buildFlavor = "staging" // uncomment when using build flavor and check android/ios flavor setup see android file android\app\build.gradle
    // ..targetDeviceId =
    //     "ce09171968df50b90c7e" // uncomment to run tests on all connected devices or set specific device target id
    // ..tagExpression = "@smoke" // uncomment to see an example of running scenarios based on tag expressions
    ..stopAfterTestFailed = false; // set to false if debugging to exit cleanly
  return GherkinRunner().execute(config);
}
