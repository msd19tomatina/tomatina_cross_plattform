import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:tomatina/core/base_storage.dart';
import 'package:tomatina/core/models/group.dart';
import 'package:tomatina/core/models/group_data.dart';

class HighScoreScreen extends StatefulWidget {

  final BaseStorage storage;

  HighScoreScreen({Key key, this.storage}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HighScoreScreenState();
}

class _HighScoreScreenState extends State<HighScoreScreen> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 20),

              child:  Text("Highscores", style: TextStyle(fontSize: 15), textAlign: TextAlign.center)),
          FutureBuilder(
            builder: (context, snapshot) {
              if (snapshot.connectionState != ConnectionState.done) {
                return Container();
              }
              GroupData groupData = snapshot.data;
              List<Group> groups = groupData.groups;
              Map<String, int> groupsWithScore = Map<String, int>();

              groups.forEach((group) { 
                int groupScore = group.members.fold(0, (acc, cur) => acc + cur.currentScore);
                groupsWithScore[group.groupName] = groupScore;
              });

              final sorted = SplayTreeMap.from(groupsWithScore, (key1, key2) => groupsWithScore[key2].compareTo(groupsWithScore[key1]));

              final groupNames = sorted.keys.toList();
              final scores = sorted.values.toList();
              return Expanded(
                child: ListView.builder(
                    itemCount: groupNames.length,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 8.0,
                        child: Container(
                          padding: EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(groupNames[index], textAlign: TextAlign.center, style: TextStyle(fontSize: 18.0),),
                              Text('${scores[index]}'),
                            ],
                          ),
                        ),
                      );
                    }),
              );
            },
            future: widget.storage.groupData,
          )
        ],
      ),
    );
  }
}