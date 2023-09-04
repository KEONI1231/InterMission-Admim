import 'package:flutter/material.dart';

Future CustomDialog(context) async {
  //final ts = TextStyle(color: PRIMARY_COLOR);

  return await showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        title: Text('요청 중...'),
        content: Column(
          mainAxisSize: MainAxisSize.min, // 이 부분을 추가합니다.
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 8,
            ),
            Text('에러가 발생했습니다.'),
            SizedBox(
              height: 8,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('확인'),
          ),

        ],
      );
    },
  );
}
