import 'package:car_autonomy_app/models/car_model.dart';
import 'package:flutter/material.dart';

class HomePageController {
  late final _dropValue = ValueNotifier<String>('');
  late ValueNotifier<CarModel>? _selectedCar;
  double _distanciaUrbana = 0.0;
  double _distanciaRodoviaria = 0.0;
  final _result = ValueNotifier<String>('');

  void setDistanciaUrbana(String value) =>
      _distanciaUrbana = double.tryParse(value) ?? 0.0;
  void setDistanciaRodoviaria(String value) =>
      _distanciaRodoviaria = double.tryParse(value) ?? 0.0;

  ValueNotifier<String> get dropValue => _dropValue;
  ValueNotifier<String> get result => _result;
  ValueNotifier<CarModel>? get selectedCar => _selectedCar;

  void calcularConsumo() {
    final double consumo =
        (_distanciaUrbana / _selectedCar!.value.urbanConsum) +
            (_distanciaRodoviaria / _selectedCar!.value.highwayConsum);
    _result.value = consumo.toString();
  }
}
