import 'package:flutter/material.dart';

class TitleInputText extends StatefulWidget {
  final String hintText;
  final TextEditingController textController;

  // bool friendOpen;
  // final TextEditingController contentTextController;

  TitleInputText({
    // required this.friendOpen,
    // required this.contentTextController,
    required this.hintText,
    required this.textController,
    Key? key,
  }) : super(key: key);

  @override
  State<TitleInputText> createState() => _TitleInputTextState();
}

class _TitleInputTextState extends State<TitleInputText> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        color: Color(0xffF2F2F0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
        ),
        child: Container(
          height: 56,
          child: TextFormField(
            expands: true,
            controller: widget.textController,
            keyboardType: TextInputType.multiline,
            maxLines: null,
            validator: (String? val) {
              if (val == null || val.isEmpty) {
                return '해당 필드는 필수항복입니다.';
              }
              return null;
            },
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              hintText: widget.hintText,
              hintStyle: TextStyle(
                color: Color(0xffBFBFBD),
              ),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(8.0),
                ),
              ),
              //contentPadding: EdgeInsets.symmetric(vertical: 150),
            ),
            // textAlign: TextAlign.center,
            //  decoration: _decoration,
          ),
        ),
      ),
    );
  }
}
