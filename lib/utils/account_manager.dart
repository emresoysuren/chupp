import 'package:chupp/routes/card.dart';
import 'package:chupp/services/data_service.dart';
import 'package:chupp/utils/ui_manager.dart';
import 'package:chupp/widgets/cards/signout_card.dart';
import 'package:flutter/material.dart';

class AccountManager {
  AccountManager._();

  static Future<void> signOut(BuildContext context) async {
    if (isAnonymous) return;
    final bool? result = await Navigator.push<bool>(
      context,
      CardRoute(
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

  static bool isOwner(String uid) => ownerUid == uid;

  static String? get ownerUid => DataService.uid;
}
