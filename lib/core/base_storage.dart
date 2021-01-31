import 'dart:convert';
import 'dart:io';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tomatina/core/models/group.dart';
import 'package:tomatina/core/models/group_data.dart';

class BaseStorage {

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/data.json');
  }

  Future<File> writeInitialJSON() async {
    final localContent = await rootBundle.loadString('files/init_data.json');
    final file = await _localFile;
    return file.writeAsString(localContent, flush: true);
  }

  Future<GroupData> get groupData async {
    try {
      final file = await _localFile;
      String content = await file.readAsString();
      final parsedJson = jsonDecode(content);
      return GroupData.fromJSON(parsedJson);

    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<File> saveNewGroup(Group newGroup) async {
    GroupData savedData = await groupData;
    savedData.groups.add(newGroup);
    final newJson = savedData.toJSON();
    final jsonString = jsonEncode(newJson);
    final file = await _localFile;
    return file.writeAsString(jsonString, flush: true);
  }
}