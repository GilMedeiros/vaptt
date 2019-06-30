import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vapt/Tiles/marcastile.dart';
import 'package:vapt/Tiles/produtosTile.dart';
import 'package:vapt/datas/produtosdata.dart';

class PaginaLoja extends StatelessWidget {

  final DocumentSnapshot snapshot;

  PaginaLoja(this.snapshot);

  @override
  Widget build(BuildContext context) {
    final largura = MediaQuery.of(context).size.width;
    final altura = MediaQuery.of(context).size.height;

    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height) / 2;
    final double itemWidth = size.width /2;

    Widget _appbarnova() =>
        Stack(
            overflow: Overflow.visible,
            children: <Widget>[


              Container(
                width: largura,
              height: 100,
              decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(snapshot.data["logo"]),fit: BoxFit.fitWidth),
              ),
                child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaY: 4,
                      sigmaX: 4,
                    ),
                  child: Container(color: Colors.black.withOpacity(0),),
                ),
            ),

              Container(
                margin: EdgeInsets.only(top: 95),
                height: 115,
                width: largura,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black54,
                      offset: Offset(0, 3)
                    )
                  ],
                    color: Color.fromARGB(255, 50, 50, 50),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20))),
              ),
                Positioned(
                  top: 18,
                    right: 10,
                    bottom: 5,
                    left: 5,
                    child: AppBar(
                      backgroundColor: Colors.black.withOpacity(0),
                      elevation: 0.0,
                      actions: <Widget>[
                        FlatButton(
                            onPressed: (){
                              Navigator.of(context).pop();
                            },
                            child: Icon(Icons.arrow_back_ios,size: 40,color: Color.fromARGB(255, 255, 103, 38),)
                        )
                      ],
                      automaticallyImplyLeading: false,

                      iconTheme: IconThemeData(color: Color.fromARGB(255, 255, 103, 38)),

                    ),
                ),
              Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 15),
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(color: Colors.black, offset: Offset(2, 1.5))
                      ],
                      border: Border.all(color: Colors.black, width: 1),
                      image: DecorationImage(
                          image: NetworkImage(snapshot.data["logo"]), fit: BoxFit.cover), shape: BoxShape.circle,
                    ),
                    // child: Image.network("http://www.mirauto.com.br/wp-content/uploads/2014/02/01-logo-marca-mirauto-autope%C3%A7as.jpg",width: 100,height: 100),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        snapshot.data['nome'],
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 255, 76, 0)),
                      ),
                      SizedBox(width: 8,),
                      Icon(Icons.brightness_1,size: 5,color: Color.fromARGB(255, 255, 103, 38),),
                      SizedBox(width: 8,),
                      Text(
                        "14km",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 255, 103, 38)),
                      ),
                      SizedBox(width: 8,),
                      Icon(Icons.brightness_1,size: 5,color: Color.fromARGB(255, 255, 103, 38),),
                      SizedBox(width: 8,),
                      Text(
                        "1hr 30min",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: Color.fromARGB(255, 255, 103, 38)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 13,
                  ),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 255, 103, 38),
                              borderRadius: BorderRadius.all(Radius.circular(27))),
                          height: 50,
                          margin: EdgeInsets.only(left: 6, right: 5),
                          child: Stack(
                            children: <Widget>[
                              Positioned(
                                top: 0,
                                bottom: 0,
                                left: 16,
                                child: GestureDetector(
                                  onTap: () {
                                    print("TESTE");
                                  },
                                  child: Icon(
                                    Icons.search,
                                    size: 30,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 46),
                                child: TextField(
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  decoration: InputDecoration(
                                      border: InputBorder.none, counterText: ""),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                          child: Icon(
                            Icons.filter_list,
                            size: 36,
                            color: Color.fromARGB(255, 255, 76, 0),
                          ),
                          onTap: () {
                            print("TESTEW");
                          }),
                    ],
                  ),
                ],
              ),
            ]
        );
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder<QuerySnapshot>(
          future: Firestore.instance.collection("lojas").document(snapshot.documentID).collection("itens").getDocuments(),
            builder: (context, snapshot){
            if(!snapshot.hasData)
              return Center(child: CircularProgressIndicator(),);
            else
              return SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    _appbarnova(),
                    SizedBox(height: 6,),
                    Flex(
                      direction: Axis.horizontal,
                      children: <Widget>[
                        Expanded(
                          child: Container(
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 255, 103, 38),
                                  boxShadow: [
                                    BoxShadow(color: Colors.black54, offset: Offset(0, 4),blurRadius: 2)
                                  ]
                              ),
                              height: 172,
                              child: Stack(
                                alignment: Alignment.center,
                                children: <Widget>[
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: <Widget>[
                                        SizedBox(width: 16,),
                                        MarcaTile('https://png2.kisspng.com/sh/f1ba9a4dad1cd5a6ff52d04316834136/L0KzQYm3VcAyN6VwiZH0aYP2gLBuTfhwdpVmRd54Z3Awc7L5TfhwdpVmRdVydnnmPbn2jvRiNZDpkeV8ZYmwg7T2jCRmeqQyjtdsdHB1PYbohcg0bZZnTalrZUG7Poi9UcI4PGY9Sac7NUG5SYmCWcM2QWUziNDw/kisspng-honda-logo-car-honda-civic-honda-odyssey-scooters-vector-5ae83eeb57be18.7612745815251698993594.png'),
                                        SizedBox(width: 16,),
                                        MarcaTile('https://upload.wikimedia.org/wikipedia/pt/3/34/Chevrolet_logo.png'),
                                        SizedBox(width: 16,),
                                        MarcaTile('https://logodownload.org/wp-content/uploads/2014/05/fiat-logo-2.png'),
                                        SizedBox(width: 16,),
                                        MarcaTile('https://logodownload.org/wp-content/uploads/2014/05/fiat-logo-2.png'),
                                        SizedBox(width: 16,),
                                        MarcaTile('https://logodownload.org/wp-content/uploads/2014/05/fiat-logo-2.png'),
                                        SizedBox(width: 16,),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    top: 9,
                                    left: 16,
                                    child: Text("Marcas",style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.w400),),
                                  ),
                                ],
                              )
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 6,),
                    GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.only(top: 4,left: 16,bottom: 8),
                        shrinkWrap: true,
                        itemCount: snapshot.data.documents.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 4.0,
                            crossAxisSpacing: 4.0,
                            childAspectRatio: 0.72
                        ),
                        itemBuilder: (context,index){
                          return ProdutoTile("",ProdutoData.fromDocument(snapshot.data.documents[index]));
                        }),

                  ],
                ),
              );
            },
        )
      )
    );

  }
}
