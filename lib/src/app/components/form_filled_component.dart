import 'package:flutter/material.dart';

class FormFilledPattern extends StatelessWidget {
  final String label;
  final Function()? onEditingComplete;
  final TextEditingController? userInputController;
  final FocusNode? focusNode;

  FormFilledPattern({
    required this.label,
    this.userInputController,
    this.onEditingComplete,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onEditingComplete: onEditingComplete,
      controller: userInputController,
      focusNode: focusNode,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey.shade300,
        label: Text(
          label,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
