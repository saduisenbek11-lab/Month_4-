import 'package:flutter_bloc/flutter_bloc.dart';
import 'api_service.dart';
import 'money_event.dart';
import 'money_model.dart';
import 'money_state.dart';

class MoneyBloc extends Bloc<MoneyEvent, MoneyState> {
  final ApiService apiService;

  MoneyBloc(this.apiService) : super(MoneyInitial()) {
    on<GetMoneyEvent>((event, emit) async {
      emit(LoadingMoney());
      try {
        final List<CoinModel> list = await apiService.getCoins();
        emit(LoadedMoney(list: list));
      } catch (e) {
        emit(ErrorMoney());
      }
    });
  }
}