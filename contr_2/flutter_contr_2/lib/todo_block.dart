import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_contr_2/api_service.dart';
import 'package:flutter_contr_2/todo_event.dart';
import 'package:flutter_contr_2/todo_model.dart';
import 'package:flutter_contr_2/todo_state.dart';

class TodoBlock extends Bloc<TodoEvent , TodoState>{
  final ApiService apiService = ApiService();
  TodoBlock() : super (TodoInitial()){
    on<TodoEvent>((event , emit) async{
    try {
      emit(LoadingTodo());
      List<TodoModel>list = await apiService.getId();
       emit(LoadedTodo(list: list));
    }catch(e,s){
      print(e);
      print(s);
      emit(ErrorTodo(

      ));
    }
    });
  }
}