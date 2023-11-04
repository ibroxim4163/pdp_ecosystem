import 'package:flutter/material.dart';

import '../../../common/constants/app_colors.dart';
import 'bottom_item.dart';

class CustomSuperUserBottom extends StatefulWidget {
  final Function(int value) onPressed;
  final bool isSupersUser;
  const CustomSuperUserBottom({
    required this.isSupersUser,
    required this.onPressed,
    super.key,
  });

  @override
  State<CustomSuperUserBottom> createState() => _CustomSuperUserBottomState();
}

class _CustomSuperUserBottomState extends State<CustomSuperUserBottom> {
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(18),
        topRight: Radius.circular(18),
      ),
      child: BottomAppBar(
        height: 60,
        color: AppColors.bottomColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            BottomItem(
              onTap: () {
                widget.onPressed(0);
                setState(() => currentPage = 0);
              },
              currentPage: currentPage,
              label: "Input",
              index: 0,
            ),
            BottomItem(
              onTap: () {
                widget.onPressed(1);
                setState(() => currentPage = 1);
              },
              currentPage: currentPage,
              label: "Output",
              index: 1,
            ),
            BottomItem(
              onTap: () {
                widget.onPressed(2);
                setState(() => currentPage = 2);
              },
              currentPage: currentPage,
              label: "Balance",
              index: 2,
            ),
            BottomItem(
              onTap: () {
                widget.onPressed(3);
                setState(() => currentPage = 3);
              },
              currentPage: currentPage,
              label: "History",
              index: 3,
            ),
          ],
        ),
      ),
    );
  }
}

class CustomNotSuperUserBottom extends StatefulWidget {
  final Function(int value) onPressed;
  const CustomNotSuperUserBottom({
    required this.onPressed,
    super.key,
  });

  @override
  State<CustomNotSuperUserBottom> createState() =>
      _CustomNotSuperUserBottomState();
}

class _CustomNotSuperUserBottomState extends State<CustomNotSuperUserBottom> {
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(18),
        topRight: Radius.circular(18),
      ),
      child: BottomAppBar(
        height: 60,
        color: AppColors.bottomColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            
            BottomItem(
              onTap: () {
                widget.onPressed(0);
                setState(() => currentPage = 0);
              },
              currentPage: currentPage,
              label: "Output",
              index: 0,
            ),
           
            BottomItem(
              onTap: () {
                widget.onPressed(1);
                setState(() => currentPage = 1);
              },
              currentPage: currentPage,
              label: "History",
              index: 1,
            ),
          ],
        ),
      ),
    );
    ;
  }
}
