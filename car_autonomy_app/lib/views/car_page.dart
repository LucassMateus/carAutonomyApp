import 'package:car_autonomy_app/components/drawer_component.dart';
import 'package:car_autonomy_app/controllers/car_page_controller.dart';
import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class CarPage extends StatefulWidget {
  @override
  State<CarPage> createState() => _CarPageState();
}

class _CarPageState extends State<CarPage> {
  final controller = CarPageController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cadastro de carro')),
      drawer: const DrawerComponent(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextField(
              textInputAction: TextInputAction.next,
              onChanged: controller.setNome,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Nome'),
            ),
            const SizedBox(height: 10),
            TextField(
              textInputAction: TextInputAction.next,
              onChanged: controller.setMarca,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Marca'),
            ),
            const SizedBox(height: 10),
            TextField(
              textInputAction: TextInputAction.next,
              onChanged: controller.setAno,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Ano'),
            ),
            const SizedBox(height: 10),
            TextField(
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
              onChanged: controller.setConsumoUrbano,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Consumo Urbano'),
            ),
            const SizedBox(height: 10),
            TextField(
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
              onChanged: controller.setConsumoRodoviario,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Consumo Rodoviario'),
            ),
            const SizedBox(height: 10),
            ValueListenableBuilder<bool>(
              valueListenable: controller.btnAvailable,
              builder: (context, value, _) {
                return ElevatedButton(
                    onPressed: true
                        ? () {
                            controller.saveCar();
                          }
                        : null,
                    child: const Text('Salvar'));
              },
            )
          ],
        ),
      ),
    );
  }
}
