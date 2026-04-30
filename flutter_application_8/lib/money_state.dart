import 'package:equatable/equatable.dart';
import 'money_model.dart';

sealed class MoneyState extends Equatable {
  const MoneyState();
  @override
  List<Object> get props => [];
}

final class MoneyInitial extends MoneyState {}
final class LoadingMoney extends MoneyState {}
final class LoadedMoney extends MoneyState {
  final List<CoinModel> list;
  const LoadedMoney({required this.list});

  @override
  List<Object> get props => [list];
}
final class ErrorMoney extends MoneyState {}