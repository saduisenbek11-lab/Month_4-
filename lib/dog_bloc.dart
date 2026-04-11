import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'dog_event.dart';
part 'dog_state.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<String> getCatImage() async {
    final Response response = await _dio.get('https://api.thecatapi.com/v1/images/search');
    return response.data[0]['url'];
  }
}
class DogBloc extends Bloc<DogEvent, DogState> {
  final ApiService apiService = ApiService();

  DogBloc() : super(DogInitial()) {
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