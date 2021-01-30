import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:tomatina_cross_plattform/views/add_group.dart';
import 'package:tomatina_cross_plattform/views/create_group.dart';
import 'package:tomatina_cross_plattform/views/highscores_view.dart';
import 'package:tomatina_cross_plattform/views/home_view.dart';
import 'package:tomatina_cross_plattform/views/timer_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tomatina',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: HomeView(),
      routes: {
        '/createGroup': (context) => CreateGroup(),
        '/addGroup' : (context) => AddGroup(),
        '/timerView' : (context) => TimerView(),
        'highscoresView' : (context) => HighscoresView(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _page = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 0,
        height: 50.0,
        items: <Widget>[
          Icon(Icons.add, size: 30),
          Icon(Icons.list, size: 30),
          Icon(Icons.compare_arrows, size: 30),

        ],
        color: Colors.white,
        buttonBackgroundColor: Colors.white,
        backgroundColor: Colors.blueAccent,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
      ),
      body: Container(
        color: Colors.white60,
        child: Center(
          child: Column(
            children: <Widget>[
              Text(_page.toString(), textScaleFactor: 10.0),
              RaisedButton(
                child: Text('Go To Page of index 1'),
                onPressed: () {
                  //Page change using state does the same as clicking index 1 navigation button
                  final CurvedNavigationBarState navBarState =
                      _bottomNavigationKey.currentState;
                  navBarState.setPage(1);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}