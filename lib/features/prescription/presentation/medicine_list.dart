import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthnote/core/styles/styles.dart';
import 'package:slider_button/slider_button.dart';

import '../../../core/router/router.gr.dart';
import '../data/models/prescription_list_model.dart';
import '../domain/prescription_list_provider.dart';

class MedicineList extends ConsumerWidget {
  const MedicineList({
    super.key,
    required this.listProvider,
  });

  final AsyncNotifierProvider<PrescriptionListNotifier, PrescriptionListModel>
      listProvider;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final list = ref.watch(listProvider);

    return list.when(
      loading: () {
        return const Center(
          child: CircularProgressIndicator(),
        );
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
                return Card(
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
                        InkWell(
                          onTap: () async {
                            await context.pushRoute(EditRoute(item: e));

                            ref.invalidate(listProvider);
                          },
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
                            ],
                          ),
                        ),
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
                        SizedBox(
                          height: 8.h,
                        ),
                        if (e.isUserTaking() == false)
                          Text(
                            '本日分は飲みきっています',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: fontSizeM,
                            ),
                          ),
                        if (e.isUserTaking())
                          Row(
                            children: [
                              SizedBox(
                                width: 16.w,
                              ),
                              Expanded(
                                child: SliderButton(
                                  height: 24.h,
                                  buttonSize: 24.h,
                                  width: double.infinity,
                                  buttonColor: Colors.blue,
                                  action: () {
                                    ref
                                        .read(listProvider.notifier)
                                        .dbUpdUserTakingCnt(
                                          id: e.id,
                                          userTakingCnt: e.userTakingCnt + 1,
                                        );

                                    ref.invalidate(listProvider);
                                  },
                                  label: Text(
                                    '薬を飲んだらスワイプ',
                                    style: TextStyle(
                                      color: const Color(0xff4a4a4a),
                                      fontSize: fontSizeM,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 16.w,
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
                );
              }),
              SizedBox(
                height: 64.h,
              ),
            ],
          ),
        );
      },
    );
  }
}
