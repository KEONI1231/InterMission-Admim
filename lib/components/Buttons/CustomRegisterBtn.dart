import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intermission_admin/Constants/Color.dart';
import 'package:intermission_admin/components/CustomErrorDialog.dart';
import 'package:intermission_admin/components/CustomSuccessDialog.dart';

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
          style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.white),
        ),
      ),
    );
  }

  void _onPressed() async {
    Dio dio = Dio();
    try {
      final result = await dio.get(
          'admin/notify',
          data: {
            "mainTitle": widget.title.toString(),
            "detail" : widget.content.toString(),
          }
      );
      CustomSuccessDialog(context);
    }
    catch (e) {
      CustomErrorDialog(context);
      print(e);
    }
    Navigator.pop(context);
  }
}

