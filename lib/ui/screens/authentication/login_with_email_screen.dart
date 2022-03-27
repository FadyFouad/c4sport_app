import 'package:c4sport_app/ui/widgets/shadow_text_feild.dart';
import 'package:c4sport_app/utils/app_colors.dart';
import 'package:c4sport_app/utils/constants.dart';
import 'package:flutter/material.dart';

/*
╔═══════════════════════════════════════════════════╗
║ Created by Fady Fouad on 3/15/2022 at 4:57 PM.    ║
║═══════════════════════════════════════════════════║
║ fady.fouad.a@gmail.com.                           ║
╚═══════════════════════════════════════════════════╝
*/

class LoginByEmailScreen extends StatefulWidget {
  const LoginByEmailScreen({Key? key}) : super(key: key);

  @override
  State<LoginByEmailScreen> createState() => _LoginByEmailScreenState();
}

class _LoginByEmailScreenState extends State<LoginByEmailScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  var emailValue = '';

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
            ListView(
              // mainAxisAlignment: MainAxisAlignment.start,
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
                const Center(
                  child:  Text("Your sign in details..",
                      style: TextStyle(
                          color: primaryColor,
                          fontWeight: FontWeight.w400,
                          fontFamily: "Montserrat",
                          fontStyle: FontStyle.normal,
                          fontSize: 14.0),
                      textAlign: TextAlign.left),
                ),

                /// Email and password
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 36),
                        child: ShadowTextField(
                          validator: (value) {
                            bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(emailValue);

                            if(!emailValid){
                              return 'Please enter valid email';
                            }
                            return null;
                          },
                          onChanged: (value){
                            setState(() {
                              emailValue = value;
                              _formKey.currentState!.validate();
                            });
                            logger.i(value);
                          },
                          hint: 'your email',
                          margin: 0,
                        ),
                      ),
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 8.0, horizontal: 36),
                        child: ShadowTextField(
                          obscureText: true,
                          hint: 'Password',
                          margin: 0,
                        ),
                      ),
                    ],
                  ),
                ),

                /// Submit Button
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 36),
                  child: SizedBox(
                    width: width,
                    child: ElevatedButton(
                        onPressed: true ? null : () {},
                        style: ButtonStyle(
                          elevation: MaterialStateProperty.all(5),
                          //Defines Elevation
                          shadowColor: MaterialStateProperty.all(Colors.black),
                          //Defines shadowColor
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                              if (states.contains(MaterialState.pressed))
                                return primaryColor;
                              else if (states.contains(MaterialState.disabled))
                                return Color(0xffdfdfdf);
                              return primaryColor; // Use the component's default.
                            },
                          ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            "SUBMIT",
                            style: TextStyle(
                                color: Color(0xffc2c2c2),
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                fontSize: 16.0),
                          ),
                        )),
                  ),
                ),

                // Forgot your password? Reset now
                Center(
                  child: Padding(
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
                ),
                // Don't have account? Sign up now
                Center(
                  child: RichText(
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
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
