import 'package:flutter/material.dart';

Future CustomCircular(context, int discri) async {
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(color: Colors.black),
            SizedBox(
              height: 24,
            ),
            discri == 1
                ? //0이면 로그인 1이면 요청

                Text('몇 분의 시간이 소요될 수 있습니다.')
                : SizedBox(),
          ],
        ),
      );
    },
  );
}
