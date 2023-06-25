import 'dart:async';
import 'package:chupp/routes/blured.dart';
import 'package:chupp/widgets/loading_animation.dart';
import 'package:flutter/material.dart';

class LoadingPage extends StatefulWidget {
  final Future Function() run;

  const LoadingPage({super.key, required this.run});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  final Completer completer = Completer();

  @override
  void initState() {
    widget.run().then(
      (_) {
        if (mounted) Navigator.pop(context);
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Material(
      color: Colors.transparent,
      child: Center(
        child: LoadingAnimation(),
      ),
    );
  }
}

Future animateAndLoad(BuildContext context, Future Function() run) =>
    Navigator.push(
      context,
      BluredRoute(
        barrierDismissible: false,
        child: LoadingPage(
          run: () => run(),
        ),
      ),
    );
