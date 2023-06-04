import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  SharedPreferencesService({
    required SharedPreferences sharedPreferences,
  }) : _sharedPreferences = sharedPreferences;
  final SharedPreferences _sharedPreferences;

  // 起動日 YYYYMMDD
  static const spsInitialStartUpDate = 'sps_initial_start_up_date';
  Future<String?> getSPSInitialStartUpDate() async {
    return _sharedPreferences.getString(spsInitialStartUpDate);
  }

  Future<bool> saveSPSInitialStartUpDate(String value) async {
    await _sharedPreferences.setString(spsInitialStartUpDate, value);
    return true;
  }
}
