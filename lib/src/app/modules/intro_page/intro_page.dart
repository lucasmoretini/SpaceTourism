import 'package:flutter/material.dart';
import 'package:space_tourism/src/app/components/button_pattern.dart';
import 'package:space_tourism/src/app/components/form_pattern.dart';
import 'package:space_tourism/src/app/modules/main_page/main_page.dart';
import 'package:space_tourism/src/app/utils/export.dart';

import '../spaceship_page/spaceship_page.dart';

class IntroPage extends StatelessWidget {
  
   @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
             children: [
              Image.asset(
                "assets/images/spaceShip.jpg", 
                width: 450.00, 
                height: 300.00,
                alignment: Alignment.topCenter,
              ),
              Padding(
                padding: EdgeInsets.only(
                left: AppPaddings.borderPadding,
                right: AppPaddings.borderPadding,
                top: AppPaddings.topPadding,
                ),
                child: Column(
                  children: [
                  const SizedBox(height: 30),
                  const Text(
                    "Turismo Espacial",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    "Entre na sua conta!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal
                    ),
                  ),
                  const SizedBox(height: 40),
                  FormPattern(label: eMail),
                  const SizedBox(height: 15),
                  FormPattern(label: password),
                  const SizedBox(height: 30),
                  ButtonPattern(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SpaceshipPage(),
                        ),
                      );
                    },
                  buttonText: entry,
                  primaryColor: const Color.fromARGB(255, 101, 2, 194),
                  secondColor: Colors.white
                  ),
                ]
              )
            ), 
          ]
        )
      ),
    );
  }
}