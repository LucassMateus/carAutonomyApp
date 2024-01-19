import 'package:car_autonomy_app/components/drawer_component.dart';
import 'package:car_autonomy_app/controllers/home_page_controller.dart';
import 'package:car_autonomy_app/repositories/car_repository.dart';
import 'package:car_autonomy_app/states/car_state.dart';
import 'package:car_autonomy_app/stores/car_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/home_dropdown_component.dart';
import '../models/car_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CarRepository>().cars;
      context.read<CarStore>().fetchCars();
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = HomePageController();
    final store = context.watch<CarStore>();
    // final repository = context.watch<CarRepository>();
    final state = store.value;
    // final List<CarModel> cars = repository.cars;
    Widget? child;

    if (state is LoadingCarState) {
      child = const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (state is ErrorCarState) {
      child = Center(
        child: Text(state.message),
      );
    }

    if (state is SucessCarState) {
      child = Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Consumer<CarRepository>(builder: (context, repository, child) {
              return HomeDropdownComponent(cars: repository.cars);
            }),
            const SizedBox(height: 10),
            TextField(
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
              onChanged: controller.setDistanciaUrbana,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Distância Urbana'),
            ),
            const SizedBox(height: 10),
            TextField(
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
              onChanged: controller.setDistanciaRodoviaria,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Distância Rodoviária'),
            ),
            const SizedBox(height: 10),
            ValueListenableBuilder<bool>(
                valueListenable: controller.btnAvailable,
                builder: (context, value, _) {
                  return ElevatedButton(
                      onPressed: value ? () {} : null,
                      child: const Text('Calcular'));
                }),
            ValueListenableBuilder<String>(
                valueListenable: controller.result,
                builder: (context, value, _) {
                  return Text(value);
                })
          ],
        ),
      );
    }
    return Scaffold(
        appBar: AppBar(title: const Text('Consumo de combustível')),
        drawer: const DrawerComponent(),
        body: child ?? Container());
  }
}
