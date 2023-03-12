import 'package:crnt_task/controllers/dialogue_windows_controller.dart';
import 'package:crnt_task/widgets/projects/project_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final RxString _currentDirection = 'все'.obs;
  final RxString _pickedDirection = 'все'.obs;

  void _pickDirection(String name) {
    setState(() {
      _pickedDirection.value = name;
    });
  }

  void _updateDirection(String name) {
    setState(() {
      _currentDirection.value = name;
    });
  }

  Widget _category(String name) {
    return MouseRegion(
      onHover: (_) => _updateDirection(name),
      onEnter: (_) => _pickDirection(name),
      child: Container(
        width: 224,
        height: 35,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Theme.of(context).colorScheme.scrim,
              width: 0.5,
            ),
          ),
        ),
        child: _currentDirection.value == name
            ? Row(
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      height: 1.5,
                    ),
                  ),
                  const Spacer(),
                  SvgPicture.asset('assets/arrow_right_black.svg'),
                ],
              )
            : Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  name,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    height: 1.5,
                  ),
                ),
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _category('все'),
              _category('дизайн'),
              _category('моушн-дизайн'),
              _category('монтаж'),
              _category('фото и видео съемка'),
              _category('озвучка'),
              _category('субтитры'),
              _category('локализация'),
              _category('расшифровка'),
              _category('таймкоды'),
              _category('тесты'),
              _category('глоссарии'),
              _category('конспекты'),
              _category('презентации'),
              _category('верстка сайтов'),
            ],
          ),
        ),
        const SizedBox(width: 60),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 100),
            child: ListView(
              children: [
                Row(
                  children: [
                    const Spacer(),
                    GestureDetector(
                      onTap: () =>
                          DialogueWindows.isProjectCardOpened.value = true,
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
                          children: [
                            SvgPicture.asset('assets/plus.svg'),
                            const Spacer(),
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
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Wrap(
                  spacing: 22,
                  runSpacing: 18,
                  children: const [
                    ProjectCard(projectName: 'Sowin'),
                    ProjectCard(projectName: 'ТопСтанок'),
                    ProjectCard(projectName: 'Яндекс'),
                    ProjectCard(projectName: 'Skillbox'),
                    ProjectCard(projectName: 'MosBuild'),
                    ProjectCard(projectName: 'Sowin'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
