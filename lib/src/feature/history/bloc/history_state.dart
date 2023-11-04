part of 'history_bloc.dart';

enum HistoryStatus { loading, loaded, initial, error }

class HistoryState extends Equatable {
  final HistoryStatus status;
  final List<InputModel> inputs;
  final List<OutputModel> outputs;
  final String? message;
  const HistoryState({
    required this.status,
    required this.inputs,
    required this.outputs,
    this.message,
  });

  @override
  List<Object> get props => [status, inputs, outputs];
}
