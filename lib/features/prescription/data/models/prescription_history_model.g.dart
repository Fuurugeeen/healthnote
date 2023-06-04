// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prescription_history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PrescriptionHistoryModel _$$_PrescriptionHistoryModelFromJson(
        Map<String, dynamic> json) =>
    _$_PrescriptionHistoryModel(
      items: (json['items'] as List<dynamic>?)
              ?.map((e) =>
                  PrescriptionEntryModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_PrescriptionHistoryModelToJson(
        _$_PrescriptionHistoryModel instance) =>
    <String, dynamic>{
      'items': instance.items,
    };
