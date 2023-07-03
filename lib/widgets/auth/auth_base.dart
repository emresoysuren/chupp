import 'package:chupp/config/texts.dart';
import 'package:chupp/utils/utils/context_extension.dart';
import 'package:flutter/material.dart';

class AuthBase extends StatelessWidget {
  final List<Widget> top;
  final List<Widget> bottom;

  const AuthBase({
    super.key,
    this.top = const <Widget>[],
    this.bottom = const <Widget>[],
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.current.primaryBg,
      resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: top,
            ),
          ),
          if (top.isNotEmpty && bottom.isNotEmpty)
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Container(
                  color: context.theme.current.secondaryBg,
                  height: 1,
                  width: double.infinity,
                ),
                ColoredBox(
                  color: context.theme.current.primaryBg,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      Texts.authOrDivider,
                      style: context.styles.title3
                          .copyWith(color: context.theme.current.subText),
                    ),
                  ),
                ),
              ],
            ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: bottom,
            ),
          )
        ],
      ),
    );
  }
}
