import 'package:flutter/material.dart';

class ActiveSkill extends StatelessWidget {
  const ActiveSkill({Key? key, required this.skill}) : super(key: key);

  final String skill;

  @override
  Widget build(BuildContext context) {
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
    );
  }
}
