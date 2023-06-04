import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:healthnote/core/router/router.gr.dart';

import '../../features/count/data/models/count.dart';
import '../../features/count/domain/counter_provider.dart';

@RoutePage()
class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<HomePage> {
  final counterProvider = NotifierProvider<Counter, Count>(Counter.new);

  List<PageRouteInfo<dynamic>> get routes => [
        const CalendarRoute(),
        const HistoryRoute(),
      ];

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: routes,
      bottomNavigationBuilder: (context, tabsRouter) {
        return BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month),
              label: 'カレンダー',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_hospital),
              label: '薬歴',
            ),
          ],
          currentIndex: tabsRouter.activeIndex,
          onTap: (int index) {
            // 選択中じゃないタブをTapした場合
            if (tabsRouter.activeIndex != index) {
              tabsRouter.setActiveIndex(index);
            }
            // // 選択中のタブをTapした場合
            // else {
            //   // ネストされたルーターのスタック情報を破棄
            //   tabsRouter
            //       .innerRouterOf<StackRouter>(tabsRouter.current.name)
            //       ?.popUntilRoot();
            // }
          },
        );
      },
    );
  }
}
