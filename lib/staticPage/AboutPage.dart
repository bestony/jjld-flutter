import 'package:flutter/material.dart';
class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('关于津津乐道播客'),
        ),
        body: Center(
          child: new Container(
            width: 200,
            height: 200,
            child: new Column(
              children: <Widget>[
                new Image.asset("images/logo.png", height: 160, width: 160),
                new Text("津津乐道播客")
              ],
            ),
          ),
        ));
  }
}
