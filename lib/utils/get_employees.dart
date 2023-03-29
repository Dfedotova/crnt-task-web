import 'package:crnt_task/data/employees.dart';

List<String> getEmployees() {
  return allEmployees.map((employee) => employee.getFullName).toList()
    ..add('Все сотрудники')
    ..reversed;
}
