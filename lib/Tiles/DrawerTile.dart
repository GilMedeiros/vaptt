import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {


  final String text;
  final PageController controller;
  final int page;
  final CorLetra = Colors.black;
  DrawerTile(this.text, this.controller, this.page);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: (){
          Navigator.of(context).pop();
          controller.jumpToPage(page);
        },
        child: Container(
          padding: EdgeInsets.only(left: 26),
          height: 45.0,
          child: Row(
            children: <Widget>[
              Text(text, style: TextStyle(
                fontSize: 19.0,
                fontWeight: FontWeight.bold,
                color: controller.page.round() == page ? Theme.of(context).primaryColor: Colors.black54,
              )
              )],
          ),
        ),
      ),
    );
  }
}
