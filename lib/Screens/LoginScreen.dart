import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intermission_admin/Components/CustomButton.dart';
import 'package:intermission_admin/Screens/HomeScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_shadow/simple_shadow.dart';

import '../Components/CustomTextField.dart';
import 'package:window_manager/window_manager.dart';
class LoginScreen extends StatefulWidget {

  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> formKey = GlobalKey();

  final TextEditingController _idTextController = TextEditingController();

  final TextEditingController _pwTextController = TextEditingController();

  final dio = Dio();

  final ContainerDecoration = BoxDecoration(
    color: Colors.white,
    //border: Border.all(width: 2, color: PRIMARY_COLOR),
    borderRadius: BorderRadius.circular(12),
    boxShadow: [
      BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 3,
          blurRadius: 7,
          offset: Offset(0, 1))
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 150,
            ),


            Form(
              key: formKey,
              child: Container(
                width: 500,
                height: 600,
                decoration: ContainerDecoration,
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 56,
                    ),

                    SizedBox(
                      height: 56,
                    ),
                    CustomTextField(
                        textInputType: TextInputType.text,
                        Controller: _idTextController,
                        label: 'ID'),
                    SizedBox(
                      height: 16,
                    ),
                    CustomTextField(
                        textInputType: TextInputType.visiblePassword,
                        Controller: _pwTextController,
                        label: 'PW'),
                    SizedBox(
                      height: 80,
                    ),
                    CustomButton(btnText: '로그인', onPressed: onPressed)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  void onPressed() {
    print('테스트 이벤트');
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return HomeScreen();
    }));
  }
  Future<void> saveAuthorizationTokens(
      String authorization, String reAuthorization) async {
    final prefs = await SharedPreferences.getInstance();

    // Authorization 값을 저장합니다.
    await prefs.setString('Authorization', authorization);

    // ReAuthorization 값을 저장합니다.
    await prefs.setString('ReAuthorization', reAuthorization);
  }
}
