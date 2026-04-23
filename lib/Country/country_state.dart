
import 'package:equatable/equatable.dart';


sealed class CountryState extends Equatable {
  const CountryState();

  @override
  List<Object> get props => [];
}

final class CountryInitial extends CountryState{}

final class LoadingCountryState extends CountryState{}

final class LoadedCountryState extends CountryState{
  final List<dynamic> list; 
  LoadedCountryState({required this.list});
    @override
  // TODO: implement props
  List<Object> get props => [list];
}

final class ErrorCountryState extends CountryState{}