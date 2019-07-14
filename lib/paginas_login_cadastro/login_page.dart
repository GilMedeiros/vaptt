//import 'dart:async';
//import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:scoped_model/scoped_model.dart';
//import 'package:vapt/models/user_model.dart';
//import 'package:vapt/paginas_login_cadastro/verificacao_01.dart';
//import 'dados_page.dart';
//
//class LoginPage extends StatefulWidget {
//  @override
//  _LoginPageState createState() => _LoginPageState();
//}
//
//class _LoginPageState extends State<LoginPage> {
//
//  final _scaffoldKey = GlobalKey<ScaffoldState>();
//  final _numeroController = TextEditingController();
//  final _smsController = TextEditingController();
//  final FirebaseAuth _auth = FirebaseAuth.instance;
//
//  @override
//  Widget build(BuildContext context) {
//    return ScopedModelDescendant<UserModel>(
//        builder: (context, child, model) {
//          return Scaffold(
//            key: _scaffoldKey,
//            resizeToAvoidBottomPadding: false,
//            appBar: AppBar(
//              backgroundColor: Color.fromARGB(255, 50, 50, 50),
//              title: Image(
//                image: AssetImage('images/toplogo.png'),
//              ),
//              centerTitle: true,
//            ),
//            body: Column(
//              children: <Widget>[
//                Container(
//                  alignment: Alignment.topCenter,
//                  padding: EdgeInsets.only(top: 10.0),
//                  child: Text("Bem-vindo à VAPT ",
//                      style:
//                      TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold)),
//                ),
//                SizedBox(height: 16.0,),
//                Text(
//                    "Por favor, entre com seu número \n de celular e DDD para prosseguir",
//                    textAlign: TextAlign.center,
//                    style: TextStyle(
//                        fontSize: 20.0,
//                        fontWeight: FontWeight.w900,
//                        fontFamily: "Roboto")
//                ),
//                SizedBox(height: 16.0,),
//                /////////////////CAIXA DE ENTRADA DO NUMERO
//                Container(
//                  width: 264,
//                  height: 64,
//                  decoration: BoxDecoration(
//                      color: Colors.transparent,
//                      shape: BoxShape.rectangle,
//                      border: Border.all(
//                        color: Colors.black,
//                        width: 2.0,
//                      ),
//                      borderRadius: BorderRadius.all(Radius.circular(20.0))
//                  ),
//                  child: Center(
//                    child: TextFormField(
//                      controller: _numeroController,
//                      inputFormatters: [
//                        WhitelistingTextInputFormatter.digitsOnly,
//                      ],
//                      keyboardType: TextInputType.phone,
//                      textAlign: TextAlign.center,
//                      style: TextStyle(
//                          fontSize: 30.0,
//                          color: Colors.black,
//                          fontWeight: FontWeight.bold
//                      ),
//                      decoration: InputDecoration(
//                          border: InputBorder.none,
//                          counterText: "",
//                          hintText: "(21)9XXXX-XXXX"
//                      ),
//                    ),
//                  ),
//                ),
//                SizedBox(height: 5,),
//                Text("Não serão cobradas taxas de SMS \n DIGITE APENAS NÚMEROS, SEM ESPAÇO OU TRAVESSÃO", style: TextStyle(fontSize: 11.0, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
//                //////////////////////////////////////////
//                SizedBox(height: 16,),
//                RaisedButton(
//                  onPressed: () {
//                    if (_numeroController.text.isEmpty || _numeroController.text.length < 9) {
//                      model.SnackBarDefault(
//                          mensagem: "Insira um número de telefone válido",
//                          scaffoldkey: _scaffoldKey);
//                      FocusScope.of(context).requestFocus(new FocusNode());
//                    } else {
//                          model.verificarNumero(
//                            Scaffoldkey: _scaffoldKey,
//                            telefone: "+55"+_numeroController.text,
//                            context: context,
//                          );
//                          FocusScope.of(context).requestFocus(new FocusNode());
//                    }
//                    print(_numeroController.text);
//                  },
//                  color: Color.fromARGB(255, 50, 50, 50),
//                  shape: new RoundedRectangleBorder(
//                    borderRadius: BorderRadius.circular(36.0),
//                  ),
//                  child: Container(
//                    width: 296,
//                    height: 64,
//                    child: Center(
//                      child: Text("AVANÇAR",
//                          style: TextStyle(
//                              fontWeight: FontWeight.w900,
//                              fontFamily: "Robot",
//                              fontSize: 26.0,
//                              color: Color.fromARGB(255, 255, 103, 38))
//                      ),
//                    ),
//                  ),
//                ),
//              ],
//            ),
//          );
//        }
//    );
//
//  }
//  void Navigator2 (){
//    Future.delayed(Duration(seconds: 2)).then((_){
//      Navigator.of(context).push(MaterialPageRoute(builder: (context)=> PagVerificacao()));
//    });
//  }
//  void SnackBarDefault({@required String mensagem, @required scaffoldkey}) {
//    scaffoldkey.currentState.showSnackBar(
//        SnackBar(
//            backgroundColor: Color.fromARGB(255, 50, 50, 50),
//            duration: Duration(seconds: 4),
//            content: Text(mensagem, style:
//            TextStyle(
//                color: Color.fromARGB(255, 255, 103, 38),
//                fontWeight: FontWeight.bold,
//                fontSize: 18.0
//            ),
//            )
//        )
//    );
//  }
//
//
//}