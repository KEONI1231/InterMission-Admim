import 'package:flutter/material.dart';
import 'package:intermission_admin/Components/Buttons/CustomIconBtn.dart';
import 'package:intermission_admin/Constants/Color.dart';
import 'package:intermission_admin/Screens/CheckRequestResearch/Screens/FGIScreen.dart';
import 'package:intermission_admin/Screens/CheckRequestResearch/Screens/InterviewScreen.dart';
import 'package:intermission_admin/Screens/CheckRequestResearch/Screens/SurveyScreen.dart';

class CheckRequsetResearch extends StatelessWidget {
  const CheckRequsetResearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
            body: Center(
          child: Container(
            width: 650,
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 32,
                ),
                CustomIconBtn(),
                SizedBox(
                  height: 24,
                ),
                Text(
                  '리서치 요청 확인',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                SizedBox(
                  height: 24,
                ),
                TabBar(
                  labelColor: Colors.black,
                  indicatorColor: purple,
                  tabs: [
                    Tab(
                      text: "설문 요청",
                    ),
                    Tab(text: "인터뷰 요청"),
                    Tab(text: "FGI 요청"),
                  ],
                ),
                Expanded(
                    child: TabBarView(
                  children: [Survey(), InterViewScreen(), FgiScreen()],
                ))
              ],
            ),
          ),
        )));
  }
}
