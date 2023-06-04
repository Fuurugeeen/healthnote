// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'prescription_history_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PrescriptionHistoryModel _$PrescriptionHistoryModelFromJson(
    Map<String, dynamic> json) {
  return _PrescriptionHistoryModel.fromJson(json);
}

/// @nodoc
mixin _$PrescriptionHistoryModel {
  List<PrescriptionEntryModel> get items => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PrescriptionHistoryModelCopyWith<PrescriptionHistoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PrescriptionHistoryModelCopyWith<$Res> {
  factory $PrescriptionHistoryModelCopyWith(PrescriptionHistoryModel value,
          $Res Function(PrescriptionHistoryModel) then) =
      _$PrescriptionHistoryModelCopyWithImpl<$Res, PrescriptionHistoryModel>;
  @useResult
  $Res call({List<PrescriptionEntryModel> items});
}

/// @nodoc
class _$PrescriptionHistoryModelCopyWithImpl<$Res,
        $Val extends PrescriptionHistoryModel>
    implements $PrescriptionHistoryModelCopyWith<$Res> {
  _$PrescriptionHistoryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
  }) {
    return _then(_value.copyWith(
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<PrescriptionEntryModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PrescriptionHistoryModelCopyWith<$Res>
    implements $PrescriptionHistoryModelCopyWith<$Res> {
  factory _$$_PrescriptionHistoryModelCopyWith(
          _$_PrescriptionHistoryModel value,
          $Res Function(_$_PrescriptionHistoryModel) then) =
      __$$_PrescriptionHistoryModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<PrescriptionEntryModel> items});
}

/// @nodoc
class __$$_PrescriptionHistoryModelCopyWithImpl<$Res>
    extends _$PrescriptionHistoryModelCopyWithImpl<$Res,
        _$_PrescriptionHistoryModel>
    implements _$$_PrescriptionHistoryModelCopyWith<$Res> {
  __$$_PrescriptionHistoryModelCopyWithImpl(_$_PrescriptionHistoryModel _value,
      $Res Function(_$_PrescriptionHistoryModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
  }) {
    return _then(_$_PrescriptionHistoryModel(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<PrescriptionEntryModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PrescriptionHistoryModel extends _PrescriptionHistoryModel
    with DiagnosticableTreeMixin {
  _$_PrescriptionHistoryModel(
      {final List<PrescriptionEntryModel> items = const []})
      : _items = items,
        super._();

  factory _$_PrescriptionHistoryModel.fromJson(Map<String, dynamic> json) =>
      _$$_PrescriptionHistoryModelFromJson(json);

  final List<PrescriptionEntryModel> _items;
  @override
  @JsonKey()
  List<PrescriptionEntryModel> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PrescriptionHistoryModel(items: $items)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PrescriptionHistoryModel'))
      ..add(DiagnosticsProperty('items', items));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PrescriptionHistoryModel &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PrescriptionHistoryModelCopyWith<_$_PrescriptionHistoryModel>
      get copyWith => __$$_PrescriptionHistoryModelCopyWithImpl<
          _$_PrescriptionHistoryModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PrescriptionHistoryModelToJson(
      this,
    );
  }
}

abstract class _PrescriptionHistoryModel extends PrescriptionHistoryModel {
  factory _PrescriptionHistoryModel(
      {final List<PrescriptionEntryModel> items}) = _$_PrescriptionHistoryModel;
  _PrescriptionHistoryModel._() : super._();

  factory _PrescriptionHistoryModel.fromJson(Map<String, dynamic> json) =
      _$_PrescriptionHistoryModel.fromJson;

  @override
  List<PrescriptionEntryModel> get items;
  @override
  @JsonKey(ignore: true)
  _$$_PrescriptionHistoryModelCopyWith<_$_PrescriptionHistoryModel>
      get copyWith => throw _privateConstructorUsedError;
}
