import 'package:chupp/routes/card.dart';
import 'package:chupp/services/data_service.dart';
import 'package:chupp/utils/app_manager.dart';
import 'package:chupp/utils/utils/context_extension.dart';
import 'package:chupp/widgets/cards/signout_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AccountManager {
  AccountManager._();

  static Future<void> signOut(BuildContext context) async {
    if (isAnonymous) return;
    final bool? result = await Navigator.push<bool>(
      context,
      CardRoute(
        context,
        child: const SignOutCard(),
      ),
    );
    if (result != true) return;
    if (context.mounted) {
      await AppManager.animateAndLoad(context, () => DataService.signOut());
    }
  }

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
    try {
      await AppManager.animateAndLoad(
        context,
        () => DataService.emailRegister(email, password),
      );
      return true;
    } catch (e) {
      _handleException(context, context.lang.current.registerFailTitle, e);
      return false;
    }
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
    try {
      await AppManager.animateAndLoad(
        context,
        () => DataService.emailLogin(email, password),
      );
      return true;
    } catch (e) {
      _handleException(context, context.lang.current.loginFailTitle, e);
      return false;
    }
  }

  static Future<bool> signInAnonymously(BuildContext context) async {
    try {
      await AppManager.animateAndLoad(
        context,
        () => DataService.signInAnonymously(),
      );
      return true;
    } catch (e) {
      _handleException(context, context.lang.current.loginFailTitle, e);
      return false;
    }
  }

  static Future<bool> googleLogin(BuildContext context) async {
    try {
      await AppManager.animateAndLoad(
        context,
        () => DataService.googleLogin(),
      );
      return true;
    } catch (e) {
      _handleException(context, context.lang.current.loginFailTitle, e);
      return false;
    }
  }

  static Future<bool> appleLogin(BuildContext context) async {
    try {
      await AppManager.animateAndLoad(
        context,
        () => DataService.appleLogin(),
      );
      return true;
    } catch (e) {
      _handleException(context, context.lang.current.loginFailTitle, e);
      return false;
    }
  }

  static void _handleException(BuildContext context, String title, e,
      [String? unknownExceptionMessage]) {
    if (e == FirebaseAuthException) {
      AppManager.flushBarShow(
        context,
        title: title,
        message: e.message ??
            unknownExceptionMessage ??
            context.lang.current.unknownException,
      );
    } else {
      AppManager.flushBarShow(
        context,
        title: title,
        message:
            unknownExceptionMessage ?? context.lang.current.unknownException,
      );
    }
  }
}
