import 'package:car_autonomy_app/models/car_model.dart';
import 'package:car_autonomy_app/repositories/car_repository.dart';
import 'package:flutter/material.dart';

class CarPageController {
  String _nome = '';
  String _marca = '';
  int _ano = 0;
  double _consumoUrbano = 0.0;
  double _consumoRodoviario = 0.0;
  CarRepository cars = CarRepository();
  late CarModel? newCar;

  void setNome(String value) => _nome = value;
  void setMarca(String value) => _marca = value;
  void setAno(String value) => _ano = int.tryParse(value) ?? 0;
  void setConsumoUrbano(String value) =>
      _consumoUrbano = double.tryParse(value) ?? 0.00;
  void setConsumoRodoviario(String value) =>
      _consumoRodoviario = double.tryParse(value) ?? 0.00;

  ValueNotifier<bool> get btnAvailable {
    if ((_nome != '') && (_marca != '')
        // _ano > 0 &&
        // _consumoUrbano > 0 &&
        // _consumoRodoviario > 0
        ) {
      return ValueNotifier(true);
    }
    return ValueNotifier(false);
  }

  String get nome => _nome;
  String get marca => _marca;
  int get ano => _ano;
  double get consumoUrbano => _consumoUrbano;
  double get consumoRodoviario => _consumoRodoviario;

  void saveCar() {
    newCar = CarModel(
        name: _nome,
        brand: _marca,
        year: _ano,
        urbanConsum: _consumoUrbano,
        highwayConsum: _consumoRodoviario);
    cars.insertCar(newCar!);
  }
}
