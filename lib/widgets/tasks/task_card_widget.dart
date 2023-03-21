import 'dart:ui';

import 'package:crnt_task/controllers/dialogue_windows_controller.dart';
import 'package:crnt_task/utils/get_employees.dart';
import 'package:crnt_task/widgets/skills/active_skill_widget.dart';
import 'package:crnt_task/widgets/tasks/card_filter_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TaskCard extends StatefulWidget {
  const TaskCard({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  DateTime date = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );
  DateTime time = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
    DateTime.now().hour,
    DateTime.now().minute,
  );

  void _showDialog(Widget child, BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (context) => Align(
        child: Container(
          height: 216,
          width: 400,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: CupertinoColors.systemBackground.resolveFrom(context),
          ),
          child: SafeArea(
            top: false,
            child: child,
          ),
        ),
      ),
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
              height: 560,
              width: 880,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Theme.of(context).colorScheme.primary.withOpacity(0.25),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Spacer(),
                      GestureDetector(
                        onTap: () => {
                          DialogueWindows.isCardOpened.value = false,
                        },
                        child: SvgPicture.asset(
                          'assets/close.svg',
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'ID-1: Sample task',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: 40),
                  Row(
                    children: [
                      SizedBox(
                        width: 110,
                        child: Text(
                          'Тип задачи: ',
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
                        width: 144,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.outline,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const CardFilterWidget(
                          filter: 'Тип задачи',
                          items: ['Сабтаск', 'Таск', 'Стори', 'Эпик'],
                          img: 'arrow_down.svg',
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
                          'Статус:',
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
                        width: 144,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.outline,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const CardFilterWidget(
                          filter: 'Статус',
                          items: [
                            'Бэклог',
                            'В процессе',
                            'Сделано',
                            'На проверке',
                            'На согласовании',
                            'Согласовано',
                            'Архив',
                          ],
                          img: 'arrow_down.svg',
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
                          'Дедлайн:',
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
                        padding: const EdgeInsets.symmetric(horizontal: 13),
                        height: 29,
                        width: 144,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.outline,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            GestureDetector(
                              child: Text(
                                '${date.day}.${date.month}.${date.year}',
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontSize: 14,
                                  height: 1.2,
                                ),
                              ),
                              onTap: () => _showDialog(
                                CupertinoDatePicker(
                                  mode: CupertinoDatePickerMode.date,
                                  initialDateTime: DateTime(
                                    DateTime.now().year,
                                    DateTime.now().month,
                                    DateTime.now().day,
                                  ),
                                  onDateTimeChanged: (value) {
                                    setState(() => date = value);
                                  },
                                ),
                                context,
                              ),
                            ),
                            const Spacer(),
                            SvgPicture.asset(
                              'assets/calendar.svg',
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 20),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 13),
                        height: 29,
                        width: 144,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.outline,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            GestureDetector(
                              child: Text(
                                '${time.hour}:${time.minute}',
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontSize: 14,
                                  height: 1.2,
                                ),
                              ),
                              onTap: () => _showDialog(
                                CupertinoDatePicker(
                                  mode: CupertinoDatePickerMode.time,
                                  use24hFormat: true,
                                  initialDateTime: time,
                                  onDateTimeChanged: (value) {
                                    setState(() => time = value);
                                  },
                                ),
                                context,
                              ),
                            ),
                            const Spacer(),
                            SvgPicture.asset(
                              'assets/clock.svg',
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ],
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
                            hintText: 'Описание',
                            hintStyle: TextStyle(
                              height: 1.2,
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                              fontFamily: 'Montserrat',
                              color: Theme.of(context).colorScheme.surface,
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
                          'Исполнитель:',
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
                          filter: 'Исполнитель',
                          items:
                              getEmployees().sublist(1, getEmployees().length),
                          img: 'person.svg',
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
                          'Приоритет:',
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
                        width: 144,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.outline,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const CardFilterWidget(
                          filter: 'Приоритет',
                          items: [
                            'Высокий',
                            'Средний',
                            'Ниже среднего',
                            'Низкий',
                          ],
                          img: 'arrow_down.svg',
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
                          'Теги:',
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 14,
                            height: 1.2,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                      const SizedBox(width: 30),
                      const ActiveSkill(skill: 'tilda'),
                      const SizedBox(width: 20),
                      const ActiveSkill(skill: 'figma'),
                    ],
                  ),
                  const Spacer(),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      height: 35,
                      width: 178,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Align(
                        child: Text(
                          'Сохранить',
                          style: TextStyle(
                            fontSize: 14,
                            height: 1.2,
                            color: Theme.of(context).colorScheme.scrim,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
