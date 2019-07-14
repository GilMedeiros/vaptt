import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:vapt/models/user_model.dart';
import 'package:vapt/paginas_login_cadastro/recuperar_senha_page.dart';
import 'package:vapt/telas/home_page.dart';
import 'cadastro_page_ATIVA.dart';

class Login_Page_Ativa extends StatefulWidget {
  @override
  _Login_Page_AtivaState createState() => _Login_Page_AtivaState();
}

class _Login_Page_AtivaState extends State<Login_Page_Ativa> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 50, 50, 50),
          title: Image(
            image: AssetImage('images/toplogo.png'),
          ),
          centerTitle: true,
        ),
        body: ScopedModelDescendant<UserModel>(builder: (context,child,model) {
          return SingleChildScrollView (
                scrollDirection: Axis.vertical,
                child: Column(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.topCenter,
                      padding: EdgeInsets.only(top: 10.0),
                      child: Text("Bem-vindo à VAPT ",
                          style:
                          TextStyle(
                              fontSize: 30.0, fontWeight: FontWeight.bold)),
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    Text(
                        "Por favor, entre com seu login para prosseguir",
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
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          textAlign: TextAlign.center,
                          validator: (text) {
                            if (text.isEmpty || !text.contains("@"))
                              return "Email inválido";
                          },
                          style: TextStyle(
                              fontSize: 18.0,
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
                              fontSize: 20.0,
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
                    SizedBox(height: 12,),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => RecuperarSenha()));
                      },
                      child: Text("Esqueci minha senha", style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),),
                    ),
                    SizedBox(height: 12,),
                    RaisedButton(
                      onPressed: () {
                        model.Login(email: _emailController.text,
                            pass: _passController.text,
                            Sucesso: Sucesso,
                            Falha: Falha);
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
                          child: Text("LOGIN",
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
                    Text("Não possui uma conta ?", style: TextStyle(
                        fontSize: 14.0, fontWeight: FontWeight.bold),),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Cadastro_Page_Ativa()));
                      },
                      child: Text("CRIAR CONTA", style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),),
                    ),
                  ],
                )
            );
        }));
  }
  void Falha() {
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
          backgroundColor: Color.fromARGB(255, 50, 50, 50),
          duration: Duration(seconds: 4),
          content: Text("Falha ao realizar o login, verifique seu e-mail e sua senha", style:
          TextStyle(
              color: Color.fromARGB(255, 255, 103, 38),
              fontWeight: FontWeight.bold,
              fontSize: 14.0
          ),
          )
      ),
    );
  }
  void Sucesso(){
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> Home_Page()));
  }

}
