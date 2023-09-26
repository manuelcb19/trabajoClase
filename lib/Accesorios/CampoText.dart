import 'package:flutter/material.dart';

class kityCampoText extends StatelessWidget{

  String sHint;

  TextEditingController tecUsername = TextEditingController();

  kityCampoText({Key? key, required this.sHint, required this.tecUsername}) : super (key: key);

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    Row row = Row(
      children: [
      Image.asset("resources/imagenSplash.png", width: 30, height: 30),
        Flexible(child: TextFormField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: sHint
          ),

        )
        )
      ],
    );
    return row;
  }
}