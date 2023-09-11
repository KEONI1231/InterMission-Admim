import 'package:flutter/material.dart';
import 'package:intermission_admin/Components/Buttons/CustomIconBtn.dart';
import 'package:intermission_admin/Constants/Color.dart';
import 'package:intermission_admin/Screens/AcceptCheckScreen/AcceptHomeScreen.dart';
import 'package:intermission_admin/Screens/NoticeRegistScreen/NoticeHomeScreen.dart';
import 'package:intermission_admin/Screens/ResearchRegistScreen/ResearchHomeScreen.dart';

//login 이후 보여질 스크린
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future(()=> false);
      },
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //CustomIconBtn(),
            Spacer(),
            Padding(
              padding: const EdgeInsets.fromLTRB(96, 0, 96, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MenuContainerBox(
                        containerInnerText: '공지사항 등록',
                        onPressed: noticeNavigate,
                        containerBtnText: '공지사항 등록',
                        icon: Icons.content_paste,
                        iconColor: purple,
                        containerColor: lightPurple,
                      ),
                      SizedBox(width: 32,),
                      MenuContainerBox(
                        containerInnerText: '리서치 등록',
                        onPressed: researchNavigate,
                        containerBtnText: '리서치 등록',
                        icon: Icons.zoom_in,
                        iconColor: blue,
                        containerColor: lightBlue,
                      ),
                      SizedBox(width: 32,),
                      MenuContainerBox(
                        containerInnerText: '수락 확인',
                        onPressed: acceptNavigate,
                        containerBtnText: '수락확인',
                        icon: Icons.checklist_outlined,
                        iconColor: purple,
                        containerColor: lightPurple,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Spacer(),
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
    //NaviDetermine.stackIntdexPlus('noticeScreen');
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return AcceptHomeScreen();
    }));
  }

  void researchNavigate() {
    print('리서치 등록 버튼');
    //Navigator.of(context).pushNamed('/researchScreen');

    //NaviDetermine.stackIntdexPlus('noticeScreen');
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
  final Color iconColor;
  final Color containerColor;

  const MenuContainerBox({
    required this.containerInnerText,
    required this.containerBtnText,
    required this.onPressed,
    required this.icon,
    required this.containerColor,
    required this.iconColor,
    Key? key,
  }) : super(key: key);

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

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(12), // 물결 효과의 모서리 둥근 정도를 맞춰줍니다.
          child: Container(
            width: 282,
            height: 228,
            decoration: ContainerDecoration,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: containerColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  width: 110,
                  height: 110,
                  child: Icon(
                    icon,
                    size: 80,
                    color: iconColor,
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                Text(
                  containerBtnText,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 24),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 32,
        ),
      ],
    );
  }
}
