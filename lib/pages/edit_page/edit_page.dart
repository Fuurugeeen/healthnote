import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slider_button/slider_button.dart';

import '../../../core/styles/styles.dart';
import '../../../features/prescription/data/models/prescription_entry_model.dart';
import '../../../features/prescription/domain/prescription_entry_provider.dart';
import '../../../features/prescription/presentation/medicine_daily_dosage_value_select.dart';
import '../../../features/prescription/presentation/medicine_dosing_period_select.dart';
import '../../../features/prescription/presentation/medicine_taking_type_select.dart';
import '../../../features/prescription/presentation/medicine_type_select.dart';
import '../../features/prescription/presentation/medicine_details_input.dart';
import '../../features/prescription/presentation/medicine_memo_input.dart';

@RoutePage()
class EditPage extends ConsumerStatefulWidget {
  const EditPage({
    super.key,
    required this.item,
  });

  final PrescriptionEntryModel item;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EditPageState();
}

class _EditPageState extends ConsumerState<EditPage> {
  /// 画面初期化完了フラグ
  bool initFlag = false;

  /// 処方箋入力
  final prescriptionEntryProvider =
      NotifierProvider<PrescriptionEntryNotifier, PrescriptionEntryModel>(
    PrescriptionEntryNotifier.new,
  );

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // 画面描画完了後に処理を実行
      ref.read(prescriptionEntryProvider.notifier).initEdit(item: widget.item);

      setState(() {
        initFlag = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final titleTs = TextStyle(
      fontSize: fontSizeL,
      fontWeight: FontWeight.bold,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('編集画面 id：${widget.item.id}'),
      ),
      body: initFlag == false
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(
                  top: 16.h,
                  left: 16.w,
                  right: 16.w,
                  bottom: 16.h,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // 薬種類
                    Text(
                      '種類',
                      style: titleTs,
                    ),
                    MedicineTypeSelect(
                      inputProvider: prescriptionEntryProvider,
                    ),
                    SizedBox(height: 8.h),

                    // 服用回数
                    Text(
                      '服用回数',
                      style: titleTs,
                    ),
                    MedicineTakingTypeSelect(
                      inputProvider: prescriptionEntryProvider,
                    ),
                    SizedBox(height: 8.h),

                    // 服用期間
                    Text(
                      '服用期間',
                      style: titleTs,
                    ),
                    MedicineDosingPeriodSelect(
                      inputProvider: prescriptionEntryProvider,
                    ),
                    SizedBox(height: 8.h),

                    // 服用量
                    Text(
                      '服用量（1回あたり）',
                      style: titleTs,
                    ),
                    DailyDosageValueSelect(
                      inputProvider: prescriptionEntryProvider,
                    ),
                    SizedBox(height: 8.h),

                    // 薬名
                    Text(
                      '内、薬名',
                      style: titleTs,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 16.w,
                        right: 16.w,
                      ),
                      child: MedicineDetailsInput(
                        inputProvider: prescriptionEntryProvider,
                      ),
                    ),
                    SizedBox(height: 24.h),

                    // メモ
                    Text(
                      'メモ',
                      style: titleTs,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 16.w,
                        right: 16.w,
                      ),
                      child: MedicineMemoInput(
                        inputProvider: prescriptionEntryProvider,
                      ),
                    ),
                    SizedBox(height: 8.h),

                    // 登録
                    SizedBox(height: 32.h),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () async {
                          // // 登録
                          // context.router.pop();

                          final validations = ref
                              .read(prescriptionEntryProvider.notifier)
                              .validationAll();

                          if (validations.isNotEmpty) {
                            // バリデーションエラーがあれば表示
                            return showDialog<void>(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text('エラー'),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: validations
                                        .map(
                                          Text.new,
                                        )
                                        .toList(),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text('OK'),
                                    ),
                                  ],
                                );
                              },
                            );
                          }

                          // データベース登録
                          final item = ref.read(prescriptionEntryProvider);
                          await ref
                              .read(prescriptionEntryProvider.notifier)
                              .dbUpdateMedicine(
                                prescriptionEntryModel: item,
                              );

                          if (context.mounted) {
                            // スナックバー表示
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('更新しました'),
                                duration: Duration(seconds: 1),
                              ),
                            );
                            Navigator.pop(context);
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            '更新',
                            style: titleTs,
                          ),
                        ),
                      ),
                    ),

                    // 削除
                    SizedBox(height: 16.h),
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
                            buttonColor: Colors.red,
                            action: () {
                              final item = ref.read(prescriptionEntryProvider);
                              ref
                                  .read(prescriptionEntryProvider.notifier)
                                  .dbDelPrescription(
                                    prescriptionEntryModel: item,
                                  );

                              if (context.mounted) {
                                // スナックバー表示
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('削除しました'),
                                    duration: Duration(seconds: 1),
                                  ),
                                );
                                Navigator.pop(context);
                              }
                            },
                            label: Text(
                              '削除するならスワイプ',
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
                    SizedBox(height: 16.h),
                  ],
                ),
              ),
            ),
    );
  }
}
