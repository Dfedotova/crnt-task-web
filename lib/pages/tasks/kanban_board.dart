import 'package:crnt_task/controllers/dialogue_windows_controller.dart';
import 'package:crnt_task/models/task.dart';
import 'package:crnt_task/widgets/tasks/task_kanban_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class KanbanBoard extends StatelessWidget {
  const KanbanBoard({Key? key, required this.tasks}) : super(key: key);
  final List<Task> tasks;

  Widget _titleTextWidget(String title, int taskCount, BuildContext context) {
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

  Widget _taskColumnWidget(TaskStatus status, BuildContext context) {
    final title = taskStatusToString(status);
    final tasksWithSuchStatus = tasks.where(
      (element) => element.status == status,
    );
    final taskCount = tasksWithSuchStatus.length;
    return Padding(
      padding: EdgeInsets.only(left: (title == 'Бэклог') ? 0 : 22, right: 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title == 'Бэклог')
            Row(
              children: [
                _titleTextWidget(title, taskCount, context),
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
            _titleTextWidget(title, taskCount, context),
          Column(
            children: tasksWithSuchStatus
                .map(
                  (e) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 7),
                    child: GestureDetector(
                      onTap: () => {
                        // ЗАБЛОЧИЛ РЕДАКТИРОВАНИЕ ТАСКИ
                        DialogueWindows.isCardOpened.value = true,
                      },
                      child: TaskKanban(task: e),
                    ),
                  ),
                )
                .toList(),
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
              ...TaskStatus.values
                  .map(
                    (e) => _taskColumnWidget(e, context),
                  )
                  .toList()
            ],
          ),
        ),
      ),
    );
  }
}
