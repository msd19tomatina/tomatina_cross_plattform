import 'package:flutter/material.dart';
import 'package:tomatina/core/base_storage.dart';
import 'package:tomatina/core/models/group.dart';
import 'package:tomatina/core/models/member.dart';
import 'package:tomatina/ui/screens/detail_group_screen.dart';

class CreateGroupScreen extends StatefulWidget {
  final BaseStorage storage;

  CreateGroupScreen({Key key, this.storage}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CreateGroupScreenState();
}

class _CreateGroupScreenState extends State<CreateGroupScreen> {

  final GlobalKey<FormState> _createGroupFormKey = GlobalKey<FormState>();
  final TextEditingController _groupNameController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();

  bool _saveButtonIsPressed = false;

  void _saveButtonPressed() async {

      if (!_saveButtonIsPressed) {
        _saveButtonIsPressed = true;
        final groupName = _groupNameController.text;
        final userName = _userNameController.text;

        if (groupName != "" && userName != "") {
          final newMember = Member(userName, 0);
          final newGroup = Group(groupName, [newMember]);

          await widget.storage.saveNewGroup(newGroup);
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailGroupScreen(selectedGroup: newGroup,)));
        }
      }
  }

  Widget _formTitle() {
    return Padding(
        padding: EdgeInsets.fromLTRB(20, 10, 20, 20),
        child: Text("Gruppe Erstellen",
            style: TextStyle(fontSize: 15), textAlign: TextAlign.center));
  }

  Widget _formGroupNameTextField() {
    return Container(
      child: TextFormField(
        controller: _groupNameController,
        decoration: InputDecoration(
          border: InputBorder.none, hintText: "Gruppennamen"
        ),
      ),
    );
  }

  Widget _formUserNameTextField() {
    return Container(
      child: TextFormField(
        controller: _userNameController,
        decoration: InputDecoration(
          border: InputBorder.none, hintText: "Benutzername"
        ),
      ),
    );
  }

  Widget _formSaveButton() {
    return Container(
      margin: EdgeInsets.only(top: 32.0),
      width: MediaQuery.of(context).size.width * 0.5,
      child: RaisedButton(
        color: Colors.lightGreen[400],
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.check_circle_outline, color: Colors.white,),
            SizedBox(width: 5.0,),
            Text("Save", style: TextStyle(fontSize: 16.0, color: Colors.white),)
          ],
        ),
        onPressed: _saveButtonPressed,
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
      return Container(
        padding: EdgeInsets.only(left: 16.0, right: 16.0),
        child: Form(

          key: _createGroupFormKey,
          child: Column(
            children: [
              _formTitle(),
              _formGroupNameTextField(),
              _formUserNameTextField(),
              _formSaveButton()
            ],
          ),
        ),
      );
  }
}
