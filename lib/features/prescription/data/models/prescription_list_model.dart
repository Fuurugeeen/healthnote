// ignore: unused_import
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'prescription_entry_model.dart';

part 'prescription_list_model.freezed.dart';
part 'prescription_list_model.g.dart';

@freezed
class PrescriptionListModel with _$PrescriptionListModel {
  factory PrescriptionListModel({
    @Default([]) List<PrescriptionEntryModel> items,
  }) = _PrescriptionListModel;
  PrescriptionListModel._();
  factory PrescriptionListModel.fromJson(Map<String, dynamic> json) =>
      _$PrescriptionListModelFromJson(json);
}
