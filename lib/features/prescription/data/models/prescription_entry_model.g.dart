// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prescription_entry_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PrescriptionEntryModel _$$_PrescriptionEntryModelFromJson(
        Map<String, dynamic> json) =>
    _$_PrescriptionEntryModel(
      id: json['id'] as int? ?? 0,
      medicineType:
          $enumDecodeNullable(_$MedicineTypeEnumMap, json['medicineType']) ??
              MedicineType.medicineInside,
      medicineTakingType: $enumDecodeNullable(
              _$MedicineTakingTypeEnumMap, json['medicineTakingType']) ??
          MedicineTakingType.dailyTwo,
      dailyDosageValue: json['dailyDosageValue'] as int? ?? 1,
      dosingPeriodStart: json['dosingPeriodStart'] as String? ?? '',
      dosingPeriodEnd: json['dosingPeriodEnd'] as String? ?? '',
      medicineDetails: (json['medicineDetails'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const ['', '', ''],
      userTakingCnt: json['userTakingCnt'] as int? ?? 0,
    );

Map<String, dynamic> _$$_PrescriptionEntryModelToJson(
        _$_PrescriptionEntryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'medicineType': _$MedicineTypeEnumMap[instance.medicineType]!,
      'medicineTakingType':
          _$MedicineTakingTypeEnumMap[instance.medicineTakingType]!,
      'dailyDosageValue': instance.dailyDosageValue,
      'dosingPeriodStart': instance.dosingPeriodStart,
      'dosingPeriodEnd': instance.dosingPeriodEnd,
      'medicineDetails': instance.medicineDetails,
      'userTakingCnt': instance.userTakingCnt,
    };

const _$MedicineTypeEnumMap = {
  MedicineType.medicineInside: 'medicineInside',
  MedicineType.medicineOutSide: 'medicineOutSide',
  MedicineType.medicineSingleDosage: 'medicineSingleDosage',
};

const _$MedicineTakingTypeEnumMap = {
  MedicineTakingType.dailyOnce: 'dailyOnce',
  MedicineTakingType.dailyTwo: 'dailyTwo',
  MedicineTakingType.dailyThree: 'dailyThree',
  MedicineTakingType.singleDosage: 'singleDosage',
};
