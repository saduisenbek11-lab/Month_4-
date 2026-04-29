
import 'package:equatable/equatable.dart';

sealed class CountryEvent extends Equatable {
  const CountryEvent();
}
  final class SearchCountryEvent extends CountryEvent{
const SearchCountryEvent ({required this.nameCountry});

   final String nameCountry;

  @override
  List<Object?> get props => [nameCountry];
  }
  
