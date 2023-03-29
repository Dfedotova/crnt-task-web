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
    this.projectId,
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

  final String? projectId; // id = id_проекта-порядковый номер
  // final Project project; // мб через привязку к проекту лучше, если привязать,
  // можно будет как раз считать кол-во согласованных тасок в проекте
  final String name;
  final String type;
  TaskStatus status;
  final DateTime deadlineDate;
  final DateTime deadlineTime;
  final int priority; // values: [1..4]
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
