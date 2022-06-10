import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:space_tourism/src/app/model/creator_model.dart';
import '../../model/spaceship_model.dart';

class CreatorsController extends ChangeNotifier {
  bool status = true;

  List<CreatorModel> creators = [
    CreatorModel(
      name: "Matheus Barbieri de Araújo",
      rm: "RM: 85538",
      pathImage: "assets/images/matheus.jpeg",
    ),
    CreatorModel(
      name: "Lucas Moretini Mathias",
      rm: "RM: 86113",
      pathImage: "assets/images/lucas.png",
    )
  ];

  toggleRockets() {
    status = !status;
    notifyListeners();
  }
}
