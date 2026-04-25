import 'package:dio/dio.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
import '../response_model.dart';

class ApiService {
  final Dio _dio = Dio(BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com'));

  ApiService() {
    _dio.interceptors.add(TalkerDioLogger());
  }

  Future<List<PostResponseModel>> getPosts() async {
    final response = await _dio.get('/posts');
    return (response.data as List).map((e) => PostResponseModel.fromJson(e)).toList();
  }

  Future<PostResponseModel> getPostById(int id) async {
    final response = await _dio.get('/posts/$id');
    return PostResponseModel.fromJson(response.data);
  }

  Future<void> deletePost(int id) async {
    await _dio.delete('/posts/$id');
  }
}