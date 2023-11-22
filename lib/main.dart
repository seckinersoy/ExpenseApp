import 'package:expenseapp/pages/main_page.dart';
import 'package:flutter/material.dart';

ColorScheme colorScheme1 = ColorScheme.fromSeed(seedColor: Colors.white);

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: colorScheme1,
          appBarTheme: AppBarTheme(color: Colors.orange),
          cardTheme: CardTheme(
            color: Colors.orangeAccent[100],
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          ),
          textTheme: ThemeData().textTheme.copyWith(
                titleLarge:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                bodyMedium: const TextStyle(),
              )),
      home: const MainPage()));
}
