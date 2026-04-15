import 'package:flutter_application_2/dog_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'api_service.dart';

part 'dog_event.dart';
part 'dog_state.dart';
class DogBloc extends Bloc<DogEvent, DogState> {
  final ApiService apiService = ApiService();

  DogBloc() : super(DogInitial()) {
    on<GetDogImageEvent>((event, emit) async {
      try {
        emit(LoadingDogState());
        List<DogModel> listDogs = await apiService.getDogs();
        emit(LoadedDogImageState(listDogs: listDogs));
        
      } catch (e) {
        print('Error fetching dogs: $e');
        emit(const ErrorDogState());
      }
    });
  }
}