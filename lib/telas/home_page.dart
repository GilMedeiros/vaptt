import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vapt/tabs/home_tab.dart';
import 'package:vapt/tabs/meus_dados.dart';
import 'package:vapt/widgets/CustomDrawer.dart';

class Home_Page extends StatelessWidget {

  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {


    const RoundedRectangleBorder roundedRectangleBorder = RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)));
      return PageView(
      controller: _pageController,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[


        //PÁGINA 0 - TELA DE INICIO
            Scaffold(
            appBar: AppBar(
              actions: <Widget>[
                FlatButton(
                    onPressed: (){
                    },
                    child: Icon(Icons.shopping_cart,size: 30,color: Color.fromARGB(255, 255, 103, 38),)
                )
              ],
              iconTheme: IconThemeData(color: Color.fromARGB(255, 255, 103, 38)),
              backgroundColor: Color.fromARGB(255, 50, 50, 50),
              shape: roundedRectangleBorder,
              brightness: Brightness.dark,
              title: Image(
                image: AssetImage('images/toplogo.png'),
              ),
              centerTitle: true,
              bottom: PreferredSize(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 255, 103, 38),
                              borderRadius: BorderRadius.all(Radius.circular(27))
                          ),
                          height: 50,
                          margin: EdgeInsets.only(bottom: 6,left: 6,right: 6),
                          child: Stack(
                            children: <Widget>[
                              Positioned(
                                top: 0,
                                bottom: 0,
                                left: 16,
                                child: GestureDetector(
                                  onTap: (){
                                    print("TESTE");
                                  },
                                  child: Icon(Icons.search,size: 30,),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 46),
                                child: TextField(
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      counterText: ""
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  preferredSize: Size(20, 50)),
            ),
            body: Home_tab(),
            drawer: CustomDrawer(_pageController),
          ),

        //PÁGINA 1 - MEUS DADOS
        Scaffold(
          appBar:
          AppBar(
            shape: roundedRectangleBorder,
            brightness: Brightness.dark,
            iconTheme: IconThemeData(color: Color.fromARGB(255, 255, 103, 38)),
            backgroundColor: Color.fromARGB(255, 50, 50, 50),
            title: Image(
              image: AssetImage('images/toplogo.png'),
            ),
            centerTitle: true,
          ),
            body: MeusDadosPage(),
          drawer: CustomDrawer(_pageController),
        ),


        //PÁGINA 2 - FAVORITOS
        Scaffold(
          appBar:
          AppBar(
            shape: roundedRectangleBorder,
            brightness: Brightness.dark,
            iconTheme: IconThemeData(color: Color.fromARGB(255, 255, 103, 38)),
            backgroundColor: Color.fromARGB(255, 50, 50, 50),
            title: Image(
              image: AssetImage('images/toplogo.png'),
            ),
            centerTitle: true,
          ),
          drawer: CustomDrawer(_pageController),
        ),

      ],
    );
  }

}
