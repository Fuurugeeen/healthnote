import 'package:get_it/get_it.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../repositories/local_database/database_service.dart';
import '../data/models/prescription_list_model.dart';

class PrescriptionListNotifier extends AsyncNotifier<PrescriptionListModel> {
  @override
  Future<PrescriptionListModel> build() {
    return dbGetMedicine();
  }

  /// DBから登録した薬を取得
  Future<PrescriptionListModel> dbGetMedicine() async {
    state = const AsyncValue.loading();
    final items = await GetIt.instance<DatabaseService>().getMedicines();

    return PrescriptionListModel(
      items: items,
    );
  }

  /// DBから服用回数を更新
  Future<void> dbUpdUserTakingCnt({
    required int id,
    required int userTakingCnt,
  }) async {
    await GetIt.instance<DatabaseService>().updatetUserTakingCnt(
      id,
      userTakingCnt,
    );
  }
}
