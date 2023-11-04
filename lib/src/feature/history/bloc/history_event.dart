part of 'history_bloc.dart';

sealed class HistoryEvent extends Equatable {
  const HistoryEvent();

  @override
  List<Object?> get props => [];
}

class GetInputsAndOutputsForHistory extends HistoryEvent {
  const GetInputsAndOutputsForHistory();
}

class HistoryLoadingEvent extends HistoryEvent {
  const HistoryLoadingEvent();
}

class DeleteInputEvent extends HistoryEvent {
  final int id;
  const DeleteInputEvent(this.id);
}

class DeleteOutputEvent extends HistoryEvent {
  final int id;
  const DeleteOutputEvent(this.id);
}
