part of "dog_bloc.dart";

sealed class DogEvent extends Equatable {
  const DogEvent();

  @override
  List<Object?> get props => [];
}

class GetDogImageEvent extends DogEvent {}