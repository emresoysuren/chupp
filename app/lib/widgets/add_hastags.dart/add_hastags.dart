import 'package:chupp/utils/utils/context_extension.dart';
import 'package:chupp/widgets/tag_chip.dart';
import 'package:flutter/material.dart';

class AddHastags extends StatefulWidget {
  final Function() onUnFocused;
  final Function(String hashtag)? onAdd;
  final Set<String>? hashtags;

  const AddHastags({
    super.key,
    required this.onUnFocused,
    this.onAdd,
    this.hashtags,
  });

  @override
  State<AddHastags> createState() => _AddHastagsState();
}

class _AddHastagsState extends State<AddHastags> with WidgetsBindingObserver {
  final _controller = TextEditingController();
  final FocusNode focusNode = FocusNode();
  final GlobalKey _fieldKey = GlobalKey();
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
    _controller.dispose();
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
      clipBehavior: Clip.hardEdge,
      child: SafeArea(
        child: Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: AnimatedSize(
            duration: const Duration(milliseconds: 120),
            alignment: Alignment.bottomLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (text.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            context.lang.current.addHastagsFieldLabel,
                            style: context.styles.textImp.copyWith(
                              color: context.theme.current.notice,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                          child: Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: [
                              HashtagChip(
                                tag: text,
                                backgroundColor:
                                    context.theme.current.secondaryBtn,
                                color: context.theme.current.secondaryBtnText,
                                large: true,
                                onTap: () => widget.onAdd?.call(text),
                              ),
                            ],
                          ),
                        ),
                        ColoredBox(
                          color: context.theme.current.secondaryItem,
                          child: const SizedBox(
                            width: double.infinity,
                            height: 0.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    child: TextField(
                      key: _fieldKey,
                      controller: _controller,
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
                        hintText: context.lang.current.addHastagsField,
                        hintStyle: context.styles.mutted,
                        border: InputBorder.none,
                        isDense: true,
                        contentPadding: const EdgeInsets.all(0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
