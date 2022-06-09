import 'package:flutter/material.dart';

class CardPattern extends StatelessWidget {

  final String text;

  CardPattern({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color.fromARGB(255, 101, 2, 194), width: 1),
      ),
      child: Row(
        children: [
          Text(text)
        ],
      ),
    );
  }
}