import 'package:flutter/material.dart';
import 'package:intermission_admin/Components/Buttons/CustomButton.dart';
import 'package:intermission_admin/Components/Buttons/CustomRegisterBtn.dart';
import 'package:intermission_admin/Components/InputForms/ContentInputForm.dart';
import 'package:intermission_admin/Components/InputForms/TitleInputForm.dart';

import '../../Components/Buttons/CustomIconBtn.dart';
import '../../trashcan/BottomNavi.dart';

class NoticeHomeScreen extends StatefulWidget {
  const NoticeHomeScreen({Key? key}) : super(key: key);

  @override
  State<NoticeHomeScreen> createState() => _NoticeHomeScreenState();
}

class _NoticeHomeScreenState extends State<NoticeHomeScreen> {
  @override
  final TextEditingController contentTextController = TextEditingController();

  final TextEditingController titleTextController = TextEditingController();

  void initState() {
    super.initState();
    contentTextController.addListener(_updateState);
    titleTextController.addListener(_updateState);
  }

  void _updateState() {
    setState(() {}); // 텍스트 필드 값의 변경을 감지하여 상태를 업데이트합니다.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: CustomIconBtn(),
            ),
            Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 2.5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '공지사항 등록',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 32),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        '공지사항에 등록할 내용을 입력해 주세요.',
                        style: TextStyle(fontSize: 24, color: Colors.grey),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 64,
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 2.5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 4.0),
                        child: Text(
                          '제목',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      TitleInputText(
                        hintText: "제목을 읿력해주세요.",
                        textController: titleTextController,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 48,
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 2.5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 4.0),
                        child: Text(
                          '내용',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      ContentInputText(
                        textController: contentTextController,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                CustomRegisterBtn(
                  btnText: '등록',
                  title: titleTextController.text,
                  content: contentTextController.text,
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: SizedBox(
                width: 0,
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }

  void onPressed() {}
}
