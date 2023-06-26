import 'package:chupp/pages/side/post/post_content.dart';
import 'package:chupp/utils/utils/context_extension.dart';
import 'package:chupp/widgets/bars/custom/content_bar.dart';
import 'package:chupp/widgets/draggable_menu/post_menu.dart';
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
  final GlobalKey _navigatorKey = GlobalKey();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.current.primaryBg,
      resizeToAvoidBottomInset: false,
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
      body: WillPopScope(
        onWillPop: () async {
          if (Navigator.of(_navigatorKey.currentContext!).canPop()) {
            await Navigator.of(_navigatorKey.currentContext!).maybePop();
            return false;
          }
          return true;
        },
        child: Navigator(
          key: _navigatorKey,
          pages: [
            MaterialPage(
              child: PostContent(
                contentKey: _contentKey,
                controller: _controller,
                openDescription: widget.openDescription,
                openOpinion: widget.openOpinion,
              ),
            ),
          ],
          onPopPage: (route, result) => route.didPop(result),
        ),
      ),
    );
  }
}
