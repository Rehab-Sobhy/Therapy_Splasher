import 'package:flutter/material.dart';

import 'package:therapy_splasher/constants/clors.dart';

// ignore: must_be_immutable
class TextFormFieldCustom extends StatelessWidget {
  final BuildContext context;
  final String labelText;
  final void Function(String) onChanged;
  final TextEditingController controller;
  // final String? validatorErrorMessage;
  final String? Function(String?)? validator;

  bool? border = true;
  bool? enabled;
  bool? number = false;
  bool? password = false;
  String? value;
  double length;

  TextFormFieldCustom({
    super.key,
    required this.context,
    required this.labelText,
    required this.onChanged,
    required this.controller,
    // this.validatorErrorMessage,
    this.border,
    this.enabled,
    this.value,
    this.number,
    this.password,
    this.length = 0,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: value == null ? controller : null,
        initialValue: value,
        validator: (value) {
          if (value!.isEmpty) {}
          return null;
        },
        onChanged: (value) => onChanged(value),
        enabled: enabled,
        keyboardType:
            number == true ? TextInputType.number : TextInputType.text,
        decoration: InputDecoration(
          contentPadding: length == 0 ? null : EdgeInsets.only(bottom: length),
          hintText: labelText,
          floatingLabelAlignment: FloatingLabelAlignment.start,

          filled: true,
          labelStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: primary, overflow: TextOverflow.clip, fontSize: 10),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: const BorderSide(color: Colors.transparent, width: 0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: const BorderSide(color: Colors.transparent, width: 0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: const BorderSide(color: Colors.transparent, width: 0),
          ),
          // labelStyle: const TextStyle(color: Colors.black45),
          hintStyle:
              TextStyle(color: Colors.black.withOpacity(0.25), fontSize: 10),
          iconColor: Colors.grey,
        ));
  }
}
