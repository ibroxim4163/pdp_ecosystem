import 'package:flutter/material.dart';

import '../../../common/constants/app_colors.dart';


class BottomItem extends StatelessWidget {
  final void Function() onTap;
  final int currentPage;
  final int index;
  final String label;

  const BottomItem({
    super.key,
    required this.onTap,
    required this.currentPage,
    required this.label,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: AppColors.whiteColor,
              fontSize: 15,
              fontWeight: FontWeight.w600,
              shadows: [
                const Shadow(
                  color: AppColors.bottomColor,
                  blurRadius: 3,
                  offset: Offset(0, 0),
                ),
                Shadow(
                  color: AppColors.bottomShadowColor,
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          currentPage == index
              ? Container(
                  color: AppColors.whiteColor,
                  height: 2,
                  width: 45,
                )
              : const SizedBox.shrink()
        ],
      ),
    );
  }
}
