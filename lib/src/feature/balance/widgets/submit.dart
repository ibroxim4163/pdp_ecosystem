import 'package:flutter/material.dart';

import '../../../common/constants/app_colors.dart';
import '../../../common/constants/app_icons.dart';

class Submit extends StatefulWidget {
  final PageController controller;
  const Submit({
    required this.controller,
    super.key,
  });

  @override
  State<Submit> createState() => _SubmitState();
}

class _SubmitState extends State<Submit> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 2),
      () => widget.controller.jumpToPage(0),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(20),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Balance",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 40,
              ),
            ),
            Spacer(),
            Center(
              child: Text(
                " A report has been sent\nto your Telegram account",
                style: TextStyle(
                  color: AppColors.mainColor,
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: 15),
            Image(
              image: AssetImage(AppIcons.sendDone),
              height: 60,
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
