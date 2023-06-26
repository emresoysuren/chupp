import 'package:chupp/pages/side/post/post_content.dart';
import 'package:chupp/pages/side/post/post_inherited.dart';
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

class _PostPageState extends State<PostPage> with TickerProviderStateMixin {
  final GlobalKey _contentKey = GlobalKey();
  final GlobalKey _navigatorKey = GlobalKey();
  final ScrollController _controller = ScrollController();
  double _offset = 0;
  late final AnimationController _animationController = AnimationController(
    duration: const Duration(milliseconds: 320),
    vsync: this,
  );
  void Function()? _removeLastAnimation;

  void _changeOffset(double value) =>
      setState(() => _offset = value < 0 ? 0 : value);

  void _animateOffset(double value) => setState(() {
        _removeLastAnimation?.call();

        final double offset = value < 0 ? 0 : value;

        final animation = Tween<double>(begin: _offset, end: offset)
            .animate(_animationController);

        void callback() => setState(() => _offset = animation.value);
        _removeLastAnimation = () => animation.removeListener(callback);
        animation.addListener(callback);
        _animationController.reset();
        _animationController.forward();
      });

  @override
  void dispose() {
    _controller.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PostInherited(
      offset: _offset,
      changeOffset: _changeOffset,
      animateOffset: _animateOffset,
      child: Scaffold(
        backgroundColor: context.theme.current.primaryBg,
        resizeToAvoidBottomInset: false,
        appBar: ContentBar(
          title: "Which character is more likely to die next?",
          controller: _controller,
          contentKey: _contentKey,
          offset: _offset,
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
      ),
    );
  }
}
