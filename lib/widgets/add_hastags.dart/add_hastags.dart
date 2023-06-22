import 'package:chupp/config/texts.dart';
import 'package:chupp/utils/utils/context_extension.dart';
import 'package:flutter/material.dart';

class AddHastags extends StatefulWidget {
  final Function() onUnFocused;

  const AddHastags({super.key, required this.onUnFocused});

  @override
  State<AddHastags> createState() => _AddHastagsState();
}

class _AddHastagsState extends State<AddHastags> with WidgetsBindingObserver {
  final FocusNode focusNode = FocusNode();
  String text = "";
  bool showing = false;

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
    focusNode.addListener(() {
      if (!focusNode.hasFocus) {
        showing = false;
        widget.onUnFocused.call();
      }
    });
    focusNode.requestFocus();
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
      widget.onUnFocused.call();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.theme.current.secondaryBg,
      borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            16,
            4,
            16,
            MediaQuery.of(context).viewInsets.bottom + 4,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 14),
            child: TextField(
              focusNode: focusNode,
              onChanged: (value) {
                setState(() {
                  text = value;
                });
              },
              keyboardType: TextInputType.text,
              maxLines: 1,
              style: context.styles.text,
              decoration: InputDecoration(
                hintText: Texts.addHastagsField,
                hintStyle: context.styles.subText,
                border: InputBorder.none,
                isDense: true,
                contentPadding: const EdgeInsets.all(0),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
