import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vapt/datas/produtosdata.dart';

class CarrinhoP {

  String cid;
  String loja;
  String pid;

  int quantidade;

  ProdutoData produtoData;

  CarrinhoP.fromDocument(DocumentSnapshot document){
    cid = document.documentID;
    loja = document.data["lojas"];
    pid = document.data["pid"];
    quantidade = document.data["quantidade"];
  }

  Map<String, dynamic> toMap(){
    return{
      "lojas": loja,
      "pid": pid,
      "quantidade":quantidade,
      "produto": produtoData.toResumedMap()
    };
  }


}