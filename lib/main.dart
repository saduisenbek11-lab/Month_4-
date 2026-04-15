import 'package:flutter/material.dart';
import 'package:flutter_application_2/dog_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'my_home_page.dart'; 

void main() {
  runApp(
    BlocProvider(create: (context) => DogBloc(),
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
      home: const MyHomePage(),
    );
  }
} 