import 'dart:math';
import 'dart:ui';

import 'package:crnt_task/controllers/create_task_controller.dart';
import 'package:crnt_task/controllers/dialogue_windows_controller.dart';
import 'package:crnt_task/data/employees.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../models/employee.dart';

class ChatCreation extends StatefulWidget {
  const ChatCreation({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ChatCreationState();
}

class _ChatCreationState extends State<ChatCreation> {
  final createTaskController = Get.put(CreateTaskController());
  final _descriptionController = TextEditingController();
  List<Employee> _selectedEmployees = [];

  @override
  void initState() {
    super.initState();
    _descriptionController.addListener(() {
      createTaskController
          .notifyDescriptionUpdated(_descriptionController.text);
    });
  }

  @override
  void dispose() {
    _descriptionController.dispose();
    super.dispose();
  }

  Widget _selectedEmployeesWidget() {
    return Wrap(
      spacing: 10,
      runSpacing: 8,
      children: allEmployees
          .map(
            (e) => _selectedEmployees.contains(e)
                ? Chip(
                    labelPadding: const EdgeInsets.symmetric(horizontal: 15),
                    label: Text(
                      e.getFullName,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 14,
                      ),
                    ),
                    backgroundColor: Theme.of(context).colorScheme.tertiary,
                    deleteIcon: Container(
                      padding: const EdgeInsets.all(2),
                      height: 18,
                      width: 18,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Theme.of(context).colorScheme.shadow,
                      ),
                      child: SvgPicture.asset(
                        'assets/close.svg',
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    onDeleted: () => setState(() {
                      _selectedEmployees.remove(e);
                    }),
                    deleteButtonTooltipMessage: 'Удалить',
                  )
                : Chip(
                    labelPadding: const EdgeInsets.symmetric(horizontal: 15),
                    label: Text(
                      e.getFullName,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 14,
                      ),
                    ),
                    backgroundColor: Theme.of(context).colorScheme.shadow,
                    deleteIcon: SvgPicture.asset('assets/plus.svg'),
                    deleteButtonTooltipMessage: 'Добавить',
                    onDeleted: () => setState(() {
                      _selectedEmployees.add(e);
                    }),
                  ),
          )
          .toList(),
    );
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
              height: 500,
              width: 480,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Theme.of(context).colorScheme.primary.withOpacity(0.25),
              ),
              child: Obx(
                () {
                  final loading = createTaskController.loading.value;
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
                                    createTaskController.loading.value;
                                return GestureDetector(
                                  onTap: () => {
                                    if (!createLoading)
                                      DialogueWindows
                                          .isChatSelectionOpened.value = false,
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
                        const SizedBox(height: 20),
                        Text(
                          'Создать чат',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Container(
                          padding:
                          const EdgeInsets.symmetric(horizontal: 13),
                          height: 29,
                          width: 244,
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.outline,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: TextFormField(
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
                              hintText: 'Название чата',
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
                        const SizedBox(height: 20),
                        _selectedEmployeesWidget(),
                        const Spacer(),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Obx(
                            () {
                              final createLoading =
                                  createTaskController.loading.value;
                              return GestureDetector(
                                onTap: () {
                                  if (!createLoading) {
                                    createTaskController.createTask();
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
                                        'Создать',
                                        style: TextStyle(
                                          fontSize: 14,
                                          height: 1.2,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .scrim,
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
