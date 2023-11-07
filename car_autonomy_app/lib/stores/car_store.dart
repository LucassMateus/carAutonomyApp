// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:car_autonomy_app/services/car_service.dart';
import 'package:car_autonomy_app/states/car_state.dart';
import 'package:flutter/widgets.dart';

class CarStore extends ValueNotifier<CarState> {
  final CarService carService;

  CarStore(this.carService) : super(InitialCarState());

  fetchCars() async {
    value = LoadingCarState();
    await Future.delayed(const Duration(seconds: 1));
    try {
      final cars = await carService.fetchCars();
      value = SucessCarState(cars);
    } catch (e) {
      ErrorCarState(e.toString());
    }
  }
}
