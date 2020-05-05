import 'package:flutter/material.dart';
import 'package:flutterapp/music_player_tutorial.dart';
import 'package:flutterapp/push_data.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PushData(title: 'Flutter Demo Home Page'),
//      home: HomePage(),
    );
  }
}
