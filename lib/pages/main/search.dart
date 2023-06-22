import 'package:auto_route/annotations.dart';
import 'package:chupp/utils/utils/context_extension.dart';
import 'package:chupp/widgets/navbar/app_navbar.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.current.primaryBg,
      bottomNavigationBar: const AppNavBar(current: 1),
    );
  }
}
