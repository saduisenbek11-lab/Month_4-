import 'package:dio/dio.dart';
import 'package:flutter_application_2/Weather/weather_model.dart';
import 'package:flutter_application_2/Weather/weather_params.dart';
import 'Country/country_model.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
class ApiService {
  final Dio _dio = Dio(BaseOptions(baseUrl: ''));

  ApiService() {
    _dio.interceptors.add(TalkerDioLogger());
  }

  Future<List<CountryModel>> searchCountries(String nameCountry) async {
    final Response response = await _dio.get(
        'https://nominatim.openstreetmap.org/search',
        options: Options(headers: {'User_Agent': 'weather_app'}),
        queryParameters: {'q': nameCountry, 'format': 'json'}
    );
    List<CountryModel>list = [];
    response.data.forEach((country) {
      list.add(CountryModel.fromJson(country));
    });
    return list;
  }


  Future<WeatherModel> getWeather(WeatherParams params) async {
    final Response response = await _dio.get(
        'forecast',
        queryParameters: params.toJson()
    );
    return WeatherModel.fromJson(response.data);
  }
}