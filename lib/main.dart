import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:vapt/models/user_model.dart';
import 'package:vapt/telas/home_page.dart';

void main() {
  runApp(MaterialApp(
    home: Vapt(),
    debugShowCheckedModeBanner: false,
  ));
}

class Vapt extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return ScopedModel<UserModel>(
      model: UserModel(),
      child: MaterialApp(
        title: 'VAPT',
        theme: ThemeData(
          scaffoldBackgroundColor: Color.fromARGB(255, 217, 88, 32),
          primarySwatch: Colors.orange,
          primaryColor: Colors.black,
        ),
        debugShowCheckedModeBanner: false,
        home: Home_Page()
      ),
    );
  }
}