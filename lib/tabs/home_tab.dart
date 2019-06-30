import 'package:flutter/material.dart';
import 'package:vapt/Tiles/lojastile.dart';
import 'package:vapt/Tiles/marcastile.dart';
import 'package:vapt/Tiles/pecasmaisvendidasTile.dart';
import 'package:vapt/telas/paginaLoja.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Home_tab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
        future: Firestore.instance.collection("lojas").getDocuments(),
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Center(
              child: CircularProgressIndicator(),
            );
          else
            return ListView(
              children: <Widget>[
                Flex(
                  direction: Axis.horizontal,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 255, 103, 38),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black54,
                                    offset: Offset(0, 4),
                                    blurRadius: 2)
                              ]),
                          height: 172,
                          child: Stack(
                            alignment: Alignment.center,
                            children: <Widget>[
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: <Widget>[
                                    SizedBox(
                                      width: 16,
                                    ),
                                    MarcaTile(
                                        'https://png2.kisspng.com/sh/f1ba9a4dad1cd5a6ff52d04316834136/L0KzQYm3VcAyN6VwiZH0aYP2gLBuTfhwdpVmRd54Z3Awc7L5TfhwdpVmRdVydnnmPbn2jvRiNZDpkeV8ZYmwg7T2jCRmeqQyjtdsdHB1PYbohcg0bZZnTalrZUG7Poi9UcI4PGY9Sac7NUG5SYmCWcM2QWUziNDw/kisspng-honda-logo-car-honda-civic-honda-odyssey-scooters-vector-5ae83eeb57be18.7612745815251698993594.png'),
                                    SizedBox(
                                      width: 16,
                                    ),
                                    MarcaTile(
                                        'https://upload.wikimedia.org/wikipedia/pt/3/34/Chevrolet_logo.png'),
                                    SizedBox(
                                      width: 16,
                                    ),
                                    MarcaTile(
                                        'https://logodownload.org/wp-content/uploads/2014/05/fiat-logo-2.png'),
                                    SizedBox(
                                      width: 16,
                                    ),
                                    MarcaTile(
                                        'https://logodownload.org/wp-content/uploads/2014/05/fiat-logo-2.png'),
                                    SizedBox(
                                      width: 16,
                                    ),
                                    MarcaTile(
                                        'https://logodownload.org/wp-content/uploads/2014/05/fiat-logo-2.png'),
                                    SizedBox(
                                      width: 16,
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                top: 9,
                                left: 16,
                                child: Text(
                                  "Marcas",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 25,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ],
                          )),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Flex(
                  direction: Axis.horizontal,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 255, 103, 38),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black54,
                                    offset: Offset(0, 4),
                                    blurRadius: 2)
                              ]),
                          height: 145,
                          child: Stack(
                            alignment: Alignment.center,
                            children: <Widget>[

                              ListView.builder(
                                scrollDirection: Axis.horizontal,
                                  itemCount: snapshot.data.documents.length,
                                  padding: EdgeInsets.only(top: 38,left: 16,bottom: 10),
                                  itemBuilder: (context,index){
                                  return Lojastile(snapshot.data.documents[index]);
                                  },
                              ),

                              Positioned(
                                top: 9,
                                left: 16,
                                child: Text(
                                  "Lojas",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 25,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ],
                          )),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Flex(
                  direction: Axis.horizontal,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 255, 103, 38),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black54,
                                    offset: Offset(0, 4),
                                    blurRadius: 2)
                              ]),
                          height: 172,
                          child: Stack(
                            alignment: Alignment.center,
                            children: <Widget>[
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: <Widget>[],
                                ),
                              ),
                              Positioned(
                                top: 9,
                                left: 16,
                                child: Text(
                                  "Lojas próximas",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 25,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ],
                          )),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Flex(
                  direction: Axis.horizontal,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 255, 103, 38),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black54,
                                    offset: Offset(0, 4),
                                    blurRadius: 2)
                              ]),
                          height: 342,
                          child: Stack(
                            alignment: Alignment.center,
                            children: <Widget>[
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    SizedBox(
                                      width: 16,
                                    ),
                                    PecasMaisVendidas(
                                        "Turbina Garret .50",
                                        "1.200",
                                        "10",
                                        "Turbina Garret .50, com eixo mancal, carcaça quente .45, carcaça fria .50"),
                                    SizedBox(
                                      width: 16,
                                    ),
                                    PecasMaisVendidas(
                                        "Turbina Garret .50",
                                        "1.200",
                                        "10",
                                        "Turbina Garret .50, com eixo mancal, carcaça quente .45, carcaça fria .50"),
                                    SizedBox(
                                      width: 16,
                                    ),
                                    PecasMaisVendidas(
                                        "Turbina Garret .50",
                                        "1.200",
                                        "10",
                                        "Turbina Garret .50, com eixo mancal, carcaça quente .45, carcaça fria .50"),
                                    SizedBox(
                                      width: 16,
                                    ),
                                    PecasMaisVendidas(
                                        "Turbina Garret .50",
                                        "1.200",
                                        "10",
                                        "Turbina Garret .50, com eixo mancal, carcaça quente .45, carcaça fria .50"),
                                    SizedBox(
                                      width: 16,
                                    ),
                                    PecasMaisVendidas(
                                        "Turbina Garret .50",
                                        "1.200",
                                        "10",
                                        "Turbina Garret .50, com eixo mancal, carcaça quente .45, carcaça fria .50"),
                                    SizedBox(
                                      width: 16,
                                    ),
                                    PecasMaisVendidas(
                                        "Turbina Garret .50",
                                        "1.200",
                                        "10",
                                        "Turbina Garret .50, com eixo mancal, carcaça quente .45, carcaça fria .50"),
                                    SizedBox(
                                      width: 16,
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                top: 9,
                                left: 16,
                                child: Text(
                                  "Peças mais vendidas",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 25,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ],
                          )),
                    ),
                  ],
                ),
              ],
            );

        });
  }
}
