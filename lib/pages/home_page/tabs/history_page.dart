import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../features/prescription/data/models/prescription_history_model.dart';
import '../../../features/prescription/domain/prescription_history_provider.dart';
import '../../../features/prescription/presentation/medicine_history.dart';
import '../../../global/log.dart';

@RoutePage()
class HistoryPage extends ConsumerStatefulWidget {
  const HistoryPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HistoryPageState();
}

class _HistoryPageState extends ConsumerState<HistoryPage> with AutoRouteAware {
  AutoRouteObserver? _observer;

  /// 処方箋履歴
  final prescriptionHistoryProvider = AsyncNotifierProvider<
      PrescriptionHistoryNotifier, PrescriptionHistoryModel>(
    PrescriptionHistoryNotifier.new,
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
    logger.info('HistoryPage didChangeTabRoute');

    // 再読み込み
    ref.invalidate(prescriptionHistoryProvider);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('処方箋履歴'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // 処方箋履歴
            MedicineHistory(
              historyProvider: prescriptionHistoryProvider,
            ),
          ],
        ),
      ),
    );
  }
}
