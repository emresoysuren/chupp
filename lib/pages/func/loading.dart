import 'dart:async';
import 'package:chupp/widgets/loading_animation.dart';
import 'package:flutter/material.dart';

class LoadingPage extends StatefulWidget {
  final Future Function() run;

  const LoadingPage({super.key, required this.run});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
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
    return WillPopScope(
      onWillPop: () async => false,
      child: const Material(
        color: Colors.transparent,
        child: Center(
          child: LoadingAnimation(),
        ),
      ),
    );
  }
}
