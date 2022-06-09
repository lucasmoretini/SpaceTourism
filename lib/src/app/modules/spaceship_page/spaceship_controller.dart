import 'package:flutter/cupertino.dart';
import '../../model/spaceship_model.dart';

class SpaceshipController extends ChangeNotifier{

  List<SpaceshipModel> transactionList = [];

  addNewSpaceship({required String spaceshipName}){
    transactionList.insert(
    transactionList.length, 
      SpaceshipModel(
        spaceshipName: spaceshipName, 
      )
    );
    notifyListeners();
  }
}