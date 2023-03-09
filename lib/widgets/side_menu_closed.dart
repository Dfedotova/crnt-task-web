import 'package:crnt_task/locator.dart';
import 'package:crnt_task/navigation/navigation_service.dart';
import 'package:crnt_task/navigation/route_names.dart';
import 'package:crnt_task/widgets/circle_button_active.dart';
import 'package:crnt_task/widgets/circle_button_inactive.dart';
import 'package:flutter/material.dart';

class SideMenuClosed extends StatefulWidget {
  const SideMenuClosed({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SideMenuClosedState();
}

class _SideMenuClosedState extends State<StatefulWidget> {
  int checkInt = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 62,
      height: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        border: Border.all(
          color: Theme.of(context).colorScheme.tertiary,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 6),
        child: Column(
          children: [
            const SizedBox(height: 120),
            Element(
              check: 0,
              onPressed: () {
                setState(() {
                  checkInt = 0;
                });
              },
              count: checkInt,
              name: 'Home',
            ),
            const SizedBox(height: 10),
            Element(
              check: 1,
              onPressed: () {
                setState(() {
                  checkInt = 1;
                });
              },
              count: checkInt,
              name: 'Tasks',
            ),
            const SizedBox(height: 10),
            Element(
              check: 2,
              onPressed: () {
                setState(() {
                  checkInt = 2;
                });
              },
              count: checkInt,
              name: 'Analytics',
            ),
            const SizedBox(height: 10),
            Element(
              check: 3,
              onPressed: () {
                setState(() {
                  checkInt = 3;
                });
              },
              count: checkInt,
              name: 'Settings',
            ),
            const Spacer(),
            Stack(
              children: [
                const SizedBox(
                  width: 40,
                  height: 40,
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/example_photo.jpeg'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 27),
                  child: Container(
                    height: 7,
                    width: 7,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 10),
            const ActiveCircleButton(image: 'user.svg'),
          ],
        ),
      ),
    );
  }
}

class Element extends StatefulWidget {
  const Element({
    Key? key,
    required this.check,
    required this.onPressed,
    required this.count,
    required this.name,
  }) : super(key: key);
  final int check;
  final VoidCallback onPressed;
  final int count;
  final String name;

  @override
  ElementState createState() => ElementState();
}

class ElementState extends State<Element> {
  List inactiveButtons = [
    const InactiveCircleButton(image: 'home.svg'),
    const InactiveCircleButton(image: 'task.svg'),
    const InactiveCircleButton(image: 'graph.svg'),
    const InactiveCircleButton(image: 'settings.svg'),
  ];

  List activeButtons = [
    const ActiveCircleButton(image: 'home.svg'),
    const ActiveCircleButton(image: 'task.svg'),
    const ActiveCircleButton(image: 'graph.svg'),
    const ActiveCircleButton(image: 'settings.svg'),
  ];

  List routers = [
    HomeRoute,
    TasksRoute,
    AnalyticsRoute,
    SettingsRoute,
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        locator<NavigationService>().navigateTo(routers[widget.check]);
        widget.onPressed();
      },
      child: widget.count != widget.check
          ? inactiveButtons[widget.check]
          : activeButtons[widget.check],
    );
  }
}
