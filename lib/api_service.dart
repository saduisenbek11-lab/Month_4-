import 'package:dio/dio.dart';
import 'package:flutter_application_2/Weather/weather_model.dart';
import 'package:flutter_application_2/Weather/weather_params.dart';
import 'Country/country_model.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
class ApiService {
 final Dio _dio = Dio(BaseOptions(
  baseUrl: 'https://api.open-meteo.com/v1/',
));
  ApiService() {
    _dio.interceptors.add(TalkerDioLogger());
  }

  Future<List<CountryModel>> searchCountries(String nameCountry) async {
  final Response response = await _dio.get(
    'https://nominatim.openstreetmap.org/search',
    options: Options(headers: {'User-Agent': 'weather_app'}),
    queryParameters: {'q': nameCountry, 'format': 'json'},
  );

  if (response.data is! List) {
    return [];
  }

  return (response.data as List)
      .map((e) => CountryModel.fromJson(e))
      .toList();
}

  Future<WeatherModel> getWeather(WeatherParams params) async {
    final Response response = await _dio.get(
        'forecast',
        queryParameters: params.toJson()
    );
    return WeatherModel.fromJson(response.data);
  }
}