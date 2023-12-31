import 'package:another_flushbar/flushbar.dart';
import 'package:chupp/pages/func/loading.dart';
import 'package:chupp/routes/blured.dart';
import 'package:chupp/utils/utils/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppManager {
  AppManager._();

  static Future<void> animateAndLoad(
    BuildContext context,
    Future Function() run,
  ) async {
    dynamic error;
    await Navigator.push(
      context,
      BluredRoute(
        context,
        barrierDismissible: false,
        child: LoadingPage(
          run: () async {
            try {
              await run();
            } catch (e) {
              error = e;
            }
          },
        ),
      ),
    );
    if (error != null) throw error;
  }

  static Future flushBarShow(
    BuildContext context, {
    required String title,
    required String message,
  }) =>
      Flushbar(
        backgroundColor: context.theme.current.barrierColor,
        borderRadius: BorderRadius.circular(16),
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.all(16),
        barBlur: 16,
        isDismissible: false,
        titleText: Text(
          title,
          style: context.styles.textImp,
        ),
        messageText: Text(
          message,
          style: context.styles.text,
        ),
        forwardAnimationCurve: Curves.ease,
        duration: const Duration(seconds: 2),
      ).show(context);

  static String numFormat(int? number) {
    final formater = NumberFormat.compact();
    return formater.format(number ?? 0);
  }
}
