import 'package:crnt_task/models/task.dart';

class Project {
  Project({
    required this.name,
    required this.id,
    required this.direction,
    required this.description,
    required this.responsible,
    this.tasks = const [],
  });

  final String name;
  final String id;
  final String direction;
  final String description;
  final String responsible;
  final List<Task> tasks;
}
