import 'package:car_autonomy_app/models/car_model.dart';
import 'package:car_autonomy_app/repositories/car_repository.dart';

class CarPageController {
  String _nome = '';
  String _marca = '';
  String _ano = '';
  double _consumoUrbano = 0.0;
  double _consumoRodoviario = 0.0;
  CarRepository cars = CarRepository();
  late CarModel? newCar;

  void setNome(String value) => _nome = value;
  void setMarca(String value) => _marca = value;
  void setAno(String value) => _ano = value;
  void setConsumoUrbano(String value) =>
      _consumoUrbano = double.tryParse(value) ?? 0.00;
  void setConsumoRodoviario(String value) =>
      _consumoRodoviario = double.tryParse(value) ?? 0.00;

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
