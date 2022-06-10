import 'package:flutter/material.dart';
import 'package:space_tourism/src/app/utils/paddings.dart';

class CustomScrollViewComponent extends StatelessWidget {
  final Widget child;

  CustomScrollViewComponent({
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraint.maxHeight),
            child: IntrinsicHeight(
              child: child,
            ),
          ),
        );
      },
    );
  }
}
