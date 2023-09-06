import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';
import 'Components/Interceptors.dart';
import 'Screens/LoginScreen.dart';

Dio dio = Dio();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();

  dio.interceptors.add(customInterceptor(dio));

  WindowOptions windowOptions = const WindowOptions(
    //size: Size(1200, 900),
    center: true,
    backgroundColor: Colors.transparent,
    skipTaskbar: false,
    titleBarStyle: TitleBarStyle.normal,
    //maximumSize: Size(1200, 900),
    minimumSize: Size(1200, 900),
    fullScreen: true,

    windowButtonVisibility: true,
  );

  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });

  runApp(
    MaterialApp(
      // <-- 여기에 MaterialApp을 추가했습니다.
      home: LoginScreen(),
    ),
  );
}
