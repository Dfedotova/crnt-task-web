import 'package:crnt_task/data/skills.dart';
import 'package:crnt_task/models/skill.dart';
import 'package:crnt_task/themes/material_theme.dart';
import 'package:crnt_task/themes/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late List<Skill> skills;
  static final RxBool _lightModeSelected =
      ThemeProvider().currentTheme == themeLight ? true.obs : false.obs;

  @override
  void initState() {
    super.initState();
    skills = List.of(allSkills);
  }

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
      children: skills
          .map(
            (s) => s.isPicked
                ? Chip(
                    labelPadding: const EdgeInsets.symmetric(horizontal: 15),
                    label: Text(
                      s.skill,
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
                      s.updatePickState = false;
                    }),
                    deleteButtonTooltipMessage: '??????????????',
                  )
                : Chip(
                    labelPadding: const EdgeInsets.symmetric(horizontal: 15),
                    label: Text(
                      s.skill,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 14,
                      ),
                    ),
                    backgroundColor: Theme.of(context).colorScheme.shadow,
                    deleteIcon: SvgPicture.asset('assets/plus.svg'),
                    onDeleted: () => setState(() {
                      s.updatePickState = true;
                    }),
                    deleteButtonTooltipMessage: '????????????????',
                  ),
          )
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
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
                      '?????????? ????????????????',
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
                  '????????????',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 10),
                _skillsWidget(),
                const SizedBox(height: 55),
                const Text(
                  '????????',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 10),
                Obx(
                  () => Wrap(
                    spacing: 10,
                    children: [
                      GestureDetector(
                        child: _themeWidget(
                          '??????????????',
                          _lightModeSelected.value
                              ? Theme.of(context).colorScheme.tertiary
                              : Theme.of(context).colorScheme.shadow,
                        ),
                        onTap: () {
                          if (themeProvider.brightness ==
                              CustomBrightness.dark) {
                            themeProvider.toggle(CustomBrightness.light);
                          }
                          _lightModeSelected.value = true;
                        },
                      ),
                      GestureDetector(
                        child: _themeWidget(
                          '????????????',
                          !_lightModeSelected.value
                              ? Theme.of(context).colorScheme.tertiary
                              : Theme.of(context).colorScheme.shadow,
                        ),
                        onTap: () {
                          if (themeProvider.brightness ==
                              CustomBrightness.light) {
                            themeProvider.toggle(CustomBrightness.dark);
                          }
                          _lightModeSelected.value = false;
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
