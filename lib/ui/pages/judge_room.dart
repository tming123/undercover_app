import 'package:flutter/material.dart';
import 'package:undercover_app/util/http_utils.dart';
import 'package:undercover_app/models/models.dart';

HttpUtils _httpUtils = new HttpUtils();
int number;

class JudgeRoomPage extends StatefulWidget {
  final CreateRoomModel data;

  JudgeRoomPage({
    Key key,
    this.data,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new _JudgeRoomPageState(data);
  }
}

class _JudgeRoomPageState extends State<JudgeRoomPage> {
  CreateRoomModel _createRoomModel =
      new CreateRoomModel("00", "000", "0", "0", "0", " ", " ", "0", "0", "0");
  List<MemberModel> listMembers;
  StringBuffer strTipsBuffer = new StringBuffer();

  _JudgeRoomPageState(CreateRoomModel createRoomModel) {
    if (createRoomModel != null) {
      this._createRoomModel = createRoomModel;
      _refresh();
    }
  }

  void _refresh() {
    _httpUtils
        .getRoomInfos(_createRoomModel.ownerId, _createRoomModel.roomNum)
        .then((model) {
      if (model != null &&
          model.createRoomModel != null &&
          model.memberList != null) {
        setState(() {
          // 房间信息
          _createRoomModel = model.createRoomModel;
          // 成员信息
          if (model != null && model.memberList != null) {
            listMembers = model.memberList;
            strTipsBuffer.clear();
            listMembers.forEach((val) {
              if (val.memType != '2') {
                String memType;
                if (val.memType == '0') {
                  memType = '平民';
                }
                if (val.memType == '1') {
                  memType = '卧底';
                }
                strTipsBuffer
                    .write('\n#${val.id}: ' + '${val.memName}' + '（$memType）');
              }
            });
          }
        });
      }
    });
  }

  void refreshVocabulary() {
    _httpUtils
        .refreshVocabulary(_createRoomModel.ownerId, _createRoomModel.roomNum)
        .then((model) {
      if (model != null &&
          model.createRoomModel != null &&
          model.memberList != null) {
        setState(() {
          // 房间信息
          _createRoomModel = model.createRoomModel;
          // 成员信息
          if (model != null && model.memberList != null) {
            strTipsBuffer.clear();
            listMembers = model.memberList;
            listMembers.forEach((val) {
              if (val.memType != '2') {
                String memType;
                if (val.memType == '0') {
                  memType = '平民';
                }
                if (val.memType == '1') {
                  memType = '卧底';
                }
                strTipsBuffer
                    .write('\n#${val.id}: ' + '${val.memName}' + '（$memType）');
              }
            });
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("#${_createRoomModel.roomNum}房间"),
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
                          '建房成功！您是法官，请让参与游戏的玩家输入【${_createRoomModel.roomNum}】进入房间。'
                          '\n'
                          '\n卧底词：${_createRoomModel.underVoc}'
                          '\n平民词：${_createRoomModel.civilianVoc}'
                          '\n配  置：${_createRoomModel.plainUnderNum}个卧底，${_createRoomModel.civilianNum}个平民',
                          style: new TextStyle(
                            fontWeight: FontWeight.bold,
                          ))),
                  new Padding(
                      padding: new EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                      child: new Text(
                        '目前已进入本房间的有${_createRoomModel.nowMember}名玩家，分别是：' +
                            strTipsBuffer.toString(),
                        style: new TextStyle(
                          color: Colors.grey[500],
                        ),
                      )),
                  new Builder(builder: (BuildContext context) {
                    return new Padding(
                        padding: new EdgeInsets.all(10.0),
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            new RaisedButton(
                              onPressed: () {
                                refreshVocabulary();
                              },
                              color: Colors.blue,
                              highlightColor: Colors.deepPurple,
                              disabledColor: Colors.cyan,
                              child: new Text(
                                "换词",
                                style: new TextStyle(color: Colors.white),
                              ),
                            ),
                            new RaisedButton(
                              onPressed: () {
                                _refresh();
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
