import 'package:crnt_task/controllers/dialogue_windows_controller.dart';
import 'package:crnt_task/widgets/header.dart';
import 'package:crnt_task/widgets/notifications.dart';
import 'package:crnt_task/widgets/side_menu_closed.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class LayoutTemplate extends StatelessWidget {
  const LayoutTemplate({Key? key, required this.child}) : super(key: key);

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Obx(
        () => Stack(
          clipBehavior: Clip.none,
          children: [
            child!,
            const SideMenuClosed(),
            const HeaderWidget(),
            if (DialogueWindows.isNotificationsOpened.value)
              const Opacity(
                opacity: 0.2,
                child: ModalBarrier(dismissible: false, color: Colors.black),
              ),
            if (DialogueWindows.isNotificationsOpened.value)
              const NotificationsWidget(),
          ],
        ),
      ),
    );
  }
}
