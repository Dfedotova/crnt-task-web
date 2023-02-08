import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ActiveCircleButton extends StatelessWidget {

  const ActiveCircleButton({Key? key, required this.image}) : super(key: key);
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 45,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(40),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            spreadRadius: 3,
            blurRadius: 5,
          ),
        ],
      ),
      child: Align(
        child: SvgPicture.asset('assets/$image'),
      ),
    );
  }
}
