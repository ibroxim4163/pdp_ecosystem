import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/constants/custom_error.dart';
import '../../../common/models/input_model.dart';
import '../../../common/models/output_model.dart';
import '../repository/history_repository.dart';

part 'history_event.dart';
part 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  final HistoryRepositoryImp repository;
  HistoryBloc(this.repository)
      : super(
          const HistoryState(
            status: HistoryStatus.initial,
            inputs: [],
            outputs: [],
          ),
        ) {
    on<HistoryEvent>((event, emit) => switch (event) {
          GetInputsAndOutputsForHistory() => _getInputsAndOutputs(emit),
          HistoryLoadingEvent() => _loading(emit),
          DeleteInputEvent e => _deleteInput(e, emit),
          DeleteOutputEvent e => _deleteOutput(e, emit),
        });
  }

  Future<void> _getInputsAndOutputs(
    Emitter<HistoryState> emit,
  ) async {
    emit(
      HistoryState(
        status: HistoryStatus.loading,
        inputs: state.inputs,
        outputs: state.outputs,
      ),
    );
    try {
      List<InputModel> inputs = await repository.getInputs();
      List<OutputModel> outputs = await repository.getOutputs();
      emit(
        HistoryState(
          status: HistoryStatus.loaded,
          inputs: inputs,
          outputs: outputs,
        ),
      );
    } catch (e) {
      if (e is InternetConnectionError) {
        emit(
          HistoryState(
            status: HistoryStatus.error,
            inputs: state.inputs,
            outputs: state.outputs,
            message: "Check Your Internet Connection",
          ),
        );
      }
      debugPrint(e.toString());
    }
  }

  Future<void> _loading(Emitter<HistoryState> emit) async {}

  Future<void> _deleteInput(
    DeleteInputEvent e,
    Emitter<HistoryState> emit,
  ) async {
    try {
      await repository.deleteInput(e.id);
      List<InputModel> inputs = await repository.getInputs();
      List<OutputModel> outputs = await repository.getOutputs();
      emit(
        HistoryState(
          status: HistoryStatus.loaded,
          inputs: inputs,
          outputs: outputs,
        ),
      );
    } catch (e) {
      if (e is InternetConnectionError) {
        emit(
          HistoryState(
            status: HistoryStatus.error,
            inputs: state.inputs,
            outputs: state.outputs,
            message: "Check Your Internet Connection",
          ),
        );
      } else {
        emit(
          HistoryState(
            status: HistoryStatus.error,
            inputs: state.inputs,
            outputs: state.outputs,
            message: "Something went wrong",
          ),
        );
      }
    }
  }

  Future<void> _deleteOutput(
    DeleteOutputEvent e,
    Emitter<HistoryState> emit,
  ) async {
    try {
      await repository.deleteOutput(e.id);
      List<InputModel> inputs = await repository.getInputs();
      List<OutputModel> outputs = await repository.getOutputs();
      emit(
        HistoryState(
          status: HistoryStatus.loaded,
          inputs: inputs,
          outputs: outputs,
        ),
      );
    } catch (e) {
      if (e is InternetConnectionError) {
        emit(
          HistoryState(
            status: HistoryStatus.error,
            inputs: state.inputs,
            outputs: state.outputs,
            message: "Check Your Internet Connection",
          ),
        );
      } else {
        emit(
          HistoryState(
            status: HistoryStatus.error,
            inputs: state.inputs,
            outputs: state.outputs,
            message: "Something went wrong",
          ),
        );
      }
    }
  }
}
