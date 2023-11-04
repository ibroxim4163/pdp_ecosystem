import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../common/constants/app_colors.dart';


class ProductsShimmer extends StatelessWidget {
  const ProductsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Shimmer.fromColors(
              baseColor: AppColors.shimmerColor,
              period: const Duration(seconds: 4),
              highlightColor: AppColors.shimmerHighlightColor,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 25,
                    width: double.infinity,
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColors.shimmerColor,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                  Divider(
                    color: AppColors.shimmerColor,
                    thickness: 1.5,
                    endIndent: 20,
                    indent: 20,
                  ),
                ],
              ),
            );
          },
          itemCount: 20,
        ),
      ),
    );
  }
}
