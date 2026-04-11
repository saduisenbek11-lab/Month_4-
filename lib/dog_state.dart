part of "dog_bloc.dart";

sealed class DogState extends Equatable {
  const DogState();

  @override
  List<Object> get props => [];
}

final class DogInitial extends DogState {}
final class LoadingDogState extends DogState {}
final class ErrorDogState extends DogState {}

final class LoadedDogImageState extends DogState {
  final String img;
  const LoadedDogImageState({required this.img});

  @override
  List<Object> get props => [img];
}