import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class FilterWidget extends StatefulWidget {
  const FilterWidget({
    Key? key,
    required this.title,
    required this.filter,
    required this.items,
  }) : super(key: key);
  final String title;
  final String filter;
  final List<String> items;

  @override
  State<StatefulWidget> createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget>{
  late final RxString _selectedValue = widget.filter.obs;

  List<DropdownMenuItem<String>> _getItems() {
    final _menuItems = <DropdownMenuItem<String>>[];
    for (final item in widget.items) {
      _menuItems.addAll(
        [
          DropdownMenuItem<String>(
            value: item,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                item,
                style: const TextStyle(
                  fontSize: 12,
                  fontFamily: 'Montserrat',
                ),
              ),
            ),
          ),
        ],
      );
    }
    return _menuItems;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: const TextStyle(
              height: 0.7,
              fontSize: 12,
              fontWeight: FontWeight.w300,
            ),
          ),
          const SizedBox(height: 2),
          DropdownButtonHideUnderline(
            child: DropdownButton(
              isDense: true,
              borderRadius: BorderRadius.circular(20),
              items: _getItems(),
              onChanged: (value) {
                setState(() {
                  _selectedValue.value = value as String;
                });
              },
              focusColor: Colors.transparent,
              dropdownColor: Theme.of(context).colorScheme.secondaryContainer,
              hint: Obx(
                ()=> Text(
                  _selectedValue.value,
                  style: const TextStyle(
                    height: 1.2,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Montserrat',
                  ),
                ),
              ),
              icon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: SvgPicture.asset(
                  'assets/arrow_down.svg',
                  color: Theme.of(context).colorScheme.surfaceTint,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
