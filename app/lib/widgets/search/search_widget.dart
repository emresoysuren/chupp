import 'package:chupp/utils/utils/context_extension.dart';
import 'package:chupp/widgets/buttons/single_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchWidget extends StatefulWidget {
  final Function()? overRide;
  final bool autoFocus;
  final TextEditingController? controller;
  final FocusNode? focusNode;

  const SearchWidget({
    super.key,
    this.overRide,
    this.autoFocus = false,
    this.controller,
    this.focusNode,
  });

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  late final TextEditingController _controller =
      widget.controller ?? TextEditingController();
  late final FocusNode _focusNode = widget.focusNode ?? FocusNode();

  @override
  void initState() {
    _focusNode.addListener(() => setState(() {}));
    super.initState();
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.overRide,
      child: Material(
        shape: const StadiumBorder(),
        color: context.theme.current.secondaryBg,
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: TextField(
                  controller: _controller,
                  enabled: widget.overRide == null,
                  focusNode: _focusNode,
                  textInputAction: TextInputAction.search,
                  autofocus: widget.autoFocus,
                  style: context.styles.text,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 11,
                      horizontal: 16,
                    ),
                    hintText: context.lang.current.searchField,
                    hintStyle: context.styles.mutted,
                    border: InputBorder.none,
                    isDense: true,
                  ),
                ),
              ),
              if (_controller.text.isNotEmpty && _focusNode.hasPrimaryFocus)
                AspectRatio(
                  aspectRatio: 1,
                  child: SingleButton(
                    onPressed: () => _controller.clear(),
                    padding: const EdgeInsets.all(0),
                    child: Center(
                      child: FaIcon(
                        FontAwesomeIcons.xmark,
                        size: 20,
                        color: context.theme.current.primaryBtn,
                      ),
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
