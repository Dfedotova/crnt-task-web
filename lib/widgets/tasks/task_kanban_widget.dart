import 'package:crnt_task/models/task.dart';
import 'package:crnt_task/widgets/skills/active_skill_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class TaskKanban extends StatelessWidget {
  const TaskKanban({Key? key, required this.task}) : super(key: key);
  final Task task;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 15),
      height: 160,
      width: 243,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'ID-1: Sample task',
                // task.name,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  height: 1.2,
                  color: Theme.of(context).colorScheme.scrim,
                ),
              ),
              const Spacer(),
            ],
          ),
          const SizedBox(height: 15),
          Text(
            'Тип: ${task.type}',
            style: TextStyle(
              fontSize: 12,
              color: Theme.of(context).colorScheme.scrim,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              SvgPicture.asset('assets/clock.svg'),
              const SizedBox(width: 10),
              Text(
                // '12.12.2012 18:00',
                '${DateFormat('dd.MM.yyyy').format(task.deadlineDate)} '
                '${DateFormat('HH-mm').format(task.deadlineTime)}',
                style: TextStyle(
                  fontSize: 12,
                  height: 1.2,
                  color: Theme.of(context).colorScheme.surface,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: task.tags.map((e) => Expanded(child: ActiveSkill(skill: e))).toList(),
            // children: const [
            //   Expanded(child: ActiveSkill(skill: 'тильда')),
            //   Expanded(child: ActiveSkill(skill: 'презентация')),
            // ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              SvgPicture.asset('assets/priority_2.svg'),
              // SvgPicture.asset('assets/priority_${task.priority+1}.svg'),
              const Spacer(),
              const SizedBox(
                width: 24,
                height: 24,
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/example_photo.jpeg'),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
