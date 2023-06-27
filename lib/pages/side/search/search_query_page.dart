import 'package:chupp/utils/utils/context_extension.dart';
import 'package:chupp/widgets/bars/bar.dart';
import 'package:chupp/widgets/search/search_widget.dart';
import 'package:flutter/material.dart';

class SearchQueryPage extends StatelessWidget {
  const SearchQueryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.current.primaryBg,
      appBar: const Bar(
        pop: true,
        children: [
          Expanded(
            child: SearchWidget(
              autoFocus: true,
            ),
          ),
        ],
      ),
      body: Container(),
    );
  }
}
