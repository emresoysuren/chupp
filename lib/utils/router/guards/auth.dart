import 'package:auto_route/auto_route.dart';
import 'package:chupp/utils/router/app_router.gr.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthGuard {
  AuthGuard._();

  static final List<String> canAccess = [
    SplashRoute.name,
    AuthRoute.name,
  ];

  static void onNavigation(NavigationResolver resolver, StackRouter router) {
    if (!canAccess.any((page) => page == resolver.route.name)) {
      if (FirebaseAuth.instance.currentUser == null) {
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
