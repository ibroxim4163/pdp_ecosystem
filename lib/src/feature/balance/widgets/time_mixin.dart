import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/balance_bloc.dart';
import '../models/balance_model.dart';
import 'time.dart';

mixin TimeMixin on State<Time> {
  late final TextEditingController fromController;
  late final TextEditingController untilController;
  final ValueNotifier<String> isCorrectDate = ValueNotifier("");
  final formKey = GlobalKey<FormState>();
  DateTime startTime = DateTime.now();
  DateTime endTime = DateTime.now();
  @override
  void initState() {
    fromController = TextEditingController();
    untilController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    fromController.dispose();
    untilController.dispose();
    super.dispose();
  }

  String? endIsValidate(String? value) {
    final regex = RegExp(
        r"(0[1-9]|1[0-9]|2[0-9]|3[0-1])-(0[1-9]|1[0-2])-(201[4-9]|20[0-9][0-9])");

    if (value != null && value.length < 10) {
      return "Invalid date";
    }
    if (!regex.hasMatch(value!)) {
      return "Date is not valid";
    }
    String formattedString = value.split("-").reversed.join("-");

    endTime = DateTime.tryParse(formattedString) ?? DateTime.now();
    return null;
  }

  String? startIsValidate(String? value) {
    final regex = RegExp(
        r"(0[1-9]|1[0-9]|2[0-9]|3[0-1])-(0[1-9]|1[0-2])-(201[4-9]|20[0-9][0-9])");
    if (value != null && value.length < 10) {
      return "Invalid date";
    }
    if (!regex.hasMatch(value!)) {
      return "Date is not valid";
    }
    String formattedString = value.split("-").reversed.join("-");

    startTime = DateTime.tryParse(formattedString) ?? DateTime.now();
    if (startTime.isAfter(endTime)) {
      return "start time can not be after end time";
    }
    print(startTime);
    print(endTime);
    return null;
  }

  void onSubmitted() {
    if (formKey.currentState!.validate()) {
      widget.controller.jumpToPage(1);
      String from =
          "${startTime.year}-${startTime.month.toString().padLeft(2, "0")}-"
          "${startTime.day.toString().padLeft(2, "0")}";

      String until =
          "${endTime.year}-${endTime.month.toString().padLeft(2, "0")}-"
          "${endTime.day.toString().padLeft(2, "0")}";

      final BalanceModel balanceModel = BalanceModel(
        from: from,
        until: until,
      );
      context.read<BalanceBloc>().add(
            BalanceEvent(balanceModel),
          );
      fromController.clear();
      untilController.clear();
    }
  }
}
