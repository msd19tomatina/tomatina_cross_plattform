import 'package:flutter/material.dart';

class JoinGroupScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _JoinGroupScreen();

}

class _JoinGroupScreen extends State<JoinGroupScreen> {

  final GlobalKey<FormState> _joinFormKey = GlobalKey<FormState>();
  final TextEditingController _codeController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  Future<void> _showAlertDialog() async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: Text("Not implemented yet"),
            content: Text("Sorry! This feature is not implemented in this version."),
            actions: [
              TextButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  Widget _formTitle() {
    return Padding(
        padding: EdgeInsets.fromLTRB(20, 10, 20, 20),
        child: Text("Gruppe Erstellen",
            style: TextStyle(fontSize: 15), textAlign: TextAlign.center));
  }

  Widget _formCodeTextField() {
    return Container(
      child: TextFormField(
        controller: _codeController,
        decoration: InputDecoration(
            border: InputBorder.none, hintText: "Code"
        ),
      ),
    );
  }

  Widget _formUserNameTextField() {
    return Container(
      child: TextFormField(
        controller: _usernameController,
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
            Icon(Icons.control_point, color: Colors.white,),
            SizedBox(width: 5.0,),
            Text("Join", style: TextStyle(fontSize: 16.0, color: Colors.white),)
          ],
        ),
        onPressed: _showAlertDialog,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16.0, right: 16.0),
      child: Form(
        key: _joinFormKey,
        child: Column(
          children: [
            _formTitle(),
            _formCodeTextField(),
            _formUserNameTextField(),
            _formSaveButton()
          ],
        ),
      ),
    );
  }

}





/*class JoinGroupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
      Container(
        child: Column(
          children: <Widget>[
            Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 10),

                child:  Text("Tomatina", style: TextStyle(fontSize: 20), textAlign: TextAlign.center)),

            Padding(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 20),
              child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none, hintText: 'Code'),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 20),
              child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none, hintText: 'Benutzername'),
              ),
            ),
          ],


        ),

      );
  }
}*/