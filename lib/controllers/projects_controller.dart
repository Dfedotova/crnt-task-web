import 'dart:math';

import 'package:crnt_task/data/projects.dart';
import 'package:get/get.dart';

class ProjectsController extends GetxController {
  final projects = List.of(allProjects);
  final loading = false.obs;

  Future<void> loadAllProjects() async {
    try {
      loading.value = true;
      await Future.delayed(Duration(seconds: 1 + Random().nextInt(3)), () {});
    } finally {
      loading.value = false;
    }
  }
}
