import 'package:flutter/material.dart';
import 'package:intermission_admin/Constants/Color.dart';

class CustomRegisterBtn extends StatefulWidget {
  final String btnText;
  final String title;
  final String content;

  CustomRegisterBtn({

    required this.btnText,
    required this.title,
    required this.content,
    Key? key,
  }) : super(key: key);

  @override
  _CustomRegisterBtnState createState() => _CustomRegisterBtnState();
}

class _CustomRegisterBtnState extends State<CustomRegisterBtn> {
  bool get _isValid => widget.title.isNotEmpty && widget.content.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2.5,
      height: 44,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: _isValid ? purpleBtnColor : Colors.grey,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        onPressed: _isValid ? _onPressed : null,
        child: Text(
          widget.btnText,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.white),
        ),
      ),
    );
  }

  void _onPressed() {
    // 여기서 버튼이 눌렸을 때의 로직을 구현합니다.

    Navigator.pop(context);
  }
}

