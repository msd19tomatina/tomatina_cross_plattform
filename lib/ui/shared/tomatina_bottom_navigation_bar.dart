import 'package:flutter/material.dart';

class TomatinaBottomNavigationBar extends StatefulWidget {

  int selectedIndex;
  Function onTapItemTapped;

  TomatinaBottomNavigationBar({Key key, this.selectedIndex, this.onTapItemTapped}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TomatinaBottomNavigationBar();
}

class _TomatinaBottomNavigationBar extends State<TomatinaBottomNavigationBar> {

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.red,
      type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_rounded),
              label: "Create",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.group_add_rounded),
              label: "Join",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.emoji_events_rounded),
            label: "HighScore"
          ),
        ],
    currentIndex: widget.selectedIndex,
    selectedItemColor: Colors.white,
    onTap: widget.onTapItemTapped,);
  }


}