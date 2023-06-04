import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:healthnote/core/router/router.gr.dart';

import '../../../features/prescription/data/models/prescription_list_model.dart';
import '../../../features/prescription/domain/prescription_list_provider.dart';
import '../../../features/prescription/presentation/medicine_list.dart';
import '../../../global/log.dart';

@RoutePage()
class CalendarPage extends ConsumerStatefulWidget {
  const CalendarPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CalendarPageState();
}

class _CalendarPageState extends ConsumerState<CalendarPage>
    with AutoRouteAware {
  AutoRouteObserver? _observer;

  /// 処方箋一覧
  final prescriptionListProvider =
      AsyncNotifierProvider<PrescriptionListNotifier, PrescriptionListModel>(
    PrescriptionListNotifier.new,
  );

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _observer =
        RouterScope.of(context).firstObserverOfType<AutoRouteObserver>();
    if (_observer != null) {
      _observer?.subscribe(this, context.routeData);
    }
  }

  @override
  void dispose() {
    super.dispose();
    _observer?.unsubscribe(this);
  }

  @override
  void didChangeTabRoute(TabPageRoute previousRoute) {
    logger.info('CalendarPage didChangeTabRoute');

    // 際読み込み
    ref.invalidate(prescriptionListProvider);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('飲むお薬'),
      ),
      body: Container(
        color: Colors.grey[100],
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              // 処方箋一覧
              MedicineList(
                listProvider: prescriptionListProvider,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          await context.pushRoute(const EntryRoute());

          // 際読み込み
          ref.invalidate(prescriptionListProvider);
        },
        tooltip: '処方箋入力',
        icon: const Icon(Icons.add),
        label: const Text('処方箋入力'),
      ),
    );
  }
}
