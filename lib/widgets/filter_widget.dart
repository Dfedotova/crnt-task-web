import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FilterWidget extends StatelessWidget {
  const FilterWidget({Key? key, required this.title, required this.filter})
      : super(key: key);
  final String title;
  final String filter;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              height: 0.7,
              fontSize: 12,
              fontWeight: FontWeight.w300,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Text(
                filter,
                style: const TextStyle(
                  height: 0.7,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(width: 15),
              SvgPicture.asset('assets/arrow_down.svg'),
            ],
          )
        ],
      ),
    );
  }
}
