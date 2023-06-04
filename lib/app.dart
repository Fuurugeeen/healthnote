import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/router/router.dart';

final _appRouter = AppRouter();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // ScreenUtilInitを使って複数デバイスの画面サイズ対応
    //  designSizeで指定したサイズをベースにする
    return ScreenUtilInit(
      // ignore: avoid_redundant_argument_values
      designSize: const Size(360, 690),
      builder: (context, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: _appRouter.config(
            // 画面毎のタブ変更検知で追加
            navigatorObservers: () => [
              AutoRouteObserver(),
            ],
          ),
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
        );
      },
    );
  }
}
