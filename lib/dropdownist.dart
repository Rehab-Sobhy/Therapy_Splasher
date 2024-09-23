import 'package:flutter/material.dart';
import 'package:therapy_splasher/constants/clors.dart';

class CustomDropDownList extends StatelessWidget {
  final List<String> list;
  final String? selectedValue;
  final void Function(String?) onChanged;
  final String hint;

  const CustomDropDownList({
    super.key,
    required this.list,
    this.selectedValue,
    required this.onChanged,
    required this.hint,
  });

  @override
  Widget build(BuildContext context) {
    String? _selectedType = selectedValue;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: Colors.grey[200], // Background color for the dropdown
        borderRadius: BorderRadius.circular(10),
        // Optional border
      ),
      child: DropdownButton<String>(
        underline: SizedBox.shrink(),
        dropdownColor: Colors.white,
        value: _selectedType,
        icon: const Icon(Icons.keyboard_arrow_down_outlined),
        isExpanded: true,
        hint: Text(hint),
        style: const TextStyle(fontSize: 14, color: Colors.black),
        borderRadius: BorderRadius.circular(10),
        onChanged: onChanged,
        items: [
          ...list.map((String location) {
            return DropdownMenuItem<String>(
              value: location,
              child: Text(location),
            );
          }).toList(),
        ],
      ),
    );
  }
}
