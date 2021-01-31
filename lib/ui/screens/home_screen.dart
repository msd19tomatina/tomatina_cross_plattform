import 'package:flutter/material.dart';
import 'package:tomatina/core/base_storage.dart';
import 'package:tomatina/core/models/group.dart';
import 'package:tomatina/core/models/group_data.dart';
import 'package:tomatina/ui/screens/detail_group_screen.dart';

class HomeScreen extends StatefulWidget {
  final BaseStorage storage;

  HomeScreen({Key key, @required this.storage}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 20.0),
            child: Text(
              "My Groups",
              style: TextStyle(fontSize: 20.0),
              textAlign: TextAlign.center,
            ),
          ),
          FutureBuilder(
            builder: (context, snapshot) {
              if (snapshot.connectionState != ConnectionState.done) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              GroupData data = snapshot.data;
              List<Group> groups = data.groups;
              return Expanded(
                child: ListView.builder(
                    itemCount: groups.length,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 8.0,
                        child: GestureDetector(
                          child: Container(
                            padding: EdgeInsets.all(16.0),
                            child: Text(groups[index].groupName, textAlign: TextAlign.center, style: TextStyle(fontSize: 18.0),),
                          ),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailGroupScreen(selectedGroup: groups[index],)));
                          },
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
