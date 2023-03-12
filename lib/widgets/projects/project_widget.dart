import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({Key? key, required this.projectName}) : super(key: key);
  final String projectName;

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
          const Text(
            'дизайн',
            style: TextStyle(
              fontSize: 10,
              height: 1.2,
              fontWeight: FontWeight.w400,
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
          const Text(
            '6/10',
            style: TextStyle(
              fontSize: 8,
              fontWeight: FontWeight.w300,
            ),
          ),
          const SizedBox(height: 14),
          Text(
            projectName,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              height: 1.2,
            ),
          ),
          const SizedBox(height: 10),
          const Flexible(
            child: Text(
              'Какое-то очень очень очень очень очень '
              'очень очень очень длинное описание',
              maxLines: 2,
              style: TextStyle(
                fontSize: 10,
                height: 1.2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          const Spacer(),
          Row(
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
        ],
      ),
    );
  }
}
