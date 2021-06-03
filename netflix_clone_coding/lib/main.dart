import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone_coding/screen/home_screen.dart';
import 'package:netflix_clone_coding/screen/loading_screen.dart';
import 'package:netflix_clone_coding/screen/more_screen.dart';
import 'package:netflix_clone_coding/widget/bottom_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _initialized = false;
  bool _error = false;

  void initializeFlutterFire() async {
    try {
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch (e) {
      _error = true;
    }
  }

  late TabController controller;

  _MyAppState() {
    initializeFlutterFire();
  }

  @override
  Widget build(BuildContext context) {

    if(_error) {
      return exit(1);
    }

    // Show a loader until FlutterFire is initialized
    if (!_initialized) {
      return LoadingScreen();
    }

    return myAwesomeApp();
  }
}

Widget myAwesomeApp() {
  return MaterialApp(
      title: 'JinFlix',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.black,
        accentColor: Colors.white,
      ),
      home: DefaultTabController(
          length: 4,
          child: Scaffold(
            body: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                children: <Widget>[
                  HomeScreen(),
                  Container(child: Center(child: Text('search'))),
                  Container(child: Center(child: Text('save'))),
                  MoreScreen()
                ]),
            bottomNavigationBar: Bottom(),
          )));
}
