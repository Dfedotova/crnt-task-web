import 'package:crnt_task/locator.dart';
import 'package:crnt_task/navigation/navigation_service.dart';
import 'package:crnt_task/navigation/route_names.dart';
import 'package:crnt_task/widgets/circle_button_active.dart';
import 'package:crnt_task/widgets/circle_button_inactive.dart';
import 'package:flutter/material.dart';

class SideMenuClosed extends StatelessWidget {
  const SideMenuClosed({Key? key}) : super(key: key);

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
            GestureDetector(
              onTap: () {
                locator<NavigationService>().navigateTo(HomeRoute);
              },
              child: const ActiveCircleButton(image: 'home.svg'),
            ),
            const SizedBox(height: 10),
            const InactiveCircleButton(image: 'task.svg'),
            const SizedBox(height: 10),
            const InactiveCircleButton(image: 'graph.svg'),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                locator<NavigationService>().navigateTo(SettingsRoute);
              },
              child: const InactiveCircleButton(image: 'settings.svg'),
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
