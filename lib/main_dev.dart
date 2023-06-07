import 'package:auto_route/auto_route.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthnote/global/global_init.dart' as gi;

import 'core/router/router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // get_it初期化
  gi.setup();

  runApp(
    ProviderScope(
      child: DevicePreview(
        builder: (BuildContext context) {
          return const MyApp();
        },
      ),
    ),
  );
}

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
          locale: DevicePreview.locale(context),
          builder: (context, child) {
            return Stack(
              children: [
                DevicePreview.appBuilder(context, child),
              ],
            );
          },
          routerConfig: _appRouter.config(
            // 画面毎のタブ変更検知で追加
            navigatorObservers: () => [
              AutoRouteObserver(),
            ],
          ),
          // screenutilが効くか確認用に追加。
          theme: ThemeData(
            primarySwatch: Colors.blue,
            appBarTheme: AppBarTheme(
              titleSpacing: 10.w,
            ),
          ),
        );
      },
    );
  }
}
