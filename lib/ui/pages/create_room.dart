import 'package:flutter/material.dart';
import 'package:undercover_app/util/http_utils.dart';
import 'package:undercover_app/ui/pages/judge_room.dart';

class CreateRoomPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _CreateRoomPage();
  }
}

class _CreateRoomPage extends State<CreateRoomPage> {

  void getCreateRoomInfo(String number) {
    if (4 < int.parse(number) && 13 > int.parse(number)) {
      new HttpUtils().getCreateRoomInfo(number).then((model) {
        if (model != null) {
          Navigator.pushReplacement(context, new MaterialPageRoute(builder: (BuildContext context){
            return new JudgeRoomPage(data:model);
          }));
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _userNumController = new TextEditingController();

    return new Scaffold(
        appBar: new AppBar(
          title: new Text("创建房间"),
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
                      padding: new EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 20.0),
                      child: new TextField(
                        controller: _userNumController,
                        keyboardType: TextInputType.number,
                        decoration: new InputDecoration(
                            contentPadding: const EdgeInsets.all(10.0),
                            icon: new Icon(Icons.person),
                            labelText: "请输入数字...",
                            helperText: "确定场上玩家人数（4-13之间，不包括法官哦）"),
                      )),
                  new Builder(builder: (BuildContext context) {
                    return new Padding(
                        padding: new EdgeInsets.all(10.0),
                        child: new RaisedButton(
                          onPressed: () {
                            getCreateRoomInfo(_userNumController.text);
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
