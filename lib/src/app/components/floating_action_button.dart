import 'package:flutter/material.dart';

class FloatingActionButtonComponent extends StatelessWidget {
  Function() onPressed;

  FloatingActionButtonComponent({Key? key, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.purple,
      foregroundColor: Colors.white,
      onPressed: onPressed,
      child: const Icon(Icons.rocket),
    );
  }
}
