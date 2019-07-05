// 法官创建房间信息
class CreateRoomModel {
  String id;
  String roomNum;
  String ownerId;
  String memberNum;
  String nowMember;
  String civilianVoc;
  String underVoc;
  String plainUnderNum;
  String underNum;
  String civilianNum;

  CreateRoomModel(
    this.id,
    this.roomNum,
    this.ownerId,
    this.memberNum,
    this.nowMember,
    this.civilianVoc,
    this.underVoc,
    this.plainUnderNum,
    this.underNum,
    this.civilianNum,
  );

  @override
  String toString() {
    return 'CreateRoomModel{id: $id, roomNum: $roomNum, ownerId: $ownerId, memberNum: $memberNum, nowMember: $nowMember, civilianVoc: $civilianVoc, underVoc: $underVoc, plainUnderNum: $plainUnderNum, underNum: $underNum, civilianNum: $civilianNum}';
  }
}

// 房间信息
class RoomInfosModel {
  List<MemberModel> memberList;
  CreateRoomModel createRoomModel;

  RoomInfosModel(this.memberList, this.createRoomModel);
}

// 成员信息
class MemberModel {
  String id;
  String isInRoom;
  String memName;
  String memType;
  String roomId;
  String vocabulary;

  MemberModel(this.id, this.isInRoom, this.memName, this.memType, this.roomId,
      this.vocabulary);

  @override
  String toString() {
    return 'MemberModel{id: $id, isInRoom: $isInRoom, memName: $memName, memType: $memType, roomId: $roomId, vocabulary: $vocabulary}';
  }
}
