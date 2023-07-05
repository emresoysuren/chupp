import 'package:auto_route/auto_route.dart';

extension BaseNavigation on StackRouter {
  Future<void> open(PageRouteInfo route, {OnNavigationFailure? onFailure}) {
    removeWhere((r) => r.name == route.routeName);
    return push(route, onFailure: onFailure);
  }

  Future<void> openBase(
    PageRouteInfo route, {
    OnNavigationFailure? onFailure,
    bool updateExistingRoutes = true,
  }) =>
      replaceAll(
        [route],
        onFailure: onFailure,
        updateExistingRoutes: updateExistingRoutes,
      );
}
