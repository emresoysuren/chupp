import 'package:chupp/utils/utils/context_extension.dart';
import 'package:chupp/widgets/bars/custom/content_bar.dart';
import 'package:chupp/widgets/disable_scroll_behavior.dart';
import 'package:flutter/material.dart';

class HashtagPage extends StatefulWidget {
  const HashtagPage({super.key});

  @override
  State<HashtagPage> createState() => _HashtagPageState();
}

class _HashtagPageState extends State<HashtagPage> {
  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.current.primaryBg,
      appBar: ContentBar(
        title: "#hashtag",
        ink: 460,
        comment: 308,
        like: 120,
        controller: _controller,
      ),
      body: DisableScrollBehavior(
        child: SingleChildScrollView(
          controller: _controller,
          child: const Column(),
        ),
      ),
    );
  }
}
