import 'package:car_autonomy_app/controllers/home_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../stores/car_store.dart';

class HomeDropdownComponent extends StatefulWidget {
  const HomeDropdownComponent({super.key});

  @override
  State<HomeDropdownComponent> createState() => _HomeDropdownComponentState();
}

class _HomeDropdownComponentState extends State<HomeDropdownComponent> {
  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   context.read<CarStore>().fetchCars();
    // });
  }

  @override
  Widget build(BuildContext context) {
    final controller = HomePageController();
    final store = context.watch<CarStore>();

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
              items: controller.dropOptions
                  .map((option) => DropdownMenuItem(
                        value: option,
                        child: Text(option),
                      ))
                  .toList(),
            ),
          );
        });
  }
}
