import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intermission_admin/Components/Buttons/CustomIconBtn.dart';
import 'package:intermission_admin/Constants/Color.dart';
import 'package:intermission_admin/Screens/AcceptCheckScreen/AcceptHomeScreen.dart';
import 'package:intermission_admin/Screens/CheckPointExchangeScreen.dart';
import 'package:intermission_admin/Screens/CheckRequestResearch/CheckRequestResearchEntry.dart';
import 'package:intermission_admin/Screens/CheckRequestResearch/Screens/SurveyScreen.dart';
import 'package:intermission_admin/Screens/NoticeRegistScreen/NoticeHomeScreen.dart';
import 'package:intermission_admin/Screens/ResearchRegistScreen/ResearchHomeScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../main.dart';
import '../LoginScreen.dart';

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
        return Future(() => false);
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
                  SizedBox(
                    height: 100,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MenuContainerBox(
                        containerInnerText: '리서치 요청 확인',
                        onPressed: checkRequsetResearchNavigate,
                        containerBtnText: '리서치 요청 확인',
                        icon: Icons.content_paste,
                        iconColor: purple,
                        containerColor: lightPurple,
                        imgPath: 'assets/img/CheckRequestResearch.png',
                      ),
                      SizedBox(
                        width: 32,
                      ),
                      MenuContainerBox(
                        containerInnerText: '리서치 등록',
                        onPressed: researchNavigate,
                        containerBtnText: '리서치 등록',
                        icon: Icons.zoom_in,
                        iconColor: blue,
                        containerColor: lightBlue,
                        imgPath: 'assets/img/RegistResearch.png',
                      ),
                      SizedBox(
                        width: 32,
                      ),
                      MenuContainerBox(
                        containerInnerText: '공지사항 등록',
                        onPressed: noticeNavigate,
                        containerBtnText: '공지사항 등록',
                        icon: Icons.content_paste,
                        iconColor: purple,
                        containerColor: lightPurple,
                        imgPath: 'assets/img/RegistNotice.png',
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MenuContainerBox(
                        containerInnerText: '수락 확인',
                        onPressed: acceptNavigate,
                        containerBtnText: '수락확인',
                        icon: Icons.checklist_outlined,
                        iconColor: blue,
                        containerColor: lightBlue,
                        imgPath: 'assets/img/CheckAccept.png',
                      ),
                      SizedBox(
                        width: 32,
                      ),
                      MenuContainerBox(
                        containerInnerText: '포인트 교환 요청 확인',
                        onPressed: checkPointExchange,
                        containerBtnText: '포인트 교환 요청 확인',
                        icon: Icons.zoom_in,
                        iconColor: blue,
                        containerColor: lightBlue,
                        imgPath: 'assets/img/CheckPointExchange.png',
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Spacer(),
            LogoutBtn(),
            SizedBox(
              height: 32,
            )
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
  void checkRequsetResearchNavigate() {
    print('리서치 요청 확인');
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return CheckRequsetResearch();
    }));
  }

  void checkPointExchange() {
    print('수락확인 등록 버튼');
    //NaviDetermine.stackIntdexPlus('noticeScreen');
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return CheckPointExchangeScreen();
    }));
  }
}

class MenuContainerBox extends StatelessWidget {
  final String containerBtnText;
  final String containerInnerText;
  final String imgPath;
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
    required this.imgPath,
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
                  child: Image.asset(
                    imgPath,
                    width: 200,
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

class LogoutBtn extends StatelessWidget {
  const LogoutBtn({Key? key}) : super(key: key);

  Future<String?> getSavedAccessToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('accessToken');
  }

  Future<void> removeAuthorizationTokens() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('accessToken');
    await prefs.remove('refreshToken');
  }

  Future<void> _logout(BuildContext context) async {
    try {
      String? accessToken = await getSavedAccessToken();

      if (accessToken != null) {
        final dio = Dio(); // 여기서 Dio 인스턴스를 생성하거나 외부에서 주입받을 수 있습니다.
        final response = await dio.post(
          'http://34.64.77.5:8080/api/auth/logout',
          options: Options(
            headers: {
              'Authorization': "Bearer $accessToken",
            },
          ),
        );

        if (response.statusCode == 200 || response.statusCode == 204) {
          await removeAuthorizationTokens();
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (BuildContext context) {
            return LoginScreen(); // 로그아웃 후 이동할 로그인 화면입니다.
          }));
        } else {
          // 에러 처리 (예: 사용자에게 알림 표시)
        }
      } else {
        print("Access token is null");
        // 토큰이 null인 경우에 대한 추가적인 처리 (예: 사용자에게 알림 표시)
      }
    } catch (e) {
      print(e);
      // 에러 처리 (예: 사용자에게 알림 표시)
    }
  }

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

    return Center(
      child: GestureDetector(
        //onTap: () => _logout(context),
        onTap: () {
          Navigator.pushNamedAndRemoveUntil(context, '/', (_) => false);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen()),
          );
        },
        child: Container(
          width: 80,
          height: 72,
          decoration: ContainerDecoration,
          child: Icon(
            Icons.logout,
            color: Colors.blue, // 이 부분에서 `blue`는 실제로 사용하는 색상 변수로 대체해야 합니다.
            size: 48,
          ),
        ),
      ),
    );
  }
}
