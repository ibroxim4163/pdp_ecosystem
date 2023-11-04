import 'package:flutter/material.dart';

import '../../common/constants/app_colors.dart';


class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onSubmitted,
    required this.onCancelled,
  });

  final void Function()? onSubmitted;
  final void Function()? onCancelled;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(
        left: 15,
        right: 15,
      ),
      child: Column(
        children: [
          ElevatedButton(
            onPressed: onSubmitted,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.mainColor,
              shape: const StadiumBorder(),
              fixedSize: Size(
                size.width * 0.944,
                size.height * 0.059,
              ),
            ),
            child: Text(
              "Submit",
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: AppColors.whiteColor,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Inter-Regular",
                  ),
            ),
          ),
          SizedBox(height: size.height * 0.019),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
                side: const BorderSide(
                  width: 1.5,
                  color: AppColors.mainColor,
                ),
                fixedSize: Size(
                  size.width * 0.944,
                  size.height * 0.059,
                ),
                shape: const StadiumBorder()),
            onPressed: onCancelled,
            child: Text(
              "Cancel",
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: AppColors.redColor,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Inter-Regular",
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
