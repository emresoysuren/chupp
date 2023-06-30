import 'package:auto_route/auto_route.dart';
import 'package:chupp/routes/basic.dart';
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
          page: SettingsRoute.page,
          customRouteBuilder: <CreatePostRoute>(context, child, page) =>
              BasicPageRoute<CreatePostRoute>(
            start: Start.right,
            settings: page,
            child: child,
          ),
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
          page: CreatePostRoute.page,
          customRouteBuilder: <CreatePostRoute>(context, child, page) =>
              BasicPageRoute<CreatePostRoute>(
            start: Start.bottom,
            settings: page,
            child: child,
          ),
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
