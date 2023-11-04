part of 'input_bloc.dart';

enum InputStatus {
  loading,
  loaded,
  error,
  initial,
}

abstract class InputState extends Equatable {
  final List<ProductModel> products;
  const InputState({required this.products});

  @override
  List<Object?> get props => [products];
}

class InputLoadingState extends InputState {
  const InputLoadingState({required super.products});
}

class InputLoadedState extends InputState {
  const InputLoadedState({required super.products});
}

class InputSuccessCratedState extends InputState {
  const InputSuccessCratedState({required super.products});

}

class InputErrorState extends InputState {
  final String message;

  const InputErrorState({
    required super.products,
    required this.message,
  });

  @override
  List<Object?> get props => [message,products];
}
