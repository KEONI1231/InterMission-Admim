import 'package:flutter/material.dart';
import 'package:intermission_admin/Constants/Color.dart';

class CustomIconBtn extends StatelessWidget {

  const CustomIconBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.transparent,
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(24), // 이 값을 조정하여 원하는 splash 반경을 설정
        onTap: () {
          Navigator.pop(context);
        },
        child: Icon(

          //Icons.arrow_circle_left_outlined,
          Icons.keyboard_backspace,
          color: purpleBtnColor,
          size: 40,
        ),
      ),
    );
  }
}
