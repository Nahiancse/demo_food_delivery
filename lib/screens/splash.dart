import 'dart:async';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

import 'home_screen.dart';
import 'login_screen.dart';
// import 'package:splashscreen/splashscreen.dart';


class Splash2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 4,
      navigateAfterSeconds: new LoginPage(),
      title: new Text('NAHIAN',textScaleFactor: 2,style: TextStyle(color:Colors.white),),
      image: new Image.asset('assets/images/brgr.png',width: double.infinity),
      loadingText: Text("Loading",style: TextStyle(color:Colors.white),),
      photoSize: 120.0,
      loaderColor: Colors.blue,
      backgroundColor:Colors.black,
    );
  }
}