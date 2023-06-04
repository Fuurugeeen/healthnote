import 'package:flutter/material.dart';
import 'package:flutter_cupertino_datetime_picker/flutter_cupertino_datetime_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../core/styles/styles.dart';
import '../data/models/prescription_entry_model.dart';
import '../domain/prescription_entry_provider.dart';

class MedicineDosingPeriodSelect extends ConsumerStatefulWidget {
  const MedicineDosingPeriodSelect({
    super.key,
    required this.inputProvider,
  });

  final NotifierProvider<PrescriptionEntryNotifier, PrescriptionEntryModel>
      inputProvider;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MedicineDosingPeriodSelectState();
}

class _MedicineDosingPeriodSelectState
    extends ConsumerState<MedicineDosingPeriodSelect> {
  final _dateTime = DateTime.now();
  final _locale = DateTimePickerLocale.jp;

  bool isValidationCheck = true;

  @override
  Widget build(BuildContext context) {
    final dosingPeriodStart = ref.watch(widget.inputProvider).dosingPeriodStart;
    final dosingPeriodEnd = ref.watch(widget.inputProvider).dosingPeriodEnd;

    return Row(
      children: [
        TextButton(
          onPressed: () {
            _showDatePicker(dateType: 0);
          },
          child: Text(
            dosingPeriodStart,
            style: TextStyle(fontSize: fontSizeL),
          ),
        ),
        const Text('〜'),
        TextButton(
          onPressed: () {
            _showDatePicker(dateType: 1);
          },
          child: Text(
            dosingPeriodEnd,
            style: TextStyle(fontSize: fontSizeL),
          ),
        ),
      ],
    );
  }

  void _showDatePicker({
    required int dateType,
  }) {
    final dateFormat = ref.read(widget.inputProvider.notifier).dateFormat;
    final minDateTime = ref.read(widget.inputProvider.notifier).minDateTime;
    final maxDateTime = ref.read(widget.inputProvider.notifier).maxDateTime;

    DatePicker.showDatePicker(
      context,
      onMonthChangeStartWithFirstDate: true,
      pickerTheme: const DateTimePickerTheme(
        confirm: Text(
          '決定',
          style: TextStyle(color: Colors.red),
        ),
      ),

      // Todo: 終了期間指定の時は、minDateTimeに開始期間を設定する
      minDateTime: DateTime.parse(minDateTime),
      maxDateTime: DateTime.parse(maxDateTime),
      initialDateTime: _dateTime,
      dateFormat: dateFormat,
      locale: _locale,
      onConfirm: (dateTime, List<int> index) {
        setState(() {
          final date = DateFormat(dateFormat).format(dateTime);

          final input = ref.read(widget.inputProvider.notifier);
          if (dateType == 0) {
            // 開始期間を設定
            input.setDosingPeriodStart(date);
          } else {
            // 終了期間を設定
            input.setDosingPeriodEnd(date);
          }

          // 登録時にまとめてチェックする
          // // バリデーションチェック
          // isValidationCheck =
          //     ref.read(widget.inputProvider.notifier).validationDosingPeriod();
        });
      },
    );
  }
}
