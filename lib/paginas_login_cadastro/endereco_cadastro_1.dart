import 'package:flutter/material.dart';
import 'package:vapt/models/user_model.dart';
import 'package:vapt/paginas_login_cadastro/login_page.dart';

class DadosCadastraisENDERECOPAGE extends StatefulWidget {

  @override
  _DadosCadastraisENDERECOPAGE createState() => _DadosCadastraisENDERECOPAGE();
}
class _DadosCadastraisENDERECOPAGE extends State<DadosCadastraisENDERECOPAGE> {



  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _ruaController = TextEditingController();
  final _numeroController = TextEditingController();
  final _complementoController = TextEditingController();
  final _cepController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                  Icons.radio_button_checked,size: 14,
                ),
                SizedBox(width: 4,),
                Icon(
                  Icons.radio_button_checked,size: 14,
                ),
              ],
            ),
            SizedBox(height: 14,),
            Text ("Digite seu endereço de entrega",
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
                  controller: _ruaController,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                  ),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      counterText: "",
                      hintText: "Rua"
                  ),
                ),
              ),
            ),
            SizedBox(height: 16,),
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
                  keyboardType: TextInputType.text,
                  controller: _numeroController,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                  ),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      counterText: "",
                      hintText: "Número"
                  ),
                ),
              ),
            ),
            SizedBox(height: 16,),
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
                  keyboardType: TextInputType.text,
                  controller: _complementoController,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                  ),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      counterText: "",
                      hintText: "Complemento"
                  ),
                ),
              ),
            ),
            SizedBox(height: 16,),
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
                  keyboardType: TextInputType.text,
                  controller: _cepController,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                  ),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      counterText: "",
                      hintText: "Cep"
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.0,),
            RaisedButton(
                onPressed: (){

//                  if(_nomeController.text.isEmpty || _sobrenomeController.text.isEmpty) {
//                    _scaffoldKey.currentState.showSnackBar(
//                      SnackBar(
//                        content: Text("Insira um nome e um sobrenome!",
//                         style: TextStyle(
//                              color: Color.fromARGB(255, 255, 103, 38),
//                              fontWeight: FontWeight.bold,
//                              fontSize: 18.0
//                         ),
//                       ),
//                       backgroundColor: Color.fromARGB(255, 50, 50, 50),
//                       duration: Duration(seconds: 4),
//                     ),
//                    );
//                 }
//                  if(_sobrenomeController.text.toLowerCase() == "") {
//                  } else if (_nomeController.text.toLowerCase() == _sobrenomeController.text.toLowerCase()){
//                    _scaffoldKey.currentState.showSnackBar(
//                      SnackBar(
//                        content: Text("Insira um nome diferente do sobrenome!",
//                          style: TextStyle(
//                              color: Color.fromARGB(255, 255, 103, 38),
//                              fontWeight: FontWeight.bold,
//                             fontSize: 18.0
//                          ),
//                        ),
//                        backgroundColor: Color.fromARGB(255, 50, 50, 50),
//                        duration: Duration(seconds: 4),
//                      ),
//                    );
//                  }
//                  FocusScope.of(context).requestFocus(new FocusNode());
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

}

