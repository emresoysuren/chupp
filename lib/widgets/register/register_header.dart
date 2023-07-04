import 'package:chupp/config/texts.dart';
import 'package:chupp/utils/utils/context_extension.dart';
import 'package:chupp/widgets/progress_bar.dart';
import 'package:flutter/material.dart';

class RegisterHeader extends StatelessWidget implements PreferredSizeWidget {
  final int total;
  final int current;

  const RegisterHeader({
    super.key,
    required this.total,
    required this.current,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  Texts.profileRegisterHeader,
                  style: context.styles.title2,
                ),
                Text(
                  "$current ${Texts.profileRegisterHeaderDivider} $total",
                  style: context.styles.textImp,
                ),
              ],
            ),
            const SizedBox(height: 16),
            ProgressBar(value: current / total)
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(84);
}
