import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:vapt/models/user_model.dart';

import 'cadastro_page_ATIVA.dart';

class RecuperarSenha extends StatefulWidget {
  @override
  _RecuperarSenhaState createState() => _RecuperarSenhaState();
}

class _RecuperarSenhaState extends State<RecuperarSenha> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<UserModel>(builder: (context, child, model) {
      return Scaffold(
        key: _scaffoldKey,

        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 50, 50, 50),
          title: Image(
            image: AssetImage('images/toplogo.png'),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.topCenter,
                padding: EdgeInsets.only(top: 10.0),
                child: Text("Recupere sua senha",
                    style:
                    TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold)),
              ),
              SizedBox(
                height: 16.0,
              ),
              Text(
                  "Por favor, digite seu e-mail para recuperar sua senha",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w900,
                      fontFamily: "Roboto")),
              SizedBox(height: 16.0,),
              Container(
                width: 264,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    shape: BoxShape.rectangle,
                    border: Border.all(
                      color: Colors.black,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(20.0))
                ),
                child: Center(
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold
                    ),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        counterText: "",
                        hintText: "E-mail"
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.0,),
              RaisedButton(
                onPressed: () {},
                color: Color.fromARGB(255, 50, 50, 50),
                shape: new RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(36.0),
                ),
                child: Container(
                  width: 296,
                  height: 64,
                  child: Center(
                    child: Text("ENVIAR",
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontFamily: "Robot",
                            fontSize: 26.0,
                            color: Color.fromARGB(255, 255, 103, 38))
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.0,),
              Text("Caso não encontre o e-mail, confira a caixa de SPAM",style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),

            ],
          ),
        )
      );
    });
  }
}
