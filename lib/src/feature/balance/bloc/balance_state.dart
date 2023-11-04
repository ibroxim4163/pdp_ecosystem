part of 'balance_bloc.dart';

class BalanceState extends Equatable {
  @override
  List<Object> get props => [];
}

class BalanceErrorState extends BalanceState {
  final String message;
  BalanceErrorState(this.message);
}
