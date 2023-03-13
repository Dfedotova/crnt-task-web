import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
      /*avatar: Container(
        padding: const EdgeInsets.all(2),
        height: 18,
          width: 18,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Theme.of(context).colorScheme.shadow,
          ),
          child: SvgPicture.asset('assets/close.svg', color: Theme.of(context).colorScheme.primary,),
      ),*/
    );
  }
}
