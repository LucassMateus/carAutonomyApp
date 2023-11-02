// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:car_autonomy_app/controllers/home_page_controller.dart';
import 'package:flutter/material.dart';
import '../models/car_model.dart';

class HomeDropdownComponent extends StatelessWidget {
  final List<CarModel> cars;

  const HomeDropdownComponent({
    Key? key,
    required this.cars,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = HomePageController();

    return ValueListenableBuilder(
        valueListenable: controller.dropValue,
        builder: (buildContext, String value, _) {
          return SizedBox(
            width: 250,
            child: DropdownButtonFormField(
              icon: const Icon(Icons.drive_eta),
              isExpanded: true,
              hint: const Text('Escolha o carro'),
              decoration: InputDecoration(
                  label: const Text('Carro'),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6))),
              value: (value.isEmpty) ? null : value,
              onChanged: (value) =>
                  controller.dropValue.value = value.toString(),
              items: cars
                  .map((option) => DropdownMenuItem(
                        value: option.name,
                        child: Text(option.name),
                      ))
                  .toList(),
            ),
          );
        });
  }
}
