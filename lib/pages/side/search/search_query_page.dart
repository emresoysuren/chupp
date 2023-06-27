import 'package:chupp/pages/side/search/search_history_content.dart';
import 'package:chupp/pages/side/search/search_result_content.dart';
import 'package:chupp/utils/utils/context_extension.dart';
import 'package:chupp/widgets/bars/bar.dart';
import 'package:chupp/widgets/search/search_widget.dart';
import 'package:flutter/material.dart';

class SearchQueryPage extends StatefulWidget {
  const SearchQueryPage({super.key});

  @override
  State<SearchQueryPage> createState() => _SearchQueryPageState();
}

class _SearchQueryPageState extends State<SearchQueryPage> {
  String _searchText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.current.primaryBg,
      appBar: Bar(
        pop: true,
        children: [
          Expanded(
            child: SearchWidget(
              autoFocus: true,
              onChanged: (value) => setState(() => _searchText = value),
            ),
          ),
        ],
      ),
      body: Builder(builder: (context) {
        if (_searchText.isNotEmpty) {
          return const SearchResultContent();
        }
        return const SearchHistoryContent();
      }),
    );
  }
}
