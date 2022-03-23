import 'package:c4sport_app/ui/screens/coaches_list/coach_list_screen.dart';
import 'package:c4sport_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/*
╔═══════════════════════════════════════════════════╗
║ Created by Fady Fouad on 3/15/2022 at 4:57 PM.    ║
║═══════════════════════════════════════════════════║
║ fady.fouad.a@gmail.com.                           ║
╚═══════════════════════════════════════════════════╝
*/

class LoginByEmailScreen extends StatelessWidget {
  const LoginByEmailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    // var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                'assets/images/addidas_fit.png',
              ),
              fit: BoxFit.fitWidth,
              alignment: Alignment.bottomCenter),
        ),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 50,
                ),

                ///logo
                Center(
                  child: Container(
                    alignment: Alignment.topCenter,
                    height: 212,
                    width: 212,
                    child: Image.asset('assets/images/app_logo.png'),
                  ),
                ),

                ///welcome
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: SizedBox(
                      width: 240,
                      height: 80,
                      child: Image.asset('assets/images/welcome.png'),
                    ),
                  ),
                ),
                const SizedBox(height: 80),

                /// Your sign in details..
                const Text("Your sign in details..",
                    style: TextStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Montserrat",
                        fontStyle: FontStyle.normal,
                        fontSize: 14.0),
                    textAlign: TextAlign.left),
                const SizedBox(height: 20),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 36),
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                      hintText: 'your email',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 5.0),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 36),
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                      hintText: 'Password',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 5.0),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(36.0),
                  child: SizedBox(
                    width: width,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: accentColor,
                      ),
                      onPressed: () {
                        Get.to(const CoachesListScreen());
                      },
                      child: // Rectangle 4
                          Text('submit'.toUpperCase()),
                    ),
                  ),
                ),
                // Forgot your password? Reset now
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: RichText(
                    text: const TextSpan(children: [
                      TextSpan(
                          style: TextStyle(
                              color: primaryColor,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Montserrat",
                              fontStyle: FontStyle.normal,
                              fontSize: 12.0),
                          text: "Forgot your password? "),
                      TextSpan(
                          style: TextStyle(
                              color: primaryColor,
                              fontWeight: FontWeight.w700,
                              fontFamily: "Montserrat",
                              fontStyle: FontStyle.normal,
                              fontSize: 12.0),
                          text: "Reset now")
                    ]),
                  ),
                ),
                // Don't have account? Sign up now
                RichText(
                  text: const TextSpan(children: [
                    TextSpan(
                        style: TextStyle(
                            color: primaryColor,
                            fontWeight: FontWeight.w400,
                            fontFamily: "Montserrat",
                            fontStyle: FontStyle.normal,
                            fontSize: 12.0),
                        text: "Don't have account? "),
                    TextSpan(
                        style: TextStyle(
                            color: primaryColor,
                            fontWeight: FontWeight.w700,
                            fontFamily: "Montserrat",
                            fontStyle: FontStyle.normal,
                            fontSize: 12.0),
                        text: "Sign up now")
                  ]),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
