import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dog_model.dart';
import 'dog_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late final DogBloc _dogBloc;

  @override
  void initState() {
    super.initState();
    _dogBloc = context.read<DogBloc>();
    _dogBloc.add(GetDogImageEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Собачкииии"),
        centerTitle: true,
      ),
      body: BlocBuilder<DogBloc, DogState>(
        builder: (context, state) {
          if (state is ErrorDogState) {
            return const Center(child: Text("Ошибка"));
          }

          if (state is LoadedDogImageState) {
            return ListView.builder(
              itemCount: state.listDogs.length,
              itemBuilder: (context, index) {
                final model = state.listDogs[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Image.network(
                        model.url,
                        width: double.infinity,
                        height: 250,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(Icons.error),
                      ),
                      //Text(model.id),
                    ],
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