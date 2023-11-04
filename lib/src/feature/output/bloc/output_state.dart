part of 'output_bloc.dart';

sealed class OutputState extends Equatable {
  final List<ProductModel> products;
  const OutputState({
    required this.products,
  });
}

class OutputRefreshState extends OutputState {
  const OutputRefreshState({
    required super.products,
  });

  @override
  List<Object?> get props => [products];
}

class OutputErrorState extends OutputState {
  final String message;

  const OutputErrorState({
    required super.products,
    required this.message,
  });

  @override
  List<Object?> get props => [products, message];
}

class OutputLoadingState extends OutputState {
  const OutputLoadingState({required super.products});

  @override
  List<Object?> get props => [];
}
