import 'package:auto_route/auto_route.dart';
import 'package:chupp/utils/account_manager.dart';
import 'package:chupp/utils/router/app_router.gr.dart';

class AuthGuard {
  AuthGuard._();

  static final List<String> noLogin = [
    SplashRoute.name,
    AuthRoute.name,
  ];

  static final List<String> noRegister = [
    ...noLogin,
    ProfileRegisterRoute.name
  ];

  static void onNavigation(NavigationResolver resolver, StackRouter router) {
    if (!noLogin.any((page) => page == resolver.route.name)) {
      _validate(resolver);
      return;
    }
    return resolver.next(true);
  }

  static void _validate(NavigationResolver resolver) {
    if (!AccountManager.loggedIn) {
      resolver.redirect(
        AuthRoute(
          validate: () => _validate(resolver),
        ),
      );
      // Stop until the _validate is called again
      return;
    }
    if (!noRegister.any((page) => page == resolver.route.name)) {
      if (!AccountManager.registered && !AccountManager.isAnonymous) {
        resolver.redirect(
          ProfileRegisterRoute(
            validate: () => _validate(resolver),
          ),
        );
        // Stop until the _validate is called again
        return;
      }
    }
    resolver.next(true);
  }
}
