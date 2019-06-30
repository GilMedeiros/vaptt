import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vapt/telas/paginaLoja.dart';
class Lojastile extends StatelessWidget {

//  String image;
//  String nota;
//  String distancia;
//  String tempo;
  final DocumentSnapshot snapshot;

  Lojastile(this.snapshot);


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> PaginaLoja(snapshot)));
      },
      child: Container(
        margin: EdgeInsets.only(left: 8,bottom: 15),
        decoration: BoxDecoration(
          //  image: DecorationImage(image: NetworkImage(image),fit: BoxFit.fill,alignment: Alignment.centerLeft),
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(12))),
        width: 180,
        height: 90,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            //   Image(image: NetworkImage(image)),
            SizedBox(width: 0.5,),
            Container(width:90,decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(snapshot.data["logo"]),fit: BoxFit.cover),borderRadius: BorderRadius.only(topLeft: Radius.circular(12),bottomLeft: Radius.circular(12))),),
            SizedBox(width: 0.5,),
            Container(width: 1,height: 80,color: Colors.black,),
            SizedBox(width: 1.5,),
            Padding(
              padding: EdgeInsets.only(left: 12,top: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('2'+"km",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16),),
                  SizedBox(height: 5,),
                  Text("1hr",style: TextStyle(fontWeight: FontWeight.normal,fontSize: 14)),
                  SizedBox(height: 5,),
                  Row(children: <Widget>[
                    Text("3"),
                    Icon(Icons.star,color: Color.fromARGB(255, 255, 170, 0),size: 16,)
                  ],)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
//Container(
//decoration: BoxDecoration(
//color: Colors.white,
//borderRadius: BorderRadius.all(Radius.circular(12)),
//image: DecorationImage(image: NetworkImage(image),
//fit: BoxFit.scaleDown,
//),
//),
//width: 180,
//height: 90,
//child: Row
//);