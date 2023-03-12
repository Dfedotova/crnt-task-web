import 'package:crnt_task/controllers/dialogue_windows_controller.dart';
import 'package:crnt_task/widgets/projects/project_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget _divider() {
    return Container(
      height: 0.5,
      width: 224,
      color: Theme.of(context).colorScheme.scrim,
    );
  }

  Widget _category(String name) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        name,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          height: 1.5,
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
              _divider(),
              _category('дизайн'),
              _divider(),
              _category('программирование'),
              _divider(),
              _category('презентации'),
              _divider(),
              _category('таймкоды'),
              _divider(),
              _category('расшифровки'),
              _divider(),
              _category('монтаж'),
              _divider(),
              _category('дизайн'),
              _divider(),
              _category('дизайн'),
              _divider(),
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
                  children: [
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
