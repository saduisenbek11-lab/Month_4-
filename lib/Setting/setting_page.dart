import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_application_2/Setting/Theme/theme_block.dart';
import 'package:flutter_application_2/Setting/Theme/theme_event.dart';
import 'package:flutter_application_2/Setting/Theme/theme_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class SettingPage extends StatelessWidget{
  const SettingPage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
  final themeBlock = context.read <ThemeBlock>();
  return Scaffold(
  body: Column(children: [
  Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
    Text("Tema"),
    BlocBuilder<ThemeBlock,ThemeState>(builder: (context,state){
    bool isDark = false;
       if (state is GetValueThemeState) {
          isDark = state.value;
        }
          return Switch(
           value: isDark, 
             onChanged: (value) {
              themeBlock.add(ChangeThemeEvent(value: value));
          },
         );
        }
     )
  ],
  ),
  ],
  ),
  );
  }
}