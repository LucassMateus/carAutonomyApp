import 'package:car_autonomy_app/components/drawer_component.dart';
import 'package:car_autonomy_app/controllers/home_page_controller.dart';
import 'package:car_autonomy_app/states/car_state.dart';
import 'package:car_autonomy_app/stores/car_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/home_dropdown_component.dart';

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
      context.read<CarStore>().fetchCars();
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = HomePageController();
    final store = context.watch<CarStore>();
    final state = store.value;
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
      child =  Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const HomeDropdownComponent(),
            const SizedBox(height: 10),
            TextField(
              onChanged: (value) => controller.setDistanciaUrbana,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Distância Urbana'),
            ),
            const SizedBox(height: 10),
            TextField(
              onChanged: (value) => controller.setDistanciaRodoviaria,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Distância Rodoviária'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(onPressed: () {}, child: const Text('Calcular')),
            ValueListenableBuilder<String>(
                valueListenable: controller.result,
                builder: (context, value, child) {
                  return Text(value);
                })
          ],
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(title: const Text('Consumo de combustível')),
      drawer: const DrawerComponent(),
      body: child ?? Container()
    );
  }
}