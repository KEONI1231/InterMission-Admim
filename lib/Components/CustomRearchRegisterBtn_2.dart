import 'package:flutter/material.dart';
import 'package:intermission_admin/Constants/Color.dart';

class CustomResearchRegisterBtn extends StatefulWidget {
  final String btnText;
  final VoidCallback onPressed;
  final String content1;
  final String content2;
  final String content3;
  final String content4;
  final String content5;
  final String content6;

  final String content7;
  final String content8;

  CustomResearchRegisterBtn({
    required this.onPressed,
    required this.btnText,
    required this.content1,
    required this.content2,
    required this.content3,
    required this.content4,
    required this.content5,
    required this.content6,

    required this.content7,
    required this.content8,
    Key? key,
  }) : super(key: key);

  @override
  _CustomRegisterBtnState createState() => _CustomRegisterBtnState();
}

class _CustomRegisterBtnState extends State<CustomResearchRegisterBtn> {
  bool get _isValid =>
      widget.content1.isNotEmpty &&
          widget.content2.isNotEmpty &&
          widget.content3.isNotEmpty &&
          widget.content4.isNotEmpty &&
          widget.content5.isNotEmpty &&
          widget.content6.isNotEmpty &&
          widget.content7.isNotEmpty &&
          widget.content8.isNotEmpty;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery
          .of(context)
          .size
          .width / 2.5,
      height: 44,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: _isValid ? purpleBtnColor : Colors.grey,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        onPressed: _isValid ? widget.onPressed : null,
        child: Text(
          widget.btnText,
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }


}
