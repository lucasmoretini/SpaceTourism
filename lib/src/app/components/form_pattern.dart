import 'package:flutter/material.dart';

class FormPattern extends StatelessWidget {
  final String label;
  final Function()? onEditingComplete;
  final TextEditingController? userInputController;

  FormPattern({
    required this.label, 
    this.userInputController, 
    this.onEditingComplete});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onEditingComplete: onEditingComplete,
      controller: userInputController,
      decoration: InputDecoration(
        label: Text(
          label, 
          style: const TextStyle(  
          fontSize: 18,
          fontWeight: FontWeight.normal,
          ),
        )
      ),
    );
  }
}
