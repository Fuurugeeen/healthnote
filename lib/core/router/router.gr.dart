// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;
import 'package:healthnote/features/prescription/data/models/prescription_entry_model.dart'
    as _i8;
import 'package:healthnote/pages/edit_page/edit_page.dart' as _i4;
import 'package:healthnote/pages/entry_page/entry_page.dart' as _i5;
import 'package:healthnote/pages/home_page/home_page.dart' as _i3;
import 'package:healthnote/pages/home_page/tabs/calendar_page.dart' as _i2;
import 'package:healthnote/pages/home_page/tabs/history_page.dart' as _i1;

abstract class $AppRouter extends _i6.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    HistoryRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.HistoryPage(),
      );
    },
    CalendarRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.CalendarPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.HomePage(),
      );
    },
    EditRoute.name: (routeData) {
      final args = routeData.argsAs<EditRouteArgs>();
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.EditPage(
          key: args.key,
          item: args.item,
        ),
      );
    },
    EntryRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.EntryPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.HistoryPage]
class HistoryRoute extends _i6.PageRouteInfo<void> {
  const HistoryRoute({List<_i6.PageRouteInfo>? children})
      : super(
          HistoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'HistoryRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i2.CalendarPage]
class CalendarRoute extends _i6.PageRouteInfo<void> {
  const CalendarRoute({List<_i6.PageRouteInfo>? children})
      : super(
          CalendarRoute.name,
          initialChildren: children,
        );

  static const String name = 'CalendarRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i3.HomePage]
class HomeRoute extends _i6.PageRouteInfo<void> {
  const HomeRoute({List<_i6.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i4.EditPage]
class EditRoute extends _i6.PageRouteInfo<EditRouteArgs> {
  EditRoute({
    _i7.Key? key,
    required _i8.PrescriptionEntryModel item,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          EditRoute.name,
          args: EditRouteArgs(
            key: key,
            item: item,
          ),
          initialChildren: children,
        );

  static const String name = 'EditRoute';

  static const _i6.PageInfo<EditRouteArgs> page =
      _i6.PageInfo<EditRouteArgs>(name);
}

class EditRouteArgs {
  const EditRouteArgs({
    this.key,
    required this.item,
  });

  final _i7.Key? key;

  final _i8.PrescriptionEntryModel item;

  @override
  String toString() {
    return 'EditRouteArgs{key: $key, item: $item}';
  }
}

/// generated route for
/// [_i5.EntryPage]
class EntryRoute extends _i6.PageRouteInfo<void> {
  const EntryRoute({List<_i6.PageRouteInfo>? children})
      : super(
          EntryRoute.name,
          initialChildren: children,
        );

  static const String name = 'EntryRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}
