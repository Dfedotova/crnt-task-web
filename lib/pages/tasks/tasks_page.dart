import 'package:crnt_task/pages/tasks/kanban_board.dart';
import 'package:crnt_task/pages/tasks/menu_board.dart';
import 'package:crnt_task/widgets/filter_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TasksPage extends StatefulWidget {
  const TasksPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 100, top: 100),
          child: Row(
            children: [
              Container(
                height: 45,
                width: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Theme.of(context)
                      .colorScheme
                      .secondaryContainer
                      .withOpacity(0.6),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset('assets/list.svg'),
                      Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Theme.of(context).colorScheme.secondary,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.4),
                              spreadRadius: 3,
                              blurRadius: 5,
                            ),
                          ],
                        ),
                        child: SvgPicture.asset(
                          'assets/kanban.svg',
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                      SvgPicture.asset('assets/gant.svg'),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 35),
              const FilterWidget(
                title: 'Сотрудники',
                filter: 'Все сотрудники',
              ),
              const FilterWidget(
                title: 'Приоритет',
                filter: 'Все задачи',
              ),
              const FilterWidget(
                title: 'Направление',
                filter: 'Все направления',
              ),
              const FilterWidget(
                title: 'Статус',
                filter: 'Все статусы',
              ),
              const FilterWidget(
                title: 'Тип задачи',
                filter: 'Все типы',
              ),
            ],
          ),
        ),
        const SizedBox(height: 40),
        //KanbanBoard(context: context),
        MenuBoard(context: context),
      ],
    );
  }
}
