import 'package:flutter/material.dart';
part 'color_schemes.g.dart';

ThemeData get ligthTheme => ThemeData(
      useMaterial3: true,
      colorScheme: _lightColorScheme,
      appBarTheme: AppBarTheme(backgroundColor: _lightColorScheme.onPrimary),
      cardTheme: CardTheme(
        color: _lightColorScheme.secondaryContainer,
      ),
    );

ThemeData get darkTheme => ThemeData(
      useMaterial3: true,
      colorScheme: _darkColorScheme,
      appBarTheme: AppBarTheme(backgroundColor: _darkColorScheme.background),
      cardTheme: CardTheme(color: _darkColorScheme.secondaryContainer),
    );
