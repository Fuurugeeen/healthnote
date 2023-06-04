import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthnote/core/styles/styles.dart';

import '../../../core/router/router.gr.dart';
import '../data/models/prescription_history_model.dart';
import '../domain/prescription_history_provider.dart';

class MedicineHistory extends ConsumerWidget {
  const MedicineHistory({
    super.key,
    required this.historyProvider,
  });

  final AsyncNotifierProvider<PrescriptionHistoryNotifier,
      PrescriptionHistoryModel> historyProvider;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final list = ref.watch(historyProvider);

    return list.when(
      loading: () {
        return const CircularProgressIndicator();
      },
      error: (e, s) {
        return const Text('error');
      },
      data: (data) {
        final items = list.asData!.value.items;

        return Padding(
          padding: EdgeInsets.only(
            left: 16.w,
            right: 16.w,
            bottom: 64.h,
          ),
          child: Column(
            children: [
              SizedBox(
                height: 16.h,
              ),
              if (items.isEmpty)
                Text(
                  '登録がありません。',
                  style: TextStyle(
                    fontSize: fontSizeL,
                  ),
                ),
              ...items.map((e) {
                return InkWell(
                  onTap: () async {
                    await context.pushRoute(EditRoute(item: e));

                    ref.invalidate(historyProvider);
                  },
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 16.h,
                        left: 16.w,
                        right: 16.w,
                        bottom: 16.h,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'id：${e.id}',
                            style: TextStyle(
                              fontSize: fontSizeM,
                            ),
                          ),
                          Text(
                            e.medicineType.displayName,
                            style: TextStyle(
                              fontSize: fontSizeM,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                e.medicineTakingType.displayName,
                                style: TextStyle(
                                  fontSize: fontSizeM,
                                ),
                              ),
                              SizedBox(
                                width: 8.w,
                              ),
                              Text(
                                '${e.dailyDosageValue}錠',
                                style: TextStyle(
                                  fontSize: fontSizeM,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                '服用期間：',
                                style: TextStyle(
                                  fontSize: fontSizeM,
                                ),
                              ),
                              Text(
                                e.dosingPeriodStart,
                                style: TextStyle(
                                  fontSize: fontSizeM,
                                ),
                              ),
                              const Text(
                                ' ~ ',
                              ),
                              Text(
                                e.dosingPeriodEnd,
                                style: TextStyle(
                                  fontSize: fontSizeM,
                                ),
                              ),
                            ],
                          ),
                          if (e.memo != '')
                            Text(
                              '備考：${e.memo}',
                              style: TextStyle(
                                fontSize: fontSizeM,
                              ),
                            ),
                          if (e.medicineDetails.isNotEmpty) ...[
                            Text(
                              '内、薬名：',
                              style: TextStyle(
                                fontSize: fontSizeM,
                              ),
                            ),
                            if (e.medicineDetails[0] != '')
                              Text(
                                '  ${e.medicineDetails[0]}',
                                style: TextStyle(
                                  fontSize: fontSizeM,
                                ),
                              ),
                            if (e.medicineDetails[1] != '')
                              Text(
                                '  ${e.medicineDetails[1]}',
                                style: TextStyle(
                                  fontSize: fontSizeM,
                                ),
                              ),
                            if (e.medicineDetails[2] != '')
                              Text(
                                '  ${e.medicineDetails[2]}',
                                style: TextStyle(
                                  fontSize: fontSizeM,
                                ),
                              ),
                          ],
                          const Divider(),
                          Row(
                            children: [
                              Text(
                                '飲んだ回数：${e.userTakingCnt}',
                                style: TextStyle(
                                  fontSize: fontSizeM,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              })
            ],
          ),
        );
      },
    );
  }
}
