// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class CreatorsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget CustomScrollView({required Widget child}) {
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

    var image = Image.asset(
      "assets/images/astronauts.jpeg",
      width: double.infinity,
      alignment: Alignment.topCenter,
    );

    var textIntro = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        SizedBox(height: 8),
        Text(
          "Criadores do Projeto",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 15),
        Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            "Clique sobre os foguetes para conhecer os criadores do projeto.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        SizedBox(height: 8),
      ],
    );

    return Scaffold(
      appBar: AppBar(),
      body: CustomScrollView(
        child: Column(
          children: [
            image,
            Expanded(
              flex: 1,
              child: textIntro,
            ),
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Ink(
                    decoration: const ShapeDecoration(
                      color: Colors.black26,
                      shape: const CircleBorder(),
                    ),
                    child: IconButton(
                      iconSize: 64,
                      onPressed: () {},
                      icon: const Icon(
                        Icons.rocket,
                        color: Colors.blue,
                        size: 64,
                      ),
                    ),
                  ),
                  Ink(
                    decoration: const ShapeDecoration(
                      color: Colors.black26,
                      shape: CircleBorder(),
                    ),
                    child: IconButton(
                      iconSize: 64,
                      onPressed: () {},
                      icon: const Icon(
                        Icons.rocket,
                        color: Colors.red,
                        size: 64,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
