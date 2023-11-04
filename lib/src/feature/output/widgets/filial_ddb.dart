import 'package:flutter/material.dart';

import '../../../common/constants/app_colors.dart';
import 'output_dialog.dart';

class CustomDropDownButton extends StatefulWidget {
  final ValueNotifier<Filials> selectedFilial;
  const CustomDropDownButton({
    required this.selectedFilial,
    super.key,
  });

  @override
  State<CustomDropDownButton> createState() => _CustomDropDownButtonState();
}

class _CustomDropDownButtonState extends State<CustomDropDownButton> {
  String filial = Filials.values.first.frontend;

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
            Radius.circular(26),
          ),
        ),
        child: Theme(
          data: ThemeData(
            hoverColor: AppColors.whiteColor,
            splashColor: null,
          ),
          child: DropdownButton(
            elevation: 0,
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(50),
            ),
            dropdownColor: AppColors.whiteColor,
            focusColor: AppColors.whiteColor,
            underline: const SizedBox(),
            isExpanded: true,
            hint: Text(
              filial,
              style: const TextStyle(
                color: AppColors.blackColor,
              ),
            ),
            items: List.generate(
              5,
              (index) => DropdownMenuItem(
                value: Text(Filials.values[index].frontend),
                child: ListTile(
                  title: Text(Filials.values[index].frontend),
                ),
                onTap: () {
                  setState(
                    () {
                      filial = Filials.values[index].frontend;
                      widget.selectedFilial.value = Filials.values[index];
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
