import 'package:crnt_task/models/task.dart';
import 'package:crnt_task/widgets/tasks/task_menu_widget.dart';
import 'package:flutter/material.dart';

import '../../controllers/dialogue_windows_controller.dart';

class MenuBoard extends StatelessWidget {
  const MenuBoard({Key? key, required this.tasks}) : super(key: key);
  final List<Task> tasks;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: tasks
                .map(
                  (task) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 7),
                    child: GestureDetector(
                      onTap: () => {
                        // ЗАБЛОЧИЛ РЕДАКТИРОВАНИЕ ТАСКИ
                        DialogueWindows.isCardOpened.value = true,
                      },
                      child: TaskMenu(
                        task: task,
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
