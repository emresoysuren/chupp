import 'package:chupp/utils/utils/context_extension.dart';
import 'package:chupp/widgets/buttons/single_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ColoredField extends StatefulWidget {
  final String? label;
  final Function(String value)? onChanged;
  final TextInputType type;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool next;
  final String? initialValue;
  final TextInputAction? textInputAction;

  const ColoredField({
    super.key,
    this.label,
    this.onChanged,
    this.type = TextInputType.text,
    this.controller,
    this.focusNode,
    this.next = false,
    this.initialValue,
    this.textInputAction,
  });

  @override
  State<ColoredField> createState() => _ColoredFieldState();
}

class _ColoredFieldState extends State<ColoredField> {
  late final FocusNode _focusNode = widget.focusNode ?? FocusNode();
  late bool obscureText = widget.type == TextInputType.visiblePassword;
  bool hasValue = false;

  int get maxLines => widget.type == TextInputType.multiline ? 3 : 1;

  get borderShape => widget.type == TextInputType.multiline
      ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))
      : const StadiumBorder();

  @override
  void initState() {
    _focusNode.addListener(() => setState(() {}));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        shape: borderShape,
        color: context.theme.current.secondaryBg,
      ),
      child: Stack(
        children: [
          TextFormField(
            style: context.styles.text,
            focusNode: _focusNode,
            onChanged: (value) {
              setState(() => hasValue = value.isNotEmpty);
              widget.onChanged?.call(value);
            },
            initialValue: widget.initialValue,
            obscureText: obscureText,
            keyboardType: widget.type,
            textInputAction: widget.textInputAction,
            controller: widget.controller,
            maxLines: maxLines,
            decoration: InputDecoration(
              isDense: true,
              contentPadding: const EdgeInsets.all(16),
              border: InputBorder.none,
              hintText: widget.label,
              hintStyle: context.styles.subText,
            ),
          ),
          if (widget.type == TextInputType.visiblePassword &&
              _focusNode.hasPrimaryFocus &&
              hasValue)
            Positioned(
              top: 0,
              bottom: 0,
              right: 0,
              child: LayoutBuilder(
                builder: (context, c) {
                  return SizedBox.square(
                    dimension: c.maxHeight,
                    child: SingleButton(
                      onPressed: () =>
                          setState(() => obscureText = !obscureText),
                      padding: const EdgeInsets.all(0),
                      child: Center(
                        child: obscureText
                            ? FaIcon(
                                FontAwesomeIcons.solidEyeSlash,
                                color: context.theme.current.secondaryItem,
                                size: 20,
                              )
                            : FaIcon(
                                FontAwesomeIcons.solidEye,
                                color: context.theme.current.primaryItem,
                                size: 20,
                              ),
                      ),
                    ),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
