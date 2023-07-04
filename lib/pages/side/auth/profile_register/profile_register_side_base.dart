import 'package:chupp/config/texts.dart';
import 'package:chupp/utils/utils/context_extension.dart';
import 'package:flutter/material.dart';

class ProfileRegisterSideBase extends StatelessWidget {
  final String title;
  final String details;
  final bool optional;
  final Widget child;

  const ProfileRegisterSideBase({
    super.key,
    required this.title,
    required this.details,
    this.optional = false,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: context.styles.title,
          ),
          const SizedBox(height: 8),
          if (optional) ...[
            Text(
              Texts.profileRegisterOptional,
              style: context.styles.textImp
                  .copyWith(color: context.theme.current.notice),
            ),
            const SizedBox(height: 8),
          ],
          Text(
            details,
            style: context.styles.text,
          ),
          const SizedBox(height: 32),
          Flexible(
            child: child,
          )
        ],
      ),
    );
  }
}
