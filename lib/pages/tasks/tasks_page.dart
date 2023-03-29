import 'package:crnt_task/controllers/tasks_controller.dart';
import 'package:crnt_task/pages/tasks/kanban_board.dart';
import 'package:crnt_task/pages/tasks/menu_board.dart';
import 'package:crnt_task/utils/get_employees.dart';
import 'package:crnt_task/widgets/filter_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class TasksPage extends StatefulWidget {
  const TasksPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  final tasksController = Get.put(TasksController());
  final RxString _viewPicked = 'kanban'.obs;

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      tasksController.filteredTasks
        ..clear()
        ..addAll(tasksController.tasks);
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      tasksController.loadAllTasks();
    });
  }

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
                width: 100,
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
                            : Padding(
                                padding: const EdgeInsets.only(right: 11),
                                child: SvgPicture.asset('assets/kanban.svg'),
                              ),
                      ),
                      /*GestureDetector(
                        onTap: () => _viewPicked.value = 'gantt',
                        child: _viewPicked.value == 'gantt'
                            ? _activeView('gant.svg')
                            : Padding(
                                padding: const EdgeInsets.only(right: 12),
                                child: SvgPicture.asset('assets/gant.svg'),
                              ),
                      ),*/
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 35),
              FilterWidget(
                title: 'Сотрудники',
                filter: 'Все сотрудники',
                items: getEmployees(),
                onFilterChanged: tasksController.onAssigneeFilterUpdated,
              ),
              FilterWidget(
                title: 'Приоритет',
                filter: 'Все задачи',
                items: const [
                  'Все задачи',
                  'Высокий',
                  'Выше среднего',
                  'Средний',
                  'Низкий',
                ],
                onFilterChanged: tasksController.onPriorityFilterUpdated,
              ),
              // FilterWidget(
              //   title: 'Направление',
              //   filter: 'Все направления',
              //   items: directions,
              //   onFilterChanged: tasksController.onDirectionFilterUpdated,
              // ),
              // FilterWidget(
              //   title: 'Статус',
              //   filter: 'Все статусы',
              //   items: const [
              //     'Все статусы',
              //     'Бэклог',
              //     'В процессе',
              //     'Сделано',
              //     'На проверке',
              //     'На согласовании',
              //     'Согласовано',
              //     'Архив'
              //   ],
              //   onFilterChanged: tasksController.onStatusFilterUpdated,
              // ),
              FilterWidget(
                title: 'Тип задачи',
                filter: 'Все типы',
                items: const [
                  'Все типы',
                  'Эпик',
                  'Стори',
                  'Таск',
                  'Сабтаск',
                ],
                onFilterChanged: tasksController.onTypeFilterUpdated,
              ),
            ],
          ),
        ),
        const SizedBox(height: 40),
        Obx(
          () {
            final loading = tasksController.loading.value;
            final selectedProjectId = tasksController.selectedProjectId.value;
            final filteredTasks = tasksController.filteredTasks;
            final tasks = selectedProjectId == ''
                ? filteredTasks
                : filteredTasks
                    .where(
                      (element) =>
                          element.projectId?.substring(0, 3) ==
                          selectedProjectId,
                    )
                    .toList();
            if (loading) {
              return const Center(child: CircularProgressIndicator());
            } else {
              if (_viewPicked.value == 'kanban') {
                return KanbanBoard(tasks: tasks);
              } else {
                return MenuBoard(tasks: tasks);
              }
            }
          },
        ),
      ],
    );
  }
}
