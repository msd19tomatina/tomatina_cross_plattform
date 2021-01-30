// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

import 'group.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
    Container(
      child: Column(
        children: <Widget>[
          Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 10),

              child: Text("Tomatina", style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center)),
          Padding(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 20),

              child: Text("Meine Gruppen", style: TextStyle(fontSize: 15),
                  textAlign: TextAlign.center)),
          GestureDetector(
            child: Container(
              height: 50,
              color: Colors.blueGrey[600],
              child: const Center(child: Text('Gruppe 1')),
            ),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => MyWidget()));
            },
          ),
          GestureDetector(
            child: Container(
              height: 50,
              color: Colors.blueGrey[600],
              child: const Center(child: Text('Gruppe 2')),
            ),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => MyWidget()));
            },
          ),
          GestureDetector(
            child: Container(
              height: 50,
              color: Colors.blueGrey[600],
              child: const Center(child: Text('Gruppe 3')),
            ),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => MyWidget()));
            },
          ),
        ],
      ),
    );
  }
}