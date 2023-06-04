// ignore: unused_import
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'enums/enums.dart';

part 'prescription_entry_model.freezed.dart';
part 'prescription_entry_model.g.dart';

@freezed
class PrescriptionEntryModel with _$PrescriptionEntryModel {
  factory PrescriptionEntryModel({
    /// id
    @Default(0) int id,

    /// 種類
    @Default(MedicineType.medicineInside) MedicineType medicineType,

    /// 服用回数
    @Default(MedicineTakingType.dailyTwo) MedicineTakingType medicineTakingType,

    /// 服用量
    @Default(1) int dailyDosageValue,

    /// 服用期間(開始〜終了)
    @Default('') String dosingPeriodStart,
    @Default('') String dosingPeriodEnd,

    /// 内、薬名 3件まで
    @Default(['', '', '']) List<String> medicineDetails,

    /// ユーザー服用回数
    @Default(0) int userTakingCnt,

    /// メモ
    @Default('') String memo,
  }) = _PrescriptionEntryModel;
  PrescriptionEntryModel._();
  factory PrescriptionEntryModel.fromJson(Map<String, dynamic> json) =>
      _$PrescriptionEntryModelFromJson(json);

  Future<Map<String, dynamic>> toDBParam() async {
    final map = toJson();

    // DB登録時に裁判するので不要
    await map.remove('id');

    // Todo:名前に,を使った時の対策
    // 配列から文字列に変換
    map['medicineDetails'] = medicineDetails.join(',');

    return map;
  }

  /// 服用可能かチェック
  ///
  /// 服用可能ならTrueを返す
  bool isUserTaking() {
    // ユーザー服用回数が、服用回数を超えないかチェック
    switch (medicineTakingType) {
      case MedicineTakingType.dailyOnce:
        return userTakingCnt <= 0;
      case MedicineTakingType.dailyTwo:
        return userTakingCnt <= 1;
      case MedicineTakingType.dailyThree:
        return userTakingCnt <= 2;
      case MedicineTakingType.singleDosage:
        return true;
    }
  }
}
