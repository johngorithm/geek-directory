import 'package:flutter/material.dart';

class TabbedHome extends StatefulWidget {
  @override
  _TabbedHomeState createState() => _TabbedHomeState();
}

class _TabbedHomeState extends State<TabbedHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Geek Directory'),),
      body: Text('Body'),
    );
  }
}
