part of 'input_bloc.dart';

sealed class InputPageEvent extends Equatable {
  const InputPageEvent();
}

class InputPageGetProducts extends InputPageEvent {
  final int id;
  const InputPageGetProducts(this.id);

  @override
  List<Object?> get props => [];
}

class PostInputEvent extends InputPageEvent {
  final PostInputModel inputModel;

  const PostInputEvent(this.inputModel);

  @override
  List<Object?> get props => [inputModel];
}

class PostProductEvent extends InputPageEvent {
  final PostProductModel product;
  final int categoryId;
  const PostProductEvent({
    required this.product,
    required this.categoryId,
  });

  @override
  List<Object?> get props => [product];
}

class InputPageSearchEvent extends InputPageEvent {
  final String text;
  final int id;
  const InputPageSearchEvent(
    this.text,
    this.id,
  );

  @override
  List<Object?> get props => [text];
}



class RefreshInput extends InputPageEvent {
  final int categoryId;
  const RefreshInput(this.categoryId);

  @override
  List<Object?> get props => [];
}
