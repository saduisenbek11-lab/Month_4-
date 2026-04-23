import 'package:dio/dio.dart';
import 'weather_model.dart';
import 'weather_params.dart';
class ApiService2 {
  final Dio _dio = Dio(
    BaseOptions(baseUrl: "https://api.open-meteo.com/v1/"),
  );

  Future<WeatherModel> getWeather(WeatherParams params) async {
      final Response response = await _dio.get(
        'forecast',
        queryParameters: params.toJson()
      );
      return WeatherModel.fromJson(response.data);
    }
  }