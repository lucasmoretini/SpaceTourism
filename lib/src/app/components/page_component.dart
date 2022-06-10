import 'package:flutter/material.dart';
import 'package:space_tourism/src/app/utils/paddings.dart';

class Page extends StatelessWidget {
  final Widget body;
  final String? title;

  Page({
    this.title,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: title != null ? AppBar(title: Text(title!)) : null,
      body: body,
    );
  }
}
