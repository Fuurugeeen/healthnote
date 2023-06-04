import 'package:get_it/get_it.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../repositories/local_database/database_service.dart';
import '../data/models/prescription_entry_model.dart';
import '../data/models/prescription_history_model.dart';

class PrescriptionHistoryNotifier
    extends AsyncNotifier<PrescriptionHistoryModel> {
  @override
  Future<PrescriptionHistoryModel> build() {
    return dbGetMedicine();
  }

  /// DBから登録した薬を取得
  Future<PrescriptionHistoryModel> dbGetMedicine() async {
    state = const AsyncValue.loading();
    final medicines = await GetIt.instance<DatabaseService>().getMedicines();

    final items = <PrescriptionEntryModel>[];
    for (final e in medicines) {
      items.add(e);
      // if (e.isUserTaking()) {
      //   // 服用可能なら追加
      //   items.add(e);
      // }
    }
    return PrescriptionHistoryModel(
      items: items,
    );
  }

  // /// DBから服用回数を更新
  // Future<void> dbUpdUserTakingCnt({
  //   required int id,
  //   required int userTakingCnt,
  // }) async {
  //   await GetIt.instance<DatabaseService>().updatetUserTakingCnt(
  //     id,
  //     userTakingCnt,
  //   );
  // }
}
