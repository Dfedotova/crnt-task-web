import 'package:crnt_task/controllers/chat_controller.dart';
import 'package:crnt_task/controllers/dialogue_windows_controller.dart';
import 'package:crnt_task/data/chats.dart';
import 'package:crnt_task/widgets/messages/chat_widget.dart';
import 'package:crnt_task/widgets/messages/search_chats_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ChatsPage extends StatefulWidget {
  const ChatsPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> {
  final RxString _selectedChat = ''.obs;
  final chatController = Get.put(ChatController());

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      chatController.filteredChats
        ..clear()
        ..addAll(allChats);
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      chatController.loadAllChats();
    });
  }

  Widget _chat() {
    //todo
    if (_selectedChat.value == 'Админка') {
      return ChatWidget(messagesJson: 'messages2');
    } else {
      return ChatWidget(messagesJson: 'messages1');
    }
  }

  Widget _contactsWidget(String img, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          SvgPicture.asset('assets/$img'),
          const SizedBox(width: 12),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              text,
              style: const TextStyle(
                height: 1.2,
                fontSize: 16,
                fontWeight: FontWeight.w300,
                fontFamily: 'Montserrat',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _chatWidget(String name, String message, DateTime time) {
    return GestureDetector(
      onTap: () => {
        _selectedChat.value = name,
      },
      child: Row(
        children: [
          SizedBox(
            width: 45,
            height: 45,
            child: CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.tertiary,
              child: Align(
                child: Text(
                  name.substring(0, 1),
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    height: 1.2,
                    color: Theme.of(context).colorScheme.scrim,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 17),
          Container(
            padding: const EdgeInsets.only(top: 10, bottom: 15),
            width: 223,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Theme.of(context).colorScheme.tertiary,
                ),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 14,
                        height: 1.2,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      '${time.day}.${time.month}.${time.year}',
                      style: const TextStyle(
                        fontSize: 12,
                        height: 1.2,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  message,
                  style: const TextStyle(
                    fontSize: 14,
                    height: 1.2,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        final loading = chatController.loading.value;
        final filteredChats = chatController.filteredChats;
        /*if (loading) {
          return const Center(child: CircularProgressIndicator());
        } else {*/
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 62, top: 62),
                child: Container(
                  width: 306,
                  decoration: BoxDecoration(
                    border: Border(
                      right: BorderSide(
                        color: Theme
                            .of(context)
                            .colorScheme
                            .tertiary,
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 10, right: 10, top: 18),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Expanded(child: SearchChatsWidget()),
                            const SizedBox(width: 8),
                            Container(
                              height: 34,
                              width: 34,
                              decoration: BoxDecoration(
                                color: Theme
                                    .of(context)
                                    .colorScheme
                                    .secondary,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Align(
                                child: SvgPicture.asset(
                                  'assets/edit.svg',
                                  color: Theme
                                      .of(context)
                                      .colorScheme
                                      .scrim,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Expanded(
                          child: ListView(
                            children: filteredChats
                                .map(
                                  (c) =>
                                  _chatWidget(c.title, c.lastMessage, c.time),
                            )
                                .toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: _chat(),
              ),
              if (DialogueWindows.isUserPageOpened.value)
                Padding(
                  padding: const EdgeInsets.only(top: 62),
                  child: Container(
                    padding: const EdgeInsets.only(left: 23),
                    width: 350,
                    decoration: BoxDecoration(
                      border: Border(
                        left: BorderSide(
                          color: Theme
                              .of(context)
                              .colorScheme
                              .tertiary,
                        ),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 18),
                        SizedBox(
                          width: 90,
                          height: 90,
                          child: CircleAvatar(
                            backgroundColor: Theme
                                .of(context)
                                .colorScheme
                                .tertiary,
                            child: Align(
                              child: Text(
                                'ИО',
                                style: TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.w600,
                                  height: 1.2,
                                  color: Theme
                                      .of(context)
                                      .colorScheme
                                      .scrim,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        const Text(
                          'Иванов Олег',
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 30),
                        _contactsWidget('mail.svg', 'olegivanov@gmail.com'),
                        _contactsWidget('phone.svg', '+7(931)565-67-67'),
                        _contactsWidget('telegram.svg', '@olinvanov'),
                        const SizedBox(height: 62),
                        const Text(
                          'Навыки',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Chip(
                          labelPadding: const EdgeInsets.symmetric(
                              horizontal: 15),
                          label: Text(
                            'монтаж',
                            style: TextStyle(
                              color: Theme
                                  .of(context)
                                  .colorScheme
                                  .primary,
                              fontSize: 14,
                            ),
                          ),
                          backgroundColor: Theme
                              .of(context)
                              .colorScheme
                              .tertiary,
                        ),
                        const SizedBox(height: 10),
                        Chip(
                          labelPadding: const EdgeInsets.symmetric(
                              horizontal: 15),
                          label: Text(
                            'озвучка',
                            style: TextStyle(
                              color: Theme
                                  .of(context)
                                  .colorScheme
                                  .primary,
                              fontSize: 14,
                            ),
                          ),
                          backgroundColor: Theme
                              .of(context)
                              .colorScheme
                              .tertiary,
                        ),
                        const SizedBox(height: 10),
                        Chip(
                          labelPadding: const EdgeInsets.symmetric(
                              horizontal: 15),
                          label: Text(
                            'транскрипция',
                            style: TextStyle(
                              color: Theme
                                  .of(context)
                                  .colorScheme
                                  .primary,
                              fontSize: 14,
                            ),
                          ),
                          backgroundColor: Theme
                              .of(context)
                              .colorScheme
                              .tertiary,
                        ),
                        const SizedBox(height: 10),
                        Chip(
                          labelPadding: const EdgeInsets.symmetric(
                              horizontal: 15),
                          label: Text(
                            'упаковка уроков',
                            style: TextStyle(
                              color: Theme
                                  .of(context)
                                  .colorScheme
                                  .primary,
                              fontSize: 14,
                            ),
                          ),
                          backgroundColor: Theme
                              .of(context)
                              .colorScheme
                              .tertiary,
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          );
        }
      //}
    );
  }
}
