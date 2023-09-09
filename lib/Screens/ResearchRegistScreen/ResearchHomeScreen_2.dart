import 'package:flutter/material.dart';
import 'package:intermission_admin/Screens/ResearchRegistScreen/ResearchHomeScreen_2.dart';

import '../../Components/CustomIconBtn.dart';

import '../../Components/ContentInputForm.dart';

import '../../Components/CustomRearchRegisterBtn_2.dart';
import '../../Components/TitleInputForm.dart';

class ResearchHomeScreen_2 extends StatefulWidget {
  const ResearchHomeScreen_2({Key? key}) : super(key: key);

  @override
  State<ResearchHomeScreen_2> createState() => _ResearchHomeScreen_2State();
}

class _ResearchHomeScreen_2State extends State<ResearchHomeScreen_2> {
  @override
  final TextEditingController clientNameTextController = TextEditingController();
  final TextEditingController emailTextConroller = TextEditingController();
  final TextEditingController clientJobTextController = TextEditingController();
  final TextEditingController clientJobEtcTextController =
  TextEditingController();
  final TextEditingController companyNameTextController = TextEditingController();

  final TextEditingController requireNumberTextController = TextEditingController();
  final TextEditingController etcAskTextController = TextEditingController();
  final TextEditingController clientPhoneTextController = TextEditingController();

  void initState() {
    super.initState();

    clientJobEtcTextController.addListener(_updateState);
    clientNameTextController.addListener(_updateState);
    clientJobTextController.addListener(_updateState);
    emailTextConroller.addListener(_updateState);
    companyNameTextController.addListener(_updateState);
    requireNumberTextController.addListener(_updateState);
    etcAskTextController.addListener(_updateState);
    clientPhoneTextController.addListener(_updateState);

  }

  final genderTypeList = ["남성", "여성", "상관없음"];
  var selectedGenderType = "남성";
  final onOffTypeList = ["온라인", "오프라인"];
  var seletedOnOffType = "온라인";

  void _updateState() {
    setState(() {}); // 텍스트 필드 값의 변경을 감지하여 상태를 업데이트합니다.
  }

  @override
  Widget build(BuildContext context) {
    const hintText = "입력해주세요.";

    return Scaffold(
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
                        Text(
                          '리서치 등록',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 32),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          '등록할 리서치의 상세 항목을 입력해주세요.',
                          style: TextStyle(fontSize: 24, color: Colors.grey),
                        )
                      ],
                    ),
                    Text('2 / 2',
                        style: TextStyle(fontSize: 24, color: Colors.grey[700]))
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
                        '의뢰자명',
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
                      textController: clientNameTextController,
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
                        '이메일',
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
                      textController: emailTextConroller,
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
                        '의뢰자 직무',
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
                      textController: clientJobTextController,
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
                        '의뢰자 직무 기타',
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
                      textController: clientJobEtcTextController,
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
                        '회사명',
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
                      textController: companyNameTextController,
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
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 4.0),
                          child: Text(
                            '타겟 성별',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left : 4.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width / 2.53,
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 5.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4.0),
                              border:
                              Border.all(color: Colors.grey, width: 1.0),
                            ),
                            child: DropdownButtonHideUnderline(
                              // Underline을 숨깁니다.
                              child: DropdownButton<String>(
                                value: selectedGenderType,
                                isExpanded: true,
                                // DropdownButton이 Container의 전체 너비를 사용하도록 설정합니다.
                                items: genderTypeList
                                    .map<DropdownMenuItem<String>>(
                                        (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16.0)),
                                      );
                                    }).toList(),
                                onChanged: (String? newValue) {
                                  if (newValue != null) {
                                    // newValue가 null이 아닌 경우에만 상태를 업데이트합니다.
                                    setState(() {
                                      selectedGenderType = newValue;
                                      print(selectedGenderType);
                                    });
                                  }
                                },
                                icon: Icon(Icons.arrow_drop_down,
                                    color: Colors.grey),
                                // 드롭다운 아이콘의 색상 변경
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16.0),
                                dropdownColor: Colors.white, // 드롭다운 항목의 배경색 변경
                              ),
                            ),
                          ),
                        )
                      ],
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
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left : 4.0),
                          child: Text(
                            '모집 인원',
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
                          textController: requireNumberTextController,
                        )
                      ],
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
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left : 4.0),
                          child: Text(
                            '기타 요청 사항',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        ContentInputText(

                          textController: etcAskTextController,
                        )
                      ],
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
                        '의뢰자 전화번호',
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
                      textController: clientPhoneTextController,
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
                content1: clientNameTextController.text,
                content2: clientJobEtcTextController.text,
                content3: clientJobTextController.text,
                content4: clientPhoneTextController.text,
                content5: companyNameTextController.text,
                content6: etcAskTextController.text,
                content7: requireNumberTextController.text,
                content8: emailTextConroller.text,
              ),
              const SizedBox(
                height: 32,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onPressed() {
    for(int i =0; i < 2; i++) {
      Navigator.pop(context);
    }
  }
}
