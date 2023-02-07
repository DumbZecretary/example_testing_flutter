import 'package:note_location_app/utils/debug.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SampleRepoSharedPreference {
  const SampleRepoSharedPreference({
    this.sharedPreferences,
  });
  final SharedPreferences? sharedPreferences;

  static const _value = "value";

  ///============================SET================================================

  Future<bool?> saveLocalValue({required int value}) async {
    final result = await sharedPreferences?.setInt(_value, value);
    debug("save local value: $result");
    return result;
  }

  //============================GET==================================================

  int? getLocalValue() {
    final result = sharedPreferences?.getInt(_value);
    return result;
  }

  ///=========================DELETE============================================

  Future<bool?> deleteLocalValue() async {
    final result = await sharedPreferences?.remove(_value);
    return result;
  }
}
