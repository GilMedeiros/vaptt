import 'package:cloud_firestore/cloud_firestore.dart';

class ProdutoData {

  String categoria;
  String id;
  String nome;
  String codigopeca;
  String descricao;

  double preco;

  List image;

  ProdutoData.fromDocument(DocumentSnapshot snapshot){
    id = snapshot.documentID;
    nome = snapshot.data["nome"];
    descricao = snapshot.data["descricao"];
    codigopeca = snapshot.data["codigopeca"];
    preco = snapshot.data["preco"]+0.0;
    image = snapshot.data["image"];
  }

  Map<String, dynamic> toResumedMap(){
    return {
      "nome": nome,
      "descicao":descricao,
      "preco":preco,
      "codigopepca": codigopeca,
    };
  }

}