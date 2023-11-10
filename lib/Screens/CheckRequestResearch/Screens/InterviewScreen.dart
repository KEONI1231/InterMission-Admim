import 'package:flutter/material.dart';

import '../../../Constants/Color.dart';

class InterViewScreen extends StatelessWidget {
  const InterViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ts = TextStyle(
      color: blueText,
      fontWeight: FontWeight.bold,
      fontSize: 18,

    );
    final contentTs = TextStyle(
      color: blueText,

      fontSize: 18,

    );

    final ContainerDecoration = BoxDecoration(
      color: lightBlue,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 10,
            offset: Offset(0, 0))
      ],
    );
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 32,),
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
                      
                      Row(children: [
                        Text('• 하는 일 : ',style: ts,),
                        Text(' { 하는 일 } : ',style: contentTs,),
                      ],),

                      SizedBox(height: 16,),
                      Row(
                        children: [
                          Text('• 회사명/아이템명 : ',style: ts,),
                          Text(' { 회사명/아이템명 } : ',style: contentTs,),
                        ],
                      ),
                      SizedBox(height: 16,),
                      Row(
                        children: [
                          Text('• 아이템 한 줄 소개 : ',style: ts,),
                          Text(' { 아이템 한 줄 소개 } : ',style: contentTs,),
                        ],
                      ),
                      SizedBox(height: 16,),
                      Row(
                        children: [
                          Text('• 인터뷰 방법 : ',style: ts,),
                          Text(' { 인터뷰 방법 } : ',style: contentTs,),
                        ],
                      ),
                      SizedBox(height: 16,),
                      Row(
                        children: [
                          Text('• 예상 소요 시간 : ',style: ts,),
                          Text(' { 예상 소요 시간 } : ',style: contentTs,),
                        ],
                      ),
                      SizedBox(height: 16,),
                      Row(
                        children: [
                          Text('• 인터뷰 보상 : ',style: ts,),
                          Text(' { 인터뷰 보상 } : ',style: contentTs,),
                        ],
                      ),
                      SizedBox(height: 16,),
                      Row(
                        children: [
                          Text('• 원하는 인터뷰이 특성 : ',style: ts,),
                          Text(' { 특성 } : ',style: contentTs,),
                        ],
                      ),
                      SizedBox(height: 16,),
                      Row(
                        children: [
                          Text('• 원하는 인원 : ',style: ts,),
                          Text(' { 인원수 } : ',style: contentTs,),
                        ],
                      ),
                      SizedBox(height: 16,),
                      Row(
                        children: [
                          Text('• 기타 요청 사항 : ',style: ts,),
                          Text(' { 요청 사항 } : ',style: contentTs,),
                        ],
                      ),
                      SizedBox(height: 16,),
                      Row(
                        children: [
                          Text('• 의뢰하는 서비스 : ',style: ts,),
                          Text(' { 서비스명 } : ',style: contentTs,),
                        ],
                      ),
                      SizedBox(height: 16,),
                      Row(
                        children: [
                          Text('• 인터뷰 목적 : ',style: ts,),
                          Text(' { 목적 } : ',style: contentTs,),
                        ],
                      ),
                      SizedBox(height: 16,),
                      Row(
                        children: [
                          Text('• 연락처 : ',style: ts,),
                          Text(' { 연락처 } : ',style: contentTs,),
                        ],
                      ),
                      SizedBox(height: 16,),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
