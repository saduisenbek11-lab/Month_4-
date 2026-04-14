import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<String> getCatImage() async {
    final Response response = await _dio.get('https://api.thecatapi.com/v1/images/search');
    return response.data[0]['url'];
  }
}