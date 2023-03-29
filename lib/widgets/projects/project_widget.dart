import 'package:crnt_task/controllers/tasks_controller.dart';
import 'package:crnt_task/locator.dart';
import 'package:crnt_task/models/project.dart';
import 'package:crnt_task/models/task.dart';
import 'package:crnt_task/navigation/navigation_service.dart';
import 'package:crnt_task/navigation/route_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({
    Key? key,
    required this.project,
  }) : super(key: key);

  final Project project;

  @override
  Widget build(BuildContext context) {
    final doneTasksLength = project.tasks
        .where((element) => element.status == TaskStatus.agreed)
        .toList()
        .length;
    final tasksLength = project.tasks.length;
    return GestureDetector(
      onTap: () {
        Get.put(TasksController()).selectedProjectId.value = project.id;
        locator<NavigationService>().navigateTo(TasksRoute);
      },
      child: Container(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 16),
        height: 190,
        width: 230,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              project.direction,
              style: TextStyle(
                fontSize: 10,
                height: 1.2,
                fontWeight: FontWeight.w400,
                color: Theme.of(context).colorScheme.scrim,
              ),
            ),
            const SizedBox(height: 5),
            Stack(
              children: [
                Container(
                  height: 5,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.outline,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Row(
                  children: [
                    Flexible(
                      flex: doneTasksLength,
                      child: Container(
                        height: 5,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.tertiary,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    if (tasksLength != doneTasksLength)
                      Spacer(
                        flex: tasksLength == 0
                            ? 1
                            : tasksLength - doneTasksLength,
                      ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              '$doneTasksLength/$tasksLength',
              style: TextStyle(
                fontSize: 8,
                fontWeight: FontWeight.w300,
                color: Theme.of(context).colorScheme.scrim,
              ),
            ),
            const SizedBox(height: 14),
            Text(
              project.name,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                height: 1.2,
                color: Theme.of(context).colorScheme.scrim,
              ),
            ),
            const SizedBox(height: 10),
            Flexible(
              child: Text(
                project.description,
                maxLines: 2,
                style: TextStyle(
                  fontSize: 10,
                  height: 1.2,
                  overflow: TextOverflow.ellipsis,
                  color: Theme.of(context).colorScheme.scrim,
                ),
              ),
            ),
            const Spacer(),
            Align(
              alignment: Alignment.bottomRight,
              child: Row(
                children: [
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    width: 108,
                    height: 18,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.tertiary,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        Text(
                          'К задачам',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w300,
                            color: Theme.of(context).colorScheme.primary,
                            height: 1.2,
                          ),
                        ),
                        const Spacer(),
                        SvgPicture.asset('assets/arrow_right.svg'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
