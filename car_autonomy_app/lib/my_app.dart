import 'package:car_autonomy_app/views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'repositories/car_repository.dart';
import 'stores/car_store.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => CarRepository()),
          ChangeNotifierProvider(create: (context) => CarStore(context.read())),
        ],
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.light,
          home: HomePage(),
        ));
  }
}
