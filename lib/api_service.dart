import 'package:dio/dio.dart';
import 'package:flutter_application_2/dog_model.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<List<DogModel>> getDogs() async {
    try {
      final Response response = await _dio.get(
        'https://api.thedogapi.com/v1/images/search?limit=10'
      );

      if (response.statusCode == 200) {
      
        final List<dynamic> dogListJson = response.data;

        return dogListJson.map((json) => DogModel.fromJson(json)).toList();
      } else {
        throw Exception('Ошибка сервера: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Не удалось загрузить собак: $e');
    }
  }
}