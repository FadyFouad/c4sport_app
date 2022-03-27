import 'package:c4sport_app/ui/routes/app_routes.dart';
import 'package:c4sport_app/ui/screens/authentication/login_with_email_screen.dart';
import 'package:c4sport_app/ui/screens/coaches_list/coach_list_screen.dart';
import 'package:c4sport_app/ui/widgets/shadow_text_feild.dart';
import 'package:c4sport_app/ui/widgets/social_button.dart';
import 'package:c4sport_app/utils/app_colors.dart';
import 'package:c4sport_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/*
╔═══════════════════════════════════════════════════╗
║ Created by Fady Fouad on 3/14/2022 at 4:15 PM.    ║
║═══════════════════════════════════════════════════║
║ fady.fouad.a@gmail.com.                           ║
╚═══════════════════════════════════════════════════╝
*/

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _countryCodeController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();

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
                const SizedBox(height: 28),

                /// create account..
                const Center(
                  child:  // Create C4S account..
                  Text(
                      "Create C4S account..",
                      style: const TextStyle(
                          color:  const Color(0xff303952),
                          fontWeight: FontWeight.w400,
                          fontFamily: "Montserrat",
                          fontStyle:  FontStyle.normal,
                          fontSize: 16.0
                      ),
                      textAlign: TextAlign.left
                  ),
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              width: width*.4,
                              child: ShadowTextField(
                                controller: _firstNameController,
                                validator: (value) {
                                  if(value!.isEmpty){
                                    return 'Please enter valid name';
                                  }
                                  return null;
                                },
                                onChanged: (value){
                                  setState(() {
                                    _formKey.currentState!.validate();
                                  });
                                  logger.i(value);
                                },
                                hint: 'First Name',
                                margin: 0,
                              ),
                            ),
                            SizedBox(
                              width: width*.4,
                              child: ShadowTextField(
                                controller: _lastNameController,
                                validator: (value) {
                                  if(value!.isEmpty){
                                    return 'Please enter valid name';
                                  }
                                  return null;
                                },
                                onChanged: (value){
                                  setState(() {
                                    _formKey.currentState!.validate();
                                  });
                                  logger.i(value);
                                },
                                hint: 'Last Name',
                                margin: 0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 36),
                        child: ShadowTextField(
                          controller: _emailController,
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
                      Padding(
                        padding:
                        const EdgeInsets.symmetric(vertical: 8.0, horizontal: 36),
                        child: ShadowTextField(
                          controller: _passwordController,
                          obscureText: true,
                          hint: 'Password',
                          margin: 0,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 36),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              width: width*.2,
                              child: ShadowTextField(
                                controller: _countryCodeController,
                                textInputType:  TextInputType.phone,
                                maxLength: 3,
                                validator: (value) {
                                  if(value!.isEmpty){
                                    return 'Please enter valid code';
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
                                hint: '+20',
                                margin: 0,
                              ),
                            ),
                            SizedBox(
                              width: width*.6,
                              child: ShadowTextField(
                                controller: _phoneController,
                                textInputType:  TextInputType.phone,
                                maxLength: 11,
                                validator: (value) {
                                  if(value!.isEmpty){
                                    return 'Please enter valid phone num';
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
                                hint: '1123815517',
                                margin: 0,
                              ),
                            ),
                          ],
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
                        onPressed: isValidForm() ?  () {} : null,
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

              ],
            ),
          ],
        ),
      ),
    );
  }
  bool isValidForm(){
    if(_formKey.currentState!=null){
      return _formKey.currentState!.validate();
    }
    else {
      return false;
    }
  }
}
