// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../models/car_model.dart';
import '../repositories/car_repository.dart';

class CarService extends ChangeNotifier {
  final CarRepository repository;

  CarService(this.repository);

  Future<List<CarModel>> fetchCars() async {
    final response = await repository.fetchCars();
    return response;
  }
}
