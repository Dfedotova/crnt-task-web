import 'dart:math';

import 'package:crnt_task/controllers/create_task_controller.dart';
import 'package:crnt_task/controllers/projects_controller.dart';
import 'package:crnt_task/models/task.dart';
import 'package:get/get.dart';

class TasksController extends GetxController {
  final projectsController = Get.put(ProjectsController());
  final loading = false.obs;

  final assigneeFilter = ''.obs;

  // final directionFilter = ''.obs; нет с карточке создания
  final priorityFilter = ''.obs;

  // final statusFilter = ''.obs; // зачем
  final typeFilter = ''.obs;

  final tasks = List.of(Get.put(ProjectsController()).projects.expand((project) => project.tasks));
  final filteredTasks = <Task>[].obs;

  final Rx<String?> selectedProjectId = ''.obs;

  void onAssigneeFilterUpdated(String newValue) {
    if (newValue == 'Все сотрудники') {
      assigneeFilter.value = '';
    } else {
      assigneeFilter.value = newValue;
    }
    applyFilters();
  }

  void onPriorityFilterUpdated(String newValue) {
    if (newValue == 'Все задачи') {
      priorityFilter.value = '';
    } else {
      priorityFilter.value = newValue;
    }
    applyFilters();
  }

  // void onDirectionFilterUpdated(String newValue) {
  //   directionFilter.value = newValue;
  //   applyFilters();
  // }

  // void onStatusFilterUpdated(String newValue) {
  //   status = newValue;
  //   applyFilters();
  // }

  void onTypeFilterUpdated(String newValue) {
    if (newValue == 'Все типы') {
      typeFilter.value = '';
    } else {
      typeFilter.value = newValue;
    }
    applyFilters();
  }

  Future<void> applyFilters() async {
    loading.value = true;

    final filteredByAssignee = (assigneeFilter.value.isEmpty
            ? tasks
            : tasks.where((task) => task.responsible.toLowerCase() == assigneeFilter.value.toLowerCase()))
        .toSet();
    final filteredByType = (typeFilter.value.isEmpty
            ? tasks
            : tasks.where((task) => task.type.toLowerCase() == typeFilter.value.toLowerCase()))
        .toSet();
    final filteredByPriority = (priorityFilter.value.isEmpty
            ? tasks
            : tasks.where((task) => task.priority == priorityToInt(priorityFilter.value)))
        .toSet();

    filteredTasks
      ..clear()
      ..addAll(
        filteredByAssignee.intersection(filteredByPriority).intersection(filteredByType),
      );
    await Future.delayed(Duration(seconds: Random().nextInt(2)), () {});
    loading.value = false;
  }

  Future<void> loadAllTasks() async {
    try {
      loading.value = true;
      await Future.delayed(Duration(seconds: 1 + Random().nextInt(4)), () {});
    } finally {
      loading.value = false;
    }
  }
}
