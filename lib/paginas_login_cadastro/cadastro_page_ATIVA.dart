import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:vapt/models/user_model.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:vapt/telas/home_page.dart';

class Cadastro_Page_Ativa extends StatefulWidget {
  @override
  _Cadastro_Page_AtivaState createState() => _Cadastro_Page_AtivaState();
}

class _Cadastro_Page_AtivaState extends State<Cadastro_Page_Ativa> {
  final _nomeController = TextEditingController();
  final _telefoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _passController2 = TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _sobrenomeController = TextEditingController();
  final _nomecompletoController = TextEditingController();
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
//              Container(
//                alignment: Alignment.topCenter,
//                padding: EdgeInsets.only(top: 10.0),
//                child: Text("Bem-vindo à VAPT ",
//                    style:
//                    TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold)),
//              ),
              SizedBox(
                height: 16.0,
              ),
              Text(
                  "Por favor, insira seus dados para cadastro",
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
                    controller: _nomeController,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold
                    ),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        counterText: "",
                        hintText: "Nome"
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16,),
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
                    controller: _sobrenomeController,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold
                    ),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        counterText: "",
                        hintText: "Sobrenome"
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16,),
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
                    controller: _nomecompletoController,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold
                    ),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        counterText: "",
                        hintText: "Nome completo"
                    ),
                  ),
                ),
              ),
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
                    maxLength: 11,
                    controller: _telefoneController,
                    keyboardType: TextInputType.phone,
                    textAlign: TextAlign.center,
                    inputFormatters: [WhitelistingTextInputFormatter.digitsOnly
                    ],
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold
                    ),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        counterText: "",
                        hintText: "(21)9XXXX-XXXX",
                    ),
                  ),
                ),
              ),
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
                    controller: _emailController,
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
                    controller: _passController,
                    obscureText: true,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold
                    ),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        counterText: "",
                        hintText: "Senha"
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16,),
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
                    controller: _passController2,
                    obscureText: true,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold
                    ),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        counterText: "",
                        hintText: "Repita sua senha"
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16,),
              RaisedButton(
                onPressed: () {
                  if(_passController.text == _passController2.text){
                    Map<String,dynamic> userData = {
                      "name": _nomeController.text,
                      "nomecompleto":_nomecompletoController.text,
                      "sobrenome": _sobrenomeController.text,
                      "email":_emailController.text,
                      "telefone":_telefoneController.text
                    };
                    model.Cadastro(
                        userData: userData,
                        pass: _passController.text,
                        Sucesso: Sucesso,
                        Falha: Falha
                    );
                  } else {
                    model.SnackBarDefault(mensagem: "As senhas não conferem", scaffoldkey: _scaffoldKey);
                  }
                  FocusScope.of(context).requestFocus(new FocusNode());

                },
                color: Color.fromARGB(255, 50, 50, 50),
                shape: new RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(36.0),
                ),
                child: Container(
                  width: 296,
                  height: 64,
                  child: Center(
                    child: Text("CRIAR CONTA",
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontFamily: "Robot",
                            fontSize: 26.0,
                            color: Color.fromARGB(255, 255, 103, 38))
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10,),
            ],
          ),
        )
      );
    });
  }
  void Sucesso() {
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
          backgroundColor: Color.fromARGB(255, 50, 50, 50),
          duration: Duration(seconds: 4),
          content: Text("Usuário criado com sucesso, verifique seu e-mail para ativar a conta!", style:
          TextStyle(
              color: Color.fromARGB(255, 255, 103, 38),
              fontWeight: FontWeight.bold,
              fontSize: 18.0
          ),
          )
      ),
    );
    Future.delayed(Duration(seconds: 4)).then((_){
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Home_Page()));
    });
  }
  void Falha() {
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
          backgroundColor: Color.fromARGB(255, 50, 50, 50),
          duration: Duration(seconds: 4),
          content: Text("Falha ao criar usuário", style:
          TextStyle(
              color: Color.fromARGB(255, 255, 103, 38),
              fontWeight: FontWeight.bold,
              fontSize: 18.0
          ),
          )
      ),
    );
  }
}
