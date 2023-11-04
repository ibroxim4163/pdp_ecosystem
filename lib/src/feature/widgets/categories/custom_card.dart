import 'package:flutter/material.dart';

import '../../../common/constants/app_colors.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.imageUrl,
    required this.text,
    this.onPressed,
  });

  final String imageUrl;
  final String text;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Card(
        elevation: 10,
        shadowColor: AppColors.dividerShadowColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(26),
          ),
        ),
        color: const Color.fromARGB(255, 143, 221, 192),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.whiteColor,
                shadows: [
                  const Shadow(
                    color: AppColors.mainColor,
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
            Image(
              image: AssetImage(imageUrl),
              width: MediaQuery.sizeOf(context).width * .25,
            ),
          ],
        ),
      ),
    );
  }
}
