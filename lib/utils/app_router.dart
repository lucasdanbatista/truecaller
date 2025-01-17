import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';

import 'app_router.gr.dart';

@LazySingleton(as: RootStackRouter)
@AutoRouterConfig()
class AppRoute extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page, initial: true),
        AutoRoute(page: PhoneListRoute.page),
      ];
}
