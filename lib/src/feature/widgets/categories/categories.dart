import 'package:flutter/material.dart';

import '../../../common/constants/app_icons.dart';
import 'custom_card.dart';

class CustomCategories extends StatefulWidget {
  const CustomCategories({
    this.onTap,
    super.key,
  });
  final void Function()? onTap;

  @override
  State<CustomCategories> createState() => _CustomCategoriesState();
}

class _CustomCategoriesState extends State<CustomCategories> {
  List<String> text = [
    "Food",
    "Office",
    "Electronics",
    "Household",
    "Building",
    "Another"
  ];
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 15,
          right: 15,
          top: 45,
        ),
        child: GridView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: text.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            return CustomCard(
              onPressed: widget.onTap,
              imageUrl: AppIcons.categories[index],
              text: text[index],
            );
          },
        ),
      ),
    );
 
  }
}
