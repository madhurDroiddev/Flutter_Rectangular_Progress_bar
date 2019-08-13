import 'package:flutter/material.dart';

import 'LinePaint.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Line animation'),
        leading: new Icon(Icons.insert_emoticon),
      ),
      backgroundColor: Colors.white,
      body: Line(),
    );
  }
}