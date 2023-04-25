import 'package:crnt_task/widgets/messages/search_chats_widget.dart';
import 'package:crnt_task/widgets/messages/write_message_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../data/chat_messages.dart';
import '../models/chat_message.dart';

class ChatsPage extends StatefulWidget {
  const ChatsPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> {
  Widget _chatWidget(String name, String message, DateTime time) {
    return Row(
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
    );
  }

  @override
  Widget build(BuildContext context) {
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
                  color: Theme.of(context).colorScheme.tertiary,
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 18),
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
                          color: Theme.of(context).colorScheme.secondary,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Align(
                          child: SvgPicture.asset(
                            'assets/edit.svg',
                            color: Theme.of(context).colorScheme.scrim,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Expanded(
                    child: ListView(
                      children: [
                        _chatWidget(
                          'Федотова Дарья',
                          'Сообщение',
                          DateTime.now(),
                        ),
                        _chatWidget(
                          'Федотова Дарья',
                          'Сообщение',
                          DateTime.now(),
                        ),
                        _chatWidget(
                          'Федотова Дарья',
                          'Сообщение',
                          DateTime.now(),
                        ),
                        _chatWidget(
                          'Федотова Дарья',
                          'Сообщение',
                          DateTime.now(),
                        ),
                        _chatWidget(
                          'Федотова Дарья',
                          'Сообщение',
                          DateTime.now(),
                        ),
                        _chatWidget(
                          'Федотова Дарья',
                          'Сообщение',
                          DateTime.now(),
                        ),
                        _chatWidget(
                          'Федотова Дарья',
                          'Сообщение',
                          DateTime.now(),
                        ),
                        _chatWidget(
                          'Федотова Дарья',
                          'Сообщение',
                          DateTime.now(),
                        ),
                        _chatWidget(
                          'Федотова Дарья',
                          'Сообщение',
                          DateTime.now(),
                        ),
                        _chatWidget(
                          'Федотова Дарья',
                          'Сообщение',
                          DateTime.now(),
                        ),
                        _chatWidget(
                          'Федотова Дарья',
                          'Сообщение',
                          DateTime.now(),
                        ),
                        _chatWidget(
                          'Федотова Дарья',
                          'Сообщение',
                          DateTime.now(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 17, right: 30, bottom: 27),
            child: Stack(
              children: [
                ListView.builder(
                  itemCount: messages.length,
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(top: 70, bottom: 40),
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.only(top: 5, bottom: 5),
                      child: Align(
                        alignment:
                            messages[index].messageType == MessageType.receiver
                                ? Alignment.topLeft
                                : Alignment.topRight,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: messages[index].messageType ==
                                    MessageType.receiver
                                ? Theme.of(context)
                                    .colorScheme
                                    .secondaryContainer
                                : Theme.of(context).colorScheme.tertiary,
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          child: Text(
                            messages[index].messageContent,
                            style: const TextStyle(fontSize: 14, height: 1.2),
                          ),
                        ),
                      ),
                    );
                  },
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/attach_file.svg',
                        width: 30,
                        height: 30,
                      ),
                      const SizedBox(width: 16),
                      const Expanded(child: WriteMessageWidget()),
                      const SizedBox(width: 16),
                      SvgPicture.asset(
                        'assets/send_message.svg',
                        width: 30,
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
