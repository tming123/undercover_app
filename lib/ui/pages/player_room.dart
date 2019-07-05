import 'package:flutter/material.dart';
import 'package:undercover_app/util/http_utils.dart';
import 'package:undercover_app/models/models.dart';

class PlayerRoomPage extends StatefulWidget {
  final MemberModel memberModel;

  const PlayerRoomPage({Key key, this.memberModel}) : super(key: key);


  @override
  State<StatefulWidget> createState() {
    return new _PlayerRoomPageState(memberModel);
  }
}

class _PlayerRoomPageState extends State<PlayerRoomPage> {
  MemberModel _memberModel = new MemberModel('', '', '', '', '', '');

  _PlayerRoomPageState(MemberModel memberModel) {
    if (memberModel != null) {
      _memberModel = memberModel;
    }
  }

  void getWodiMemberInfos(String memberId, String roomId) {
    new HttpUtils().getWodiMemberInfos(memberId, roomId).then((model){
      if(model !=null) {
        setState(() {
          _memberModel = model;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("#${_memberModel.roomId}房间"),
          centerTitle: true,
        ),
        body: new Column(
          children: <Widget>[
            new Card(
              elevation: 15.0,
              margin: const EdgeInsets.all(15.0),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Padding(
                      padding: new EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                      child: new Text(
                          '昵  称：${_memberModel.memName}'
                          '\n你  是：${_memberModel.id}号'
                          '\n词  语：${_memberModel.vocabulary}',
                          style: new TextStyle(
                            fontWeight: FontWeight.bold,
                          ))),
                  new Builder(builder: (BuildContext context) {
                    return new Padding(
                        padding: new EdgeInsets.all(10.0),
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            new RaisedButton(
                              onPressed: () {
                                getWodiMemberInfos(_memberModel.id, _memberModel.roomId);
                              },
                              color: Colors.blue,
                              highlightColor: Colors.deepPurple,
                              disabledColor: Colors.cyan,
                              child: new Text(
                                "刷新",
                                style: new TextStyle(color: Colors.white),
                              ),
                            )
                          ],
                        ));
                  })
                ],
              ),
            )
          ],
        ));
  }
}
