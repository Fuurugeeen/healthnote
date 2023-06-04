import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/models/count.dart';

class Counter extends Notifier<Count> {
  @override
  Count build() => Count();

  // オプション
  void increment() {
    state = state.copyWith(
      value: state.value + 1,
    );
  }
}
