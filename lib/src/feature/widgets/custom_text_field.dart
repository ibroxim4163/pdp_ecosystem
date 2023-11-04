import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../common/constants/app_colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    required this.controller,
    this.hintText,
    required this.text,
    this.helperText,
    this.validator,
    this.inputFormatter,
    super.key,
  });

  final String text;
  final String? hintText;
  final String? helperText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextInputFormatter? inputFormatter;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 15,
        right: 15,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 7,
              bottom: 12,
            ),
            child: Text(
              text,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: AppColors.blackColor,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Inter-Regular",
                  ),
            ),
          ),
          TextFormField(
            controller: controller,
            inputFormatters: inputFormatter != null
                ? [
                    inputFormatter!,
                  ]
                : null,
            validator: validator,
            decoration: InputDecoration(
              border: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.textFieldBorderColor,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(26),
                  )),
              hintText: hintText,
              hintStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: AppColors.textFieldHintColor,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Inter-Regular",
                    fontSize: 13,
                  ),
              counterText: helperText,
              isDense: true,
              counterStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: AppColors.mainColor,
                    fontSize: 12,
                    fontFamily: "Inter-Regular",
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
