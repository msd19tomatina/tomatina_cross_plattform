// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

class Highscores extends StatelessWidget {
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

                child:  Text("Highscores", style: TextStyle(fontSize: 15), textAlign: TextAlign.center)),
            Container(
              height: 30,
              color: Colors.amber[600],
              child: const Center(child: Text('Gruppe 1')),
            ),
            Container(
              height: 30,
              color: Colors.amber[500],
              child: const Center(child: Text('Gruppe 2')),
            ),
            Container(
              height: 30,
              color: Colors.amber[100],
              child: const Center(child: Text('Gruppe 3')),
            ),

          ],

        ),

      );
  }
}