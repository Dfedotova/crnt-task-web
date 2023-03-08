import 'package:crnt_task/widgets/tasks/task_line_widget.dart';
import 'package:flutter/material.dart';

class MenuBoard extends StatelessWidget {
  const MenuBoard({Key? key, required this.context}) : super(key: key);
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(
              20,
              (index) => const Padding(
                padding: EdgeInsets.symmetric(vertical: 7),
                child: TaskLine(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
