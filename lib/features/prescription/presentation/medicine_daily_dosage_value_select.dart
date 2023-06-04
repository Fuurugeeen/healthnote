import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/styles/styles.dart';
import '../data/models/prescription_entry_model.dart';
import '../domain/prescription_entry_provider.dart';

class DailyDosageValueSelect extends ConsumerWidget {
  const DailyDosageValueSelect({
    super.key,
    required this.inputProvider,
  });

  final NotifierProvider<PrescriptionEntryNotifier, PrescriptionEntryModel>
      inputProvider;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dailyDosageValue = ref.watch(inputProvider).dailyDosageValue;

    return Row(
      children: <Widget>[
        IconButton(
          onPressed: () {
            ref.read(inputProvider.notifier).setDailyDosageValue(setType: 1);
          },
          icon: const Icon(
            Icons.remove_circle_outline,
            color: Colors.blue,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: 4.h,
            left: 4.w,
            right: 4.w,
            bottom: 4.h,
          ),
          child: Text(
            '$dailyDosageValue錠',
            style: TextStyle(
              fontSize: fontSizeL,
            ),
          ),
        ),
        IconButton(
          onPressed: () {
            ref.read(inputProvider.notifier).setDailyDosageValue(setType: 0);
          },
          icon: const Icon(
            Icons.add_circle_outline,
            color: Colors.blue,
          ),
        ),
      ],
    );
  }
}
