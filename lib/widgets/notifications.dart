import 'package:crnt_task/controllers/notification_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotificationsWidget extends StatelessWidget {
  const NotificationsWidget({Key? key}) : super(key: key);

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
            const SizedBox(
              width: 27,
              height: 27,
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/example_photo.jpeg'),
              ),
            ),
            const SizedBox(width: 11),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: const TextSpan(
                      text: 'Дарья Федотова ',
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
                  const Text(
                    '2 минуты назад',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
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
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          height: 620,
          width: 400,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Theme.of(context).colorScheme.secondaryContainer,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Spacer(),
                  GestureDetector(
                    onTap: () => {
                      DialogueWindows.isNotificationsOpened.value = false,
                    },
                    child: SvgPicture.asset('assets/close.svg'),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Text(
                'Уведомления (5)',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 20),
              _notificationMessage(context),
              _notificationMessage(context),
              _notificationMessage(context),
              const Spacer(),
              Align(
                alignment: Alignment.bottomRight,
                child: SizedBox(
                  width: 30,
                  child: SvgPicture.asset('assets/trash.svg'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
