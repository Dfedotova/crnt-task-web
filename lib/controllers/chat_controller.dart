import 'dart:math';

import 'package:crnt_task/data/chats.dart';
import 'package:crnt_task/models/chat.dart';
import 'package:crnt_task/models/task.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  final loading = false.obs;

  final nameFilter = ''.obs;

  final filteredChats = <Chat>[].obs;

  final Rx<String?> selectedProjectId = ''.obs;

  void onNameSearchUpdates(String newValue) {
    if (newValue == '') {
      nameFilter.value = '';
    } else {
      nameFilter.value = newValue;
    }
    applyFilters();
  }

  Future<void> applyFilters() async {
    loading.value = true;

    final filteredByName = (nameFilter.value.isEmpty
            ? allChats
            : allChats.where(
                (chat) => chat.title.toLowerCase().contains(
                      nameFilter.value.toLowerCase(),
                    ),
              ))
        .toSet();

    filteredChats
      ..clear()
      ..addAll(
        filteredByName,
      );

    await Future.delayed(Duration(seconds: Random().nextInt(2)), () {});
    loading.value = false;
  }

  Future<void> loadAllChats() async {
    try {
      loading.value = true;
      await Future.delayed(Duration(seconds: 1 + Random().nextInt(4)), () {});
    } finally {
      loading.value = false;
    }
  }
}
