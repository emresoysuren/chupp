import 'package:chupp/utils/utils/context_extension.dart';
import 'package:chupp/widgets/buttons/button.dart';
import 'package:chupp/widgets/buttons/single_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PageNav extends StatelessWidget {
  final PageController controller;
  final int current;
  final int total;
  final Function()? doneCall;

  const PageNav({
    super.key,
    required this.controller,
    required this.current,
    required this.total,
    this.doneCall,
  });

  Duration get animationDuration => const Duration(milliseconds: 320);

  Curve get animationCurve => Curves.ease;

  int get lastIndex => total - 1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (current != 0) ...[
              AspectRatio(
                aspectRatio: 1,
                child: SingleButton(
                  padding: const EdgeInsets.all(0),
                  onPressed: () => controller.previousPage(
                    duration: animationDuration,
                    curve: animationCurve,
                  ),
                  child: Center(
                    child: FaIcon(
                      FontAwesomeIcons.angleLeft,
                      color: context.theme.current.primaryItem,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
            ],
            Expanded(
              child: current < lastIndex
                  ? Button(
                      large: true,
                      label: context.lang.current.pageNavNext,
                      onPressed: () => controller.nextPage(
                        duration: animationDuration,
                        curve: animationCurve,
                      ),
                    )
                  : Button(
                      large: true,
                      label: context.lang.current.pageNavDone,
                      onPressed: doneCall,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
