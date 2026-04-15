part of "dog_bloc.dart";

sealed class DogState extends Equatable {
  const DogState();

  @override
  List<Object> get props => [];
}

final class DogInitial extends DogState {}
final class LoadingDogState extends DogState {}

class ErrorDogState extends DogState {
  final List<String> existingImages; 
  const ErrorDogState({this.existingImages = const []});

  @override
  List<Object> get props => [existingImages];
}
final class LoadedDogImageState extends DogState {
  final List<DogModel> listDogs;
  const LoadedDogImageState({required this.listDogs});

@override
  List<Object> get props => [listDogs];
}