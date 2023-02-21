import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InactiveCircleButton extends StatelessWidget {
  const InactiveCircleButton({Key? key, required this.image}) : super(key: key);
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
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
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Align(
          child: SvgPicture.asset(
            'assets/$image',
            color: Theme.of(context).colorScheme.surface,
          ),
        ),
      ),
    );
  }
}
