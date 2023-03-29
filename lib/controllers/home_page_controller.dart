import 'package:crnt_task/controllers/projects_controller.dart';
import 'package:crnt_task/models/project.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  final projectsController = Get.put(ProjectsController());

  final currentDirection = 'все'.obs;
  final pickedDirection = 'все'.obs;

  List<Project> get getAllProjects => projectsController.projects;
  List<Project> get getSpecifiedProjects => projectsController.projects
      .where(
        (project) => project.direction == pickedDirection.value,
      )
      .toList();

  void pickDirection(String name) {
    pickedDirection.value = name;
  }

  void updateDirection(String name) {
    currentDirection.value = name;
  }
}
