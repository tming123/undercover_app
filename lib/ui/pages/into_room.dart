import 'package:flutter/material.dart';
import 'package:undercover_app/util/http_utils.dart';
import 'package:undercover_app/ui/pages/player_room.dart';

class IntoRoomPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _IntoRoomPageState();
  }
}

class _IntoRoomPageState extends State<IntoRoomPage> {

  void joinRoom(String name, String roomId) {
    new HttpUtils().joinRoom(name,roomId).then((model) {
      if (model != null) {
        Navigator.pushReplacement(context, new MaterialPageRoute(builder: (BuildContext context){
          return new PlayerRoomPage(memberModel:model);
        }));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _userNameController = new TextEditingController();
    TextEditingController _userRoomController = new TextEditingController();

    return new Scaffold(
        appBar: new AppBar(
          title: new Text("进入房间"),
          centerTitle: true,
        ),
        body: new Column(
          children: <Widget>[
            new Card(
              elevation: 8.0,
              margin: const EdgeInsets.all(15.0),
              child: new Column(
                children: <Widget>[
                  new Padding(
                      padding: new EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                      child: new TextField(
                        controller: _userNameController,
                        keyboardType: TextInputType.text,
                        decoration: new InputDecoration(
                            contentPadding: const EdgeInsets.all(10.0),
                            icon: new Icon(Icons.nature_people),
                            labelText: "请输入昵称...",
                            helperText: "确定在游戏中的昵称"),
                      )),
                  new Padding(
                      padding: new EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                      child: new TextField(
                        controller: _userRoomController,
                        keyboardType: TextInputType.text,
                        decoration: new InputDecoration(
                            contentPadding: const EdgeInsets.all(10.0),
                            icon: new Icon(Icons.room_service),
                            labelText: "请输入房间号...",
                            helperText: "确定进入的游戏房间"),
                      )),
                  new Builder(builder: (BuildContext context) {
                    return new Padding(
                        padding: new EdgeInsets.all(10.0),
                        child: new RaisedButton(
                          onPressed: () {
                            joinRoom(_userNameController.text, _userRoomController.text);
                          },
                          color: Colors.blue,
                          highlightColor: Colors.deepPurple,
                          disabledColor: Colors.cyan,
                          child: new Text(
                            "开始",
                            style: new TextStyle(color: Colors.white),
                          ),
                        ));
                  })
                ],
              ),
            )
          ],
        ));
  }
}
