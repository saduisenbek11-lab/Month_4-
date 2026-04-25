import 'package:flutter/material.dart';
import 'package:flutter_application_6/Create/create_block.dart';
import 'package:flutter_application_6/Create/create_event.dart';
import 'package:flutter_application_6/Api/api_servise.dart';
import 'package:flutter_application_6/Ekran/post_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostBloc(ApiService())..add(FetchPostsEvent()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const PostListPage(), 
      ),
    );
  }
}