import 'dart:math';

import 'package:crnt_task/pages/tasks/kanban_board.dart';
import 'package:crnt_task/pages/tasks/menu_board.dart';
import 'package:crnt_task/widgets/filter_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class TasksPage extends StatefulWidget {
  const TasksPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  final RxString _viewPicked = 'kanban'.obs;

  Widget _activeView(String picture) {
    return Container(
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
        'assets/$picture',
        fit: BoxFit.scaleDown,
        color: Theme.of(context).colorScheme.scrim,
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
                child: Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => _viewPicked.value = 'list',
                        child: _viewPicked.value == 'list'
                            ? _activeView('list.svg')
                            : Padding(
                                padding: const EdgeInsets.only(left: 12),
                                child: SvgPicture.asset('assets/list.svg'),
                              ),
                      ),
                      GestureDetector(
                        onTap: () => _viewPicked.value = 'kanban',
                        child: _viewPicked.value == 'kanban'
                            ? _activeView('kanban.svg')
                            : SvgPicture.asset('assets/kanban.svg'),
                      ),
                      GestureDetector(
                        onTap: () => _viewPicked.value = 'gantt',
                        child: _viewPicked.value == 'gantt'
                            ? _activeView('gant.svg')
                            : Padding(
                                padding: const EdgeInsets.only(right: 12),
                                child: SvgPicture.asset('assets/gant.svg'),
                              ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 35),
              const FilterWidget(
                title: 'Сотрудники',
                filter: 'Все сотрудники',
                items: ['Федотова', 'Смирнов'],
              ),
              const FilterWidget(
                title: 'Приоритет',
                filter: 'Все задачи',
                items: ['Высокий', 'Выше среднего', 'Средний', 'Низкий'],
              ),
              const FilterWidget(
                title: 'Направление',
                filter: 'Все направления',
                items: ['Дизайн', 'Программирование'],
              ),
              const FilterWidget(
                title: 'Статус',
                filter: 'Все статусы',
                items: ['Done', 'In progress'],
              ),
              const FilterWidget(
                title: 'Тип задачи',
                filter: 'Все типы',
                items: ['эпик', 'таск', 'сабтаск'],
              ),
            ],
          ),
        ),
        const SizedBox(height: 40),
        Obx(
          () => _viewPicked.value == 'kanban'
              ? KanbanBoard(context: context)
              : /* _viewPicked.value == 'list' ? */ MenuBoard(context: context),
        ),
      ],
    );
  }
}
