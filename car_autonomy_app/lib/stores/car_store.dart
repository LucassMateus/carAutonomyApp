import 'package:car_autonomy_app/repositories/car_repository.dart';
import 'package:car_autonomy_app/states/car_state.dart';
import 'package:flutter/widgets.dart';

class CarStore extends ValueNotifier<CarState> {
  final CarRepository repository;

  CarStore(this.repository) : super(InitialCarState());

  Future fetchCars() async {
    value = LoadingCarState();
    await Future.delayed(const Duration(seconds: 1));
    try {
      final cars = await repository.fetchCars();
      value = SucessCarState(cars);
    } catch (e) {
      ErrorCarState(e.toString());
    }
  }
}