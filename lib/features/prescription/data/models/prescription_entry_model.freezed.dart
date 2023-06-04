// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'prescription_entry_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PrescriptionEntryModel _$PrescriptionEntryModelFromJson(
    Map<String, dynamic> json) {
  return _PrescriptionEntryModel.fromJson(json);
}

/// @nodoc
mixin _$PrescriptionEntryModel {
  /// id
  int get id => throw _privateConstructorUsedError;

  /// 種類
  MedicineType get medicineType => throw _privateConstructorUsedError;

  /// 服用回数
  MedicineTakingType get medicineTakingType =>
      throw _privateConstructorUsedError;

  /// 服用量
  int get dailyDosageValue => throw _privateConstructorUsedError;

  /// 服用期間(開始〜終了)
  String get dosingPeriodStart => throw _privateConstructorUsedError;
  String get dosingPeriodEnd => throw _privateConstructorUsedError;

  /// 内、薬名 3件まで
  List<String> get medicineDetails => throw _privateConstructorUsedError;

  /// ユーザー服用回数
  int get userTakingCnt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PrescriptionEntryModelCopyWith<PrescriptionEntryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PrescriptionEntryModelCopyWith<$Res> {
  factory $PrescriptionEntryModelCopyWith(PrescriptionEntryModel value,
          $Res Function(PrescriptionEntryModel) then) =
      _$PrescriptionEntryModelCopyWithImpl<$Res, PrescriptionEntryModel>;
  @useResult
  $Res call(
      {int id,
      MedicineType medicineType,
      MedicineTakingType medicineTakingType,
      int dailyDosageValue,
      String dosingPeriodStart,
      String dosingPeriodEnd,
      List<String> medicineDetails,
      int userTakingCnt});
}

/// @nodoc
class _$PrescriptionEntryModelCopyWithImpl<$Res,
        $Val extends PrescriptionEntryModel>
    implements $PrescriptionEntryModelCopyWith<$Res> {
  _$PrescriptionEntryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? medicineType = null,
    Object? medicineTakingType = null,
    Object? dailyDosageValue = null,
    Object? dosingPeriodStart = null,
    Object? dosingPeriodEnd = null,
    Object? medicineDetails = null,
    Object? userTakingCnt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      medicineType: null == medicineType
          ? _value.medicineType
          : medicineType // ignore: cast_nullable_to_non_nullable
              as MedicineType,
      medicineTakingType: null == medicineTakingType
          ? _value.medicineTakingType
          : medicineTakingType // ignore: cast_nullable_to_non_nullable
              as MedicineTakingType,
      dailyDosageValue: null == dailyDosageValue
          ? _value.dailyDosageValue
          : dailyDosageValue // ignore: cast_nullable_to_non_nullable
              as int,
      dosingPeriodStart: null == dosingPeriodStart
          ? _value.dosingPeriodStart
          : dosingPeriodStart // ignore: cast_nullable_to_non_nullable
              as String,
      dosingPeriodEnd: null == dosingPeriodEnd
          ? _value.dosingPeriodEnd
          : dosingPeriodEnd // ignore: cast_nullable_to_non_nullable
              as String,
      medicineDetails: null == medicineDetails
          ? _value.medicineDetails
          : medicineDetails // ignore: cast_nullable_to_non_nullable
              as List<String>,
      userTakingCnt: null == userTakingCnt
          ? _value.userTakingCnt
          : userTakingCnt // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PrescriptionEntryModelCopyWith<$Res>
    implements $PrescriptionEntryModelCopyWith<$Res> {
  factory _$$_PrescriptionEntryModelCopyWith(_$_PrescriptionEntryModel value,
          $Res Function(_$_PrescriptionEntryModel) then) =
      __$$_PrescriptionEntryModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      MedicineType medicineType,
      MedicineTakingType medicineTakingType,
      int dailyDosageValue,
      String dosingPeriodStart,
      String dosingPeriodEnd,
      List<String> medicineDetails,
      int userTakingCnt});
}

/// @nodoc
class __$$_PrescriptionEntryModelCopyWithImpl<$Res>
    extends _$PrescriptionEntryModelCopyWithImpl<$Res,
        _$_PrescriptionEntryModel>
    implements _$$_PrescriptionEntryModelCopyWith<$Res> {
  __$$_PrescriptionEntryModelCopyWithImpl(_$_PrescriptionEntryModel _value,
      $Res Function(_$_PrescriptionEntryModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? medicineType = null,
    Object? medicineTakingType = null,
    Object? dailyDosageValue = null,
    Object? dosingPeriodStart = null,
    Object? dosingPeriodEnd = null,
    Object? medicineDetails = null,
    Object? userTakingCnt = null,
  }) {
    return _then(_$_PrescriptionEntryModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      medicineType: null == medicineType
          ? _value.medicineType
          : medicineType // ignore: cast_nullable_to_non_nullable
              as MedicineType,
      medicineTakingType: null == medicineTakingType
          ? _value.medicineTakingType
          : medicineTakingType // ignore: cast_nullable_to_non_nullable
              as MedicineTakingType,
      dailyDosageValue: null == dailyDosageValue
          ? _value.dailyDosageValue
          : dailyDosageValue // ignore: cast_nullable_to_non_nullable
              as int,
      dosingPeriodStart: null == dosingPeriodStart
          ? _value.dosingPeriodStart
          : dosingPeriodStart // ignore: cast_nullable_to_non_nullable
              as String,
      dosingPeriodEnd: null == dosingPeriodEnd
          ? _value.dosingPeriodEnd
          : dosingPeriodEnd // ignore: cast_nullable_to_non_nullable
              as String,
      medicineDetails: null == medicineDetails
          ? _value._medicineDetails
          : medicineDetails // ignore: cast_nullable_to_non_nullable
              as List<String>,
      userTakingCnt: null == userTakingCnt
          ? _value.userTakingCnt
          : userTakingCnt // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PrescriptionEntryModel extends _PrescriptionEntryModel
    with DiagnosticableTreeMixin {
  _$_PrescriptionEntryModel(
      {this.id = 0,
      this.medicineType = MedicineType.medicineInside,
      this.medicineTakingType = MedicineTakingType.dailyTwo,
      this.dailyDosageValue = 1,
      this.dosingPeriodStart = '',
      this.dosingPeriodEnd = '',
      final List<String> medicineDetails = const ['', '', ''],
      this.userTakingCnt = 0})
      : _medicineDetails = medicineDetails,
        super._();

  factory _$_PrescriptionEntryModel.fromJson(Map<String, dynamic> json) =>
      _$$_PrescriptionEntryModelFromJson(json);

  /// id
  @override
  @JsonKey()
  final int id;

  /// 種類
  @override
  @JsonKey()
  final MedicineType medicineType;

  /// 服用回数
  @override
  @JsonKey()
  final MedicineTakingType medicineTakingType;

  /// 服用量
  @override
  @JsonKey()
  final int dailyDosageValue;

  /// 服用期間(開始〜終了)
  @override
  @JsonKey()
  final String dosingPeriodStart;
  @override
  @JsonKey()
  final String dosingPeriodEnd;

  /// 内、薬名 3件まで
  final List<String> _medicineDetails;

  /// 内、薬名 3件まで
  @override
  @JsonKey()
  List<String> get medicineDetails {
    if (_medicineDetails is EqualUnmodifiableListView) return _medicineDetails;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_medicineDetails);
  }

  /// ユーザー服用回数
  @override
  @JsonKey()
  final int userTakingCnt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PrescriptionEntryModel(id: $id, medicineType: $medicineType, medicineTakingType: $medicineTakingType, dailyDosageValue: $dailyDosageValue, dosingPeriodStart: $dosingPeriodStart, dosingPeriodEnd: $dosingPeriodEnd, medicineDetails: $medicineDetails, userTakingCnt: $userTakingCnt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PrescriptionEntryModel'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('medicineType', medicineType))
      ..add(DiagnosticsProperty('medicineTakingType', medicineTakingType))
      ..add(DiagnosticsProperty('dailyDosageValue', dailyDosageValue))
      ..add(DiagnosticsProperty('dosingPeriodStart', dosingPeriodStart))
      ..add(DiagnosticsProperty('dosingPeriodEnd', dosingPeriodEnd))
      ..add(DiagnosticsProperty('medicineDetails', medicineDetails))
      ..add(DiagnosticsProperty('userTakingCnt', userTakingCnt));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PrescriptionEntryModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.medicineType, medicineType) ||
                other.medicineType == medicineType) &&
            (identical(other.medicineTakingType, medicineTakingType) ||
                other.medicineTakingType == medicineTakingType) &&
            (identical(other.dailyDosageValue, dailyDosageValue) ||
                other.dailyDosageValue == dailyDosageValue) &&
            (identical(other.dosingPeriodStart, dosingPeriodStart) ||
                other.dosingPeriodStart == dosingPeriodStart) &&
            (identical(other.dosingPeriodEnd, dosingPeriodEnd) ||
                other.dosingPeriodEnd == dosingPeriodEnd) &&
            const DeepCollectionEquality()
                .equals(other._medicineDetails, _medicineDetails) &&
            (identical(other.userTakingCnt, userTakingCnt) ||
                other.userTakingCnt == userTakingCnt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      medicineType,
      medicineTakingType,
      dailyDosageValue,
      dosingPeriodStart,
      dosingPeriodEnd,
      const DeepCollectionEquality().hash(_medicineDetails),
      userTakingCnt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PrescriptionEntryModelCopyWith<_$_PrescriptionEntryModel> get copyWith =>
      __$$_PrescriptionEntryModelCopyWithImpl<_$_PrescriptionEntryModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PrescriptionEntryModelToJson(
      this,
    );
  }
}

abstract class _PrescriptionEntryModel extends PrescriptionEntryModel {
  factory _PrescriptionEntryModel(
      {final int id,
      final MedicineType medicineType,
      final MedicineTakingType medicineTakingType,
      final int dailyDosageValue,
      final String dosingPeriodStart,
      final String dosingPeriodEnd,
      final List<String> medicineDetails,
      final int userTakingCnt}) = _$_PrescriptionEntryModel;
  _PrescriptionEntryModel._() : super._();

  factory _PrescriptionEntryModel.fromJson(Map<String, dynamic> json) =
      _$_PrescriptionEntryModel.fromJson;

  @override

  /// id
  int get id;
  @override

  /// 種類
  MedicineType get medicineType;
  @override

  /// 服用回数
  MedicineTakingType get medicineTakingType;
  @override

  /// 服用量
  int get dailyDosageValue;
  @override

  /// 服用期間(開始〜終了)
  String get dosingPeriodStart;
  @override
  String get dosingPeriodEnd;
  @override

  /// 内、薬名 3件まで
  List<String> get medicineDetails;
  @override

  /// ユーザー服用回数
  int get userTakingCnt;
  @override
  @JsonKey(ignore: true)
  _$$_PrescriptionEntryModelCopyWith<_$_PrescriptionEntryModel> get copyWith =>
      throw _privateConstructorUsedError;
}
