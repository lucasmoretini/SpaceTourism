import 'package:sqflite/sqflite.dart';
import '../database/database_manager.dart';
import '../model/truck_driver.dart';

class TruckDriverRepository {
  Future<List<TruckDriver>> listarCaminhoneiros() async {
    Database db = await DatabaseManager.instance.database;
    List rows = await db.rawQuery('''
          SELECT 
            *
          FROM truck_driver
    ''');
    return rows
        .map(
          (row) => TruckDriver(
            id: row['id'] as int,
            age: int.parse(row['age'].toString()),
            cep: row['cep'],
            profession: row['profession'],
            serviceType: row['serviceType'],
        ),
        )
        .toList();
  }

  Future<int> cadastrarCaminhoneiro(TruckDriver truckDriver) async {
    Database db = await DatabaseManager.instance.database;
    return db.insert('truck_driver', {
      'age': truckDriver.age,
      'cep': truckDriver.cep,
      'profession': truckDriver.profession,
      'serviceType': truckDriver.serviceType
    });
  }

  Future<void> removerCaminhoneiro(int? id) async {
    Database db = await DatabaseManager.instance.database;
    await db.delete('truck_driver', where: 'id = ?', whereArgs: [id]);
  }
}