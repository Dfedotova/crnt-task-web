import 'dart:math';

import 'package:crnt_task/data/employees.dart';
import 'package:crnt_task/models/employee.dart';
import 'package:get/get.dart';

class AnalyticsController extends GetxController {
  final loading = false.obs;

  Future<void> loadTable() async {
    try {
      loading.value = true;
      await Future.delayed(Duration(seconds: 1 + Random().nextInt(3)), () {});
    } finally {
      loading.value = false;
    }
  }

  final directionFilter = ''.obs;
  final filteredEmployees = <Employee>[];

  void onDirectionFilterUpdated(String newValue) {
    if (newValue == 'Все направления') {
      directionFilter.value = '';
    } else {
      directionFilter.value = newValue;
    }
    applyFilter();
  }

  Future<void> applyFilter() async {
    loading.value = true;
    Set<Employee> filteredByDirection;

    filteredByDirection = (directionFilter.value.isEmpty
            ? allEmployees
            : allEmployees.where(
                (e) => e.direction == directionFilter.value,
              ))
        .toSet();

    if (directionFilter.value == 'Управление') {
      filteredByDirection = allEmployees
          .where(
            (e) =>
                e.direction == 'CEO' ||
                e.direction == 'PM' ||
                e.direction == 'Bizdev',
          )
          .toSet();
    }

    filteredEmployees
      ..clear()
      ..addAll(
        filteredByDirection,
      );
    await Future.delayed(Duration(seconds: Random().nextInt(2)), () {});
    loading.value = false;
  }
}
