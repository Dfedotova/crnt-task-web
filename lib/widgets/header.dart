import 'package:crnt_task/widgets/circle_button_active.dart';
import 'package:crnt_task/widgets/circle_button_inactive.dart';
import 'package:crnt_task/widgets/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 62,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        border: Border.all(
          color: Theme.of(context).colorScheme.tertiary,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            const ActiveCircleButton(image: 'menu.svg'),
            const SizedBox(width: 20),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: SvgPicture.asset('assets/logo.svg'),
            ),
            const Spacer(),
            const SearchWidget(),
            const SizedBox(width: 20),
            const InactiveCircleButton(image: 'notification.svg'),
          ],
        ),
      ),
    );
  }
}
