import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    _dogBloc = DogBloc();
    _dogBloc.add(GetDogImageEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Кошкиии"),
        centerTitle: true,
      ),
      body: BlocBuilder<DogBloc, DogState>(
        bloc: _dogBloc,
        builder: (context, state) {
          if (state is LoadingDogState) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is ErrorDogState) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Error!"),
                  ElevatedButton(
                    onPressed: () => _dogBloc.add(GetDogImageEvent()),
                    child: const Text("Еще раз"),
                  ),
                ],
              ),
            );
          }
          if (state is LoadedDogImageState) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(state.img, fit: BoxFit.contain),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 40),
                    child: ElevatedButton(
                      onPressed: () => _dogBloc.add(GetDogImageEvent()),
                      child: const Text("Cледующий"),
                    ),
                  ),
                ],
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  @override
  void dispose() {
    _dogBloc.close();
    super.dispose();
  }
}