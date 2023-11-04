import 'dart:convert';

import 'package:flutter/material.dart';

import '../../../common/constants/api_constants.dart';
import '../../../common/models/product_model.dart';
import '../../../common/services/api_service.dart';
import '../models/post_output_model.dart';

abstract class OutputRepository {
  Future<List<ProductModel>> getProducts(int id);

  Future<PostOutputModel> postOutput(
    PostOutputModel outputModel,
  );

  Future<List<ProductModel>> search(String text);

  Future<void> deleteOutput(int id);
}

class OutputRepositoryImp implements OutputRepository {
  final APIService apiService;
  const OutputRepositoryImp(this.apiService);

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
  Future<PostOutputModel> postOutput(
    PostOutputModel outputModel,
  ) async {
    final response = await apiService.request(
      ApiConst.postOutputPath,
      method: Method.post,
      body: jsonEncode(outputModel.toJson()),
    );

    final PostOutputModel postedProduct =
        PostOutputModel.fromJson(jsonDecode(response));
    debugPrint(postedProduct.toString());

    return postedProduct;
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
  Future<void> deleteOutput(int id) async {
    final response = await apiService.request(
      ApiConst.deleteOutputPath(id),
      method: Method.delete,
    );

    debugPrint("response=$response");
  }
}
