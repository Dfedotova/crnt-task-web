import 'package:crnt_task/widgets/skills/active_skill_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TaskMenu extends StatelessWidget {
  const TaskMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 100),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        height: 38,
        width: 1180,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            SvgPicture.asset('assets/priority_2.svg'),
            const SizedBox(width: 15),
            const Text(
              'ID-1: Sample task',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                height: 1.2,
              ),
            ),
            const SizedBox(width: 20),
            const Text(
              'Тип: сабтаск',
              style: TextStyle(
                fontSize: 12,
                height: 1.2,
              ),
            ),
            const SizedBox(width: 20),
            Row(
              children: const [
                ActiveSkill(skill: 'тильда'),
                SizedBox(width: 10),
                ActiveSkill(skill: 'презентация'),
              ],
            ),
            const Spacer(),
            SvgPicture.asset('assets/clock.svg'),
            const SizedBox(width: 10),
            Text(
              '12.12.2012 18:00',
              style: TextStyle(
                fontSize: 12,
                height: 1.2,
                color: Theme.of(context).colorScheme.surface,
              ),
            ),
            const SizedBox(width: 20),
            const SizedBox(
              width: 24,
              height: 24,
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/example_photo.jpeg'),
              ),
            ),
            const SizedBox(width: 27),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              height: 22,
              width: 200,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.tertiary,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Text(
                    'Сделано',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 14,
                      height: 1.2,
                    ),
                  ),
                  const Spacer(),
                  SvgPicture.asset(
                    'assets/arrow_down.svg',
                    color: Theme.of(context).colorScheme.primary,
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
