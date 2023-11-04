import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../common/constants/app_colors.dart';

class CustomCategoryShimmer extends StatelessWidget {
  const CustomCategoryShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 15,
            right: 15,
            top: 45,
          ),
          child: GridView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: 6,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              return Shimmer.fromColors(
                baseColor: AppColors.shimmerColor,
                period: const Duration(seconds: 4),
                highlightColor: AppColors.shimmerHighlightColor,
                child: const Card(),
              );
            },
          ),
        ),
      ),
    );
  }
}
