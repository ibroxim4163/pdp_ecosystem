import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/constants/app_colors.dart';
import '../../widgets/app_buttons.dart';
import '../../widgets/custom_text_field.dart';
import '../bloc/input_bloc.dart';
import '../models/post_product_model.dart';
import 'category_ddb.dart';
import 'unit_ddb.dart';

class AddProductDialog extends StatefulWidget {
  final int categoryId;
  const AddProductDialog({
    required this.categoryId,
    super.key,
  });

  @override
  State<AddProductDialog> createState() => _AddProductDialogState();
}

class _AddProductDialogState extends State<AddProductDialog>
    with AddProductMixin {
  final ValueNotifier<Unit> selectedUnit = ValueNotifier(
    Unit.values.first,
  );
  final ValueNotifier<int> selectedCategoryId = ValueNotifier(2);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Dialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(35),
          ),
        ),
        child: SizedBox(
          height: size.height * 0.9,
          child: Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Text(
                        "Unit",
                        style: Theme.of(context).textTheme.titleMedium!.copyWith(
                              color: AppColors.blackColor,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Inter-Regular",
                            ),
                      ),
                    ),
                  ),
                  CustomCategoryDropDownButton(
                    selectedCategory: selectedCategoryId,
                  ),
                  CustomTextField(
                    controller: nameController,
                    text: "Name",
                    validator: validateName,
                  ),
                  CustomTextField(
                    controller: countController,
                    text: "Count",
                    inputFormatter: FilteringTextInputFormatter.digitsOnly,
                    validator: validateCount,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Text(
                        "Unit",
                        style: Theme.of(context).textTheme.titleMedium!.copyWith(
                              color: AppColors.blackColor,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Inter-Regular",
                            ),
                      ),
                    ),
                  ),
                  CustomUnitDropDownButton(
                    selectedUnit: selectedUnit,
                  ),
                  CustomTextField(
                    controller: priceController,
                    text: "Price",
                    validator: validatePrice,
                  ),
                  const SizedBox(height: 15),
                  CustomButton(
                    onCancelled: () => Navigator.pop(context),
                    onSubmitted: () {
                      if (_formKey.currentState!.validate()) {
                        final PostProductModel productModel = PostProductModel(
                          category: selectedCategoryId.value,
                          name: nameController.text,
                          count: int.tryParse(countController.text) ?? 1,
                          unit: selectedUnit.value,
                          price: priceController.text,
                        );
                        context.read<InputBloc>().add(
                              PostProductEvent(
                                categoryId: widget.categoryId,
                                product: productModel,
                              ),
                            );
                        Navigator.pop(context);
                        // Navigator.pushReplacement(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => const PageBuilder(),
                        //   ),
                        // );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

mixin AddProductMixin on State<AddProductDialog> {
  late final TextEditingController categoryController;
  late final TextEditingController nameController;
  late final TextEditingController countController;
  late final TextEditingController unitController;
  late final TextEditingController priceController;

  @override
  void initState() {
    categoryController = TextEditingController();
    nameController = TextEditingController();
    countController = TextEditingController();
    unitController = TextEditingController();
    priceController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    categoryController.dispose();
    nameController.dispose();
    countController.dispose();
    unitController.dispose();
    priceController.dispose();
    super.dispose();
  }

  String? validateCategory(String? value) {
    if (value == null || value.isEmpty) {
      return "Please write category number";
    }
    return null;
  }

  String? validateCount(String? value) {
    if (value == null || value.isEmpty) {
      return "Please write count of product";
    }
    return null;
  }

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return "Please write product name";
    }
    return null;
  }

  String? validatePrice(String? value) {
    if (value == null || value.isEmpty) {
      return "Please write price of product";
    }
    return null;
  }
}
