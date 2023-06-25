import 'package:chupp/config/texts.dart';
import 'package:chupp/utils/utils/context_extension.dart';
import 'package:chupp/widgets/bars/custom/content_bar.dart';
import 'package:chupp/widgets/disable_scroll_behavior.dart';
import 'package:chupp/widgets/draggable_menu/post_menu.dart';
import 'package:chupp/widgets/posts/functional/add_opinion.dart';
import 'package:chupp/widgets/posts/post/post_widget.dart';
import 'package:chupp/widgets/posts/opinion/mini_opinion.dart';
import 'package:draggable_menu/draggable_menu.dart';
import 'package:flutter/material.dart';

class PostPage extends StatefulWidget {
  const PostPage({
    super.key,
    this.openOpinion = false,
    this.openDescription = false,
  });

  final bool openDescription;
  final bool openOpinion;

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  final GlobalKey _contentKey = GlobalKey();
  final ScrollController _controller = ScrollController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.current.primaryBg,
      appBar: ContentBar(
        title: "Which character is more likely to die next?",
        controller: _controller,
        contentKey: _contentKey,
        ink: "4.6k",
        time: "5/30/14 19:26",
        onButtonTap: () => DraggableMenu.open(
          context,
          const PostMenu(),
        ),
      ),
      body: DisableScrollBehavior(
        child: SingleChildScrollView(
          controller: _controller,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                child: PostWidget(
                  openDescription: widget.openDescription,
                  contentKey: _contentKey,
                ),
              ),
              // Opinions - START
              Padding(
                padding: const EdgeInsets.only(top: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: Text(
                        Texts.postOpinionsTitle,
                        style: context.styles.title3,
                      ),
                    ),
                    const SizedBox(height: 8),
                    for (int i = 0; i < 6; i++) const MiniOpinion(),
                  ],
                ),
              ),
              // Opinions - END
            ],
          ),
        ),
      ),
      bottomNavigationBar: AddOpinion(autofocus: widget.openOpinion),
    );
  }
}
