import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vapt/models/user_model.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:vapt/paginas_login_cadastro/dados_page.dart';
import 'package:vapt/paginas_login_cadastro/login_page.dart';


class PagVerificacao extends StatefulWidget {

  @override
  _PagVerificacaoState createState() => _PagVerificacaoState();
}
class _PagVerificacaoState extends State<PagVerificacao> {



  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _smsController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<UserModel>(
      builder: (context,child, model){
        return Scaffold(
          key: _scaffoldKey,
          resizeToAvoidBottomPadding: false,
          appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 50, 50, 50),
            title: Image(
              image: AssetImage('images/toplogo.png'),
            ),
            centerTitle: true,
          ),
          body: Column(
              children: <Widget>[
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: <Widget>[
                    Icon(
                      Icons.radio_button_checked,size: 14,
                    ),
                    SizedBox(width: 4,),
                    Icon(
                      Icons.radio_button_unchecked,size: 14,
                    ),
                    SizedBox(width: 4,),
                    Icon(
                      Icons.radio_button_unchecked,size: 14,
                    ),
                  ],
                ),
                SizedBox(height: 14,),
                Text ("Digite o código enviado para o número",
                  style:
                  TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),

                ),
                SizedBox(height: 16.0,),
                Container(
                  width: 264,
                  height: 64,
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
                      controller: _smsController,
                      textAlign: TextAlign.center,

                      style: TextStyle(
                          fontSize: 30.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        counterText: "",
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16,),
                RaisedButton(
                    onPressed: (){
                      if(_smsController.text.isEmpty) {
                        _scaffoldKey.currentState.showSnackBar(
                          SnackBar(
                            content: Text("Insira um código!",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 255, 103, 38),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0
                              ),
                            ),
                            backgroundColor: Color.fromARGB(255, 50, 50, 50),
                            duration: Duration(seconds: 4),
                          ),
                        );
                      } else {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => DadosCadastraisPAGE()));
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
                        child: Text("AVANÇAR",
                            style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontFamily: "Robot",
                                fontSize: 26.0,
                                color: Color.fromARGB(255, 255, 103, 38))
                        ),
                      ),
                    )
                )
              ]
          ),
        );
      }
    );
  }

    }
