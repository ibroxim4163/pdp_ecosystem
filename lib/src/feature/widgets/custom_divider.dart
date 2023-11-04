import 'package:flutter/material.dart';

import '../../common/constants/app_colors.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 1.5,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.dividerColor,
          boxShadow: [
            BoxShadow(
              color: AppColors.dividerShadowColor,
            )
          ],
        ),
      ),
    );
  }
}
