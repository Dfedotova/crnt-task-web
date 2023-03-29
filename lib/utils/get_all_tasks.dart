import 'package:crnt_task/data/tasks.dart';

import 'package:crnt_task/models/task.dart';

List<Task> getAllTasks() {
  final allTasks = <Task>[];
  sowinTasks.map(allTasks.add);
  skillboxTasksIllustrations.map(allTasks.add);
  skillboxTasksPresentations.map(allTasks.add);
  return allTasks;
}
