import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/styles/styles.dart';
import '../data/models/enums/enums.dart';
import '../data/models/prescription_entry_model.dart';
import '../domain/prescription_entry_provider.dart';

class MedicineTypeSelect extends ConsumerWidget {
  const MedicineTypeSelect({
    super.key,
    required this.inputProvider,
  });

  final NotifierProvider<PrescriptionEntryNotifier, PrescriptionEntryModel>
      inputProvider;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final medicineType = ref.watch(inputProvider).medicineType;

    return Wrap(
      children: <Widget>[
        ...MedicineType.values.map((e) {
          return InkWell(
            onTap: () {
              ref.read(inputProvider.notifier).setMedicineType(
                    e,
                  );
            },
            child: Padding(
              padding: EdgeInsets.only(
                left: 8.w,
                right: 8.w,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Radio<MedicineType>(
                    value: e,
                    groupValue: medicineType,
                    // ここだとラジオボタンの意、名前タップでは変更されなかった
                    onChanged: (MedicineType? value) {},
                  ),
                  Text(
                    e.displayName,
                    style: TextStyle(
                      fontSize: fontSizeM,
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ],
    );
  }
}
