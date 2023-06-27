import 'package:chupp/utils/utils/context_extension.dart';
import 'package:flutter/material.dart';

class SearchEmptyContent extends StatelessWidget {
  const SearchEmptyContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Text(
        "There is nothing yet.",
        style: context.styles.mutted,
      ),
    );
  }
}
