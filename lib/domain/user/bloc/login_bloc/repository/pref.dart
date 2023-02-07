import 'package:note_location_app/utils/debug.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginRepoSharedPreference {
  const LoginRepoSharedPreference({
    this.sharedPreferences,
  });
  final SharedPreferences? sharedPreferences;

  static const _value = "userName";

  ///============================SET================================================

  Future<bool?> saveLocalValue({required String value}) async {
    final result = await sharedPreferences?.setString(_value, value);
    debug("save local value: $result");
    return result;
  }

  //============================GET==================================================

  String? getLocalValue() {
    final result = sharedPreferences?.getString(_value);
    return result;
  }

  ///=========================DELETE============================================

  Future<bool?> deleteLocalValue() async {
    final result = await sharedPreferences?.remove(_value);
    return result;
  }
}
