import 'package:flutter/material.dart';

import '../../../common/constants/app_colors.dart';
import '../input_screen.dart';

class CustomCategoryDropDownButton extends StatefulWidget {
  final ValueNotifier<int> selectedCategory;
  const CustomCategoryDropDownButton({
    required this.selectedCategory,
    super.key,
  });

  @override
  State<CustomCategoryDropDownButton> createState() =>
      _CustomCategoryDropDownButtonState();
}

class _CustomCategoryDropDownButtonState
    extends State<CustomCategoryDropDownButton> {
  Categories category = Categories.values.first;

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
              category.category,
              style: const TextStyle(
                color: AppColors.blackColor,
              ),
            ),
            items: List.generate(
              Categories.values.length,
              (index) => DropdownMenuItem(
                value: Text(Categories.values[index].category),
                child: ListTile(
                  title: Text(Categories.values[index].category),
                ),
                onTap: () {
                  setState(
                    () {
                      category = Categories.values[index];
                      widget.selectedCategory.value =
                          Categories.values[index].id;
                     
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
