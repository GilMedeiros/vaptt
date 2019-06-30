import 'package:flutter/material.dart';

class PecasMaisVendidas extends StatelessWidget {

  String nome;
  String id;
  String preco;
  String descricao;
  String parcelamento;

  PecasMaisVendidas(this.nome,this.preco,this.parcelamento, this.descricao);



  @override
  Widget build(BuildContext context) {

    return Container(
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
              image: DecorationImage(image: NetworkImage("https://metalhorse.com.br/media/catalog/product/cache/2/image/650x/040ec09b1e35df139433887a97daa66f/c/a/capturar4_2.png")),
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
                          child: Text("R\$ ${preco}", style: TextStyle(fontSize: 20,fontWeight: FontWeight.normal),),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 30),
                          child: Text("${parcelamento}x de R\$ 120,00", style: TextStyle(fontSize: 12,fontWeight: FontWeight.normal),),
                        ),
                      ],
                    ),
                SizedBox(height: 5,),
                Text(nome,style: TextStyle(fontSize: 15),),
                SizedBox(height: 5,),
                Text("${descricao}",style: TextStyle(fontSize: 11),maxLines: 2,overflow: TextOverflow.ellipsis,),
                Text("Ver mais",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
