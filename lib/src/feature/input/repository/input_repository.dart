import 'dart:convert';

import 'package:flutter/material.dart';

import '../../../common/constants/api_constants.dart';
import '../../../common/models/product_model.dart';
import '../../../common/services/api_service.dart';
import '../models/post_input_model.dart';
import '../models/post_product_model.dart';
import '../models/posted_input_model.dart';

abstract class InputRepository {
  Future<List<ProductModel>> getProducts(int id);

  Future<PostedInputModel> postInput(
    PostInputModel inputModel,
  );

  Future<ProductModel> postProduct(
    PostProductModel productModel,
  );

  Future<List<ProductModel>> search(String text);

  Future<void> deleteInput(int id);
}

class InputRepositoryImp implements InputRepository {
  final APIService apiService;
  const InputRepositoryImp(this.apiService);

  @override
  Future<List<ProductModel>> getProducts(int id) async {
    final response = await apiService.request(
      ApiConst.categoryIdPath(id),
    );
    final products = List<Map<String, Object?>>.from(
      jsonDecode(response),
    ).map(ProductModel.fromJson).toList();

    return products;
  }

  @override
  Future<PostedInputModel> postInput(PostInputModel inputModel) async {
    final response = await apiService.request(
      ApiConst.inputPostPath,
      method: Method.post,
      body: jsonEncode(inputModel.toJson()),
    );

    final PostedInputModel postedProduct =
        PostedInputModel.fromJson(jsonDecode(response));
    debugPrint(postedProduct.toString());

    return postedProduct;
  }

  @override
  Future<ProductModel> postProduct(
    PostProductModel productModel,
  ) async {
    final response = await apiService.request(
      ApiConst.createProductPath,
      method: Method.post,
      body: jsonEncode(productModel.toJson()),
    );

    final ProductModel product = ProductModel.fromJson(jsonDecode(response));
    debugPrint(product.toString());

    return product;
  }

  @override
  Future<List<ProductModel>> search(String text) async {
    final response = await apiService.request(
      "${ApiConst.searchPath}$text",
    );

    final products = List<Map<String, Object?>>.from(jsonDecode(response))
        .map(ProductModel.fromJson)
        .toList();

    return products;
  }

  @override
  Future<void> deleteInput(int id) async {
    print("Came-----------------------");
    final response = await apiService.request(
      ApiConst.deleteInputIdPath(id),
      method: Method.delete,
    );
    debugPrint("Response--------------------------$response");
  }
}
