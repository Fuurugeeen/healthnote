// ignore: unused_import
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'prescription_entry_model.dart';

part 'prescription_history_model.freezed.dart';
part 'prescription_history_model.g.dart';

@freezed
class PrescriptionHistoryModel with _$PrescriptionHistoryModel {
  factory PrescriptionHistoryModel({
    @Default([]) List<PrescriptionEntryModel> items,
  }) = _PrescriptionHistoryModel;
  PrescriptionHistoryModel._();
  factory PrescriptionHistoryModel.fromJson(Map<String, dynamic> json) =>
      _$PrescriptionHistoryModelFromJson(json);
}
