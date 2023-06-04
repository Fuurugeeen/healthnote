import 'package:freezed_annotation/freezed_annotation.dart';

part 'count.freezed.dart';

@freezed
class Count with _$Count {
  factory Count({
    @Default(0) int value,
    @Default('') String version,
  }) = _Count;
  Count._();
}
