import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'api_service.dart';

part 'dog_event.dart';
part 'dog_state.dart';

class DogBloc extends Bloc<DogEvent, DogState> {
  final ApiService apiService;

  DogBloc({required this.apiService}) : super(DogInitial()) {
    on<GetDogImageEvent>((event, emit) async {
      try {
        emit(LoadingDogState());
        final String img = await apiService.getCatImage();
        emit(LoadedDogImageState(img: img));
      } catch (e) {
        emit(ErrorDogState());
      }
    });
  }
}