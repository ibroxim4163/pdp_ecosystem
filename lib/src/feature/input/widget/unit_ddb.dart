import 'package:flutter/material.dart';

import '../../../common/constants/app_colors.dart';
import '../models/post_product_model.dart';

class CustomUnitDropDownButton extends StatefulWidget {
  final ValueNotifier<Unit> selectedUnit;
  const CustomUnitDropDownButton({
    required this.selectedUnit,
    super.key,
  });

  @override
  State<CustomUnitDropDownButton> createState() =>
      _CustomUnitDropDownButtonState();
}

class _CustomUnitDropDownButtonState extends State<CustomUnitDropDownButton> {
  String unit = Unit.values.first.frontend;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.textFieldBorderColor,
            width: 1,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(40),
          ),
        ),
        child: Theme(
          data: ThemeData(
            hoverColor: AppColors.whiteColor,
            splashColor: null,
          ),
          child: DropdownButton(
            borderRadius: const BorderRadius.all(
              Radius.circular(40),
            ),
            elevation: 0,
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
            ),
            dropdownColor: AppColors.whiteColor,
            focusColor: AppColors.whiteColor,
            underline: const SizedBox(),
            isExpanded: true,
            hint: Text(
              unit,
              style: const TextStyle(
                color: AppColors.blackColor,
              ),
            ),
            items: List.generate(
              Unit.values.length,
              (index) => DropdownMenuItem(
                value: Text(Unit.values[index].frontend),
                child: ListTile(
                  title: Text(Unit.values[index].frontend),
                ),
                onTap: () {
                  setState(
                    () {
                      unit = Unit.values[index].frontend;
                      widget.selectedUnit.value = Unit.values[index];
                    },
                  );
                },
              ),
            ),
            onChanged: (value) {},
          ),
        ),
      ),
    );
  }
}
