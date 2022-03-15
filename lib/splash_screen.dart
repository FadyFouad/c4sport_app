import 'dart:async';

import 'package:c4sport_app/home_screen.dart';
import 'package:flutter/material.dart';

/*
╔═══════════════════════════════════════════════════╗
║ Created by Fady Fouad on 3/14/2022 at 4:10 PM.    ║
║═══════════════════════════════════════════════════║
║ fady.fouad.a@gmail.com.                           ║
╚═══════════════════════════════════════════════════╝
*/

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    redirect();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    // var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Padding(
              padding: EdgeInsets.only(bottom: width/2),
              child: Image.asset('assets/images/app_logo.png'),
            ),
          ),
          Container(

            alignment: Alignment.bottomCenter,
            child: Image.asset('assets/images/addidas_fit.png',fit: BoxFit.scaleDown,),
          ),
        ],
      ),
    );
  }

  redirect() async {
    Timer(
      const Duration(seconds: 3),
      () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      ),
    );
  }
}
