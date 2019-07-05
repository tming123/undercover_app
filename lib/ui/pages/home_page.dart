import 'package:flutter/material.dart';
import 'package:undercover_app/util/utils.dart';
import 'package:undercover_app/util/route_util.dart';
import 'package:undercover_app/constant/route_const.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('角色选择'),
        centerTitle: true,
      ),
      body: new Center(
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new Card(
              elevation: 8.0,
              margin: const EdgeInsets.all(15.0),
              child: new InkWell(
                  child: new Container(
                    width: 100.0,
                    height: 100.0,
                    alignment: Alignment.center,
                    child: new Text("我是法官"),
                  ),
                  onTap: () {
                    RouteUtil.pushNamed(context, RouteConst.routeCreateRoom);
                  }),
            ),
            new Card(
              elevation: 8.0,
              margin: const EdgeInsets.all(15.0),
              child: new InkWell(
                  child: new Container(
                    width: 100.0,
                    height: 100.0,
                    alignment: Alignment.center,
                    child: new Text("我是玩家"),
                  ),
                  onTap: () {
                    RouteUtil.pushNamed(context, RouteConst.routeIntoRoom);
                  }),
            )
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: new Text('Tony'),
              accountEmail: new Text('undercover_app@xxx.com'),
              currentAccountPicture: new CircleAvatar(
                backgroundImage:
                    AssetImage(Utils.getImgPath('left_drawer_header')),
                radius: 35.0,
              ),
            ),
            ListTile(
              leading: new Icon(Icons.info),
              title: Text('关于'),
              onTap: () {
                RouteUtil.pushNamed(context, RouteConst.routeAbout);
              },
            ),
            ListTile(
              leading: new Icon(Icons.share),
              title: Text('分享'),
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }

  Widget buildDrawerHeader() {
    Widget userHeader = UserAccountsDrawerHeader(
      accountName: new Text('Tom'),
      accountEmail: new Text('tom@xxx.com'),
      currentAccountPicture: new CircleAvatar(
        backgroundImage: AssetImage('images/pic1.jpg'),
        radius: 35.0,
      ),
    );

    return userHeader;
  }
}
