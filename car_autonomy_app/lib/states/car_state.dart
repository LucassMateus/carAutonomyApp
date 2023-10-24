import 'package:car_autonomy_app/models/car_model.dart';

abstract class CarState {}

class InitialCarState extends CarState {}

class LoadingCarState extends CarState {}

class SucessCarState extends CarState {
  final List<CarModel> cars;

  SucessCarState(this.cars);
}

class ErrorCarState extends CarState {
  final String message;

  ErrorCarState(this.message);
} 