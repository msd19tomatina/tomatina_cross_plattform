import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tomatina/core/models/group.dart';

class DetailGroupScreen extends StatefulWidget {

  final Group selectedGroup;

  DetailGroupScreen({Key key, this.selectedGroup}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DetailGroupScreenState();
}

class _DetailGroupScreenState extends State<DetailGroupScreen> {

  Timer _timer;
  int _timeInterval = 1500;
  bool _timerIsActivated = false;

  String get _timerString {
    return '${(_timeInterval ~/ 60)}:${(_timeInterval % 60).toString().padLeft(2, '0')}';
  }

  void _startTimer() {
    if (_timer != null) {
      _timer.cancel();
      _timer = null;
      _timerIsActivated = false;
      setState(() {
        _timeInterval = 1500;
      });
    }
    else {
      _timerIsActivated = true;
      _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
        setState(() {
          if (_timeInterval < 0) {
            _timer.cancel();
          }
          else {
            _timeInterval = _timeInterval - 1;
          }
        });
      });
    }
  }

  void _stopTimer() {
    if (_timer != null) {
      _timer.cancel();
      _timerIsActivated = false;
      setState(() {
        _timeInterval = 1500;
      });
    }
  }

  @override
  void dispose() {
    if (_timer != null) {
      _timer.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(widget.selectedGroup.groupName),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop),
                image: AssetImage("images/tomatinabg.png"), fit: BoxFit.cover)
        ),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 24.0),
              height: 200.0,
              child: ListView.builder(
                itemCount: widget.selectedGroup.members.length,
                  itemBuilder: (context, index) {
                  return Card(
                    child: Container(
                      padding: EdgeInsets.all(16.0),
                      height: 50.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(widget.selectedGroup.members[index].name),
                          Row(
                            children: [
                              Text('${widget.selectedGroup.members[index].currentScore}'),
                              SizedBox(width: 5.0,),
                              Icon(Icons.sports_soccer, color: Colors.red, size: 14.0,)
                            ],
                          )
                          ,
                        ],
                      ),
                    ),
                  );
                  }),
            ),
            SizedBox(
              height: 24.0,
            ),
            Center(
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.50,
                        height: MediaQuery.of(context).size.width * 0.50,
                        decoration: BoxDecoration(
                            color: Colors.orange,
                            shape: BoxShape.circle
                        ),
                      ),
                      Text(_timerString, style: TextStyle(fontSize: 28.0),)
                    ],
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: RaisedButton(
                        child: Text(_timerIsActivated ? "Stop" : "Start"),
                        color: _timerIsActivated ? Colors.red : Colors.green,
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(16.0))
                        ),
                        onPressed: () {
                          _timerIsActivated ? _stopTimer() : _startTimer();
                        }),
                  ),
                  _timerIsActivated ? Container(child: Text("Wenn du auf 'Stopp' klickst, geht dein Fortschritt verloren"),) : Container()
                ],
              )
            )
          ],
        ),
      ),
    );
  }
}