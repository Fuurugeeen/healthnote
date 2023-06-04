// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'prescription_list_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PrescriptionListModel _$PrescriptionListModelFromJson(
    Map<String, dynamic> json) {
  return _PrescriptionListModel.fromJson(json);
}

/// @nodoc
mixin _$PrescriptionListModel {
  /// 内、薬名 3件まで
  List<PrescriptionEntryModel> get items => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PrescriptionListModelCopyWith<PrescriptionListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PrescriptionListModelCopyWith<$Res> {
  factory $PrescriptionListModelCopyWith(PrescriptionListModel value,
          $Res Function(PrescriptionListModel) then) =
      _$PrescriptionListModelCopyWithImpl<$Res, PrescriptionListModel>;
  @useResult
  $Res call({List<PrescriptionEntryModel> items});
}

/// @nodoc
class _$PrescriptionListModelCopyWithImpl<$Res,
        $Val extends PrescriptionListModel>
    implements $PrescriptionListModelCopyWith<$Res> {
  _$PrescriptionListModelCopyWithImpl(this._value, this._then);

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
abstract class _$$_PrescriptionListModelCopyWith<$Res>
    implements $PrescriptionListModelCopyWith<$Res> {
  factory _$$_PrescriptionListModelCopyWith(_$_PrescriptionListModel value,
          $Res Function(_$_PrescriptionListModel) then) =
      __$$_PrescriptionListModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<PrescriptionEntryModel> items});
}

/// @nodoc
class __$$_PrescriptionListModelCopyWithImpl<$Res>
    extends _$PrescriptionListModelCopyWithImpl<$Res, _$_PrescriptionListModel>
    implements _$$_PrescriptionListModelCopyWith<$Res> {
  __$$_PrescriptionListModelCopyWithImpl(_$_PrescriptionListModel _value,
      $Res Function(_$_PrescriptionListModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
  }) {
    return _then(_$_PrescriptionListModel(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<PrescriptionEntryModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PrescriptionListModel extends _PrescriptionListModel
    with DiagnosticableTreeMixin {
  _$_PrescriptionListModel(
      {final List<PrescriptionEntryModel> items = const []})
      : _items = items,
        super._();

  factory _$_PrescriptionListModel.fromJson(Map<String, dynamic> json) =>
      _$$_PrescriptionListModelFromJson(json);

  /// 内、薬名 3件まで
  final List<PrescriptionEntryModel> _items;

  /// 内、薬名 3件まで
  @override
  @JsonKey()
  List<PrescriptionEntryModel> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PrescriptionListModel(items: $items)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PrescriptionListModel'))
      ..add(DiagnosticsProperty('items', items));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PrescriptionListModel &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PrescriptionListModelCopyWith<_$_PrescriptionListModel> get copyWith =>
      __$$_PrescriptionListModelCopyWithImpl<_$_PrescriptionListModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PrescriptionListModelToJson(
      this,
    );
  }
}

abstract class _PrescriptionListModel extends PrescriptionListModel {
  factory _PrescriptionListModel({final List<PrescriptionEntryModel> items}) =
      _$_PrescriptionListModel;
  _PrescriptionListModel._() : super._();

  factory _PrescriptionListModel.fromJson(Map<String, dynamic> json) =
      _$_PrescriptionListModel.fromJson;

  @override

  /// 内、薬名 3件まで
  List<PrescriptionEntryModel> get items;
  @override
  @JsonKey(ignore: true)
  _$$_PrescriptionListModelCopyWith<_$_PrescriptionListModel> get copyWith =>
      throw _privateConstructorUsedError;
}
