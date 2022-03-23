import 'dart:async';

import 'package:c4sport_app/ui/routes/app_routes.dart';
import 'package:c4sport_app/ui/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

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
          ///loading_animation
          Center(
            child: Padding(
                padding: EdgeInsets.only(bottom: width / 2),
                child: Lottie.asset('assets/loading_lottie.json')),
          ),

          ///addidas_fit background
          Container(
            alignment: Alignment.bottomCenter,
            child: Image.asset(
              'assets/images/addidas_fit.png',
              fit: BoxFit.fitWidth,
            ),
          ),
        ],
      ),
    );
  }

  redirect() async {
    Timer(const Duration(seconds: 3), () => Get.offAndToNamed(Routes.loginScreen));
  }
}
