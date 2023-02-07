import 'package:flutter_gherkin/flutter_gherkin.dart';
// ignore: depend_on_referenced_packages
import 'package:gherkin/gherkin.dart';
import '../pages/login_page.dart';

class EnterFormLoginStep extends When2WithWorld<String, String, FlutterWorld> {
  EnterFormLoginStep()
      : super(StepDefinitionConfiguration()
          ..timeout = const Duration(seconds: 5));
  @override
  RegExp get pattern =>
      RegExp(r"I enter LoginForm: account: {string}, {string}");

  @override
  Future<void> executeStep(String account, String password) async {
    final loginPage = LoginPage(world.driver!);
    await loginPage.enterLoginForm(world, account: account, password: password);
  }
}

class CheckFormLoginStep extends Then1WithWorld<String, FlutterWorld> {
  CheckFormLoginStep()
      : super(StepDefinitionConfiguration()
          ..timeout = const Duration(seconds: 5));
  @override
  RegExp get pattern => RegExp(r"I expect login {string}");

  @override
  Future<void> executeStep(String expectResult) async {
    final loginPage = LoginPage(world.driver!);
    final loginResult = await loginPage.checkLoginForm(world, expectResult);
    expectMatch(loginResult, expectResult);
    if (loginResult != expectResult) {
      throw StepResult(
        0,
        StepExecutionResult.error,
      );
    }
  }
}
