// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:chupp/pages/func/splash.dart' as _i1;
import 'package:chupp/pages/main/home.dart' as _i2;
import 'package:chupp/pages/main/liked_posts.dart' as _i6;
import 'package:chupp/pages/main/profile.dart' as _i3;
import 'package:chupp/pages/main/search.dart' as _i4;
import 'package:chupp/pages/side/auth/auth.dart' as _i5;
import 'package:flutter/material.dart' as _i8;

abstract class $AppRouter extends _i7.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.SplashPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.HomePage(),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.ProfilePage(),
      );
    },
    SearchRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.SearchPage(),
      );
    },
    AuthRoute.name: (routeData) {
      final args =
          routeData.argsAs<AuthRouteArgs>(orElse: () => const AuthRouteArgs());
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.AuthPage(
          key: args.key,
          onLogin: args.onLogin,
        ),
      );
    },
    LikedPostsRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.LikedPostsPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.SplashPage]
class SplashRoute extends _i7.PageRouteInfo<void> {
  const SplashRoute({List<_i7.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i2.HomePage]
class HomeRoute extends _i7.PageRouteInfo<void> {
  const HomeRoute({List<_i7.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i3.ProfilePage]
class ProfileRoute extends _i7.PageRouteInfo<void> {
  const ProfileRoute({List<_i7.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i4.SearchPage]
class SearchRoute extends _i7.PageRouteInfo<void> {
  const SearchRoute({List<_i7.PageRouteInfo>? children})
      : super(
          SearchRoute.name,
          initialChildren: children,
        );

  static const String name = 'SearchRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i5.AuthPage]
class AuthRoute extends _i7.PageRouteInfo<AuthRouteArgs> {
  AuthRoute({
    _i8.Key? key,
    dynamic Function(bool)? onLogin,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          AuthRoute.name,
          args: AuthRouteArgs(
            key: key,
            onLogin: onLogin,
          ),
          initialChildren: children,
        );

  static const String name = 'AuthRoute';

  static const _i7.PageInfo<AuthRouteArgs> page =
      _i7.PageInfo<AuthRouteArgs>(name);
}

class AuthRouteArgs {
  const AuthRouteArgs({
    this.key,
    this.onLogin,
  });

  final _i8.Key? key;

  final dynamic Function(bool)? onLogin;

  @override
  String toString() {
    return 'AuthRouteArgs{key: $key, onLogin: $onLogin}';
  }
}

/// generated route for
/// [_i6.LikedPostsPage]
class LikedPostsRoute extends _i7.PageRouteInfo<void> {
  const LikedPostsRoute({List<_i7.PageRouteInfo>? children})
      : super(
          LikedPostsRoute.name,
          initialChildren: children,
        );

  static const String name = 'LikedPostsRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}
