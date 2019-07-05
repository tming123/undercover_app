import 'package:flutter/material.dart';
import 'package:undercover_app/constant/route_const.dart';

class RouteUtil {
  static void goMain(BuildContext context) {
    pushReplacementNamed(context, RouteConst.routeMain);
  }

  static void goCreateRoom(BuildContext context) {
    pushNamed(context, RouteConst.routeMain);
  }

  static void goIntoRoom(BuildContext context) {
    pushNamed(context, RouteConst.routeMain);
  }

  static void pushNamed(BuildContext context, String pageName) {
    Navigator.of(context).pushNamed(pageName);
  }

  static void pushReplacementNamed(BuildContext context, String pageName) {
    Navigator.of(context).pushReplacementNamed(pageName);
  }

  static void pushReplacementNamedWithArgs(BuildContext context, String pageName, String key, Object data) {
    Navigator.pushReplacementNamed(context, pageName, arguments: {key: data});
  }
}
