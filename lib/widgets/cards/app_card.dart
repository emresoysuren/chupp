import 'package:chupp/utils/utils/context_extension.dart';
import 'package:chupp/widgets/draggable_menu/draggable_button.dart';
import 'package:flutter/material.dart';

class AppCard extends StatelessWidget {
  final String title;
  final String description;
  final List<ListButton>? children;

  const AppCard({
    super.key,
    required this.title,
    required this.description,
    this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Material(
          borderRadius: BorderRadius.circular(16),
          clipBehavior: Clip.hardEdge,
          color: context.theme.current.secondaryBg,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: context.styles.title2,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      description,
                      style: context.styles.text,
                    ),
                  ],
                ),
              ),
              if (children != null) ...children!,
            ],
          ),
        ),
      ),
    );
  }
}
