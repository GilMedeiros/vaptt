import 'package:flutter/material.dart';
class oaskoa extends StatefulWidget {
  @override
  _oaskoaState createState() => _oaskoaState();
}

class _oaskoaState extends State<oaskoa> {
  @override
  Widget build(BuildContext context) {
    return Dismissible(
        key: Key(DateTime.now().millisecondsSinceEpoch.toString()),
    background: Container(
    color: Colors.red,
    child: Align(
    alignment: Alignment(-0.9, 0.0),
    child: Icon(
    Icons.delete,
    color: Colors.white,
    ),
    ),
    ),
    direction: DismissDirection.startToEnd,
    child: Container(
      height: 50.0,
      width: 50.0,
      margin: EdgeInsets.only(top: 10),
      child: RaisedButton(
            color: Colors.green,
            child: Text(
              "kkk",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            onPressed: () {}),
      )
    );}
}
