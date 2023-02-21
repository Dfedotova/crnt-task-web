import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  Widget _contactsWidget(String img, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          SvgPicture.asset('assets/$img'),
          const SizedBox(width: 12),
          Text(
            text,
            style: const TextStyle(
              height: 0.7,
              fontSize: 16,
              fontWeight: FontWeight.w300,
            ),
          )
        ],
      ),
    );
  }

  Widget _activeSkillWidget(String skill) {
    return Chip(
      labelPadding: const EdgeInsets.symmetric(horizontal: 15),
      label: Text(
        skill,
        style: TextStyle(
          color: Theme.of(context).colorScheme.primary,
          fontSize: 14,
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.tertiary,
      deleteIcon: SvgPicture.asset('assets/close.svg'),
    );
  }

  Widget _inactiveSkillWidget(String skill) {
    return Chip(
      labelPadding: const EdgeInsets.symmetric(horizontal: 15),
      label: Text(
        skill,
        style: TextStyle(
          color: Theme.of(context).colorScheme.primary,
          fontSize: 14,
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.shadow,
      avatar: SvgPicture.asset('assets/plus.svg'),
    );
  }

  Widget _themeWidget(String theme, Color color) {
    return Chip(
      labelPadding: const EdgeInsets.symmetric(horizontal: 15),
      label: Text(
        theme,
        style: TextStyle(
          color: Theme.of(context).colorScheme.primary,
          fontSize: 14,
        ),
      ),
      backgroundColor: color,
    );
  }

  Widget _skillsWidget() {
    return Wrap(
      spacing: 10,
      runSpacing: 8,
      children: [
        _activeSkillWidget('программирование'),
        _activeSkillWidget('транскрипция'),
        _activeSkillWidget('отсмотр материала'),
        _activeSkillWidget('упаковка уроков'),
        _activeSkillWidget('верстка презентаций'),
        _activeSkillWidget('тильда'),
        _inactiveSkillWidget('видеомонтаж'),
        _inactiveSkillWidget('figma'),
        _inactiveSkillWidget('adobe'),
        _inactiveSkillWidget('моушн-дизайн'),
        _inactiveSkillWidget('верстка сайтов'),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(top: 150, bottom: 50, left: 150, right: 300),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            width: 120,
            height: 120,
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/example_photo.jpeg'),
            ),
          ),
          const SizedBox(width: 46),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      'Дарья Федотова',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Container(
                      height: 25,
                      width: 25,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Align(
                        child: SvgPicture.asset(
                          'assets/edit.svg',
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                _contactsWidget('mail.svg', 'dariafedotova42@gmail.com'),
                _contactsWidget('phone.svg', '+7 (926) 845-64-11'),
                _contactsWidget('telegram.svg', '@lama_s_sushi'),
                const SizedBox(height: 55),
                const Text(
                  'Навыки',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 10),
                _skillsWidget(),
                const SizedBox(height: 55),
                const Text(
                  'Тема',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 10),
                Wrap(
                  spacing: 10,
                  children: [
                    _themeWidget(
                      'светлая',
                      Theme.of(context).colorScheme.tertiary,
                    ),
                    _themeWidget(
                      'тёмная',
                      Theme.of(context).colorScheme.shadow,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
