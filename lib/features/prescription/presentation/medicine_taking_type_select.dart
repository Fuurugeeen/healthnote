import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/styles/styles.dart';
import '../data/models/enums/enums.dart';
import '../data/models/prescription_entry_model.dart';
import '../domain/prescription_entry_provider.dart';

class MedicineTakingTypeSelect extends ConsumerWidget {
  const MedicineTakingTypeSelect({
    super.key,
    required this.inputProvider,
  });

  final NotifierProvider<PrescriptionEntryNotifier, PrescriptionEntryModel>
      inputProvider;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final medicineTakingType = ref.watch(inputProvider).medicineTakingType;

    return Wrap(
      children: <Widget>[
        ...MedicineTakingType.values.map((e) {
          return InkWell(
            onTap: () {
              ref.read(inputProvider.notifier).setMedicineTakingType(
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
                  Radio<MedicineTakingType>(
                    value: e,
                    groupValue: medicineTakingType,
                    // ここだとラジオボタンの意、名前タップでは変更されなかった
                    onChanged: (MedicineTakingType? value) {},
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
