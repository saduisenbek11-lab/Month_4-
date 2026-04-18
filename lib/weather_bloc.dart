import 'package:flutter_application_2/weather_model.dart';
import 'package:flutter_application_2/weather_params.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'api_service.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final ApiService apiService = ApiService();
  
  WeatherBloc() : super(WeatherInitial()) {
    on<LoadedWeatherEvent>((event, emit) async { 
      try {
        emit(LoadingWeatherState());
       final WeatherModel weather = await apiService.getWeather(event.params);
        emit(LoadedWeatherImageState(weatherModel: weather));
      } catch (e,s) {
        print('Error fetching dogs: $e');
        emit(const ErrorWeaterState());
      }
    });
  }
}