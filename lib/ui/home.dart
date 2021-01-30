// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
    Container(
            child: ListView(
             padding: const EdgeInsets.all(8),
             children: <Widget>[

               Container(
                 height: 50,
                 color: Colors.amber[600],
                 child: const Center(child: Text('Entry A')),
               ),
               Container(
                 height: 50,
                 color: Colors.amber[500],
                 child: const Center(child: Text('Entry B')),
               ),
               Container(
                 height: 50,
                 color: Colors.amber[100],
                 child: const Center(child: Text('Entry C')),
               ),
             ],
           ),
    );
  }
}