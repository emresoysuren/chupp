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
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    _focusNode.addListener(() => setState(() {}));
    _controller.addListener(() => setState(() {}));
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.current.primaryBg,
      appBar: Bar(
        pop: true,
        child: SearchWidget(
          autoFocus: true,
          controller: _controller,
          focusNode: _focusNode,
        ),
      ),
      body: Builder(builder: (context) {
        if (_controller.text.isNotEmpty && !_focusNode.hasFocus) {
          return const SearchResultContent();
        }
        return SearchHistoryContent(
          search: historySearch,
        );
      }),
    );
  }

  void historySearch(String value) {
    setState(() {
      _controller.text = value;
      _focusNode.unfocus();
    });
  }
}
