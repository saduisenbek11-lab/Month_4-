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

  @override
  void initState() {
    super.initState();
    _dogBloc = DogBloc(apiService: ApiService());
    _dogBloc.add(GetDogImageEvent());
  }

  @override
  void dispose() {
    _dogBloc.close();
    super.dispose();
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
                  const Text("Ошибка!"),
                  ElevatedButton(
                    onPressed: () => _dogBloc.add(GetDogImageEvent()),
                    child: const Text("Еще раз"),
                  ),
                ],
              ),
            );
          }

          if (state is LoadedDogImageState) {
            return Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        state.img, 
                        fit: BoxFit.contain,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return const Center(child: CircularProgressIndicator());
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: ElevatedButton(
                    onPressed: () => _dogBloc.add(GetDogImageEvent()),
                    child: const Text("Следующий"),
                  ),
                ),
              ],
            );
          }
          
          return const SizedBox.shrink();
        },
      ),
    );
  }
}