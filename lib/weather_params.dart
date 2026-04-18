class WeatherParams {
  WeatherParams({
    required this.latitude,
    required this.longitude,
    required this.currentWeather,
  });

  final double latitude;
  final double longitude;
  final bool currentWeather;

  Map<String, dynamic> toJson() {
    return {
      "latitude": latitude, 
      "longitude": longitude, 
      "current_weather": currentWeather,
    };
  }
}