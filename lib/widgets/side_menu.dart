import 'dart:ui';

import 'package:crnt_task/controllers/dialogue_windows_controller.dart';
import 'package:crnt_task/controllers/tasks_controller.dart';
import 'package:crnt_task/data/current_user.dart';
import 'package:crnt_task/locator.dart';
import 'package:crnt_task/navigation/navigation_service.dart';
import 'package:crnt_task/navigation/route_names.dart';
import 'package:crnt_task/widgets/circle_button_active.dart';
import 'package:crnt_task/widgets/circle_button_inactive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SideMenuClosed extends StatefulWidget {
  const SideMenuClosed({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SideMenuClosedState();
}

class _SideMenuClosedState extends State<StatefulWidget> {
  static RxInt openedRoute = 0.obs;

  Widget _avatar() {
    return Stack(
      children: [
        SizedBox(
          width: 40,
          height: 40,
          child: CircleAvatar(
            //backgroundImage: AssetImage('assets/example_photo.jpeg'),
            backgroundColor: Theme.of(context).colorScheme.tertiary,
            child: Align(
              child: Text(
                currentUser.fullName.substring(0, 1),
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  height: 1.2,
                  color: Theme.of(context).colorScheme.scrim,
                ),
              ),
            ),
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            width: !DialogueWindows.isMenuOpened.value ? 62 : 200,
            height: double.infinity,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background.withOpacity(0.65),
              border: Border(
                right: BorderSide(
                  color: Theme.of(context).colorScheme.tertiary,
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 120),
                  Element(
                    check: 0,
                    onPressed: () {
                      setState(() {
                        openedRoute.value = 0;
                      });
                    },
                    count: openedRoute.value,
                    name: 'Home',
                  ),
                  const SizedBox(height: 10),
                  Element(
                    check: 1,
                    onPressed: () {
                      Get.put(TasksController()).selectedProjectId.value = '';
                      setState(() {
                        openedRoute.value = 1;
                      });
                    },
                    count: openedRoute.value,
                    name: 'Tasks',
                  ),
                  const SizedBox(height: 10),
                  Element(
                    check: 2,
                    onPressed: () {
                      setState(() {
                        openedRoute.value = 2;
                      });
                    },
                    count: openedRoute.value,
                    name: 'Analytics',
                  ),
                  const SizedBox(height: 10),
                  Element(
                    check: 3,
                    onPressed: () {
                      setState(() {
                        openedRoute.value = 3;
                      });
                    },
                    count: openedRoute.value,
                    name: 'Settings',
                  ),
                  const Spacer(),
                  Obx(
                    () => !DialogueWindows.isMenuOpened.value
                        ? Column(
                            children: [
                              _avatar(),
                              const SizedBox(height: 10),
                              GestureDetector(
                                onTap: () => locator<NavigationService>()
                                    .navigateTo(AuthRoute),
                                child:
                                    const ActiveCircleButton(image: 'user.svg'),
                              ),
                            ],
                          )
                        : Row(
                            children: [
                              GestureDetector(
                                onTap: () => locator<NavigationService>()
                                    .navigateTo(AuthRoute),
                                child:
                                    const ActiveCircleButton(image: 'user.svg'),
                              ),
                              const SizedBox(width: 10),
                              _avatar(),
                            ],
                          ),
                  ),
                ],
              ),
            ),
          ),
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

  List inactiveButtonsOpened = [
    Row(
      children: const [
        InactiveCircleButton(image: 'home.svg'),
        SizedBox(width: 20),
        Text(
          'Главная',
          style: TextStyle(
            height: 1.2,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    ),
    Row(
      children: const [
        InactiveCircleButton(image: 'task.svg'),
        SizedBox(width: 20),
        Text(
          'Задачи',
          style: TextStyle(
            height: 1.2,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    ),
    Row(
      children: const [
        InactiveCircleButton(image: 'graph.svg'),
        SizedBox(width: 20),
        Text(
          'Аналитика',
          style: TextStyle(
            height: 1.2,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    ),
    Row(
      children: const [
        InactiveCircleButton(image: 'settings.svg'),
        SizedBox(width: 20),
        Text(
          'Настройки',
          style: TextStyle(
            height: 1.2,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    ),
  ];

  List activeButtonsOpened = [
    Row(
      children: const [
        ActiveCircleButton(image: 'home.svg'),
        SizedBox(width: 20),
        Text(
          'Главная',
          style: TextStyle(
            height: 1.2,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    ),
    Row(
      children: const [
        ActiveCircleButton(image: 'task.svg'),
        SizedBox(width: 20),
        Text(
          'Задачи',
          style: TextStyle(
            height: 1.2,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    ),
    Row(
      children: const [
        ActiveCircleButton(image: 'graph.svg'),
        SizedBox(width: 20),
        Text(
          'Аналитика',
          style: TextStyle(
            height: 1.2,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    ),
    Row(
      children: const [
        ActiveCircleButton(image: 'settings.svg'),
        SizedBox(width: 20),
        Text(
          'Настройки',
          style: TextStyle(
            height: 1.2,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    ),
  ];

  List routes = [
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
        locator<NavigationService>().navigateTo(routes[widget.check]);
        widget.onPressed();
      },
      child: !DialogueWindows.isMenuOpened.value
          ? widget.count != widget.check
              ? inactiveButtons[widget.check]
              : activeButtons[widget.check]
          : widget.count != widget.check
              ? inactiveButtonsOpened[widget.check]
              : activeButtonsOpened[widget.check],
    );
  }
}
