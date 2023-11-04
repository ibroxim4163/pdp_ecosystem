import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/constants/custom_error.dart';
import '../../../common/models/product_model.dart';
import '../models/post_output_model.dart';
import '../repository/output_repository.dart';

part 'output_event.dart';
part 'output_state.dart';

class OutputBloc extends Bloc<OutputEvent, OutputState> {
  final OutputRepositoryImp repository;
  OutputBloc(this.repository)
      : super(
          const OutputRefreshState(
            products: [],
          ),
        ) {
    on<OutputEvent>((event, emit) => switch (event) {
          OutputPageGetProducts e => _getProducts(e, emit),
          PostOutputEvent e => _postOutput(e, emit),
          OutputPageSearch e => _searchOutput(e, emit),
          RefreshOutputPage e => _refresh(e, emit),
        });
  }

  Future<void> _getProducts(
    OutputPageGetProducts e,
    Emitter<OutputState> emit,
  ) async {
    emit(
      OutputLoadingState(
        products: state.products,
      ),
    );
    try {
      List<ProductModel> products = await repository.getProducts(e.id);
      emit(
        OutputRefreshState(
          products: products,
        ),
      );
    } catch (e) {
      if (e is InternetConnectionError) {
        emit(
          OutputErrorState(
            products: state.products,
            message: "Check Your Network",
          ),
        );
      } else {
        emit(
          OutputErrorState(
            products: state.products,
            message: e.toString(),
          ),
        );
      }
    }
  }

  Future<void> _postOutput(
    PostOutputEvent e,
    Emitter<OutputState> emit,
  ) async {
    try {
      final response = await repository.postOutput(e.outputModel);
    debugPrint(response.toString());
    } catch (e) {
      if (e is InternetConnectionError) {
        emit(
          OutputErrorState(
            products: state.products,
            message: "Check Your Network",
          ),
        );
      } else {
        emit(
          OutputErrorState(
            products: state.products,
            message: e.toString(),
          ),
        );
      }
    }
    
  }

  Future<void> _searchOutput(
    OutputPageSearch e,
    Emitter<OutputState> emit,
  ) async {
    try {
       emit(OutputLoadingState(products: state.products));
    List<ProductModel> searchedProducts = [];
    if (e.text.isEmpty) {
      searchedProducts = await repository.getProducts(e.id);
    } else {
      searchedProducts = await repository.search(e.text);
    }
    emit(
      OutputRefreshState(
        products: searchedProducts,
      ),
    );
    }catch (e) {
      if (e is InternetConnectionError) {
        emit(
          OutputErrorState(
            products: state.products,
            message: "Check Your Network",
          ),
        );
      } else {
        emit(
          OutputErrorState(
            products: state.products,
            message: e.toString(),
          ),
        );
      }
    }
  }

  Future<void> _refresh(RefreshOutputPage e, Emitter<OutputState> emit) async {
    try {
      List<ProductModel> products = await repository.getProducts(e.categoryId);
      emit(
        OutputRefreshState(
          products: products,
        ),
      );
    } catch (e) {
      if (e is InternetConnectionError) {
        emit(
          OutputErrorState(
            products: state.products,
            message: "Check Your Network",
          ),
        );
      } else {
        emit(
          OutputErrorState(
            products: state.products,
            message: e.toString(),
          ),
        );
      }
    }
  }
}
