
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState

    return _SplashViewState();
  }

}

class _SplashViewState extends State<SplashView>{

  late BuildContext _context;

  @override
  void initState(){

    super.initState();
    checkSession();

  }

  void checkSession() async {

    await Future.delayed(Duration(seconds: 2));
    if (FirebaseAuth.instance.currentUser != null)
      {

        Navigator.of(_context).popAndPushNamed("/menuview");
      }

    else
      {
        Navigator.of(_context).popAndPushNamed("/loginview");

      }


  }
  @override
  Widget build(BuildContext context) {
    _context = context;
    // TODO: implement build
    Column column = Column(
      children: [
        Image.asset("resources/imagenSplash.png", width: 300, height: 150,),
        CircularProgressIndicator()
      ],
    );
    //return Image.network("https://cdn.discordapp.com/attachments/1094893510609608764/1154156474763845703/yony44_logo_using_cat_ears_and_head_like_disney_symbol_happy_an_1fccd304-c37e-410f-a9bd-155c310e365a.png");
    return column;

  }

}