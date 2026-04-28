import 'package:dio/dio.dart';
import 'package:flutter_contr_2/todo_model.dart';
class ApiService {
final Dio _dio = Dio();

Future<List<TodoModel>> getId() async {

   final Response response = await _dio.get(
    "https://dummyjson.com/todos"
   );
   final List <dynamic>listResponse = response.data['todos'];

   List <TodoModel >list = [];
   listResponse.forEach((action){
    list.add(TodoModel.fromJson(action));
   });
 return list ;
}
}