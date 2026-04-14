import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dog_bloc.dart';
import 'api_service.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late final DogBloc _dogBloc;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
     _dogBloc = DogBloc(apiService: ApiService())..add(GetDogImageEvent());
    
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 100) {
      if (_dogBloc.state is! LoadingDogState) {
        _dogBloc.add(GetDogImageEvent());
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _dogBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Собачкииии"),
        centerTitle: true,
      ),
      body: BlocBuilder<DogBloc, DogState>(
        bloc: _dogBloc,
       builder: (context, state) {
  // 1. Если картинок вообще нет и произошла ошибка
  if (state is ErrorDogState && state.existingImages.isEmpty) {
    return const Center(child: Text("Ошибка"));
  }

  // 2. Если есть картинки (неважно, Loaded это или Error с данными)
  List<String> images = [];
  if (state is LoadedDogImageState) images = state.images;
  if (state is ErrorDogState) images = state.existingImages;

  if (images.isNotEmpty) {
    return ListView.builder(
      controller: _scrollController,
      itemCount: images.length + (state is ErrorDogState ? 1 : 1),
      itemBuilder: (context, index) {
        // Если дошли до конца и там ошибка
        if (index == images.length) {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Center(
              child: Text(state is ErrorDogState ? "Ошибка" : "Загрузка..."),
            ),
          );
        }

        return Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Image.network(
            images[index],
            width: double.infinity,
            fit: BoxFit.cover,
          ),
         );
         },
        );
        }
      return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}