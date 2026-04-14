import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<String> getCatImage() async {
    final Response response = await _dio.get('https://pro-api.thedogapi.com/v1/images/search?&page=0&limit=10');
    return response.data[0]['url'];
  }
}