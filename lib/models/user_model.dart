import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:scoped_model/scoped_model.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:vapt/paginas_login_cadastro/verificacao_01.dart';

class UserModel extends Model {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser firebaseUser;
  Map<String, dynamic> userData = Map();

  bool isLoading = false;

  @override
  void addListener(listener) {
    super.addListener(listener);
    _currentuserload();
  }

  void Cadastro ({@required Map<String, dynamic>userData, @required String pass,@required VoidCallback Sucesso, @required VoidCallback Falha}){
    isLoading = true;
    notifyListeners();

    _auth.createUserWithEmailAndPassword(
        email: userData["email"],
        password: pass,
    ).then((user)async{
      firebaseUser = user;
      await _saveUserData(userData);
      Sucesso();
      isLoading = false;
      notifyListeners();
    }).catchError((e){
      Falha();
      isLoading = false;
      notifyListeners();
    });
  }
  void Login ({@required String email,@required String pass, @required VoidCallback Sucesso, @required VoidCallback Falha}) async{
    isLoading = true;
    await _currentuserload();
    notifyListeners();
    _auth.signInWithEmailAndPassword(
        email: email,
        password: pass,
    ).then((user){
      firebaseUser = user;
      Sucesso();
      isLoading = false;
      notifyListeners();
    }).catchError((e){
      Falha();
      isLoading = false;
      notifyListeners();
    });
    firebaseUser.sendEmailVerification();
  }

  void RecuperarSenha(String email){
    _auth.sendPasswordResetEmail(email: email);
  }

  void SingOut()async{
    await _auth.signOut();
    userData = Map();
    firebaseUser = null;
    notifyListeners();
  }

  bool isLoggedIn(){
    return firebaseUser != null;
  }

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
        ),
    );
  }


  Future<Null> _currentuserload()async{
    if(firebaseUser == null)
      firebaseUser = await _auth.currentUser();
    if(firebaseUser != null){
      if(userData["name"] == null){
        DocumentSnapshot docUser =
        await Firestore.instance.collection("users").document(firebaseUser.uid).get();
        userData = docUser.data;

      }
    }
    notifyListeners();
  }


  Future<Null> _saveUserData(Map<String, dynamic> userData)async{
    this.userData = userData;
    await Firestore.instance.collection("users").document(firebaseUser.uid).setData(userData);
  }
} //UserModel
