import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../repositories/local_database/database_service.dart';
import '../data/models/prescription_entry_model.dart';
import '../data/models/prescription_list_model.dart';

class PrescriptionListNotifier extends AsyncNotifier<PrescriptionListModel> {
  @override
  Future<PrescriptionListModel> build() {
    return dbGetMedicine();
  }

  /// DBから登録した薬を取得
  Future<PrescriptionListModel> dbGetMedicine() async {
    state = const AsyncValue.loading();
    final medicines = await GetIt.instance<DatabaseService>().getMedicines();

    final nowDate =
        DateTime.parse(DateFormat('yyyy-MM-dd').format(DateTime.now()));

    final items = <PrescriptionEntryModel>[];
    for (final e in medicines) {
      // 登録期間が本日を含むかチェック

      final startDate = DateTime.parse(e.dosingPeriodStart);
      final endDate = DateTime.parse(e.dosingPeriodEnd);

      if ((nowDate.isAfter(startDate) || nowDate == startDate) &&
          (nowDate.isBefore(endDate) || nowDate == endDate)) {
        // 指定期間に本日を含む
        items.add(e);
      } else {
        // 指定期間に本日を含まない
      }
    }

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
