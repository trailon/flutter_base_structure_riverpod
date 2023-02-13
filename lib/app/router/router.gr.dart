// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;

import '../../views/detail_view/detail_view.dart' as _i2;
import '../../views/home_view/home_view.dart' as _i1;
import 'custom_route_builder.dart' as _i5;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    HomeViewRoute.name: (routeData) {
      return _i3.CustomPage<void>(
        routeData: routeData,
        child: const _i1.HomeView(),
        transitionsBuilder: _i5.CustomRouteBuilder.slideTransitionBuilder,
        durationInMilliseconds: 400,
        opaque: true,
        barrierDismissible: false,
      );
    },
    DetailViewRoute.name: (routeData) {
      return _i3.CustomPage<void>(
        routeData: routeData,
        child: const _i2.DetailView(),
        transitionsBuilder: _i5.CustomRouteBuilder.slideTransitionBuilder,
        durationInMilliseconds: 400,
        opaque: true,
        barrierDismissible: false,
      );
    },
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(
          HomeViewRoute.name,
          path: '/',
        ),
        _i3.RouteConfig(
          DetailViewRoute.name,
          path: '/detail-view',
        ),
      ];
}

/// generated route for
/// [_i1.HomeView]
class HomeViewRoute extends _i3.PageRouteInfo<void> {
  const HomeViewRoute()
      : super(
          HomeViewRoute.name,
          path: '/',
        );

  static const String name = 'HomeViewRoute';
}

/// generated route for
/// [_i2.DetailView]
class DetailViewRoute extends _i3.PageRouteInfo<void> {
  const DetailViewRoute()
      : super(
          DetailViewRoute.name,
          path: '/detail-view',
        );

  static const String name = 'DetailViewRoute';
}
