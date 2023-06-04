import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:healthnote/core/router/router.gr.dart';

Route<T> myCustomRouteBuilder<T>(
  BuildContext context,
  Widget child,
  AutoRoutePage<T> page,
) {
  return PageRouteBuilder(
    fullscreenDialog: page.fullscreenDialog,
    settings: page,
    pageBuilder: (_, __, ___) => child,
  );
}

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        // ホーム画面
        AutoRoute(
          page: HomeRoute.page,
          initial: true,
          children: [
            // カレンダー
            AutoRoute(
              path: 'calendar',
              page: CalendarRoute.page,
              initial: true,
            ),
            // 薬歴
            AutoRoute(
              path: 'history',
              page: HistoryRoute.page,
            ),
          ],
        ),
        // 薬入力画面モーダル表示
        CustomRoute(
          path: '/entry',
          page: EntryRoute.page,
          fullscreenDialog: true,
          customRouteBuilder: myCustomRouteBuilder,
        ),
        // 薬編集画面モーダル表示
        CustomRoute(
          path: '/edit:id',
          page: EditRoute.page,
          fullscreenDialog: true,
          customRouteBuilder: myCustomRouteBuilder,
        ),
      ];
}
