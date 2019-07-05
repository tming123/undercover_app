import 'package:flutter/material.dart';
import 'package:undercover_app/ui/pages/splash_page.dart';
import 'package:undercover_app/constant/route_const.dart';
import 'package:undercover_app/ui/pages/home_page.dart';
import 'package:undercover_app/ui/pages/into_room.dart';
import 'package:undercover_app/ui/pages/create_room.dart';
import 'package:undercover_app/ui/pages/judge_room.dart';
import 'package:undercover_app/ui/pages/player_room.dart';
import 'package:undercover_app/ui/pages/about_page.dart';

void main() => runApp(MyApp());

// This widget is the root of your application.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        // 注册页面路由
        routes: {
          RouteConst.routeMain: (ctx) => HomePage(),
          RouteConst.routeIntoRoom: (ctx) => IntoRoomPage(),
          RouteConst.routeCreateRoom: (ctx) => CreateRoomPage(),
          RouteConst.routeJudgeRoom: (ctx) => JudgeRoomPage(),
          RouteConst.routePlayerRoom: (ctx) => PlayerRoomPage(),
          RouteConst.routeAbout: (ctx) => AboutPage(),
        },
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: new SplashPage(),);
  }
}
