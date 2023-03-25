import 'package:dropdown_button2/dropdown_button2.dart';
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
            child: DropdownButton2(
              isDense: true,
              dropdownStyleData: DropdownStyleData(
                offset: const Offset(-20, -5),
                maxHeight: 300,
                width: 200,
                padding: const EdgeInsets.symmetric(vertical: 3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Theme.of(context).colorScheme.secondaryContainer,
                ),
              ),
              items: _getItems(),
              onChanged: (value) {
                setState(() {
                  _selectedValue.value = value as String;
                });
              },
              customButton: Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Row(
                  children: [
                    Obx(
                          ()=> Text(
                        _selectedValue.value,
                        style: TextStyle(
                          height: 1.2,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Montserrat',
                          color: Theme.of(context).colorScheme.surfaceTint,
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    SvgPicture.asset(
                      'assets/arrow_down.svg',
                      color: Theme.of(context).colorScheme.surfaceTint,
                    ),
                  ],
                ),
              ),
              buttonStyleData: ButtonStyleData(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
