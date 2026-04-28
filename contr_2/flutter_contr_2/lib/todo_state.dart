import 'package:equatable/equatable.dart';
import 'package:flutter_contr_2/todo_model.dart';

class TodoState extends Equatable {
  const TodoState();
   @override
  List<Object> get props => [];
}
final class TodoInitial extends TodoState {}
final class LoadingTodo extends TodoState {}
final class LoadedTodo extends TodoState{
final  List<TodoModel> list;

  LoadedTodo({required this.list});
}
final class ErrorTodo extends TodoState{}