import 'package:flutter_gherkin/src/flutter/flutter_world.dart';
import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:flutter_test/flutter_test.dart';

import '../base_test/base_test.dart';

class LoginPage extends BaseTestPage {
  final accountTextField = 'accountTextField';
  final passwordTextField = 'passwordTextField';
  final loginBtn = 'loginBtn';

  final messageLogin = 'messageLogin';

  LoginPage(FlutterDriver driver) : super();

  Future<void> enterLoginForm(FlutterWorld world,
      {required String account, required String password}) async {
    // enter Form
    final accountKey = super.findElementByKey(accountTextField);
    await super.enterTextField(world.driver!, accountKey, text: account);
    final passwordKey = super.findElementByKey(passwordTextField);
    await super.enterTextField(world.driver!, passwordKey, text: password);
  }

  Future<String> checkLoginForm(FlutterWorld world, String text) async {
    // Click Login Btn
    final loginBtnKey = super.findElementByKey(loginBtn);
    await super.tap(world.driver!, loginBtnKey, world);
    // Check Form validate
    final messageLoginKey = super.findElementByKey(messageLogin);
    await world.driver!.waitFor(messageLoginKey);
    String loginResult = await super.getText(world.driver!, messageLoginKey);
    return loginResult;
  }
}
