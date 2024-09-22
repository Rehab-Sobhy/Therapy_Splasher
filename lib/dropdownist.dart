import 'package:flutter/material.dart';

class CustomDropDownList extends StatelessWidget {
  final List<String> list;
  final String? selectedValue;
  final void Function(String?) onChanged;
  final String hint;
  const CustomDropDownList(
      {super.key,
      required this.list,
      this.selectedValue,
      required this.onChanged,
      required this.hint});

  @override
  Widget build(BuildContext context) {
    String? _selectedType = selectedValue;
    return DropdownButton(
      underline: SizedBox.shrink(),
      dropdownColor: Colors.white,
      value: _selectedType,
      icon: const Icon(Icons.keyboard_arrow_down_outlined),
      isExpanded: true,
      hint: Text(hint),
      style: TextStyle(fontSize: 16, color: Colors.black),
      borderRadius: BorderRadius.circular(10),
      onChanged: onChanged,
      items: [
        ...list.map((String location) {
          return DropdownMenuItem<String>(
            value: location,
            child: Text(location),
          );
        }),
      ],
    );
  }
}
