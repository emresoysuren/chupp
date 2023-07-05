import 'package:chupp/utils/utils/context_extension.dart';
import 'package:flutter/material.dart';

class PageCategory extends StatefulWidget implements PreferredSizeWidget {
  final List<String> pages;
  final PageController controller;

  const PageCategory({
    super.key,
    required this.pages,
    required this.controller,
  });

  @override
  State<PageCategory> createState() => _PageCategoryState();

  @override
  Size get preferredSize => const Size.fromHeight(52);
}

class _PageCategoryState extends State<PageCategory> {
  @override
  void initState() {
    widget.controller.addListener(() => setState(() {}));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, c) {
      final double itemWidth = c.maxWidth / widget.pages.length;
      return Material(
        color: context.theme.current.primaryBg,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                for (int i = 0; i < widget.pages.length; i++)
                  Expanded(
                    child: InkWell(
                      enableFeedback: false,
                      splashColor: Colors.transparent,
                      onTap: () => widget.controller.animateToPage(
                        i,
                        duration: const Duration(milliseconds: 320),
                        curve: Curves.ease,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: Center(
                          child: Text(
                            widget.pages[i],
                            style: context.styles.textImp,
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                left: itemWidth * (widget.controller.page ?? 0),
              ),
              child: Container(
                color: context.theme.current.primaryItem,
                height: 2,
                width: itemWidth,
              ),
            ),
          ],
        ),
      );
    });
  }
}
