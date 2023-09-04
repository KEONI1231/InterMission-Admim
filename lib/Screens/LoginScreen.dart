import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intermission_admin/Components/CustomButton.dart';
import 'package:intermission_admin/Screens/HomeScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:intermission_admin/main.dart';
import '../Components/CircularProgress.dart';
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

  void onPressed() async {

    if (formKey.currentState == null) {
      return;
    }
    if (formKey.currentState!.validate()) {
      Navigator.of(context)
              .push(MaterialPageRoute(builder: (BuildContext context) {
            return HomeScreen();
          }));

      // try {
      //   print(_idTextController.text.toString());
      //
      //   String credentials = '$_idTextController.text.toString() : _pwTextController.text.toString()';
      //   String encodedCredentials = base64Encode(utf8.encode(credentials));
      //   print(encodedCredentials);
      //   CustomCircular(context, 0);
      //   final response = await dio.post(
      //     '${dotenv.env['baseUrl']}'+'${dotenv.env['loginUrl']}',
      //
      //     data: {
      //       'email': _idTextController.text.toString(),
      //       'password': _pwTextController.text.toString()
      //     },
      //     options: Options(
      //       headers: {
      //         'Authorization': "Basic $encodedCredentials",
      //       },
      //     ),
      //   );
      //
      //   String accessToken = response.data.value('authorization') ?? '';
      //   String refreshToken =
      //       response.headers.value('reauthorization') ?? '';
      //
      //   await saveAuthorizationTokens(accessToken, refreshToken);
      //
      //   Navigator.pop(context);
      //
      //   Navigator.of(context)
      //       .push(MaterialPageRoute(builder: (BuildContext context) {
      //     return HomeScreen();
      //   }));
      //
      // } catch (e) {
      //   Navigator.pop(context);
      //   print(e);
      // }
    }
  }

  Future<void> saveAuthorizationTokens(
      String authorization, String reAuthorization) async {
    final prefs = await SharedPreferences.getInstance();

    // Authorization 값을 저장합니다.
    await prefs.setString('accessToken', authorization);

    // ReAuthorization 값을 저장합니다.
    await prefs.setString('refreshToken', reAuthorization);
  }
}
