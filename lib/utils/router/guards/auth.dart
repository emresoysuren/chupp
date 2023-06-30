import 'package:auto_route/auto_route.dart';
import 'package:chupp/utils/account_manager.dart';
import 'package:chupp/utils/router/app_router.gr.dart';

class AuthGuard {
  AuthGuard._();

  static final List<String> canAccess = [
    SplashRoute.name,
    AuthRoute.name,
  ];

  static void onNavigation(NavigationResolver resolver, StackRouter router) {
    if (!canAccess.any((page) => page == resolver.route.name)) {
      if (!AccountManager.loggedIn) {
        resolver.redirect(
          AuthRoute(
            onLogin: (result) => resolver.next(result),
          ),
        );
        return;
      }
    }
    return resolver.next(true);
  }
}
