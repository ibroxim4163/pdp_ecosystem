
import 'package:flutter/material.dart';

import '../../../common/constants/app_colors.dart';


class CustomHistoryProducts extends StatelessWidget {
  final String productName;
  final DateTime date;
  const CustomHistoryProducts({
    required this.productName,
    required this.date,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 2,
          child: Text(
            productName,
            maxLines: 2,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.w700,
                  color: AppColors.blackColor,
                  fontFamily: "Inter-Regular",
                ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 15,
              right: 8,
            ),
            child: Align(
              alignment: Alignment.topRight,
              child: Text(
                "${date.day}.${date.month}.${date.year}",
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontWeight: FontWeight.w700,
                      color: AppColors.mainColor,
                      fontFamily: "Inter-Regular",
                    ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
