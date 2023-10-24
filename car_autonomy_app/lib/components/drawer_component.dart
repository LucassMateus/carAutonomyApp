import 'package:car_autonomy_app/views/car_list_page.dart';
import 'package:car_autonomy_app/views/car_page.dart';
import 'package:car_autonomy_app/views/home_page.dart';
import 'package:flutter/material.dart';

class DrawerComponent extends StatelessWidget {
  const DrawerComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const UserAccountsDrawerHeader(
            accountName: Text(''),
            accountEmail: Text('App'),
            // decoration: BoxDecoration(color: Color(0xFF5F1609)),
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Home'),
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const HomePage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.list_alt_outlined),
            title: const Text('Cadastro'),
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => CarPage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.table_restaurant_outlined),
            title: const Text('Listagem'),
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const CarListPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
