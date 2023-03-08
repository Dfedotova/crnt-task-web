import 'package:crnt_task/pages/tasks/kanban_board.dart';
import 'package:crnt_task/pages/tasks/menu_board.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TasksPage extends StatefulWidget {
  const TasksPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  Widget _filterWidget(String title, String filter) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              height: 0.7,
              fontSize: 12,
              fontWeight: FontWeight.w300,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Text(
                filter,
                style: const TextStyle(
                  height: 0.7,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(width: 15),
              SvgPicture.asset('assets/arrow_down.svg'),
            ],
          )
        ],
      ),
    );
  }

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
              _filterWidget('Сотрудники', 'Все сотрудники'),
              _filterWidget('Приоритет', 'Все задачи'),
              _filterWidget('Спринт', 'Все спринты'),
              _filterWidget('Направление', 'Все направления'),
              _filterWidget('Статус', 'Все статусы'),
              _filterWidget('Тип задачи', 'Все типы'),
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
