part of "weather_bloc.dart";

sealed class WeatherEvent extends Equatable {
  const WeatherEvent();
}
  final class LoadedWeatherEvent extends WeatherEvent{
  const LoadedWeatherEvent({required this.params});

   final WeatherParams params;

  @override
  List<Object?> get props => [params];
  }
  