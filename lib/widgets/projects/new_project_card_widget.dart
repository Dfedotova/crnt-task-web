import 'dart:ui';

import 'package:crnt_task/controllers/create_project_controller.dart';
import 'package:crnt_task/controllers/dialogue_windows_controller.dart';
import 'package:crnt_task/controllers/projects_controller.dart';
import 'package:crnt_task/data/directions.dart';
import 'package:crnt_task/widgets/tasks/card_filter_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class NewProjectCard extends StatefulWidget {
  const NewProjectCard({Key? key}) : super(key: key);

  @override
  State<NewProjectCard> createState() => _NewProjectCardState();
}

class _NewProjectCardState extends State<NewProjectCard> {
  final createProjectController = Get.put(CreateProjectController());
  final projectsController = Get.put(ProjectsController());

  final _nameController = TextEditingController();
  final _idController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameController.addListener(() {
      createProjectController.notifyNameUpdated(_nameController.text);
    });
    _idController.addListener(() {
      createProjectController.notifyIdUpdated(_idController.text);
    });
    _descriptionController.addListener(() {
      createProjectController
          .notifyDescriptionUpdated(_descriptionController.text);
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _idController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Padding(
        padding: const EdgeInsets.only(top: 65, right: 20),
        child: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              height: 560,
              width: 880,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Theme.of(context).colorScheme.primary.withOpacity(0.25),
              ),
              child: Obx(
                () {
                  final loading = createProjectController.loading.value;
                  if (loading) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Spacer(),
                            Obx(
                              () {
                                final createLoading =
                                    createProjectController.loading.value;
                                return GestureDetector(
                                  onTap: () => {
                                    if (!createLoading)
                                      {
                                        DialogueWindows
                                            .isProjectCardOpened.value = false
                                      }
                                  },
                                  child: SvgPicture.asset(
                                    'assets/close.svg',
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 13),
                          height: 29,
                          width: 244,
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.outline,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: TextFormField(
                            controller: _nameController,
                            style: TextStyle(
                              height: 1.2,
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                              fontFamily: 'Montserrat',
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            cursorColor: Theme.of(context).colorScheme.surface,
                            cursorHeight: 20,
                            decoration: InputDecoration.collapsed(
                              hintText: 'Название',
                              hintStyle: TextStyle(
                                height: 2,
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                                fontFamily: 'Montserrat',
                                color: Theme.of(context).colorScheme.surface,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 40),
                        Row(
                          children: [
                            SizedBox(
                              width: 110,
                              child: Text(
                                'ID: ',
                                style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 14,
                                  height: 1.2,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                              ),
                            ),
                            const SizedBox(width: 30),
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 13),
                              height: 29,
                              width: 144,
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.outline,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: TextFormField(
                                controller: _idController,
                                style: TextStyle(
                                  height: 1.2,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                  fontFamily: 'Montserrat',
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                                cursorColor:
                                    Theme.of(context).colorScheme.surface,
                                cursorHeight: 20,
                                decoration: InputDecoration.collapsed(
                                  hintText: 'ID',
                                  hintStyle: TextStyle(
                                    height: 2,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300,
                                    fontFamily: 'Montserrat',
                                    color:
                                        Theme.of(context).colorScheme.surface,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            SizedBox(
                              width: 110,
                              child: Text(
                                'Направление: ',
                                style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 14,
                                  height: 1.2,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                              ),
                            ),
                            const SizedBox(width: 30),
                            Container(
                              height: 29,
                              width: 210,
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.outline,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: CardFilterWidget(
                                filter: 'Направление',
                                items: directions.sublist(
                                  1,
                                  directions.length,
                                ),
                                img: 'arrow_down.svg',
                                onValueSelected:
                                    createProjectController.onDirectionUpdated,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 110,
                              child: Text(
                                'Описание:',
                                style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 14,
                                  height: 2,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                              ),
                            ),
                            const SizedBox(width: 30),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 13,
                                vertical: 13,
                              ),
                              height: 115,
                              width: 560,
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.outline,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: TextFormField(
                                controller: _descriptionController,
                                style: TextStyle(
                                  height: 1.2,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                  fontFamily: 'Montserrat',
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                                cursorColor:
                                    Theme.of(context).colorScheme.surface,
                                cursorHeight: 20,
                                decoration: InputDecoration.collapsed(
                                  hintText: 'Описание',
                                  hintStyle: TextStyle(
                                    height: 1.2,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300,
                                    fontFamily: 'Montserrat',
                                    color:
                                        Theme.of(context).colorScheme.surface,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            SizedBox(
                              width: 110,
                              child: Text(
                                'Ответственный:',
                                style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 14,
                                  height: 1.2,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                              ),
                            ),
                            const SizedBox(width: 30),
                            Container(
                              height: 29,
                              width: 215,
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.outline,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: CardFilterWidget(
                                filter: 'Ответственный',
                                items: const ['Дарья Федотова', 'Олег Иванов'],
                                img: 'person.svg',
                                onValueSelected: createProjectController
                                    .onResponsibleUpdated,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Obx(
                            () {
                              final createLoading =
                                  createProjectController.loading.value;
                              return GestureDetector(
                                onTap: () {
                                  if (!createLoading) {
                                    createProjectController.createProject();
                                  }
                                },
                                child: Container(
                                  height: 35,
                                  width: 178,
                                  decoration: BoxDecoration(
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Align(
                                    child: Text(
                                      'Сохранить',
                                      style: TextStyle(
                                        fontSize: 14,
                                        height: 1.2,
                                        color:
                                            Theme.of(context).colorScheme.scrim,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    );
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
