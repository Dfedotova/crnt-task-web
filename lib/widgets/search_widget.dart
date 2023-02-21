import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 270,
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
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 9),
            child: SvgPicture.asset('assets/search.svg'),
          ),
          const SizedBox(width: 8),
          Text( // TODO text form field
            'Поиск по задачам',
            style: TextStyle(color: Theme.of(context).colorScheme.shadow),
          ),
        ],
      ),
    );
  }
}
