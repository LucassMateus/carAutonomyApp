import 'package:car_autonomy_app/database/db.dart';
import 'package:car_autonomy_app/models/car_model.dart';
import 'package:flutter/material.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class CarRepository extends ChangeNotifier {
  late Database db;
  // final CarModel carTeste = CarModel(name: 'teste', brand: 'teste', year: '2000', urbanConsum: 10.0, highwayConsum: 12.5);
  final List<CarModel> _cars = [];

  List<CarModel> get cars => _cars;

  CarRepository() {
    _initRepository();
  }

  _initRepository() async {
    await _getCars();
    // final CarModel carTeste = CarModel(
    //     name: 'teste',
    //     brand: 'teste',
    //     year: '2000',
    //     urbanConsum: 10.0,
    //     highwayConsum: 12.5);
    // _cars.add(carTeste);
  }

  _getCars() async {
    db = await DB.instance.dataBase;
    List result = await db.query('cars');
    List<CarModel> savedCars = result.map((e) => CarModel.fromMap(e)).toList();
    for (var car in savedCars) {
      _cars.add(car);
    }
    notifyListeners();
  }

  insertCar(CarModel car) async {
    db = await DB.instance.dataBase;
    await db.transaction((txn) async {
      final posicaoCar =
          await txn.query('cars', where: 'name = ?', whereArgs: [car.name]);

      if (posicaoCar.isEmpty) {
        await txn.insert('cars', {
          'name': car.name,
          'brand': car.brand,
          'year': car.year,
          'urbanConsum': car.urbanConsum,
          'highwayConsum': car.highwayConsum
        });
      } else {
        await txn.update(
            'cars',
            {
              'urbanConsum': car.urbanConsum,
              'highwayConsum': car.highwayConsum
            },
            where: 'name = ?',
            whereArgs: [car.name]);
      }
    });
    notifyListeners();
  }

  Future<List<CarModel>> fetchCars() async {
    db = await DB.instance.dataBase;
    List result = await db.query('cars');
    List<CarModel> savedCars = result.map((e) => CarModel.fromMap(e)).toList();

    return savedCars;
  }
}
