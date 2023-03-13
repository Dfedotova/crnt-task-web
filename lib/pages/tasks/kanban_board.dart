import 'package:crnt_task/controllers/dialogue_windows_controller.dart';
import 'package:crnt_task/widgets/tasks/task_kanban_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class KanbanBoard extends StatelessWidget {
  const KanbanBoard({Key? key, required this.context}) : super(key: key);
  final BuildContext context;

  Widget _titleTextWidget(String title, int taskCount) {
    return RichText(
      text: TextSpan(
        text: '$title ',
        style: TextStyle(
          fontSize: 20,
          height: 1.2,
          fontWeight: FontWeight.w600,
          fontFamily: 'Montserrat',
          color: Theme.of(context).colorScheme.surfaceTint,
        ),
        children: [
          TextSpan(
            text: '($taskCount)',
            style: TextStyle(
              fontSize: 20,
              height: 1.2,
              fontWeight: FontWeight.w600,
              fontFamily: 'Montserrat',
              color: Theme.of(context).colorScheme.shadow,
            ),
          )
        ],
      ),
    );
  }

  Widget _taskColumnWidget(String title, int taskCount) {
    return Padding(
      padding: EdgeInsets.only(left: (title == 'Бэклог') ? 0 : 22, right: 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title == 'Бэклог')
            Row(
              children: [
                _titleTextWidget(title, taskCount),
                const SizedBox(width: 114),
                GestureDetector(
                  onTap: () => {
                    DialogueWindows.isCardOpened.value = true,
                  },
                  child: SvgPicture.asset('assets/add_task.svg'),
                ),
              ],
            )
          else
            _titleTextWidget(title, taskCount),
          Column(
            children: List.generate(
              taskCount,
              (index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: GestureDetector(
                  onTap: () => {
                    DialogueWindows.isCardOpened.value = true,
                  },
                  child: const TaskKanban(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        primary: false,
        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(width: 100),
              _taskColumnWidget('Бэклог', 4),
              _taskColumnWidget('В процессе', 1),
              _taskColumnWidget('Сделано', 1),
              _taskColumnWidget('На проверке', 1),
              _taskColumnWidget('На согласовании', 2),
              _taskColumnWidget('Согласовано', 1),
              _taskColumnWidget('Архив', 3),
            ],
          ),
        ),
      ),
    );
  }
}
