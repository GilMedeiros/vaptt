import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:scoped_model/scoped_model.dart';
import 'dart:async';
import 'package:flutter/material.dart';


class UserModel extends Model {


  Map<String, dynamic> userData = Map();

  void SnackBarDefault({@required String mensagem, @required scaffoldkey}) {
    scaffoldkey.currentState.showSnackBar(
        SnackBar(
            backgroundColor: Color.fromARGB(255, 50, 50, 50),
            duration: Duration(seconds: 4),
            content: Text(mensagem, style:
            TextStyle(
                color: Color.fromARGB(255, 255, 103, 38),
                fontWeight: FontWeight.bold,
                fontSize: 18.0
            ),
            )
        )
    );
  }







//  Future<Null> _saveUserData(Map<String, dynamic> userData)async{
//    this.userData = userData;
//    await Firestore.instance.collection("users").document(firebaseUser.uid).setData(userData);
//  }

} //UserModel
