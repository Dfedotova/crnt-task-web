import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({
    Key? key,
    required this.name,
    required this.direction,
    required this.description,
  }) : super(key: key);
  final String name;
  final String direction;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 16),
      height: 190,
      width: 230,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            direction,
            style: TextStyle(
              fontSize: 10,
              height: 1.2,
              fontWeight: FontWeight.w400,
              color: Theme.of(context).colorScheme.scrim,
            ),
          ),
          const SizedBox(height: 5),
          Stack(
            children: [
              Container(
                height: 5,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.outline,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Container(
                height: 5,
                width: 130,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.tertiary,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            '6/10',
            style: TextStyle(
              fontSize: 8,
              fontWeight: FontWeight.w300,
              color: Theme.of(context).colorScheme.scrim,
            ),
          ),
          const SizedBox(height: 14),
          Text(
            name,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              height: 1.2,
              color: Theme.of(context).colorScheme.scrim,
            ),
          ),
          const SizedBox(height: 10),
          Flexible(
            child: Text(
              description,
              maxLines: 2,
              style: TextStyle(
                fontSize: 10,
                height: 1.2,
                overflow: TextOverflow.ellipsis,
                color: Theme.of(context).colorScheme.scrim,
              ),
            ),
          ),
          const Spacer(),
          Align(
            alignment: Alignment.bottomRight,
            child: Row(
              children: [
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  width: 108,
                  height: 18,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.tertiary,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      Text(
                        'К задачам',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w300,
                          color: Theme.of(context).colorScheme.primary,
                          height: 1.2,
                        ),
                      ),
                      const Spacer(),
                      SvgPicture.asset('assets/arrow_right.svg'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
