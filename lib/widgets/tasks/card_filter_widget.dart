import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardFilterWidget extends StatefulWidget {
  const CardFilterWidget({
    Key? key,
    required this.filter,
    required this.items,
    required this.img,
    required this.onValueSelected,
  }) : super(key: key);
  final String filter;
  final List<String> items;
  final String img;
  final void Function(String) onValueSelected;

  @override
  State<StatefulWidget> createState() => _CardFilterWidgetState();
}

class _CardFilterWidgetState extends State<CardFilterWidget> {
  late String _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.filter;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: DropdownButtonHideUnderline(
        child: DropdownButton2<String>(
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
          items: widget.items
              .map(
                (item) => DropdownMenuItem<String>(
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
              )
              .toList(),
          onChanged: (value) {
            setState(() {
              widget.onValueSelected(value!);
              _selectedValue = value!;
            });
          },
          customButton: Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Row(
              children: [
                Text(
                  _selectedValue,
                  style: TextStyle(
                    height: 0.7,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Montserrat',
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                const Spacer(),
                SvgPicture.asset(
                  'assets/${widget.img}',
                  color: Theme.of(context).colorScheme.primary,
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
    );
  }
}
