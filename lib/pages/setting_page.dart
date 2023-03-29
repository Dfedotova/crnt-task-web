import 'package:crnt_task/data/current_user.dart';
import 'package:crnt_task/data/skills.dart';
import 'package:crnt_task/models/skill.dart';
import 'package:crnt_task/models/user.dart';
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
  final RxBool _isEditable = false.obs;
  late List<Skill> _skills;
  static final RxBool _lightModeSelected = ThemeProvider().currentTheme == themeLight ? true.obs : false.obs;
  static late User _user;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final RegExp _emailRegExp = RegExp(r'\S+@\S+\.\S+');
  final TextEditingController _phoneController = TextEditingController();
  final RegExp _phoneRegExp = RegExp(r'\+\d \(\d{3}\) \d{3}-\d{2}-\d{2}');
  final TextEditingController _telegramController = TextEditingController();
  final RegExp _telegramRegExp = RegExp(r'@\S+');

  @override
  void initState() {
    super.initState();
    _skills = List.of(allSkills);
    _user = currentUser;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _telegramController.dispose();
    super.dispose();
  }

  Widget _contactsWidget(
    String img,
    String text,
    TextFieldToEdit toEdit,
    TextEditingController controller,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Obx(
        () => Row(
          children: [
            SvgPicture.asset('assets/$img'),
            const SizedBox(width: 12),
            if (_isEditable.value)
              Container(
                padding: const EdgeInsets.only(left: 10),
                width: 300,
                height: 24,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(32),
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: TextFormField(
                    controller: controller,
                    style: const TextStyle(
                      height: 1.2,
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                      fontFamily: 'Montserrat',
                    ),
                    cursorColor: Theme.of(context).colorScheme.scrim,
                    cursorHeight: 20,
                    decoration: InputDecoration.collapsed(
                      hintText: text,
                    ),
                    onChanged: (value) => {
                      setState(() {
                        if (toEdit == TextFieldToEdit.email && _emailRegExp.hasMatch(value)) {
                          _user.setEmail = value;
                        } else if (toEdit == TextFieldToEdit.phone && _phoneRegExp.hasMatch(value)) {
                          _user.setPhone = value;
                        } else if (_telegramRegExp.hasMatch(value)) {
                          _user.setTelegram = value;
                        }
                      })
                    },
                  ),
                ),
              )
            else
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
      children: _skills
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
                    deleteButtonTooltipMessage: 'Удалить',
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
                    deleteButtonTooltipMessage: 'Добавить',
                  ),
          )
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Padding(
      padding: const EdgeInsets.only(top: 150, bottom: 50, left: 150, right: 300),
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
                    Text(
                      _user.fullName,
                      style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Obx(
                      () => GestureDetector(
                        onTap: () => _isEditable.value = !_isEditable.value,
                        child: Container(
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.secondary,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Align(
                            child: SvgPicture.asset(
                              _isEditable.value ? 'assets/close.svg' : 'assets/edit.svg',
                              color: Theme.of(context).colorScheme.scrim,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                _contactsWidget(
                  'mail.svg',
                  _user.email,
                  TextFieldToEdit.email,
                  _emailController,
                ),
                _contactsWidget(
                  'phone.svg',
                  _user.phone,
                  TextFieldToEdit.phone,
                  _phoneController,
                ),
                _contactsWidget(
                  'telegram.svg',
                  _user.telegram,
                  TextFieldToEdit.telegram,
                  _telegramController,
                ),
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
                Obx(
                  () => Wrap(
                    spacing: 10,
                    children: [
                      GestureDetector(
                        child: _themeWidget(
                          'светлая',
                          _lightModeSelected.value
                              ? Theme.of(context).colorScheme.tertiary
                              : Theme.of(context).colorScheme.shadow,
                        ),
                        onTap: () {
                          if (themeProvider.brightness == CustomBrightness.dark) {
                            themeProvider.toggle(CustomBrightness.light);
                          }
                          _lightModeSelected.value = true;
                        },
                      ),
                      GestureDetector(
                        child: _themeWidget(
                          'тёмная',
                          !_lightModeSelected.value
                              ? Theme.of(context).colorScheme.tertiary
                              : Theme.of(context).colorScheme.shadow,
                        ),
                        onTap: () {
                          if (themeProvider.brightness == CustomBrightness.light) {
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

enum TextFieldToEdit {
  fullName,
  email,
  phone,
  telegram,
}
