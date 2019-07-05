import 'dart:convert';
import 'dart:io';
import 'package:undercover_app/models/models.dart';

class HttpUtils {
  static const String HOST = '192.168.43.29:9090';

  // 法官创建房间
  Future<CreateRoomModel> getCreateRoomInfo(String number) async {
    try {
      var httpClient = new HttpClient();
      var uri = new Uri.http(HOST, '/wodi/createdRoom', {'memNum': '$number'});
      var request = await httpClient.getUrl(uri);
      var response = await request.close();
      if (response.statusCode == HttpStatus.OK) {
        var json = await response.transform(utf8.decoder).join();
        var data = jsonDecode(json);
        print("HttpUtils --> _getCreateRoomInfo:\t" + data.toString());
        return new CreateRoomModel(
            data['infos']['id'].toString(),
            data['infos']['roomNum'].toString(),
            data['infos']['ownerId'].toString(),
            data['infos']['memberNum'].toString(),
            data['infos']['nowMember'].toString(),
            data['infos']['civilianVoc'].toString(),
            data['infos']['underVoc'].toString(),
            data['infos']['plainUnderNum'].toString(),
            data['infos']['underNum'].toString(),
            (data['infos']['memberNum'] - data['infos']['plainUnderNum']).toString()
        );
      } else {
        print("HttpUtils --> _getCreateRoomInfo:\t" +
            'Http status ${response.statusCode}');
        return null;
      }
    } catch (exception) {
      print("HttpUtils --> _getCreateRoomInfo:\t" +
          'Failed ' +
          exception.toString());
      return null;
    }
  }

  // 进入房间
  Future<MemberModel> joinRoom(String name, String roomId) async {
    try {
      var httpClient = new HttpClient();
      var uri = new Uri.http(HOST, '/wodi/joinRoom',
          {'roomId': '$roomId', 'name': '$name'});
      var request = await httpClient.getUrl(uri);
      var response = await request.close();
      if (response.statusCode == HttpStatus.OK) {
        var json = await response.transform(utf8.decoder).join();
        var data = jsonDecode(json);
        print("HttpUtils --> joinRoom:\t" + data.toString());

        return new MemberModel(
            data['infos']['id'].toString(),
            data['infos']['isInRoom'].toString(),
            data['infos']['memName'].toString(),
            data['infos']['memType'].toString(),
            data['infos']['roomId'].toString(),
            data['infos']['vocabulary'].toString());
      } else {
        print(
            "HttpUtils --> joinRoom:\t" + 'Http status ${response.statusCode}');
        return null;
      }
    } catch (exception) {
      print("HttpUtils --> joinRoom:\t" + 'Failed ' + exception.toString());
      return null;
    }
  }

  // 法官刷新
  Future<RoomInfosModel> getRoomInfos(String memberId, String roomId) async {
    try {
      var httpClient = new HttpClient();
      var uri = new Uri.http(HOST, '/wodi/getRoomInfos',
          {'roomId': '$roomId', 'memberId': '$memberId'});
      var request = await httpClient.getUrl(uri);
      var response = await request.close();
      if (response.statusCode == HttpStatus.OK) {
        var json = await response.transform(utf8.decoder).join();
        Map<String, dynamic> data = jsonDecode(json);
        print("HttpUtils --> getRoomInfos:\t" + data.toString());
        CreateRoomModel createRoomModel = new CreateRoomModel(
            data['infos']['room']['id'].toString(),
            data['infos']['room']['roomNum'].toString(),
            data['infos']['room']['ownerId'].toString(),
            data['infos']['room']['memberNum'].toString(),
            data['infos']['room']['nowMember'].toString(),
            data['infos']['room']['civilianVoc'].toString(),
            data['infos']['room']['underVoc'].toString(),
            data['infos']['room']['plainUnderNum'].toString(),
            data['infos']['room']['underNum'].toString(),
            (data['infos']['room']['memberNum'] - data['infos']['room']['plainUnderNum']).toString()
        );
        List<MemberModel> listMembers = new List();
        List<dynamic> members =  data['infos']['members'];
        members.forEach((val){
          MemberModel model = new MemberModel(
              val['id'].toString(),
              val['isInRoom'].toString(),
              val['memName'].toString(),
              val['memType'].toString(),
              val['roomId'].toString(),
              val['vocabulary'].toString()
          );
          listMembers.add(model);
        });

        return new RoomInfosModel(listMembers,createRoomModel);
      } else {
        print("HttpUtils --> getRoomInfos:\t" +
            'Http status ${response.statusCode}');
        return null;
      }
    } catch (exception) {
      print("HttpUtils --> getRoomInfos:\t" + 'Failed ' + exception.toString());
      return null;
    }
  }

  // 法官换词
  Future<RoomInfosModel> refreshVocabulary(String memberId, String roomId) async {
    try {
      var httpClient = new HttpClient();
      var uri = new Uri.http(HOST, '/wodi/refreshVocabulary',
          {'roomId': '$roomId', 'memberId': '$memberId'});
      var request = await httpClient.getUrl(uri);
      var response = await request.close();
      if (response.statusCode == HttpStatus.OK) {
        var json = await response.transform(utf8.decoder).join();
        Map<String, dynamic> data = jsonDecode(json);
        print("HttpUtils --> refreshVocabulary:\t" + data.toString());
        CreateRoomModel createRoomModel = new CreateRoomModel(
            data['infos']['room']['id'].toString(),
            data['infos']['room']['roomNum'].toString(),
            data['infos']['room']['ownerId'].toString(),
            data['infos']['room']['memberNum'].toString(),
            data['infos']['room']['nowMember'].toString(),
            data['infos']['room']['civilianVoc'].toString(),
            data['infos']['room']['underVoc'].toString(),
            data['infos']['room']['plainUnderNum'].toString(),
            data['infos']['room']['underNum'].toString(),
            (data['infos']['room']['memberNum'] - data['infos']['room']['plainUnderNum']).toString()
        );
        List<MemberModel> listMembers = new List();
        List<dynamic> members =  data['infos']['member'];
        members.forEach((val){
          MemberModel model = new MemberModel(
              val['id'].toString(),
              val['isInRoom'].toString(),
              val['memName'].toString(),
              val['memType'].toString(),
              val['roomId'].toString(),
              val['vocabulary'].toString()
          );
          listMembers.add(model);
        });

        return new RoomInfosModel(listMembers,createRoomModel);
      } else {
        print("HttpUtils --> refreshVocabulary:\t" +
            'Http status ${response.statusCode}');
        return null;
      }
    } catch (exception) {
      print("HttpUtils --> refreshVocabulary:\t" +
          'Failed ' +
          exception.toString());
      return null;
    }
  }

  // 玩家刷新
  Future<MemberModel> getWodiMemberInfos(String memberId, String roomId) async {
    try {
      var httpClient = new HttpClient();
      var uri = new Uri.http(HOST, '/wodi/getWodiMemberInfos',
          {'roomId': '$roomId', 'memberId': '$memberId'});
      var request = await httpClient.getUrl(uri);
      var response = await request.close();
      if (response.statusCode == HttpStatus.OK) {
        var json = await response.transform(utf8.decoder).join();
        var data = jsonDecode(json);
        print("HttpUtils --> getWodiMemberInfos:\t" + data.toString());
        return new MemberModel(
            data['infos']['id'].toString(),
            data['infos']['isInRoom'].toString(),
            data['infos']['memName'].toString(),
            data['infos']['memType'].toString(),
            data['infos']['roomId'].toString(),
            data['infos']['vocabulary'].toString());
      } else {
        print("HttpUtils --> getWodiMemberInfos:\t" +
            'Http status ${response.statusCode}');
        return null;
      }
    } catch (exception) {
      print("HttpUtils --> getWodiMemberInfos:\t" +
          'Failed ' +
          exception.toString());
      return null;
    }
  }
}
