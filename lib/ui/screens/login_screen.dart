import 'package:c4sport_app/ui/screens/authentication/login_with_email_screen.dart';
import 'package:c4sport_app/ui/screens/home_screen.dart';
import 'package:c4sport_app/ui/widgets/social_button.dart';
import 'package:c4sport_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/*
╔═══════════════════════════════════════════════════╗
║ Created by Fady Fouad on 3/14/2022 at 4:15 PM.    ║
║═══════════════════════════════════════════════════║
║ fady.fouad.a@gmail.com.                           ║
╚═══════════════════════════════════════════════════╝
*/

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    // var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            alignment: Alignment.bottomCenter,
            child: Expanded(
              child: Image.asset(
                'assets/images/addidas_fit.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
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

              ///Sign in Text
              const SizedBox(
                child: Center(
                  child: // Sign in to your account..
                      Text("Sign in to your account..",
                          style: TextStyle(
                              color: primaryColor,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Montserrat",
                              fontStyle: FontStyle.normal,
                              fontSize: 14.0),
                          textAlign: TextAlign.left),
                ),
              ),
              const SizedBox(height: 20),
              _buildSocialButtons(width: width),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                child: Center(
                  child: // Don't have account? Sign up now
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
                            decoration: TextDecoration.underline,
                            color: primaryColor,
                            fontWeight: FontWeight.w700,
                            fontFamily: "Montserrat",
                            fontStyle: FontStyle.normal,
                            fontSize: 12.0),
                        text: "Sign up now")
                  ])),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Column _buildSocialButtons({required double width}) {
    return Column(
      children: [
        SocialLoginButton(
            label: "Sign in with Facebook ",
            width: width,
            onTap: () {
              debugPrint('loggin with Facebook');
            },
            icon: 'facebook_logo',
            color: const Color.fromRGBO(66, 103, 178, 1)),
        SocialLoginButton(
            label: "Sign in using Gmail",
            onTap: () {
              Get.to(const HomeScreen());
              debugPrint('login with Gmail');
            },
            width: width,
            icon: 'gmail_new_logo',
            color: const Color.fromRGBO(234, 67, 53, 1)),
        SocialLoginButton(
            label: "Sign in using your account",
            onTap: () {
              Get.to(const LoginByEmailScreen());
              debugPrint('login with account');
            },
            width: width,
            icon: 'cs_logo',
            color: const Color.fromRGBO(48, 57, 82, 1)),
      ],
    );
  }
}
