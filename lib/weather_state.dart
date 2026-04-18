part of "weather_bloc.dart";

sealed class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

final class WeatherInitial extends WeatherState {}
final class LoadingWeatherState extends WeatherState {}

class ErrorWeaterState extends WeatherState {
  final List<String> existingImages; 
  const ErrorWeaterState({this.existingImages = const []});

  @override
  List<Object> get props => [existingImages];
}
final class LoadedWeatherImageState extends WeatherState {
  const LoadedWeatherImageState({required this.weatherModel});
  final WeatherModel weatherModel;

@override
  List<Object> get props => [weatherModel];
}