import 'package:get_it/get_it.dart';

import '../repositories/local_database/database_service.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  getIt.registerLazySingleton<DatabaseService>(DatabaseService.new);
}
