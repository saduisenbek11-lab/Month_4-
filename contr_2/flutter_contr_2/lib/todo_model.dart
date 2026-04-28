import 'package:equatable/equatable.dart';
class TodoModel extends Equatable{
  TodoModel ({
  required this.userId,
  required this.id,
  required this.todo,
  required this.completed,
  });
  final int userId;
  final int id;
  final String todo;
  final bool completed;

  factory TodoModel.fromJson (Map<String,dynamic> json){
    return TodoModel(userId: json['userId'], id: json['id'],
     todo: json["todo"], completed: json["completed"],);
  }
  @override
  // TODO: implement props
  List<Object?> get props => [id,userId,completed,todo];
}
