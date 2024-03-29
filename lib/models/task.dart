enum TaskStatus {
  backlog,
  inProgress,
  done,
  onCheck,
  toBeAgreed,
  agreed,
}

class Task {
  Task({
    required this.projectId,
    // required this.project,
    required this.name,
    required this.type,
    this.status = TaskStatus.backlog,
    required this.deadlineDate,
    required this.deadlineTime,
    required this.priority,
    required this.tags,
    required this.responsible,
  });

  final String? projectId;
  final String name;
  final String type;
  TaskStatus status;
  final DateTime deadlineDate;
  final DateTime deadlineTime;
  final int priority;
  final List<String> tags;
  final String responsible;
}

String taskStatusToString(TaskStatus taskStatus) {
  switch (taskStatus) {
    case TaskStatus.backlog:
      return 'Бэклог';
    case TaskStatus.inProgress:
      return 'В процессе';
    case TaskStatus.done:
      return 'Сделано';
    case TaskStatus.onCheck:
      return 'На проверке';
    case TaskStatus.toBeAgreed:
      return 'На согласовании';
    case TaskStatus.agreed:
      return 'Согласовано';
  }
}
