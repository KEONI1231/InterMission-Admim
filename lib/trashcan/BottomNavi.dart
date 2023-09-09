import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final Function? onLeftArrowTap;
  final Function? onRightArrowTap;

  CustomBottomNavigationBar({
    this.onLeftArrowTap,
    this.onRightArrowTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          IconButton(
            icon: Icon(Icons.arrow_circle_left_outlined),
            onPressed: onLeftArrowTap as void Function()?,
          ),
          SizedBox(width: 20),  // 아이콘 간 간격 조절
          IconButton(
            icon: Icon(Icons.arrow_circle_right_outlined),
            onPressed: onRightArrowTap as void Function()?,
          ),
        ],
      ),
    );
  }
}
