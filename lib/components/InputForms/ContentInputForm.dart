import 'package:flutter/material.dart';

class ContentInputText extends StatefulWidget {


   final TextEditingController textController;
  // bool friendOpen;
  // final TextEditingController contentTextController;

  ContentInputText({
    // required this.friendOpen,
     required this.textController,
    // required this.emotionTextController,
    Key? key,
  }) : super(key: key);

  @override
  State<ContentInputText> createState() => _ContentInputTextState();
}

class _ContentInputTextState extends State<ContentInputText> {

  @override
  Widget build(BuildContext context) {


    return SingleChildScrollView(
      child: Card(
        color: Color(0xffF2F2F0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
        ),
        child: Container(
          height: 300,
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
            decoration: const InputDecoration(
              fillColor: Colors.white,
              filled: true,
              hintText: '내용을 입력해주세요.',
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