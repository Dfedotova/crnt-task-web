import 'dart:math';

import 'package:crnt_task/controllers/dialogue_windows_controller.dart';
import 'package:crnt_task/controllers/projects_controller.dart';
import 'package:crnt_task/models/project.dart';
import 'package:get/get.dart';

class CreateProjectController extends GetxController {
  final projectsController = Get.put(ProjectsController());

  final loading = false.obs;

  final name = ''.obs;
  final id = ''.obs;
  final direction = ''.obs;
  final description = ''.obs;
  final responsible = ''.obs;

  void notifyNameUpdated(String newValue) {
    name.value = newValue;
  }

  void notifyIdUpdated(String newValue) {
    id.value = newValue;
  }

  void notifyDescriptionUpdated(String newValue) {
    description.value = newValue;
  }

  void onDirectionUpdated(String newValue) {
    direction.value = newValue;
  }

  void onResponsibleUpdated(String newValue) {
    responsible.value = newValue;
  }

  Future<void> createProject() async {
    try {
      loading.value = true;
      final newProject = Project(
        id: id.value,
        name: name.value,
        direction: direction.value,
        description: description.value,
        responsible: responsible.value,
      );
      await Future.delayed(Duration(seconds: 1 + Random().nextInt(2)), () {
        projectsController.projects.add(newProject);
      });
      DialogueWindows.isProjectCardOpened.value = false;
      await projectsController.loadAllProjects();
    } finally {
      loading.value = false;
    }
  }
}
