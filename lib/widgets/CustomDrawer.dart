import 'package:flutter/material.dart';
import 'package:vapt/Tiles/DrawerTile.dart';

class CustomDrawer extends StatelessWidget {

  final PageController pageController;

  CustomDrawer(this.pageController);

  @override
  Widget build(BuildContext context) {

    Widget _drawerback() => Container(
      color: Color.fromARGB(255, 255, 103, 38),
    );

    return Drawer(
      child: Stack(
        children: <Widget>[
          _drawerback(),
          ListView(
            children: <Widget>[
          Flex(
          direction: Axis.horizontal ,
            children: <Widget>[
              Expanded(
                  child: Container(
                    height: 130,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8),bottomRight: Radius.circular(8)),
                      color: Color.fromARGB(255, 50, 50, 50),
                      boxShadow: [
                        
                        BoxShadow(
                            color: Color.fromARGB(100,0,0,0),
                          offset: Offset(0, 3.5)
                        ),
                      ]
                    ),
                    child: Padding(
                        padding: EdgeInsets.only(left: 26,top: 26,bottom: 26),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Stack(
                            children: <Widget>[
                              Positioned(
                                  child:GestureDetector(
                                    child: Container(
                                      width: 77.9,
                                      height: 77.9,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(image: AssetImage("images/perfil.png")),
                                          border: Border.all(
                                            width: 2.1,
                                            color: Color.fromARGB(255, 255,103, 38),
                                            style: BorderStyle.solid,
                                          )
                                      ),
                                    ),
                                  )
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(left: 26),
                                child: Text("Olá, USER",style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                    fontSize: 19,
                                    color: Color.fromARGB(255, 255, 76, 0),
                                ),
                                ),
                              ),
                              SizedBox(height:9 ,),
                              Padding(
                                padding: EdgeInsets.only(left: 26),
                                child: Text("Como posso te ajudar ?",style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14,
                                  color: Color.fromARGB(255, 255, 76, 0),
                                ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
              ),
              )],
          ), // TOP BAR DRAWER
              Divider(color: Colors.transparent,),
                  DrawerTile("Início",pageController, 0),
                  Divider(),
                  DrawerTile("Meus Dados",pageController, 1),
                  Divider(),
                  DrawerTile("Favoritos",pageController, 2),
                  Divider(),
                  DrawerTile("Histórico de busca",pageController, 3),
                  Divider(),
                  DrawerTile("Formas de pagamento",pageController, 4),
                  Divider(),
                  DrawerTile("Avisos",pageController, 5),
                  Divider(),
                  DrawerTile("Configurações",pageController, 6),
                  Divider(),
                  DrawerTile("Sobre nós",pageController, 7),
                  Divider(),
                  DrawerTile("Trabalhe conosco",pageController, 8),
                  Divider(),
                  DrawerTile("Termos e condições",pageController, 9),
                  Divider(),
                  DrawerTile("Ajuda",pageController, 10),

            ],
          ),
        ],
      ),
    );
  }
}
