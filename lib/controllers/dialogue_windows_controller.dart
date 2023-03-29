import 'package:crnt_task/data/tasks.dart';
import 'package:crnt_task/models/task.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class DialogueWindows {
  static RxBool isNotificationsOpened = false.obs;

  static RxBool isCardOpened = false.obs;
  static Task taskOpened = defaultTask;

  static RxBool isProjectCardOpened = false.obs;

  static RxBool isMenuOpened = false.obs;
}
