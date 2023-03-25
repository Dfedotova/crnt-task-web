import 'package:crnt_task/models/project.dart';

class Task {
  const Task({
    required this.id,
    required this.project,
    required this.name,
    required this.type,
    required this.deadlineDate,
    required this.deadlineTime,
    required this.priority,
    required this.tags,
    required this.responsible,
  });

  final String id; // id = id_проекта-порядковый номер
  final Project project; // мб через привязку к проекту лучше, если привязать,
  // можно будет как раз считать кол-во согласованных тасок в проекте
  final String name;
  final String type;
  final DateTime deadlineDate;
  final DateTime deadlineTime;
  final int priority; // values: [1..4]
  final List<String> tags;
  final String responsible;
}
