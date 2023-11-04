import 'dart:convert';

import 'package:flutter/material.dart';

import '../../../common/constants/api_constants.dart';
import '../../../common/models/input_model.dart';
import '../../../common/models/output_model.dart';
import '../../../common/services/api_service.dart';

abstract class HistoryRepository {
 Future<void> deleteInput(int id);

  Future<void> deleteOutput(int id);

  Future<List<OutputModel>> getOutputs();

  Future<List<InputModel>> getInputs();
}

class HistoryRepositoryImp implements HistoryRepository {
  final APIService apiService;
  HistoryRepositoryImp(this.apiService);
  @override
  @override
  Future<void> deleteInput(int id) async {
    final response = await apiService.request(
      ApiConst.deleteInputIdPath(id),
      method: Method.delete,
    );
    debugPrint(response);
  }

 @override
  Future<void> deleteOutput(int id) async {
    final response = await apiService.request(
      ApiConst.deleteOutputPath(id),
      method: Method.delete,
    );

    debugPrint("response=$response");
  }

  @override
  Future<List<InputModel>> getInputs() async {
    final response = await apiService.request(
      ApiConst.inputGetPath,
    );

    final List<InputModel> inputs =
        List<Map<String, Object?>>.from(jsonDecode(response))
            .map((InputModel.fromJson))
            .toList();

    return inputs;
  }

  @override
  Future<List<OutputModel>> getOutputs() async {
    final response = await apiService.request(
      ApiConst.getOutputPath,
    );

    final List<OutputModel> outputs =
        List<Map<String, Object?>>.from(jsonDecode(response))
            .map((OutputModel.fromJson))
            .toList();

    return outputs;
  }
}
