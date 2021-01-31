import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tomatina/core/base_storage.dart';
import 'package:tomatina/ui/screens/createGroup.dart';
import 'package:tomatina/ui/screens/highscores.dart';
import 'package:tomatina/ui/screens/home_screen.dart';
import 'package:tomatina/ui/screens/joinGroup.dart';
import 'package:tomatina/ui/shared/tomatina_bottom_navigation_bar.dart';

class TomatinaApp extends StatefulWidget {

  final BaseStorage baseStorage;

  TomatinaApp({Key key, @required this.baseStorage}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TomatinaApp();
}

class _TomatinaApp extends State<TomatinaApp> {

  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  int _selectedIndex = 0;

  List<Widget> _screens = [];

  void _onTapItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _initScreen() {
    _screens.add(HomeScreen(storage: widget.baseStorage));
    _screens.add(CreateGroupScreen(storage: widget.baseStorage,));
    _screens.add(JoinGroupScreen());
    _screens.add(HighScoreScreen(storage: widget.baseStorage,));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Tomatina"),
      ),
      body: FutureBuilder(
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return Container();
          }
          SharedPreferences prefs = snapshot.data;
          if (!(prefs.getBool("initial") ?? false)) {
            return FutureBuilder(
                builder: (context, snapshot) {
                  if (snapshot.connectionState != ConnectionState.done) {
                    return Container();
                  }
                  _initScreen();
                  prefs.setBool("initial", true);
                  return Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop),
                            image: AssetImage("images/tomatinabg.png"), fit: BoxFit.cover)
                    ),
                    child: _screens[_selectedIndex],
                  );
                },
                future: widget.baseStorage.writeInitialJSON(),);
          }
          else {
            _initScreen();
            return Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop),
                      image: AssetImage("images/tomatinabg.png"), fit: BoxFit.cover)
              ),
              child: _screens[_selectedIndex],
            );
          }
        },
        future: _prefs,
      ),
      bottomNavigationBar: TomatinaBottomNavigationBar(selectedIndex: _selectedIndex, onTapItemTapped: _onTapItemTapped,),
    );
  }
}