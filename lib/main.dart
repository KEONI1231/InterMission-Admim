import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intermission_admin/Screens/AcceptCheckScreen/AcceptHomeScreen.dart';
import 'package:intermission_admin/Screens/EntryMenuScreen/EntryMenuSelectScreen.dart';
import 'package:intermission_admin/Screens/NoticeRegistScreen/NoticeHomeScreen.dart';
import 'package:intermission_admin/Screens/ResearchRegistScreen/ResearchHomeScreen.dart';
import 'package:window_manager/window_manager.dart';
import 'Components/Interceptors.dart';
import 'Screens/LoginScreen.dart';

Dio dio = Dio();
//var NaviDetermine = NavigatorHistory();

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();

  dio.interceptors.add(customInterceptor(dio));

  WindowOptions windowOptions = const WindowOptions(
    size: Size(1200, 900),
    center: true,
    backgroundColor: Colors.transparent,
    skipTaskbar: false,
    titleBarStyle: TitleBarStyle.normal,
    //maximumSize: Size(1200, 900),
    minimumSize: Size(1200, 850),
    fullScreen: false,
    windowButtonVisibility: true,

  );

  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
    //await setTitle('asdf');
  });

  runApp(
    MaterialApp(
      // routes: {
      //   '/noticeScreen' : (context) => NoticeHomeScreen(),
      //   '/acceptScreen' : (context) => AcceptHomeScreen(),
      //   '/researchScreen' : (context) => ResearchHomeScreen(),
      //   '/entryMenuScreen' : (context) => HomeScreen()
      //
      // },


      home: LoginScreen(),
    ),
  );
}
