// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:space_tourism/src/app/components/button_component.dart';
import 'package:space_tourism/src/app/components/custom_scrollview_component.dart';
import 'package:space_tourism/src/app/components/form_outline_component.dart';
import 'package:space_tourism/src/app/modules/creators_page/creators_page.dart';

import 'package:space_tourism/src/app/utils/export.dart';

import '../spaceship_page/spaceship_page.dart';

class IntroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    navigateToSpaceShipScreen() {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => SpaceshipPage(),
        ),
      );
    }

    navigateToCreatorsPage() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CreatorsPage(),
        ),
      );
    }

    Widget Form({required BuildContext context}) {
      return Padding(
        padding: EdgeInsets.only(
          left: AppPaddings.borderPadding,
          right: AppPaddings.borderPadding,
          bottom: 60,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FormOutlinePattern(label: eMail),
            const SizedBox(height: 15),
            FormOutlinePattern(label: password),
            const SizedBox(height: 30),
            ButtonPattern(
              onPressed: navigateToSpaceShipScreen,
              buttonText: entry,
              primaryColor: const Color.fromARGB(255, 101, 2, 194),
              secondColor: Colors.white,
            ),
            TextButton(
              onPressed: navigateToCreatorsPage,
              child: const Text("Criadores do projeto"),
            )
          ],
        ),
      );
    }

    var image = Image.asset(
      "assets/images/spaceShip.jpg",
      width: 450.00,
      height: 300.00,
      alignment: Alignment.topCenter,
    );

    var textIntro = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        SizedBox(height: 8),
        Text(
          "Turismo Espacial",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 15),
        Text(
          "Entre na sua conta!",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
        ),
        SizedBox(height: 8),
      ],
    );

    return Scaffold(
      body: CustomScrollViewComponent(
        child: Column(
          children: [
            image,
            Expanded(
              flex: 1,
              child: textIntro,
            ),
            Expanded(
              flex: 2,
              child: Form(context: context),
            ),
          ],
        ),
      ),
    );
  }
}
