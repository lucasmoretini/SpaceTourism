import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../model/spaceship_model.dart';

class SpaceshipController extends ChangeNotifier {
  List<SpaceshipModel> transactionList = [];

  addNewSpaceship({
    required String spaceshipName,
    required String spaceshipDescription,
  }) {
    transactionList.insert(
      0,
      SpaceshipModel(
        spaceshipName: spaceshipName,
        spaceshipDescription: spaceshipDescription,
      ),
    );
    notifyListeners();
  }
}
