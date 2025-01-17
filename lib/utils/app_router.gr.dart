// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;
import 'package:truecaller/entities/phone_list_mode.dart' as _i5;
import 'package:truecaller/features/home/home_page.dart' as _i1;
import 'package:truecaller/features/phone_list/phone_list_page.dart' as _i2;

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i3.PageRouteInfo<void> {
  const HomeRoute({List<_i3.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      return const _i1.HomePage();
    },
  );
}

/// generated route for
/// [_i2.PhoneListPage]
class PhoneListRoute extends _i3.PageRouteInfo<PhoneListRouteArgs> {
  PhoneListRoute({
    _i4.Key? key,
    required _i5.PhoneListMode mode,
    List<_i3.PageRouteInfo>? children,
  }) : super(
          PhoneListRoute.name,
          args: PhoneListRouteArgs(
            key: key,
            mode: mode,
          ),
          initialChildren: children,
        );

  static const String name = 'PhoneListRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PhoneListRouteArgs>();
      return _i2.PhoneListPage(
        key: args.key,
        mode: args.mode,
      );
    },
  );
}

class PhoneListRouteArgs {
  const PhoneListRouteArgs({
    this.key,
    required this.mode,
  });

  final _i4.Key? key;

  final _i5.PhoneListMode mode;

  @override
  String toString() {
    return 'PhoneListRouteArgs{key: $key, mode: $mode}';
  }
}
