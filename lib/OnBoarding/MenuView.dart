import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kyty/OnBoarding/RegisterView.dart';

class MenuView extends StatelessWidget{

  late BuildContext _context;

  void onClickRegistrar(){
    Navigator.of(_context).pushNamed("/registerview");
  }
  void onClickAceptar(){

  }

  @override
  Widget build(BuildContext context) {
    _context=context;
    // TODO: implement build
    //Text texto=Text("Hola Mundo desde Kyty");
    //return texto;


    Column columna = Column(children: [
      Text("Bienvenido a Kyty Login",style: TextStyle(fontSize: 25)),

      Padding(padding: EdgeInsets.symmetric(horizontal: 60, vertical: 16),
        child: TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Escribe tu usuario',
          ),
        ),
      ),

    ],);

    AppBar appBar = AppBar(
      title: const Text('Login'),
      centerTitle: true,
      shadowColor: Colors.pink,
      backgroundColor: Colors.greenAccent,
    );

    Scaffold scaf=Scaffold(body: columna,
      //backgroundColor: Colors.deepOrange,
      appBar: appBar,);

    return scaf;
  }

}