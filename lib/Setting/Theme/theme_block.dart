import 'package:flutter_application_2/Setting/Theme/theme_event.dart';
import 'package:flutter_application_2/Setting/Theme/theme_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeBlock extends Bloc<ThemeEvent, ThemeState>{
  ThemeBlock() : super (ThemeInitial()){
    on<ChangeThemeEvent>((event, emit) {
      emit(GetValueThemeState(value: event.value));
    },);
  }
}