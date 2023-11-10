import 'package:flutter/material.dart';
import 'package:intermission_admin/Constants/Color.dart';

class Survey extends StatelessWidget {
  const Survey({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                          Text('• 설문 대상 : ',style: ts,),
                          Text(' { 설문 대상 } : ',style: contentTs,),
                        ],
                      ),
                      SizedBox(height: 16,),
                      Row(
                        children: [
                          Text('• 설문 링크 : ',style: ts,),
                          Text(' { 설문 링크 } : ',style: contentTs,),
                        ],
                      ),
                      SizedBox(height: 16,),
                      Row(
                        children: [
                          Text('• 설문 예상 문항 및 응답 시간 : ',style: ts,),
                          Text(' { 설문 예상 문항 및 응답 시간 } : ',style: contentTs,),
                        ],
                      ),
                      SizedBox(height: 16,),
                      Row(
                        children: [
                          Text('• 원하는 인원 : ',style: ts,),
                          Text(' { 원하는 인원 } : ',style: contentTs,),
                        ],
                      ),
                      SizedBox(height: 16,),
                      Row(
                        children: [
                          Text('• 의뢰하는 서비스 : ',style: ts,),
                          Text(' { 의뢰하는 서비스 } : ',style: contentTs,),
                        ],
                      ),
                      SizedBox(height: 16,),
                      Row(
                        children: [
                          Text('• 연락처: ',style: ts,),
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
