import 'package:flutter/material.dart';
import 'package:myportofolio_mobile/screens/menu.dart';

// titik masuk utama aplikasi flutter
void main() {
  runApp(const MyApp());
}

// widget root aplikasi
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyPortfolio',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
        ).copyWith(
          secondary: Colors.amber[700],
        ),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}
