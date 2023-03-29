import 'dart:math';

import 'package:crnt_task/controllers/dialogue_windows_controller.dart';
import 'package:crnt_task/controllers/projects_controller.dart';
import 'package:crnt_task/controllers/tasks_controller.dart';
import 'package:crnt_task/models/task.dart';
import 'package:get/get.dart';

class CreateTaskController extends GetxController {
  final tasksController = Get.put(TasksController());
  final loading = false.obs;

  String type = '';
  String status = '';
  DateTime date = DateTime.now();
  DateTime time = DateTime.now();
  String description = '';
  String assignee = '';
  String priority = '';

  void onTypeUpdated(String newValue) {
    type = newValue;
  }

  void onStatusUpdated(String newValue) {
    status = newValue;
  }

  void onDateUpdated(DateTime newValue) {
    date = newValue;
  }

  void onTimeUpdated(DateTime newValue) {
    time = newValue;
  }

  void notifyDescriptionUpdated(String newValue) {
    description = newValue;
  }

  void onAssigneeUpdated(String newValue) {
    assignee = newValue;
  }

  void onPriorityUpdated(String newValue) {
    priority = newValue;
  }

  Future<void> createTask() async {
    try {
      loading.value = true;
      late final TaskStatus taskStatus;
      late final int taskPriority;
      if (status == 'В процессе') {
        taskStatus = TaskStatus.inProgress;
      } else if (status == 'Сделано') {
        taskStatus = TaskStatus.done;
      } else if (status == 'На проверке') {
        taskStatus = TaskStatus.onCheck;
      } else if (status == 'На согласовании') {
        taskStatus = TaskStatus.toBeAgreed;
      } else if (status == 'Согласовано') {
        taskStatus = TaskStatus.agreed;
      } else {
        taskStatus = TaskStatus.backlog;
      }
      taskPriority = priorityToInt(priority);

      final newTask = Task(
        name: '',
        type: type,
        status: taskStatus,
        projectId: tasksController.selectedProjectId.value,
        deadlineDate: date,
        deadlineTime: time,
        responsible: assignee,
        priority: taskPriority,
        tags: ['Tilda', 'Figma'],
      );
      if (tasksController.selectedProjectId.value != '') {
        Get.put(ProjectsController())
            .projects
            .where((element) => element.id == tasksController.selectedProjectId.value)
            .toList()
            .first
            .tasks
            .add(newTask);
      }
      await Future.delayed(Duration(seconds: 1 + Random().nextInt(2)), () {
        tasksController.tasks.add(newTask);
      });
      DialogueWindows.isCardOpened.value = false;
      await tasksController.loadAllTasks();
    } finally {
      loading.value = false;
    }
  }
}

int priorityToInt(String priority) {
  if (priority == 'Высокий') {
    return 0;
  } else if (priority == 'Средний') {
    return 1;
  } else if (priority == 'Ниже среднего') {
    return 2;
  } else {
    return 3;
  }
}
