import 'package:car_autonomy_app/views/car_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/drawer_component.dart';
import '../states/car_state.dart';
import '../stores/car_store.dart';

class CarListPage extends StatefulWidget {
  const CarListPage({super.key});

  @override
  State<CarListPage> createState() => _CarListPageState();
}

class _CarListPageState extends State<CarListPage> {
    @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CarStore>().fetchCars();
    });
  }
  @override
  Widget build(BuildContext context) {
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
      child = Stack(
        children: [
          ListView.builder(
            itemCount: state.cars.length,
            itemBuilder: (_, index) {
              final car = state.cars[index];
              return ListTile(
                title: Text(car.name),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => CarPage()),
                  );
                },
                child: const Icon(Icons.add),
              ),
            ),
          )
        ],
      );
    }
    return Scaffold(
      appBar: AppBar(title: const Text('Lista de Carros')),
      drawer: const DrawerComponent(),
      body: child ?? Container()
    );
  }
}
