import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intermission_admin/Constants/Color.dart';

import '../../../dto/response/servey/SurveyDto.dart';

class Survey extends StatefulWidget {
  const Survey({Key? key}) : super(key: key);

  @override
  State<Survey> createState() => _SurveyState();
}

class _SurveyState extends State<Survey> {
  List<SurveyDto> pages = []; // 페이지 데이터를 저장하는 리스트
  int currentPage = 1;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    if (isLoading || (pages.isNotEmpty && pages.last.last)) return;

    isLoading = true;
    Dio dio = Dio();
    try {
      final result = await dio.get(
        '/admin/pre-register',
        queryParameters: {
          'page': currentPage,
          'size': 10,
        },
      );
      setState(() {
        pages.add(SurveyDto.fromJson(result.data));
        currentPage++;
      });
    } catch (e) {
      print(e);
    } finally {
      isLoading = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: pages.length + 1,
        itemBuilder: (context, index) {
          if (index < pages.length) {
            return _buildPageContent(pages[index]);
          } else {
            if (!isLoading) fetchData();
            return const Padding(
              padding: EdgeInsets.only(top: 140.0),
              child: Column(children: [
                Center(child: CircularProgressIndicator()),
                SizedBox(height: 32),
                Text('로딩중',
                    style: TextStyle(
                        color: purpleSTextColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18))
              ]),
            );
          }
        },
      ),
    );
  }

  Widget _buildPageContent(SurveyDto pageData) {
    final ts = TextStyle(
      color: purpleSTextColor,
      fontWeight: FontWeight.bold,
      fontSize: 18,
    );
    final contentTs = TextStyle(
      color: purpleSTextColor,
      fontSize: 18,
    );

    final ContainerDecoration = BoxDecoration(
      color: lightPurple,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 10,
            offset: Offset(0, 0))
      ],
    );
    List<Widget> contentWidgets = pageData.content.map((surveyContent) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            Text('• 하는 일 : ', style: ts),
            Text(surveyContent.job, style: contentTs),
          ]),
          const SizedBox(height: 16),
          Row(children: [
            Text('• 설문 대상 : ', style: ts),
            Text(surveyContent.target, style: contentTs),
          ]),
          const SizedBox(height: 16),
          Row(children: [
            Text('• 설문 링크 : ', style: ts),
            Text(surveyContent.link, style: contentTs)
          ]),
          const SizedBox(height: 16),
          Row(children: [
            Text('• 설문 예상 문항 및 응답 시간 : ', style: ts),
            Text(surveyContent.expectedQuestions, style: contentTs)
          ]),
          const SizedBox(height: 16),
          Row(children: [
            Text('• 원하는 인원 : ', style: ts),
            Text(surveyContent.desiredParticipants, style: contentTs)
          ]),
          const SizedBox(height: 16),
          Row(children: [
            Text('• 의뢰하는 서비스 : ', style: ts),
            Text(surveyContent.requestedService, style: contentTs)
          ]),
          const SizedBox(height: 16),
          Row(children: [
            Text('• 연락처: ', style: ts),
            Text(surveyContent.contact, style: contentTs)
          ]),
          const SizedBox(height: 16),
          // 나머지 데이터에 대한 Row 위젯들...
        ],
      );
    }).toList();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        width: 650,
        decoration: ContainerDecoration,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: SelectableRegion(
            focusNode: FocusNode(),
            selectionControls: MaterialTextSelectionControls(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: contentWidgets,
            ),
          ),
        ),
      ),
    );
  }
}
