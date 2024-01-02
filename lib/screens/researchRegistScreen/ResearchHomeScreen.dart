import 'package:flutter/material.dart';
import 'package:intermission_admin/Screens/ResearchRegistScreen/ResearchHomeScreen_2.dart';
import '../../Components/Buttons/CustomIconBtn.dart';
import '../../Components/InputForms/ContentInputForm.dart';
import '../../Components/Buttons/CustomRearchRegisterBtn.dart';
import '../../Components/InputForms/CustomDropdownMenui.dart';
import '../../Components/InputForms/TitleInputForm.dart';

class ResearchHomeScreen extends StatefulWidget {
  const ResearchHomeScreen({Key? key}) : super(key: key);

  @override
  State<ResearchHomeScreen> createState() => _ResearchHomeScreenState();
}

class _ResearchHomeScreenState extends State<ResearchHomeScreen> {
  @override
  final TextEditingController titleTextController = TextEditingController();
  final TextEditingController subTitleTextConroller = TextEditingController();
  final TextEditingController dueDateTextController = TextEditingController();
  final TextEditingController aboutConsumeTimeTextController =
      TextEditingController();
  final TextEditingController ageTextController = TextEditingController();
  final TextEditingController detailContentTextController =
      TextEditingController();
  final TextEditingController typeTextController = TextEditingController();
  final TextEditingController onOffTextController = TextEditingController();
  final TextEditingController creditTextController = TextEditingController();

  void initState() {
    super.initState();

    titleTextController.addListener(_updateState);
    subTitleTextConroller.addListener(_updateState);
    dueDateTextController.addListener(_updateState);
    aboutConsumeTimeTextController.addListener(_updateState);
    ageTextController.addListener(_updateState);
    detailContentTextController.addListener(_updateState);
    typeTextController.addListener(_updateState);
    onOffTextController.addListener(_updateState);
    creditTextController.addListener(_updateState);
  }

  final researchTypeList = ["인터뷰", "설문", "테스터"];
  var selectedType = "인터뷰";
  final onOffTypeList = ["온라인", "오프라인"];
  var selectedOnOffType = "온라인";

  void _updateState() {
    setState(() {}); // 텍스트 필드 값의 변경을 감지하여 상태를 업데이트합니다.
  }

  @override
  Widget build(BuildContext context) {
    const hintText = "입력해주세요.";

    return WillPopScope(
      onWillPop: () {
        return Future(() => false);
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 48,
                ),
                CustomIconBtn(),
                SizedBox(
                  height: 48,
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 2.5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '리서치 등록',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 24),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            '등록할 리서치의 상세 항목을 입력해주세요.',
                            style: TextStyle(fontSize: 20, color: Colors.grey),
                          )
                        ],
                      ),
                      Text(
                        '1 / 2',
                        style: TextStyle(fontSize: 20, color: Colors.grey[700]),
                      )
                    ],
                  ),
                ),
                SizedBox(
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
                          '리서치 제목',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      TitleInputText(
                        hintText: hintText,
                        textController: titleTextController,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
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
                          '리서치 부제목',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      TitleInputText(
                        hintText: hintText,
                        textController: subTitleTextConroller,
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
                          '마감일',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      TitleInputText(
                        hintText: hintText,
                        textController: dueDateTextController,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
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
                          '예상 소요 시간(분)',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      TitleInputText(
                        hintText: hintText,
                        textController: aboutConsumeTimeTextController,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
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
                          '참여 가능 연령대',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      TitleInputText(
                        hintText: hintText,
                        textController: ageTextController,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
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
                          '리서치 상세내용',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      ContentInputText(
                        //hintText: hintText,
                        textController: detailContentTextController,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 2.5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 4.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '리서치 종류',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            CustomDropdownMenu(
                              itemList: researchTypeList,
                              onChanged: (value) {
                                setState(() {
                                  selectedType = value; // 선택된 값 저장
                                });
                              },
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 2.5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 4.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '온/오프라인 여부',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            CustomDropdownMenu(
                              itemList: onOffTypeList,
                              onChanged: (value) {
                                setState(() {
                                  selectedOnOffType = value; // 선택된 값 저장
                                });
                              },
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
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
                          '리서치 보상',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      TitleInputText(
                        hintText: hintText,
                        textController: creditTextController,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                CustomResearchRegisterBtn(
                  btnText: '다음',
                  onPressed: onPressed,
                  content1: titleTextController.text,
                  content2: subTitleTextConroller.text,
                  content3: dueDateTextController.text,
                  content4: aboutConsumeTimeTextController.text,
                  content5: ageTextController.text,
                  content6: detailContentTextController.text,
                  content7: creditTextController.text,
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onPressed() {
    print(selectedType);
    print(selectedOnOffType);
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return ResearchHomeScreen_2(
          titleText: titleTextController.text,
          subTitleText: subTitleTextConroller.text,
          dueDateText: dueDateTextController.text,
          aboutConsumeText: aboutConsumeTimeTextController.text,
          ageText: ageTextController.text,
          detailContentText: detailContentTextController.text,
          creditText: creditTextController.text,
          selectedType: selectedType,
          selectedOnOffType: selectedOnOffType);
    }));
  }
}
