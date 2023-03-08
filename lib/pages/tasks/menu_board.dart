import 'package:crnt_task/widgets/tasks/task_menu_widget.dart';
import 'package:flutter/material.dart';

import '../../controllers/dialogue_windows_controller.dart';

class MenuBoard extends StatelessWidget {
  const MenuBoard({Key? key, required this.context}) : super(key: key);
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(
              20,
              (index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 7),
                child: GestureDetector(
                  onTap: () => {
                    DialogueWindows.isCardOpened.value = true,
                  },
                  child: const TaskMenu(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
