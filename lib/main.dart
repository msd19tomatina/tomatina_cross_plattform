import 'package:flutter/material.dart';
import 'package:tomatina/core/base_storage.dart';
import 'package:tomatina/ui/tomatina_app.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Tomatina",
      debugShowCheckedModeBanner: false,
      home: TomatinaApp(baseStorage: BaseStorage(),),
    );
  }
}