import 'package:crnt_task/locator.dart';
import 'package:crnt_task/navigation/navigation_service.dart';
import 'package:crnt_task/navigation/route_names.dart';
import 'package:crnt_task/navigation/router.dart';
import 'package:crnt_task/widgets/header.dart';
import 'package:crnt_task/widgets/side_menu_closed.dart';
import 'package:flutter/material.dart';

class LayoutTemplate extends StatelessWidget {
  const LayoutTemplate({Key? key, required this.child}) : super(key: key);

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          child!,
          const SideMenuClosed(),
          const HeaderWidget(),
        ],
      ),
    );
  }
}
