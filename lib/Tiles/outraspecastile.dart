import 'package:flutter/material.dart';

import 'package:vapt/datas/produtosdata.dart';

class OutrasPecasTile extends StatelessWidget {

  final ProdutoData produtoData;

  OutrasPecasTile(this.produtoData);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      width: 160,
      height: 250,
      child: Column(
        children: <Widget>[
          SizedBox(width: 0.5,),
          Container(
            width: 160,
            height: 125,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              image: DecorationImage(image: NetworkImage(produtoData.image[0])),
              //border: Border.all(color: Colors.black)
            ),
          ),
          SizedBox(width: 0.5,),
          Container(width: 150,height: 1,color: Colors.black,),
          SizedBox(width: 0.5,),
          Padding(
            padding: EdgeInsets.only(top: 6,left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 0,right: 0,left: 110),
                      child: Icon(Icons.favorite,color: Color.fromARGB(255, 255, 103, 38),),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: Text("R\$ "+ produtoData.preco.toString(), style: TextStyle(fontSize: 20,fontWeight: FontWeight.normal),),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 30),
                      child: Text("10x de R\$ 12,50", style: TextStyle(fontSize: 12,fontWeight: FontWeight.normal),),
                    ),
                  ],
                ),
                SizedBox(height: 5,),
                Text(produtoData.nome,style: TextStyle(fontSize: 15),),
                SizedBox(height: 5,),
                Text(produtoData.descricao,style: TextStyle(fontSize: 11),maxLines: 2,overflow: TextOverflow.ellipsis,),
                Text("Ver mais",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
