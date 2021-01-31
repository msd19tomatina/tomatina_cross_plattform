import 'package:tomatina/core/models/group.dart';

class GroupData {

  List<Group> groups;

  GroupData(this.groups);

  GroupData.fromJSON(Map<String, dynamic> json) {
    groups = json["groups"].map<Group>((json) => Group.fromJSON(json)).toList();
  }

  Map<String, dynamic> toJSON() =>
      {
        'groups': groups.map((group) => group.toJSON()).toList()
      };
}