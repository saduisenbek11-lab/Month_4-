
import 'package:equatable/equatable.dart';

sealed class CountryEvent extends Equatable {
  const CountryEvent();
}
  final class SearchContryEvent extends CountryEvent{
const SearchContryEvent ({required this.nameCountry});

   final String nameCountry;

  @override
  List<Object?> get props => [nameCountry];
  }
  
