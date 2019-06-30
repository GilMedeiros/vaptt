import 'package:carousel_pro/carousel_pro.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vapt/Tiles/produtosTile.dart';
import 'package:vapt/datas/produtosdata.dart';
import 'package:vapt/Tiles/outraspecastile.dart';

class PaginaProduto extends StatefulWidget {

  final ProdutoData produto;

  PaginaProduto(this.produto);


  @override
  _PaginaProdutoState createState() => _PaginaProdutoState(produto);
}

class _PaginaProdutoState extends State<PaginaProduto> {
  final ProdutoData produto;

  _PaginaProdutoState(this.produto);

  @override
  Widget build(BuildContext context) {
    final largura = MediaQuery.of(context).size.width;
    const RoundedRectangleBorder roundedRectangleBorder =
        RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)));

    return Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 30,
                  color: Color.fromARGB(255, 255, 103, 38),
                ))
          ],
          iconTheme: IconThemeData(color: Color.fromARGB(255, 255, 103, 38)),
          automaticallyImplyLeading: false,
          backgroundColor: Color.fromARGB(255, 50, 50, 50),
          shape: roundedRectangleBorder,
          brightness: Brightness.dark,
          title: Image(
            image: AssetImage('images/toplogo.png'),
          ),
          centerTitle: true,
        ),
        body: FutureBuilder<QuerySnapshot>(
            future: Firestore.instance.collection("lojas").document("Mirauto").collection("itens").getDocuments(),
            builder: (context, snapshot) {
              if (!snapshot.hasData)
                return Center(
                  child: CircularProgressIndicator(),
                );
              else
                return SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 3,
                      ),
                      Container(
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                              color: Colors.black54,
                              offset: Offset(0, 4),
                              blurRadius: 2)
                        ]),
                        child: AspectRatio(
                          aspectRatio: 1.1,
                          child: Carousel(
                            boxFit: BoxFit.contain,
                            images: produto.image.map((url) {
                              return NetworkImage(url);
                            }).toList(),
                            dotSize: 5.0,
                            dotSpacing: 15.0,
                            autoplay: false,
                            dotBgColor: Colors.transparent,
                            dotColor: Color.fromARGB(255, 255, 76, 0),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 16, right: 16, top: 12),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          produto.nome,
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w600),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 16, right: 16, top: 20),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "R\$ " + produto.preco.toStringAsFixed(2),
                          style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.w400,
                              color: Colors.black87),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 16, right: 16),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "10x R\$ 12,50 sem juros",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: Color.fromARGB(255, 50, 50, 50)),
                        ),
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      Container(
                        width: largura,
                        height: 64,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 50, 50, 50),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black54,
                                  offset: Offset(0, 4),
                                  blurRadius: 3)
                            ]),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                print("teste2");
                              },
                              child: Container(
                                  margin: EdgeInsets.all(8),
                                  alignment: Alignment.center,
                                  width: 170,
                                  height: 55,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8)),
                                      color: Color.fromARGB(255, 255, 76, 0)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        "Pôr no carrinho",
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Icon(Icons.shopping_cart),
                                    ],
                                  )),
                            ),
                            GestureDetector(
                              onTap: () {
                                print("teste");
                              },
                              child: Container(
                                  margin: EdgeInsets.all(8),
                                  alignment: Alignment.center,
                                  width: 170,
                                  height: 55,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8)),
                                      color: Color.fromARGB(255, 255, 76, 0)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        "Pôr na lista \nde desejos",
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Icon(Icons.favorite),
                                    ],
                                  )),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Container(
                        width: largura,
                        height: 116,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black54,
                                offset: Offset(0, 4),
                                blurRadius: 3)
                          ],
                          color: Color.fromARGB(255, 255, 103, 38),
                        ),
                        child: Row(
                          children: <Widget>[
                            Container(
                              margin:
                                  EdgeInsets.only(top: 8, left: 16, bottom: 8),
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color.fromARGB(255, 50, 50, 50)),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Text(
                              "5,6km",
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(255, 50, 50, 50)),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Text(
                              "50min",
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w300,
                                  color: Color.fromARGB(255, 50, 50, 50)),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.yellowAccent,
                            ),
                            Text(
                              "4",
                              style: TextStyle(
                                  fontSize: 18, color: Colors.yellowAccent),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Container(
                        width: largura,
                        height: 167,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black54,
                                offset: Offset(0, 4),
                                blurRadius: 3)
                          ],
                          color: Color.fromARGB(255, 255, 103, 38),
                        ),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Container(
                            margin: EdgeInsets.only(
                                left: 32, top: 16, right: 16, bottom: 8),
                            child: Text("Descrição\n\n" + produto.descricao,
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Container(
                        width: largura,
                        height: 96,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black54,
                                offset: Offset(0, 4),
                                blurRadius: 3)
                          ],
                          color: Color.fromARGB(255, 255, 103, 38),
                        ),
                        child: Center(
                          child: RaisedButton(
                              onPressed: () {},
                              color: Color.fromARGB(255, 0, 0, 0),
                              shape: new RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(36.0),
                              ),
                              child: Container(
                                width: 296,
                                height: 64,
                                child: Center(
                                  child: Text("COMPRAR",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w900,
                                          fontFamily: "Robot",
                                          fontSize: 26.0,
                                          color: Color.fromARGB(
                                              255, 255, 103, 38))),
                                ),
                              )),
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Container(
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 255, 103, 38),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black54,
                                    offset: Offset(0, 4),
                                    blurRadius: 2)
                              ]),
                          width: largura,
                          height: 320,
                          child: Stack(
                            alignment: Alignment.center,
                            children: <Widget>[
                              Positioned(
                                top: 9,
                                left: 16,
                                child: Text(
                                  "Outros produtos da mesma loja",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 22,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                              ListView.builder(
                                scrollDirection: Axis.horizontal,
                                padding: EdgeInsets.only(
                                    top: 48, left: 16, bottom: 25),
                                itemCount: snapshot.data.documents.length,
                                itemBuilder: (context, index) {
                                  return OutrasPecasTile(ProdutoData.fromDocument(snapshot.data.documents[index]));
                                },
                              ),
                            ],
                          )),
                    ],
                  ),
                );
            }));
  }
}
