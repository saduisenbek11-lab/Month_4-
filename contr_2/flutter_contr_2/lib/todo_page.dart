import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_contr_2/todo_block.dart';
import 'package:flutter_contr_2/todo_event.dart';
import 'package:flutter_contr_2/todo_state.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  final TodoBlock _todoBlock = TodoBlock();
  @override
  void initState(){
    _todoBlock.add(GetTodoEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TodoBlock , TodoState> (
        bloc: _todoBlock,
      builder: (context , state) {
        if (state is LoadedTodo){
          return ListView.builder(
            itemCount: state.list.length,
            itemBuilder: (context , index){
            final  model = state.list[index];
            return Text(model.todo);
            }
          );
        }
        if (state is ErrorTodo){
          return Text("Ошибка");
        }
        if (state is LoadingTodo){
          return CircularProgressIndicator();
        }
        return Text('data');
      }
      )
    );
  }
}