import 'package:auto_route/annotations.dart';

import '../../views/detail_view/detail_view.dart';
import '../../views/home_view/home_view.dart';
import '../app_defaults.dart';
import 'custom_route_builder.dart';

@CustomAutoRouter(
  transitionsBuilder: CustomRouteBuilder.slideTransitionBuilder,
  durationInMilliseconds: AppDefaults.kStandartTransitionDuration,
  routes: [
    CustomRoute<void>(
      transitionsBuilder: CustomRouteBuilder.slideTransitionBuilder,
      durationInMilliseconds: AppDefaults.kStandartTransitionDuration,
      page: HomeView,
      initial: true,
      name: 'homeViewRoute',
    ),
    CustomRoute<void>(
      transitionsBuilder: CustomRouteBuilder.slideTransitionBuilder,
      durationInMilliseconds: AppDefaults.kStandartTransitionDuration,
      page: DetailView,
      name: 'detailViewRoute',
    ),
  ],
)
class $AppRouter {}
