// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prescription_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PrescriptionListModel _$$_PrescriptionListModelFromJson(
        Map<String, dynamic> json) =>
    _$_PrescriptionListModel(
      items: (json['items'] as List<dynamic>?)
              ?.map((e) =>
                  PrescriptionEntryModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_PrescriptionListModelToJson(
        _$_PrescriptionListModel instance) =>
    <String, dynamic>{
      'items': instance.items,
    };
