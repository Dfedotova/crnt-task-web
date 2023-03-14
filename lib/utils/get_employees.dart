import 'package:crnt_task/data/employees.dart';

List<String> getEmployees() {
  final employees = <String>[];
  for (var i = 0; i < allEmployees.length; i++) {
    employees.add(allEmployees[i].getFullName);
  }
  return employees;
}
