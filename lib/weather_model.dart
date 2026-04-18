class WeatherModel {
  WeatherModel({
  required this.latitude , 
  required this.longitude,
  required this.temUnit,
  required  this.tem,
  });

   final double latitude;
   final double longitude;
   final CurrentWeatherUnits temUnit;
   final CurrentWeather tem;

 Map<String,dynamic> toJson(){
 return {"latitude" : 42.8746,"longitude" : "74.5698", "current_weater" : true};
 }
  factory WeatherModel.fromJson(Map<String , dynamic> json){
    return WeatherModel(
      latitude: json["latitude"],
       longitude: json["longitude"],
       temUnit: CurrentWeatherUnits.fromJson(json['current_weather_units']),
       tem: CurrentWeather.fromJson(json["current_weather"]),
       );
  }
}
final class CurrentWeatherUnits{
  CurrentWeatherUnits({required this.temperature});
  final String temperature;

  factory CurrentWeatherUnits.fromJson(Map<String , dynamic> json){
    return CurrentWeatherUnits(temperature: json["temperature"]);
  }
}
final class CurrentWeather{
  CurrentWeather({required this.temperature});
  final double temperature;

  factory CurrentWeather.fromJson(Map<String , dynamic> json){
    return CurrentWeather(temperature: json["temperature"]);
  }
}