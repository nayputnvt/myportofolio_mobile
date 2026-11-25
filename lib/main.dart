import 'package:flutter/material.dart';
import 'package:myportofolio_mobile/screens/menu.dart';
import 'package:myportofolio_mobile/services/api_client.dart';
import 'package:myportofolio_mobile/services/auth_state.dart';
import 'package:provider/provider.dart';

// titik masuk utama aplikasi flutter
void main() {
  runApp(MyApp(apiClient: ApiClient()));
}

// widget root aplikasi dengan injeksi dependensi multiprovider
class MyApp extends StatelessWidget {
  MyApp({super.key, ApiClient? apiClient})
    : apiClient = apiClient ?? ApiClient();

  final ApiClient apiClient;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider.value(value: apiClient),
        ChangeNotifierProvider(create: (_) => AuthState(apiClient)),
      ],
      child: MaterialApp(
        title: 'MyPortfolio',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo)
              .copyWith(secondary: Colors.amber[700]),
          useMaterial3: true,
        ),
        home: MyHomePage(),
      ),
    );
  }
}
