import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:space_tourism/src/app/model/planet_model.dart';
import '../../model/spaceship_model.dart';

class PlanetsController extends ChangeNotifier {
  List<PlanetModel> transactionList = [
    PlanetModel(
      description: "Distância média do Sol: 60.000.000 km",
      name: "Mercúrio",
      pathImage: "assets/images/mercurio.jpeg",
    ),
    PlanetModel(
      description: "Distância média do Sol: 60.000.000 km",
      name: "Vênus",
      pathImage: "assets/images/venus.jpeg",
    ),
    PlanetModel(
      description: "Distância média do Sol: 150.000.000 km",
      name: "Terra",
      pathImage: "assets/images/terra.jpeg",
    ),
    PlanetModel(
      description: "Distância média do Sol: 225.000.000 km",
      name: "Marte",
      pathImage: "assets/images/marte.png",
    )
  ];

  shufflePlanets() {
    transactionList.shuffle();
    notifyListeners();
  }
}
