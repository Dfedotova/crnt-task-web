import 'package:crnt_task/controllers/dialogue_windows_controller.dart';
import 'package:crnt_task/themes/theme_provider.dart';
import 'package:crnt_task/widgets/circle_button_active.dart';
import 'package:crnt_task/widgets/circle_button_inactive.dart';
import 'package:crnt_task/widgets/tasks/search_tasks_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 62,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        border: Border(
          bottom: BorderSide(color: Theme.of(context).colorScheme.tertiary),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            GestureDetector(
              onTap: () => DialogueWindows.isMenuOpened.value =
                  !DialogueWindows.isMenuOpened.value,
              child: const ActiveCircleButton(image: 'menu.svg'),
            ),
            const SizedBox(width: 20),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Provider.of<ThemeProvider>(context).brightness ==
                      CustomBrightness.light
                  ? SvgPicture.asset('assets/logo_light.svg')
                  : SvgPicture.asset('assets/logo_dark.svg'),
            ),
            const Spacer(),
            const SearchTasksWidget(),
            const SizedBox(width: 20),
            GestureDetector(
              onTap: () => {
                DialogueWindows.isNotificationsOpened.value = true,
              },
              child: const InactiveCircleButton(image: 'notification.svg'),
            ),
          ],
        ),
      ),
    );
  }
}
