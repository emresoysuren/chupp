import 'package:chupp/config/texts.dart';
import 'package:chupp/pages/draggable_menus/profile_register_menu.dart';
import 'package:chupp/utils/utils/context_extension.dart';
import 'package:chupp/widgets/buttons/single_button.dart';
import 'package:chupp/widgets/progress_bar.dart';
import 'package:draggable_menu/draggable_menu.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Text(
                    Texts.profileRegisterHeader,
                    style: context.styles.title2,
                  ),
                ),
                const SizedBox(width: 4),
                Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: SingleButton(
                    onPressed: () => DraggableMenu.open(
                      context,
                      const ProfileRegisterMenu(),
                    ),
                    padding: const EdgeInsets.all(12),
                    child: FaIcon(
                      FontAwesomeIcons.ellipsis,
                      color: context.theme.current.primaryItem,
                    ),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Text(
                    "$current ${Texts.profileRegisterHeaderDivider} $total",
                    style: context.styles.textImp,
                  ),
                ),
              ],
            ),
            ProgressBar(value: current / total)
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(84);
}
