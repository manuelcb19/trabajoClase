import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget{

  late BuildContext _context;
  late String contenidoLogin;
  late String contenidoPassword;
  late String contenidoPasswordVerificacion;

  final correoMyController = TextEditingController();
  final passwordMyController = TextEditingController();
  final passwordconfirmationMyController = TextEditingController();

  int contador = 0;


  void onClickCancelar(){

    Navigator.of(_context).pushNamed("/registerview");
  }

    void showMyDialog(String mensaje) async {
    return showDialog<void>(
      context: _context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('AlertDialog Title'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text("mensaje"),
                Text("mensaje"),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Approve'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }


  void onClickAceptar() async {

    contador = 0;

    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(

        email: correoMyController.text,

        password: passwordMyController.text,

      );

    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showMyDialog("casa");
        print('The password provided is too weak.');
        contador += 1;
      } else if (e.code == 'email-already-in-use') {
        showMyDialog("contraseña");
        print('The account already exists for that email.');
        contador += 1;
      }
     if(contador == 0) {

       Navigator.of(_context).pushNamed("/menuview");

     }

    }

    catch (e) {
      print(e);
    }
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //Text texto=Text("Hola Mundo desde Kyty");
    //return texto;
    _context=context;

    Column columna = Column(children: [
      Text("Bienvenido a Kyty Register",style: TextStyle(fontSize: 25)),

      Padding(padding: EdgeInsets.symmetric(horizontal: 60, vertical: 16),
        child: TextField(

            controller: correoMyController,
            decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Escribe tu correo',

          ),
        ),
      ),


      Padding(padding: EdgeInsets.symmetric(horizontal: 60, vertical: 16),
        child: TextField(
          controller: passwordMyController,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Escribe tu contraseña',


          ),
        ),
      ),

      Padding(padding: EdgeInsets.symmetric(horizontal: 60, vertical: 16),
        child: TextFormField(

          controller: passwordconfirmationMyController,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Repite tu password',
          ),
          obscureText: true,
        ),
      ),

      Row(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(onPressed: onClickAceptar, child: Text("Aceptar"),),
          TextButton( onPressed: onClickCancelar, child: Text("Cancelar"),)

        ],)

    ],);



    AppBar appBar = AppBar(
      title: const Text('Register'),
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