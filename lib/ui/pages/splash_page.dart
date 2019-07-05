import 'package:flutter/material.dart';
import 'package:undercover_app/util/route_util.dart';
import 'package:undercover_app/constant/route_const.dart';
import 'package:undercover_app/util/utils.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key key}) : super(key: key);

  @override
  _SplashPage createState() => new _SplashPage();
}

class _SplashPage extends State<SplashPage> {
  bool isStartHomePage = false;

  @override
  Widget build(BuildContext context) {
    return _buildSplashBg();
  }

  @override
  void initState() {
    super.initState();
    countDown();
  }

  Widget _buildSplashBg() {
    return new Image.asset(
      Utils.getImgPath('splash_bg'),
      width: double.infinity,
      fit: BoxFit.fill,
      height: double.infinity,
    );
  }

  void countDown() {
    var duration = new Duration(seconds: 1);
    new Future.delayed(duration, () {
      if (!isStartHomePage) {
        RouteUtil.pushReplacementNamed(context, RouteConst.routeMain);
        isStartHomePage = true;
      }
    });
  }
}
