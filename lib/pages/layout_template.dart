import 'package:crnt_task/controllers/dialogue_windows_controller.dart';
import 'package:crnt_task/widgets/header.dart';
import 'package:crnt_task/widgets/messages/create_chat_widget.dart';
import 'package:crnt_task/widgets/notifications.dart';
import 'package:crnt_task/widgets/projects/new_project_card_widget.dart';
import 'package:crnt_task/widgets/side_menu.dart';
import 'package:crnt_task/widgets/tasks/task_card_widget.dart';
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
            if (DialogueWindows.isNotificationsOpened.value ||
                DialogueWindows.isCardOpened.value ||
                DialogueWindows.isProjectCardOpened.value ||
                DialogueWindows.isChatSelectionOpened.value
            )
              Opacity(
                opacity: 0.4,
                child: ModalBarrier(
                  dismissible: false,
                  color: Theme.of(context).colorScheme.scrim,
                ),
              ),
            if (DialogueWindows.isNotificationsOpened.value)
              NotificationsWidget(),
            if (DialogueWindows.isCardOpened.value) const TaskCard(),
            if (DialogueWindows.isProjectCardOpened.value)
              const NewProjectCard(),
            if (DialogueWindows.isChatSelectionOpened.value)
              const ChatCreation(),
          ],
        ),
      ),
    );
  }
}
