import 'dart:ui';

import 'package:crnt_task/controllers/dialogue_windows_controller.dart';
import 'package:crnt_task/data/current_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class NotificationsWidget extends StatelessWidget {
  NotificationsWidget({Key? key}) : super(key: key);

  final RxBool _deleteEntered = false.obs;

  Widget _notificationMessage(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Container(
        padding: const EdgeInsets.all(20),
        height: 100,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).colorScheme.primary,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 27,
              height: 27,
              child: CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.tertiary,
                child: Align(
                  child: Text(
                    currentUser.fullName.substring(0, 1),
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      height: 1.2,
                      color: Theme.of(context).colorScheme.scrim,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 11),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: const TextSpan(
                      text: 'Федотова Дарья ',
                      style: TextStyle(
                        fontSize: 12,
                        height: 1.2,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Montserrat',
                      ),
                      children: [
                        TextSpan(
                          text: 'упомянул(-а) вас в воркспейсе',
                          style: TextStyle(
                            fontSize: 12,
                            height: 1.2,
                            fontWeight: FontWeight.w300,
                            fontFamily: 'Montserrat',
                          ),
                        )
                      ],
                    ),
                  ),
                  const Spacer(),
                  Text(
                    '2 минуты назад',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                      color: Theme.of(context).colorScheme.scrim,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: const EdgeInsets.only(top: 65, right: 20),
        child: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              height: 620,
              width: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Theme.of(context).colorScheme.primary.withOpacity(0.25),
              ),
              child: Obx(
                ()=> Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Spacer(),
                        GestureDetector(
                          onTap: () => {
                            DialogueWindows.isNotificationsOpened.value = false,
                          },
                          child: SvgPicture.asset(
                            'assets/close.svg',
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      _deleteEntered.value
                          ? 'Уведомления (0)'
                          : 'Уведомления (3)',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    const SizedBox(height: 20),
                    if(!_deleteEntered.value) ...[
                      _notificationMessage(context),
                      _notificationMessage(context),
                      _notificationMessage(context),
                    ],
                    const Spacer(),
                    GestureDetector(
                      onTap: () => _deleteEntered.value = true,
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: SizedBox(
                          width: 30,
                          child: SvgPicture.asset(
                            'assets/trash.svg',
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
