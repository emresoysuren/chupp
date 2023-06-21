import 'package:chupp/config/styles.dart';
import 'package:chupp/config/utils.dart';
import 'package:chupp/widgets/buttons/single_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AddOpinion extends StatefulWidget implements PreferredSizeWidget {
  const AddOpinion({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(64);

  @override
  State<AddOpinion> createState() => _AddOpinionState();
}

class _AddOpinionState extends State<AddOpinion> with WidgetsBindingObserver {
  String text = "";
  final FocusNode focusNode = FocusNode();
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
      color: Utils.theme.current.primaryBg,
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            16,
            4,
            16,
            MediaQuery.of(context).viewInsets.bottom + 4,
          ),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  child: TextField(
                    focusNode: focusNode,
                    onChanged: (value) {
                      setState(() {
                        text = value;
                      });
                    },
                    keyboardType: TextInputType.multiline,
                    minLines: 1,
                    maxLines: 3,
                    style: Styles.text,
                    decoration: InputDecoration(
                      hintText: "Add your opinion...",
                      hintStyle: Styles.subText,
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
                    color: Utils.theme.current.primaryItem,
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
