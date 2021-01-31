import 'package:tomatina/core/models/member.dart';

class Group {

   String groupName;
   List<Member> members;

  Group(this.groupName, this.members);

  Group.fromJSON(Map<String, dynamic> json) {
    groupName = json["group_name"];
    members = json["members"].map<Member>((json) => Member.fromJSON(json)).toList();
  }

  Map<String, dynamic> toJSON() =>
      {
          'group_name': groupName,
          'members': members.map((member) => member.toJSON()).toList()
      };
}