import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kyty/OnBoarding/RegisterView.dart';

class LoginView extends StatelessWidget{

  late BuildContext _context;

  TextEditingController tecUsername = TextEditingController();
  TextEditingController tecPassword = TextEditingController();

  void showMyDialog(String mensaje) async {
    return showDialog<void>(
      context: _context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('AlertDialog Title'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(mensaje),
                Text(mensaje),
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

  void onClickRegistrar(){
    Navigator.of(_context).pushNamed("/registerview");
  }
  void onClickAceptar() async{

    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: tecUsername.text,
          password: tecPassword.text
      );

      Navigator.of(_context).pushNamed("/menuview");
      print(">>>>>>>>>>>>>>>>>>>>>>> me he logeado");

    } on FirebaseAuthException catch (e) {
      showMyDialog("usuario no encontrado "+e.code);

      if (e.code == 'user-not-found') {

        print('The password provided is too weak.');
      } else if (e.code == 'wrong-password') {
        showMyDialog("contraseña incorrecta");
        print('The account already exists for that email.');
      }
    }
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
          controller: tecUsername,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Escribe tu usuario',
          ),
        ),
      ),

      Padding(padding: EdgeInsets.symmetric(horizontal: 60, vertical: 16),
        child: TextFormField(
          controller: tecPassword,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Escribe tu password',
          ),
          obscureText: true,
        ),
      ),
      Row(mainAxisAlignment: MainAxisAlignment.center,
        children: [
        TextButton(onPressed: onClickAceptar, child: Text("Aceptar"),),
        TextButton( onPressed: onClickRegistrar, child: Text("REGISTRO"),)
      ],)

        
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