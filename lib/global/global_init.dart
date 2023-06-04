import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../repositories/local_database/database_service.dart';
import '../repositories/local_database/shared_preferences_service.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  // データベース用
  getIt.registerLazySingleton<DatabaseService>(DatabaseService.new);

  // ローカルストレージ用
  final prefs = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferencesService>(
    () => SharedPreferencesService(sharedPreferences: prefs),
  );
}
