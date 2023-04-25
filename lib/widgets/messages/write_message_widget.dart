import 'package:crnt_task/controllers/tasks_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class WriteMessageWidget extends StatefulWidget {
  const WriteMessageWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _WriteMessageWidgetState();
}

class _WriteMessageWidgetState extends State<WriteMessageWidget> {
  final TextEditingController controller = TextEditingController();
  //final tasksController = Get.put(TasksController());

  @override
  void initState() {
    super.initState();
    /*SchedulerBinding.instance.addPostFrameCallback((_) {
      tasksController.filteredTasks
        ..clear()
        ..addAll(tasksController.tasks);
    });*/
  }

  /*@override
  void didChangeDependencies() {
    super.didChangeDependencies();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      tasksController.loadAllTasks();
    });
  }*/

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondaryContainer,
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            spreadRadius: 3,
            blurRadius: 5,
          ),
        ],
      ),
      child: Row(
        children: [
          const SizedBox(width: 12),
          SizedBox(
            width: 180,
            child: TextFormField(
              controller: controller,
              cursorColor: Theme.of(context).colorScheme.scrim,
              decoration: InputDecoration.collapsed(
                hintText: 'Напишите сообщение...',
                hintStyle: TextStyle(
                  color: Theme.of(context).colorScheme.scrim,
                ),
              ),
              style: TextStyle(
                color: Theme.of(context).colorScheme.scrim,
                height: 1.2,
                fontSize: 12,
                fontFamily: 'Montserrat',
              ),
              //onChanged: tasksController.onNameSearchUpdates,
            ),
          ),
        ],
      ),
    );
  }
}
