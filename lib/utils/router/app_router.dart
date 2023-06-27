import 'package:auto_route/auto_route.dart';
import 'package:chupp/utils/router/guards/auth.dart';

import 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends $AppRouter implements AutoRouteGuard {
  @override
  List<AutoRoute> get routes => [
        CustomRoute(
          page: SplashRoute.page,
          initial: true,
          transitionsBuilder: TransitionsBuilders.noTransition,
        ),
        CustomRoute(
          page: AuthRoute.page,
          transitionsBuilder: TransitionsBuilders.noTransition,
        ),
        CustomRoute(
          page: HomeRoute.page,
          transitionsBuilder: TransitionsBuilders.noTransition,
        ),
        CustomRoute(
          page: SearchRoute.page,
          transitionsBuilder: TransitionsBuilders.noTransition,
        ),
        CustomRoute(
          page: LikedPostsRoute.page,
          transitionsBuilder: TransitionsBuilders.noTransition,
        ),
        CustomRoute(
          page: ProfileRoute.page,
          transitionsBuilder: TransitionsBuilders.noTransition,
        ),
      ];

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    AuthGuard.onNavigation(resolver, router);
  }
}
