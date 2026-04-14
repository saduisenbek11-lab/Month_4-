import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'api_service.dart';

part 'dog_event.dart';
part 'dog_state.dart';

class DogBloc extends Bloc<DogEvent, DogState> {
  final ApiService apiService;
  final List<String> _currentImages = [];

  DogBloc({required this.apiService}) : super(DogInitial()) {
    on<GetDogImageEvent>((event, emit) async {
      try {
        if (_currentImages.isEmpty) emit(LoadingDogState());
        final String newImg = await apiService.getCatImage();
        _currentImages.add(newImg);
        
        emit(LoadedDogImageState(images: List.from(_currentImages)));
        
      } catch (e) {
       emit(ErrorDogState(existingImages: List.from(_currentImages)));
      }
    });
  }
}