import 'package:flutter/material.dart';
import 'package:space_tourism/src/app/modules/spaceship_page/spaceship_controller.dart';

import '../../components/button_pattern.dart';
import '../../components/card_pattern.dart';
import '../../components/form_pattern.dart';
import '../../utils/paddings.dart';

class SpaceshipPage extends StatefulWidget{

  @override
  State<StatefulWidget> createState(){
    return _SpaceshipPageState();
  }
}

class _SpaceshipPageState extends State<SpaceshipPage>{
  TextEditingController nameController = TextEditingController();
  FocusNode spaceshipNameFocus = FocusNode();
  FocusNode spaceshipValueFocus = FocusNode();

  final controller = SpaceshipController();

  @override
  void initState(){
    super.initState();
    controller.addListener(() {
      setState(() {
        
      });
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
         title: const Text('Turismo Espacial')
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 0.0,
          right: 0.0,
          top: 0.0,
          bottom: 10.0
        ),
        child: Column(
          children: [
            Container(
              color: const Color.fromARGB(255, 101, 2, 194),
              child: Column(
                children: [
                  const SizedBox(height: 15),
                  const Text(
                      "Adicione a sua nave espacial",
                      style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 248, 244, 244)
                    ),
                  ),
                  const SizedBox(height: 30),
                  FormPattern(
                    label: 'Nome da nave', 
                    userInputController: nameController
                  ),
                  const SizedBox(height: 30),
                  ButtonPattern(
                    buttonText: 'ADICIONAR NAVE', 
                    onPressed: () {
                      controller.addNewSpaceship(spaceshipName: nameController.text);
                    },
                    primaryColor: Colors.white,
                    secondColor: const Color.fromARGB(255, 101, 2, 194)
                  ),
                  const SizedBox(height: 30),
                ]
              ),
            ),

             Container(
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  ListView.separated(
                    separatorBuilder: (BuildContext context, int index){
                      return const SizedBox(height: 20);
                    },
                    shrinkWrap: true,
                    itemCount: controller.transactionList.length,
                    itemBuilder: (context, index) {
                      var listItem = controller.transactionList[index];
                    return CardPattern(
                      text: listItem.spaceshipName!,
                    );
                    }
                  ),
                  const SizedBox(height: 15),
                ]
              ),
            ),

          ],
        ),
      ),
    );
  }

}