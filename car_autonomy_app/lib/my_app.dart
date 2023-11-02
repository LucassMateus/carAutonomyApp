import 'package:car_autonomy_app/services/car_service.dart';
import 'package:car_autonomy_app/views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'repositories/car_repository.dart';
import 'src/shared/themes/themes.dart';
import 'stores/car_store.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => CarRepository()),
          ChangeNotifierProvider(create: (context) => CarService()),
          ChangeNotifierProvider(create: (context) => CarStore()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.light,
          theme: ligthTheme,
          darkTheme: darkTheme,
          home: const HomePage(),
        ));
  }
}
