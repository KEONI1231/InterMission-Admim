import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../Constants/Color.dart';
import '../../../dto/response/fgi/FgiDto.dart';

class FgiScreen extends StatefulWidget {
  const FgiScreen({Key? key}) : super(key: key);

  @override
  State<FgiScreen> createState() => _FgiScreenState();
}

class _FgiScreenState extends State<FgiScreen> {
  List<FgiDto> pages = [];
  int currentPage = 1;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
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
        pages.add(FgiDto.fromJson(result.data));
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

  @override
  Widget _buildPageContent(FgiDto pageData) {
    final ts = TextStyle(
      color: orangeText,
      fontWeight: FontWeight.bold,
      fontSize: 18,
    );
    final contentTs = TextStyle(
      color: orangeText,
      fontSize: 18,
    );

    final ContainerDecoration = BoxDecoration(
      color: orange,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, 0))
      ],
    );
    List<Widget> contentWidgets = pageData.content.map((fgiContent) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('• 하는 일 : ', style: ts),
            Flexible(child: Text(fgiContent.job, style: contentTs))
          ]),
          const SizedBox(height: 16),
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('• 회사명/아이템명 : ', style: ts),
            Flexible(
                child: Text(fgiContent.companyNameOrItemName, style: contentTs))
          ]),
          const SizedBox(height: 16),
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('• FGI대상 : ', style: ts),
            Flexible(child: Text(fgiContent.fgiTarget, style: contentTs))
          ]),
          const SizedBox(height: 16),
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('• 제품/서비스 링크 : ', style: ts),
            Flexible(child: Text(fgiContent.serviceLink, style: contentTs))
          ]),
          const SizedBox(height: 16),
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('• FGI 방법 : ', style: ts),
            Flexible(child: Text(fgiContent.fgiMethod, style: contentTs))
          ]),
          const SizedBox(height: 16),
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('• FGI 예상 소요 시간, 원하는 인원, 횟수 : ', style: ts),
            Flexible(
                child: Text(
                    '${fgiContent.estimatedTime}, ${fgiContent.desiredParticipants}, ${fgiContent.participantsCount}',
                    style: contentTs))
          ]),
          const SizedBox(height: 16),
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('• 선호하는 진행 시간대 : ', style: ts),
            Flexible(child: Text(fgiContent.preferTime, style: contentTs))
          ]),
          const SizedBox(height: 16),
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('• 연락처 : ', style: ts),
            Flexible(child: Text(fgiContent.contact, style: contentTs))
          ]),
          const SizedBox(height: 16),
        ],
      );
    }).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 32),
        Padding(
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
        )
      ],
    );
  }
}
