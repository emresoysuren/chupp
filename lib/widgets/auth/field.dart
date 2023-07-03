import 'package:chupp/utils/utils/context_extension.dart';
import 'package:chupp/widgets/buttons/single_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AuthField extends StatefulWidget {
  final String? label;
  final Function(String value)? onChanged;
  final bool password;
  final TextEditingController? controller;
  final FocusNode? focusNode;

  const AuthField({
    super.key,
    this.label,
    this.onChanged,
    this.password = false,
    this.controller,
    this.focusNode,
  });

  @override
  State<AuthField> createState() => _AuthFieldState();
}

class _AuthFieldState extends State<AuthField> {
  late final FocusNode _focusNode = widget.focusNode ?? FocusNode();
  late bool obscureText = widget.password;
  bool hasValue = false;

  @override
  void initState() {
    _focusNode.addListener(() => setState(() {}));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        shape: const StadiumBorder(),
        color: context.theme.current.secondaryBg,
      ),
      child: Stack(
        children: [
          TextField(
            style: context.styles.text,
            focusNode: _focusNode,
            onChanged: (value) {
              setState(() => hasValue = value.isNotEmpty);
              widget.onChanged?.call(value);
            },
            obscureText: obscureText,
            keyboardType: widget.password
                ? TextInputType.visiblePassword
                : TextInputType.emailAddress,
            controller: widget.controller,
            decoration: InputDecoration(
              isDense: true,
              contentPadding: const EdgeInsets.all(16),
              border: InputBorder.none,
              hintText: widget.label,
              hintStyle: context.styles.subText,
            ),
          ),
          if (widget.password && _focusNode.hasPrimaryFocus && hasValue)
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
