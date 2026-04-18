import 'package:flutter/material.dart';
import 'package:flutter_application_2/weather_bloc.dart';
import 'package:flutter_application_2/weather_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    BlocProvider(create: (context) => WeatherBloc(),
    child: const MainApp(),)
    );
}//В случае ошибки введите в терминал flutter run -d chrome --web-browser-flag "--disable-web-security"


class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, 
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blue,
      ),
      home: const WeatherPage(),
    );
  }
} 