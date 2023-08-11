import 'package:chupp/routes/card.dart';
import 'package:chupp/services/data_service.dart';
import 'package:chupp/utils/app_manager.dart';
import 'package:chupp/utils/utils/context_extension.dart';
import 'package:chupp/widgets/cards/signout_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AccountManager {
  AccountManager._();

  static bool get isAnonymous {
    if (loggedIn) {
      return DataService.isAnonymous == true;
    }
    return false;
  }

  static bool get loggedIn => DataService.loggedIn;

  static bool get registered => false;

  static bool isOwner(String uid) => ownerUid == uid;

  static String? get ownerUid => DataService.uid;

  // Firebase Auth | Start

  static Future<bool> signOut(BuildContext context) async {
    if (isAnonymous) return false;
    final bool? result = await Navigator.push<bool>(
      context,
      CardRoute(
        context,
        child: const SignOutCard(),
      ),
    );
    if (result != true) return false;
    if (context.mounted) {
      return await _load(
        context,
        run: () => DataService.signOut(),
        errorTitle: context.lang.current.logoutFailTitle,
      );
    }
    return false;
  }

  static Future<bool> emailRegister(
    BuildContext context,
    String email,
    String password,
    String passwordCheck,
  ) async {
    if (email.isEmpty || password.isEmpty || passwordCheck.isEmpty) {
      AppManager.flushBarShow(
        context,
        title: context.lang.current.registerFailTitle,
        message: "Fill the all fields and try again.",
      );
      return false;
    }
    if (password != passwordCheck) {
      AppManager.flushBarShow(
        context,
        title: context.lang.current.registerFailTitle,
        message: "The passwords you entered don't match.",
      );
      return false;
    }
    return await _load(
      context,
      run: () => DataService.register(email, password),
      errorTitle: context.lang.current.registerFailTitle,
    );
  }

  static Future<bool> emailLogin(
    BuildContext context,
    String email,
    String password,
  ) async {
    if (email.isEmpty || password.isEmpty) {
      AppManager.flushBarShow(
        context,
        title: context.lang.current.loginFailTitle,
        message: "Fill the all fields and try again.",
      );
      return false;
    }
    return await _load(
      context,
      run: () => DataService.login(email, password),
      errorTitle: context.lang.current.loginFailTitle,
    );
  }

  static Future<bool> signInAnonymously(BuildContext context) => _load(
        context,
        run: () => DataService.signInAnonymously(),
        errorTitle: context.lang.current.loginFailTitle,
      );

  static Future<bool> googleLogin(BuildContext context) => _load(
        context,
        run: () => DataService.googleLogin(),
        errorTitle: context.lang.current.loginFailTitle,
      );

  static Future<bool> appleLogin(BuildContext context) => _load(
        context,
        run: () => DataService.appleLogin(),
        errorTitle: context.lang.current.loginFailTitle,
      );

  // Firebase Auth | End

  static Future<bool> _load(
    context, {
    required Future Function() run,
    required String errorTitle,
  }) async {
    try {
      await AppManager.animateAndLoad(
        context,
        run,
      );
      return true;
    } catch (e) {
      _handleException(context, errorTitle, e);
      return false;
    }
  }

  static Future _handleException(BuildContext context, String title, e,
          [String? unknownExceptionMessage]) =>
      AppManager.flushBarShow(
        context,
        title: title,
        message:
            unknownExceptionMessage ?? context.lang.current.unknownException,
      );

  static Future<bool> userRegister(
    BuildContext context,
    WidgetRef ref, {
    required String username,
    required String about,
  }) async {
    return false;
    // if (username.length < 4) {
    //   AppManager.flushBarShow(
    //     context,
    //     title: context.lang.current.registerFailTitle,
    //     message: "Pick a longer username than 3 characters.",
    //   );
    //   return false;
    // }
    // if (registered) {
    //   AppManager.flushBarShow(
    //     context,
    //     title: context.lang.current.registerFailTitle,
    //     message: "The user has been registered already.",
    //   );
    //   return false;
    // }
    // if (!loggedIn) {
    //   AppManager.flushBarShow(
    //     context,
    //     title: context.lang.current.registerFailTitle,
    //     message: "The user isn't logged in.",
    //   );
    //   return false;
    // }
    // return await _load(
    //   context,
    //   run: () async {
    //     await DataService.userRegister(
    //       username,
    //       about,
    //     );
    //     await ref.read(ownerProvider).getOwner();
    //   },
    //   errorTitle: context.lang.current.registerFailTitle,
    // );
  }
}
