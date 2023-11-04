import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/constants/custom_error.dart';
import '../../../common/repositories/api_repository2.dart';
import '../models/balance_model.dart';

part 'balance_event.dart';
part 'balance_state.dart';

class BalanceBloc extends Bloc<BalanceEvent, BalanceState> {
  final ApiRepositoryImp repository;

  BalanceBloc(this.repository) : super(BalanceState()) {
    on<BalanceEvent>(
      (event, emit) async {
        try {
          await repository.postBalance(event.balanceModel);
        } catch (e) {
          if (e is InternetConnectionError) {
            emit(BalanceErrorState(e.message));
          } else {
            emit(BalanceErrorState("Something went wrong"));
          }
        }
      },
    );
  }
}
