import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../global/log.dart';
import '../../../repositories/local_database/database_service.dart';
import '../data/models/enums/enums.dart';
import '../data/models/prescription_entry_model.dart';

class PrescriptionEntryNotifier extends Notifier<PrescriptionEntryModel> {
  @override
  PrescriptionEntryModel build() => PrescriptionEntryModel();

  String get dateFormat => 'yyyy-MM-dd';

  // Todo: 当日〜1年間までが良いかも
  String get minDateTime => '2023-06-03';
  String get maxDateTime => '2024-06-03';

  /// 登録前初期化
  void initEntry() {
    final initDateStr = DateFormat(dateFormat).format(DateTime.now());
    state = state.copyWith(
      dosingPeriodStart: initDateStr,
      dosingPeriodEnd: initDateStr,
    );
  }

  /// 登録前初期化
  void initEdit({
    required PrescriptionEntryModel item,
  }) {
    state = item;
  }

  /// 薬種類を更新
  void setMedicineType(MedicineType medicineType) {
    logger.info('薬種類を更新：${medicineType.displayName}');
    state = state.copyWith(
      medicineType: medicineType,
    );
  }

  /// 服用回数を更新
  void setMedicineTakingType(MedicineTakingType medicineTakingType) {
    logger.info('服用回数を更新：${medicineTakingType.displayName}');
    state = state.copyWith(
      medicineTakingType: medicineTakingType,
    );
  }

  /// 服用量を更新
  void setDailyDosageValue({required int setType}) {
    logger.info('服用量を更新');
    if (setType == 0) {
      state = state.copyWith(
        dailyDosageValue: state.dailyDosageValue + 1,
      );
    } else {
      // 0以下にならないようにする
      final zero = (state.dailyDosageValue - 1) < 0;

      state = state.copyWith(
        dailyDosageValue: zero ? 0 : state.dailyDosageValue - 1,
      );
    }
  }

  /// 内、薬名を更新
  void setMedicineDetail({
    required int id,
    required String text,
  }) {
    logger.info('内、薬名を更新');

    final list = [
      ...state.medicineDetails,
    ];
    list[id] = text;

    state = state.copyWith(
      medicineDetails: list,
    );
  }

  /// 服用期間の開始日を更新
  void setDosingPeriodStart(String date) {
    logger.info('服用期間の開始日を更新$date');
    state = state.copyWith(
      dosingPeriodStart: date,
    );
  }

  /// 服用期間の終了日を更新
  void setDosingPeriodEnd(String date) {
    logger.info('服用期間の終了日を更新$date');
    state = state.copyWith(
      dosingPeriodEnd: date,
    );
  }

  /// 服用期間バリデーション
  bool validationDosingPeriod() {
    final dateStart = DateTime.tryParse(state.dosingPeriodStart);
    final dateEnd = DateTime.tryParse(state.dosingPeriodEnd);

    if (dateStart == null || dateEnd == null) {
      // 開始or終了日が未入力か不正な日付の場合はエラー
      logger.info('開始or終了日が未入力か不正な日付の場合はエラー');
      return false;
    }

    if (dateStart.isAfter(dateEnd)) {
      // 開始期間が終了期間より過去の場合はエラー
      logger.info('開始期間が終了期間より過去の場合はエラー');
      return false;
    }
    return true;
  }

  /// 登録時のバリデーションチェック
  List<String> validationAll() {
    final result = <String>[];
    if (validationDosingPeriod() == false) {
      // 服用期間バリデーションエラー
      result.add('服用期間を確認してください');
    }

    return result;
  }

  /// DB登録
  Future<void> dbInsertMedicine({
    required PrescriptionEntryModel prescriptionEntryModel,
  }) async {
    await GetIt.instance<DatabaseService>().insertMedicine(
      prescriptionEntryModel,
    );
  }

  /// DB更新
  Future<void> dbUpdateMedicine({
    required PrescriptionEntryModel prescriptionEntryModel,
  }) async {
    await GetIt.instance<DatabaseService>().updateMedicine(
      prescriptionEntryModel,
    );
  }
}
