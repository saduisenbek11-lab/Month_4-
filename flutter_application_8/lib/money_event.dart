import 'package:equatable/equatable.dart';

sealed class MoneyEvent extends Equatable {
  const MoneyEvent();
  @override
  List<Object?> get props => [];
}

class GetMoneyEvent extends MoneyEvent {}