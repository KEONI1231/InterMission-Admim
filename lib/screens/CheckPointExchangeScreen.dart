import 'package:flutter/material.dart';

import '../Components/Buttons/CustomIconBtn.dart';
import '../Components/Buttons/CustomSaveBtn.dart';
import '../Constants/Color.dart';
class CheckPointExchangeScreen extends StatelessWidget {
  const CheckPointExchangeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ContainerDecoration = BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 10,
            offset: Offset(0, 0))
      ],
    );
    final ContainerBorderDecoration = BoxDecoration(
        color: Colors.white,
        border: Border.all(),
        borderRadius: BorderRadius.circular(12));
    const double defaultHeightGap = 36;
    const TextStyle ts = TextStyle(fontWeight: FontWeight.bold, fontSize: 24);

    return WillPopScope(
      onWillPop: () {
        return Future(() => false);
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 48,
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.9,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '수락확인',
                        style: ts.copyWith(fontSize: 32),
                      ),
                      Row(
                        children: [
                          Container(
                            decoration: ContainerDecoration,
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: CustomIconBtn(),
                            ),
                          ),

                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: defaultHeightGap,
                ),
                SelectableRegion(
                  focusNode: FocusNode(),
                  selectionControls: MaterialTextSelectionControls(),
                  child: Container(
                    decoration: ContainerDecoration,
                    width: MediaQuery.of(context).size.width / 1.9,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.check_circle,
                            size: 32,
                            color: purpleBtnColor,
                          ),
                          SizedBox(width: 12), // Icon과 Text 사이의 간격
                          Flexible(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [

                                    Text(
                                      '교환 요청 ',
                                      style: ts.copyWith(color: purpleTextColor),
                                      overflow: TextOverflow.ellipsis,
                                    ), //변수
                                    Text(
                                      '이 확인되었습니다.',
                                      style: ts,
                                      overflow: TextOverflow.ellipsis,
                                    ),

                                  ],
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  '김조사 유저 / 11-222-333-456 국민 은행 / 10만원',
                                  //모두 변수
                                  style: ts.copyWith(
                                      fontSize: 20, fontWeight: FontWeight.normal),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
