import 'package:flutter/material.dart';

class MarcaTile extends StatelessWidget {

  String image;
  
  MarcaTile(this.image);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(12)),
        image: DecorationImage(image: NetworkImage(image),
          fit: BoxFit.scaleDown,
        ),
      ),
      width: 100,
      height: 90,
      child: GestureDetector(
        onTap: (){
          print("oasjkdoaskd");
        },
      ),
    );
  }
}
