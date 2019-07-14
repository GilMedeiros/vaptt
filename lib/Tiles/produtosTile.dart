import 'package:flutter/material.dart';
import 'package:vapt/datas/produtosdata.dart';

import 'package:vapt/telas/paginaproduto.dart';
class ProdutoTile extends StatelessWidget {

  final String nome;
  final ProdutoData produtoData;

  ProdutoTile(this.nome,this.produtoData);


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> PaginaProduto(produtoData)));

      },
      child: Flex(
          direction: Axis.vertical,
        children: <Widget>[
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20))
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 115,
                    margin: EdgeInsets.only(left: 16,right: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      image: DecorationImage(image: NetworkImage(produtoData.image[0]),fit: BoxFit.scaleDown),
                    ),
                  ),
                  SizedBox(height: 0.5,),
                  Container(margin:EdgeInsets.only(left: 16,right: 16),height: 1,color: Colors.black,),
                  SizedBox(height: 0.5,),
                  Padding(
                    padding: EdgeInsets.only(top: 3,left: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Stack(
                          children: <Widget>[
                            Positioned(
                              right: 16,
                              child: Icon(Icons.favorite,color: Color.fromARGB(255, 255, 103, 38),size: 35,),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 5),
                              child: Text("R\$ ${produtoData.preco}", style: TextStyle(fontSize: 20,fontWeight: FontWeight.normal),),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 30),
                              child: Text("10x de R\$ 120,00", style: TextStyle(fontSize: 12,fontWeight: FontWeight.normal),),
                            ),
                          ],
                        ),
                        SizedBox(height: 3,),
                        Text(produtoData.nome,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w800),),
                        SizedBox(height: 5,),
                        Text(produtoData.descricao,style: TextStyle(fontSize: 13),maxLines: 2,overflow: TextOverflow.ellipsis,softWrap: true,),

                      ],
                    ),
                  ),
//            Container(
//              margin: EdgeInsets.only(left: 16,right: 16,top: 16,bottom: 16),
//              height: 253,
//              color: Colors.red,
//            ),
                ],
              ),
            )
          )
        ],
      )
    );
  }
}
