import 'package:flutter/material.dart';

import '../../../Constants/Color.dart';

class FgiScreen extends StatelessWidget {
  const FgiScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
                      children: [
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('• 하는 일 : ', style: ts),
                              Flexible(
                                  child: Text(
                                      ' { 하는 일 } :  { 하는 일 } :  { 하는 일 } :  { 하는 일 } :  { 하는 일 } :  { 하는 일 } :  { 하는 일 } :  { 하는 일 } :  { 하는 일 } :  { 하는 일 } :  { 하는 일 } :  { 하는 일 } :  { 하는 일 } :  { 하는 일 } :  { 하는 일 } :  { 하는 일 } :  { 하는 일 } :  { 하는 일 } :  { 하는 일 } :  { 하는 일 } :  { 하는 일 } :  { 하는 일 } :  { 하는 일 } :  { 하는 일 } :  { 하는 일 } :  { 하는 일 } :  { 하는 일 } :  { 하는 일 } :  { 하는 일 } :  { 하는 일 } :  { 하는 일 } :  { 하는 일 } :  { 하는 일 } :  { 하는 일 } :  { 하는 일 } :  { 하는 일 } :  { 하는 일 } :  { 하는 일 } :  { 하는 일 } :  { 하는 일 } : ',
                                      style: contentTs))
                            ]),
                        const SizedBox(height: 16),
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('• 회사명/아이템명 : ', style: ts),
                              Flexible(
                                  child: Text(' { 회상명/아이템명 } : ',
                                      style: contentTs))
                            ]),
                        const SizedBox(height: 16),
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('• FGI대상 : ', style: ts),
                              Flexible(
                                  child: Text(' { 대상 } : ', style: contentTs))
                            ]),
                        const SizedBox(height: 16),
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('• 제품/서비스 링크 : ', style: ts),
                              Flexible(
                                  child: Text(' { 링크 } : ', style: contentTs))
                            ]),
                        const SizedBox(height: 16),
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('• FGI 방법 : ', style: ts),
                              Flexible(
                                  child: Text(
                                      ' { 방법 } :  { 방법 } :  { 방법 } :  { 방법 } :  { 방법 } :  { 방법 } :  { 방법 } :  { 방법 } :  { 방법 } :  { 방법 } :  { 방법 } :  { 방법 } :  { 방법 } :  { 방법 } :  { 방법 } :  { 방법 } :  { 방법 } :  { 방법 } :  { 방법 } :  { 방법 } :  { 방법 } :  { 방법 } :  { 방법 } :  { 방법 } :  { 방법 } :  { 방법 } :  { 방법 } :  { 방법 } :  { 방법 } :  { 방법 } :  { 방법 } :  { 방법 } : ',
                                      style: contentTs))
                            ]),
                        const SizedBox(height: 16),
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('• FGI 예상 소요 시간, 원하는 인원, 횟수 : ', style: ts),
                              Flexible(
                                  child: Text(' { 시간 }, { 인원 }, { 횟수 } : ',
                                      style: contentTs))
                            ]),
                        const SizedBox(height: 16),
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('• 선호하는 진행 시간대 : ', style: ts),
                              Flexible(
                                  child: Text(' { hh:mm:~hh:mm } : ',
                                      style: contentTs))
                            ]),
                        const SizedBox(height: 16),
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('• 연락처 : ', style: ts),
                              Flexible(
                                  child: Text(' { 연락처 } : ', style: contentTs))
                            ]),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
