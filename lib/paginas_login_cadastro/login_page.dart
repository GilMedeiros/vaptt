import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:vapt/models/user_model.dart';
import 'package:vapt/paginas_login_cadastro/verificacao_01.dart';
import 'package:vapt/splash_screen/paginatest.dart';
import 'package:vapt/widgets/refresh.dart';

import 'dados_page.dart';

enum AuthStatus {PHONE_AUTH, SMS_AUTH, SOCIAL_AUTH, PROFILE_AUTH}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  static const String TAG = "AUTH";
  AuthStatus status = AuthStatus.SOCIAL_AUTH;

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _numeroController = TextEditingController();
  final _smsController = TextEditingController();

  String _phoneNumber;
  String _errorMessage;
  String _verificationid;
  Timer _codeTimer;

  bool _isRefreshing = false;
  bool _codeTimeOut = false;
  bool _codeVerified = false;
  Duration _timeOut = const Duration(minutes: 1);

  final FirebaseAuth _auth = FirebaseAuth.instance;

  FirebaseUser _firebaseUser;

  //PhoneVerificationFail
  verificationFail(AuthException authException){
    SnackBarDefault(mensagem: "Não foi possível verificar seu número, tente novamente", scaffoldkey: _scaffoldKey);
  }
  //PhoneCodeSent
  codeSent(String verificationid, [int forceResendingToken]) async{
    _codeTimer = Timer(_timeOut, () {
        setState(() {
          _codeTimeOut = true;
        });
    });
    _updateRefreshing(false);
    setState(() {
      this._verificationid = verificationid;
      this.status = AuthStatus.SMS_AUTH;
    });
  }
  //PhoneCodeAutoRetrievalTimeout
  codeAutoRetrieval(String verificarionid){
    _updateRefreshing(false);
    setState(() {
      this._verificationid = verificarionid;
      this._codeTimeOut = true;
    });
  }

  @override
  void dispose(){
    _codeTimer?.cancel();
    super.dispose();
  }

  Future<Null> _updateRefreshing(bool isRefreshing)async{
    if(_isRefreshing){
      setState(() {
        this._isRefreshing = false;
      });
    }
    setState(() {
      this._isRefreshing = isRefreshing;
    });
  }

  Future<Null> _submitPhone() async {
    final error = _phoneInputValidator();
    if(error != null){
      _updateRefreshing(false);
      setState(() {
        _errorMessage = error;
      });
      return null;
    } else {
      _updateRefreshing(false);
      setState(() {
        _errorMessage = null;
      });
//      final result = await _verifiPhoneNumber();
//      return result;
    }
  }

//  Future<Null> _verifiPhoneNumber() async {
//    await _auth.verifyPhoneNumber(
//        phoneNumber: _numeroController.text,
//        timeout: _timeOut,
//        verificationCompleted: _linkWithPhoneNumber,
//        verificationFailed: verificationFail,
//        codeSent: codeSent,
//        codeAutoRetrievalTimeout: codeAutoRetrieval
//    );
//  }

//  Future<Null> _submitSmsCode()async{
//    final error = _smsInputValidator();
//    if(error != null){
//      _updateRefreshing(false);
//      SnackBarDefault(mensagem: error, scaffoldkey: _scaffoldKey);
//      return null;
//    } else {
//      if(this._codeVerified){
//        await _finishSignIn(await _auth.currentUser());
//      } else {
//        await _linkWithPhoneNumber(
//          PhoneAuthProvider.getCredential(
//              verificationId: _verificationid,
//              smsCode: _smsController.text
//          ),
//        );
//      }
//      return null;
//    }
//  }

//  Future<void> _linkWithPhoneNumber (AuthCredential credential) async{
//    final errorMessage = "Não foi possível verificar seu código, tente novamente";
//        await _onCodeVerified(_firebaseUser).then((codeVerified) async {
//     this._codeVerified = codeVerified;
//    });
//    if(this._codeVerified){
//      await _finishSignIn(_firebaseUser);
//    } else {
//      SnackBarDefault(mensagem: errorMessage, scaffoldkey: _scaffoldKey);
//    }
//  }

  Future<bool> _onCodeVerified(FirebaseUser user) async {

      final isUserValid = (user != null && (user.phoneNumber !=null && user.phoneNumber.isNotEmpty));
    if(isUserValid){
      setState(() {
        this.status = AuthStatus.PROFILE_AUTH;
      });
    } else {
      SnackBarDefault(mensagem: "Não conseguimos verificar seu código, tente novamente", scaffoldkey: _scaffoldKey);
    }
    return isUserValid;
  }
  _finishSignIn(FirebaseUser user) async {
    await _onCodeVerified(user).then((result){
      if(result){
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => DadosCadastraisPAGE()
        ));
      } else {
        setState(() {
          this.status = AuthStatus.SMS_AUTH;
        });
        SnackBarDefault(mensagem: "Não foi possível cadastrar seu usuário", scaffoldkey: _scaffoldKey);
      }
    }
    );
  }


  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<UserModel>(
        builder: (context, child, model) {
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
                Container(
                  alignment: Alignment.topCenter,
                  padding: EdgeInsets.only(top: 10.0),
                  child: Text("Bem-vindo à VAPT ",
                      style:
                      TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold)),
                ),
                SizedBox(height: 16.0,),
                Text(
                    "Por favor, entre com seu número \n de celular para prosseguir",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w900,
                        fontFamily: "Roboto")
                ),
                SizedBox(height: 16.0,),
                /////////////////CAIXA DE ENTRADA DO NUMERO
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
                      controller: _numeroController,
                      inputFormatters: [
                        WhitelistingTextInputFormatter.digitsOnly,
                      ],
                      keyboardType: TextInputType.phone,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 30.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                      ),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          counterText: "",
                          hintText: "(21)9XXXX-XXXX"
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 5,),
                Text("Não serão cobradas taxas de SMS \n DIGITE APENAS NÚMEROS, SEM ESPAÇO OU TRAVESSÃO", style: TextStyle(fontSize: 11.0, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                //////////////////////////////////////////
                SizedBox(height: 16,),
                RaisedButton(
                  onPressed: () {
                    if (_numeroController.text.isEmpty) {
                      model.SnackBarDefault(
                          mensagem: "Insira um número de telefone",
                          scaffoldkey: _scaffoldKey);
                      FocusScope.of(context).requestFocus(new FocusNode());
                    } else {
                          Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => PagVerificacao()));
                    }
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
                  ),
                ),
              ],
            ),
          );
        }
    );
  }

  String _phoneInputValidator() {

    if (_numeroController.text.isEmpty) {

      return "Your phone number can't be empty!";

    } else if (_numeroController.text.length < 15) {

      return "This phone number is invalid!";

    }

    return null;

  }
  String _smsInputValidator() {

    if (_smsController.text.isEmpty) {

      return "Your verification code can't be empty!";

    } else if (_smsController.text.length < 6) {

      return "This verification code is invalid!";

    }

    return null;

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
        )
    );
  }
}