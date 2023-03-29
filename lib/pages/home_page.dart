import 'package:crnt_task/controllers/create_project_controller.dart';
import 'package:crnt_task/controllers/dialogue_windows_controller.dart';
import 'package:crnt_task/controllers/home_page_controller.dart';
import 'package:crnt_task/controllers/projects_controller.dart';
import 'package:crnt_task/data/directions.dart';
import 'package:crnt_task/widgets/projects/project_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homePageController = Get.put(HomePageController());
  final createProjectController = Get.put(CreateProjectController());
  final projectsController = Get.put(ProjectsController());

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      projectsController.loadAllProjects();
    });
  }

  Widget _category(String name) {
    return MouseRegion(
      onHover: (_) => homePageController.updateDirection(name),
      onEnter: (_) => homePageController.pickDirection(name),
      child: Container(
        width: 224,
        height: 35,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Theme.of(context).colorScheme.surfaceTint,
              width: 0.5,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              name,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                height: 1.5,
              ),
            ),
            if (homePageController.currentDirection.value == name)
              SvgPicture.asset('assets/arrow_right_black.svg'),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 100, top: 140),
          child: Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: directions.map(_category).toList(),
            ),
          ),
        ),
        const SizedBox(width: 60),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 100),
            child: ListView(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Obx(
                    () {
                      final createLoading =
                          createProjectController.loading.value;
                      final fetchLoading = projectsController.loading.value;
                      return GestureDetector(
                        onTap: () {
                          if (!createLoading && !fetchLoading) {
                            DialogueWindows.isProjectCardOpened.value = true;
                          }
                        },
                        child: Container(
                          margin: const EdgeInsets.only(right: 70),
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          width: 150,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.shadow,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SvgPicture.asset('assets/plus.svg'),
                              Text(
                                'Новый проект',
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontSize: 14,
                                  height: 1.2,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 30),
                Obx(
                  () {
                    final loading = projectsController.loading.value;
                    final pickedDirection =
                        homePageController.pickedDirection.value;

                    if (loading) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      return Wrap(
                        spacing: 22,
                        runSpacing: 18,
                        children: (pickedDirection == 'все'
                                ? homePageController.getAllProjects
                                : homePageController.getSpecifiedProjects)
                            .map(
                              (p) => ProjectCard(project: p),
                            )
                            .toList(),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
