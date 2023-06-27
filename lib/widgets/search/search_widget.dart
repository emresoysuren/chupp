import 'package:chupp/config/texts.dart';
import 'package:chupp/utils/utils/context_extension.dart';
import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  final Function()? overRide;
  final bool autoFocus;

  const SearchWidget({
    super.key,
    this.overRide,
    this.autoFocus = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: overRide,
      child: Container(
        decoration: ShapeDecoration(
          shape: const StadiumBorder(),
          color: context.theme.current.secondaryBg,
        ),
        child: TextField(
          enabled: overRide == null,
          textInputAction: TextInputAction.search,
          autofocus: autoFocus,
          style: context.styles.text,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 11, horizontal: 16),
            hintText: Texts.searchField,
            hintStyle: context.styles.mutted,
            border: InputBorder.none,
            isDense: true,
          ),
        ),
      ),
    );
  }
}
