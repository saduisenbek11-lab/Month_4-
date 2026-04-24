import 'package:flutter/material.dart';
import 'package:flutter_application_2/Home/home.dart';

void main() => runApp(MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark),
    ));
/*
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/Setting/Theme/theme_block.dart';
import 'package:flutter_application_2/Setting/Theme/theme_state.dart';
import 'package:flutter_application_2/Router/app_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talker_flutter/talker_flutter.dart';

void main() async {
   final talker = Talker();
  runApp( MainApp(talker: talker),);
}
 final talker = Talker();

class MainApp extends StatefulWidget {
 final Talker talker;
 const MainApp({super.key, required this.talker});

 @override
 State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
 final _appRouter = AppRouter();

 @override
 Widget build(BuildContext context) {
 return BlocProvider(
  create: (context) => ThemeBlock(),
  child : BlocBuilder<ThemeBlock,ThemeState>(builder: (context ,state){
     bool isDark = false;
  if (state is GetValueThemeState){
  isDark = state.value;
  }
 return MaterialApp.router(routerConfig: _appRouter.config(),theme: isDark ? ThemeData.dark() : ThemeData.light() ,);
  }
 ),
 );
 }
} */