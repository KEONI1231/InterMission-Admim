import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intermission_admin/Components/Buttons/CustomIconBtn.dart';
import 'package:intermission_admin/Constants/Color.dart';

import '../../dto/response/reasearchAcceptCheck/ReseatchAcceptDto.dart';

class AcceptHomeScreen extends StatefulWidget {
  const AcceptHomeScreen({Key? key}) : super(key: key);

  @override
  State<AcceptHomeScreen> createState() => _AcceptHomeScreenState();
}

class _AcceptHomeScreenState extends State<AcceptHomeScreen> {
  List<ResearchResponse> pages = []; // 페이지 데이터를 저장하는 리스트
  int currentPage = 1;
  bool isLoading = false;

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
        pages.add(ResearchResponse.fromJson(result.data));
        currentPage++;
      });
    } catch (e) {
      print(e);
    } finally {
      isLoading = false;
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
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
          offset: Offset(0, 0),
        )
      ],
    );
    final TextStyle ts =
    TextStyle(fontWeight: FontWeight.bold, fontSize: 24);
    const double defaultHeightGap = 36;

    return Scaffold(
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
              isLoading
                  ? CircularProgressIndicator()
                  : Column(
                children: [
                  for (ResearchResponse pageData in pages)
                    for (ResearchItem surveyContent in pageData.content)
                      _buildPageContent(surveyContent),
                  if (isLoading)
                    Padding(
                      padding: EdgeInsets.only(top: 140.0),
                      child: Column(children: [
                        Center(
                          child: CircularProgressIndicator(),
                        ),
                        SizedBox(height: 32),
                        Text(
                          '로딩중',
                          style: TextStyle(
                            color: purpleSTextColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        )
                      ]),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPageContent(ResearchItem surveyContent) {
    final ContainerDecoration = BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 1,
          blurRadius: 10,
          offset: Offset(0, 0),
        )
      ],
    );
    final TextStyle ts =
    TextStyle(fontWeight: FontWeight.bold, fontSize: 24);

    return Container(
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
            SizedBox(width: 12),
            Flexible(
              child: SelectableRegion(
                focusNode: FocusNode(),
                selectionControls: MaterialTextSelectionControls(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          '유저가 ',
                          style: ts,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          '${surveyContent.researchId}에', // 변동이 없음
                          style: ts.copyWith(color: purpleTextColor),
                          overflow: TextOverflow.ellipsis,
                        ), // 변동이 없음
                        Text(
                          '에 ${surveyContent.participationStatus} 했습니다.',
                          style: ts,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Column(
                      children: [
                        Text(
                          '${surveyContent.memberEmail}',
                          style: ts.copyWith(
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
