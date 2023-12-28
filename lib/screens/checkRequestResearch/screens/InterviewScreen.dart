import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../Constants/Color.dart';
import '../../../dto/response/interview/InterviewDto.dart';

class InterViewScreen extends StatefulWidget {
  const InterViewScreen({Key? key}) : super(key: key);

  @override
  State<InterViewScreen> createState() => _InterViewScreenState();
}

class _InterViewScreenState extends State<InterViewScreen> {
  List<InterviewDto> pages = []; // 페이지 데이터를 저장하는 리스트
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
        pages.add(InterviewDto.fromJson(result.data));
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

  Widget _buildPageContent(InterviewDto pageData) {
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
    List<Widget> contentWidgets = pageData.content.map((interviewContent) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            Text('• 하는 일 : ', style: ts),
            Text(interviewContent.job, style: contentTs)
          ]),
          SizedBox(height: 16),
          Row(children: [
            Text('• 회사명/아이템명 : ', style: ts),
            Text(interviewContent.companyNameOrItemName, style: contentTs)
          ]),
          SizedBox(height: 16),
          Row(children: [
            Text('• 아이템 한 줄 소개 : ', style: ts),
            Text(interviewContent.itemIntroduction, style: contentTs)
          ]),
          SizedBox(height: 16),
          Row(children: [
            Text('• 인터뷰 방법 : ', style: ts),
            Text(interviewContent.interviewMethod, style: contentTs)
          ]),
          SizedBox(height: 16),
          Row(children: [
            Text('• 예상 소요 시간 : ', style: ts),
            Text(interviewContent.estimatedTime, style: contentTs)
          ]),
          SizedBox(height: 16),
          Row(children: [
            Text('• 인터뷰 보상 : ', style: ts),
            Text(interviewContent.interviewReward, style: contentTs)
          ]),
          SizedBox(height: 16),
          Row(children: [
            Text('• 원하는 인터뷰이 특성 : ', style: ts),
            Text(interviewContent.desiredIntervieweeCharacteristics,
                style: contentTs)
          ]),
          SizedBox(height: 16),
          Row(children: [
            Text('• 원하는 인원 : ', style: ts),
            Text(interviewContent.desiredParticipants, style: contentTs)
          ]),
          SizedBox(height: 16),
          Row(children: [
            Text('• 기타 요청 사항 : ', style: ts),
            Text(interviewContent.otherRequests, style: contentTs)
          ]),
          SizedBox(height: 16),
          Row(children: [
            Text('• 의뢰하는 서비스 : ', style: ts),
            Text(interviewContent.requestedService, style: contentTs)
          ]),
          SizedBox(height: 16),
          Row(children: [
            Text('• 인터뷰 목적 : ', style: ts),
            Text(interviewContent.interviewPurpose, style: contentTs)
          ]),
          SizedBox(height: 16),
          Row(children: [
            Text('• 연락처 : ', style: ts),
            Text(interviewContent.contact, style: contentTs)
          ]),
          SizedBox(height: 16),
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
