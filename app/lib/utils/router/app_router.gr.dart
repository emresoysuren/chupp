// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i10;
import 'package:chupp/pages/func/splash.dart' as _i1;
import 'package:chupp/pages/main/create_post.dart' as _i2;
import 'package:chupp/pages/main/home.dart' as _i3;
import 'package:chupp/pages/main/liked_posts.dart' as _i4;
import 'package:chupp/pages/main/profile.dart' as _i5;
import 'package:chupp/pages/main/search.dart' as _i6;
import 'package:chupp/pages/side/auth/auth.dart' as _i7;
import 'package:chupp/pages/side/auth/profile_register/profile_register.dart'
    as _i9;
import 'package:chupp/pages/side/settings/settings.dart' as _i8;
import 'package:flutter/material.dart' as _i11;

abstract class $AppRouter extends _i10.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i10.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.SplashPage(),
      );
    },
    CreatePostRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.CreatePostPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.HomePage(),
      );
    },
    LikedPostsRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.LikedPostsPage(),
      );
    },
    ProfileRoute.name: (routeData) {
      final args = routeData.argsAs<ProfileRouteArgs>(
          orElse: () => const ProfileRouteArgs());
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.ProfilePage(key: args.key),
      );
    },
    SearchRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.SearchPage(),
      );
    },
    AuthRoute.name: (routeData) {
      final args =
          routeData.argsAs<AuthRouteArgs>(orElse: () => const AuthRouteArgs());
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.AuthPage(
          key: args.key,
          validate: args.validate,
        ),
      );
    },
    SettingsRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.SettingsPage(),
      );
    },
    ProfileRegisterRoute.name: (routeData) {
      final args = routeData.argsAs<ProfileRegisterRouteArgs>(
          orElse: () => const ProfileRegisterRouteArgs());
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.ProfileRegisterPage(
          key: args.key,
          validate: args.validate,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.SplashPage]
class SplashRoute extends _i10.PageRouteInfo<void> {
  const SplashRoute({List<_i10.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i2.CreatePostPage]
class CreatePostRoute extends _i10.PageRouteInfo<void> {
  const CreatePostRoute({List<_i10.PageRouteInfo>? children})
      : super(
          CreatePostRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreatePostRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i3.HomePage]
class HomeRoute extends _i10.PageRouteInfo<void> {
  const HomeRoute({List<_i10.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i4.LikedPostsPage]
class LikedPostsRoute extends _i10.PageRouteInfo<void> {
  const LikedPostsRoute({List<_i10.PageRouteInfo>? children})
      : super(
          LikedPostsRoute.name,
          initialChildren: children,
        );

  static const String name = 'LikedPostsRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i5.ProfilePage]
class ProfileRoute extends _i10.PageRouteInfo<ProfileRouteArgs> {
  ProfileRoute({
    _i11.Key? key,
    List<_i10.PageRouteInfo>? children,
  }) : super(
          ProfileRoute.name,
          args: ProfileRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const _i10.PageInfo<ProfileRouteArgs> page =
      _i10.PageInfo<ProfileRouteArgs>(name);
}

class ProfileRouteArgs {
  const ProfileRouteArgs({this.key});

  final _i11.Key? key;

  @override
  String toString() {
    return 'ProfileRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i6.SearchPage]
class SearchRoute extends _i10.PageRouteInfo<void> {
  const SearchRoute({List<_i10.PageRouteInfo>? children})
      : super(
          SearchRoute.name,
          initialChildren: children,
        );

  static const String name = 'SearchRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i7.AuthPage]
class AuthRoute extends _i10.PageRouteInfo<AuthRouteArgs> {
  AuthRoute({
    _i11.Key? key,
    void Function()? validate,
    List<_i10.PageRouteInfo>? children,
  }) : super(
          AuthRoute.name,
          args: AuthRouteArgs(
            key: key,
            validate: validate,
          ),
          initialChildren: children,
        );

  static const String name = 'AuthRoute';

  static const _i10.PageInfo<AuthRouteArgs> page =
      _i10.PageInfo<AuthRouteArgs>(name);
}

class AuthRouteArgs {
  const AuthRouteArgs({
    this.key,
    this.validate,
  });

  final _i11.Key? key;

  final void Function()? validate;

  @override
  String toString() {
    return 'AuthRouteArgs{key: $key, validate: $validate}';
  }
}

/// generated route for
/// [_i8.SettingsPage]
class SettingsRoute extends _i10.PageRouteInfo<void> {
  const SettingsRoute({List<_i10.PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i9.ProfileRegisterPage]
class ProfileRegisterRoute
    extends _i10.PageRouteInfo<ProfileRegisterRouteArgs> {
  ProfileRegisterRoute({
    _i11.Key? key,
    void Function()? validate,
    List<_i10.PageRouteInfo>? children,
  }) : super(
          ProfileRegisterRoute.name,
          args: ProfileRegisterRouteArgs(
            key: key,
            validate: validate,
          ),
          initialChildren: children,
        );

  static const String name = 'ProfileRegisterRoute';

  static const _i10.PageInfo<ProfileRegisterRouteArgs> page =
      _i10.PageInfo<ProfileRegisterRouteArgs>(name);
}

class ProfileRegisterRouteArgs {
  const ProfileRegisterRouteArgs({
    this.key,
    this.validate,
  });

  final _i11.Key? key;

  final void Function()? validate;

  @override
  String toString() {
    return 'ProfileRegisterRouteArgs{key: $key, validate: $validate}';
  }
}
