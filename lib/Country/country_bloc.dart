import 'package:flutter_application_2/Country/country_event.dart';
import 'package:flutter_application_2/Country/country_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talker_flutter/talker_flutter.dart';
import '../api_service.dart';

class CountryBloc extends Bloc<CountryEvent, CountryState> {
  final ApiService apiService = ApiService();
  final talker = TalkerFlutter.init(); 

  CountryBloc() : super(CountryInitial()) {
    on<SearchCountryEvent>(_searchCountry);   
  }

  Future<void> _searchCountry(
    SearchCountryEvent event, 
    Emitter<CountryState> emit,
  ) async { 
    try {
      emit(LoadingCountryState());
      final countryModel = await apiService.searchCountries(event.nameCountry);
      emit(LoadedCountryState(list: countryModel));
    } catch (e, s) {
      talker.handle(e, s, 'Ошибка: ${event.nameCountry}');
      emit(ErrorCountryState());
    }
  }
}