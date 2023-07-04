import 'package:chupp/utils/utils/context_extension.dart';
import 'package:chupp/widgets/buttons/single_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AddComment extends StatefulWidget implements PreferredSizeWidget {
  final bool autofocus;
  final Color? backgroundColor;
  final FocusNode? focusNode;

  const AddComment({
    super.key,
    this.autofocus = false,
    this.backgroundColor,
    this.focusNode,
  });

  @override
  Size get preferredSize => const Size.fromHeight(64);

  @override
  State<AddComment> createState() => _AddCommentState();
}

class _AddCommentState extends State<AddComment> with WidgetsBindingObserver {
  late final FocusNode focusNode = widget.focusNode ?? FocusNode();
  String text = "";
  bool showing = false;

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    focusNode.dispose();
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    final value = MediaQuery.of(context).viewInsets.bottom;
    if (value != 0 && !showing) {
      showing = true;
    }
    if (showing && value == 0) {
      showing = false;
      focusNode.unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: widget.backgroundColor ?? context.theme.current.primaryBg,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  child: TextField(
                    focusNode: focusNode,
                    autofocus: widget.autofocus,
                    onChanged: (value) {
                      setState(() {
                        text = value;
                      });
                    },
                    keyboardType: TextInputType.multiline,
                    minLines: 1,
                    maxLines: 3,
                    style: context.styles.text,
                    decoration: InputDecoration(
                      hintText: context.lang.current.postAddYourOpinion,
                      hintStyle: context.styles.mutted,
                      border: InputBorder.none,
                      isDense: true,
                      contentPadding: const EdgeInsets.all(0),
                    ),
                  ),
                ),
              ),
              AnimatedOpacity(
                opacity: text.isNotEmpty ? 1 : 0,
                duration: const Duration(milliseconds: 120),
                child: SingleButton(
                  onPressed: text.isEmpty ? null : () {},
                  child: FaIcon(
                    FontAwesomeIcons.solidPaperPlane,
                    color: context.theme.current.primaryItem,
                    size: 22,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
