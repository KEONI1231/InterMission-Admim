import 'package:flutter/material.dart';
import 'package:intermission_admin/Screens/AcceptCheckScreen/AcceptHomeScreen.dart';
import 'package:intermission_admin/Screens/NoticeRegistScreen/NoticeHomeScreen.dart';
import 'package:intermission_admin/Screens/ResearchRegistScreen/ResearchHomeScreen.dart';

import '../../Components/CustomButton.dart';

//login 이후 보여질 스크린
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(96, 0, 96, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MenuContainerBox(
                  containerInnerText: '공지사항 등록',
                  onPressed: noticeNavigate,
                  containerBtnText: '공지사항 등록',
                  icon: Icons.campaign_outlined,
                ),
                MenuContainerBox(
                  containerInnerText: '리서치 등록',
                  onPressed: researchNavigate,
                  containerBtnText: '리서치 등록',
                  icon: Icons.menu_book_outlined,
                ),
                MenuContainerBox(
                  containerInnerText: '수락 확인',
                  onPressed: acceptNavigate,
                  containerBtnText: '수락확인',
                  icon: Icons.checklist_outlined,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void noticeNavigate() {
    print('공지사항 등록 버튼');
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return NoticeHomeScreen();
    }));
  }

  void acceptNavigate() {
    print('수락확인 등록 버튼');
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return AcceptHomeScreen();
    }));
  }

  void researchNavigate() {
    print('리서치 등록 버튼');
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return ResearchHomeScreen();
    }));
  }
}

class MenuContainerBox extends StatelessWidget {
  final String containerBtnText;
  final String containerInnerText;
  final VoidCallback onPressed;
  final IconData icon;

  const MenuContainerBox(
      {required this.containerInnerText,
      required this.containerBtnText,
      required this.onPressed,
      required this.icon,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ContainerDecoration = BoxDecoration(
      color: Colors.white,
      //border: Border.all(width: 2, color: PRIMARY_COLOR),
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 7,
            offset: Offset(0, 1))
      ],
    );
    const HeightSizeRate = 0.2;
    const WidthSizeRate = 0.3;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: MediaQuery.of(context).size.height * WidthSizeRate,
          height: MediaQuery.of(context).size.height * HeightSizeRate,
          decoration: ContainerDecoration,
          child: Center(
              child: IconTheme(
            data: IconThemeData(opacity: 0.5), // opacity를 조절하여 굵기를 얇게 만듭니다.
            child: Icon(
              icon,
              size: 80,
            ),
          )),
        ),
        const SizedBox(
          height: 32,
        ),
        CustomButton(btnText: containerBtnText, onPressed: onPressed)
      ],
    );
  }
}
