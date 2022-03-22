import 'package:c4sport_app/ui/screens/agenda_widget.dart';
import 'package:c4sport_app/ui/widgets/app_bar.dart';
import 'package:c4sport_app/ui/widgets/rounded_button.dart';
import 'package:c4sport_app/ui/widgets/shadow_text_feild.dart';
import 'package:c4sport_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/*
╔═══════════════════════════════════════════════════╗
║ Created by Fady Fouad on 3/17/2022 at 10:41 AM.   ║
║═══════════════════════════════════════════════════║
║ fady.fouad.a@gmail.com.                           ║
╚═══════════════════════════════════════════════════╝
*/

class PayByCardScreen extends StatelessWidget {
  const PayByCardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var width = MediaQuery.of(context).size.width;
    // var height = MediaQuery.of(context).size.height;
    return  Scaffold(
      appBar: const CustomAppBar(actions: [],),
      body:ListView(
        // mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 70,),
          // Add Card Details
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
                "Add Card Details",
                style: TextStyle(
                    color:  primaryColor,
                    fontWeight: FontWeight.w700,
                    fontFamily: "Montserrat",
                    fontStyle:  FontStyle.normal,
                    fontSize: 20.0
                ),
                textAlign: TextAlign.center
            ),
          ),
          // Please Add your card details
          const Text(
              "Please Add your card details",
              style: TextStyle(
                  color:  primaryColor,
                  fontWeight: FontWeight.w300,
                  fontFamily: "Montserrat",
                  fontStyle:  FontStyle.normal,
                  fontSize: 14.0
              ),
              textAlign: TextAlign.center
          ),
          const SizedBox(height: 30,),

          Visibility(
            visible:true,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              margin: const EdgeInsets.only(left: 16, top: 16, right: 16),
              child: const ShadowTextField(hint: '',),
            ),
          ),
          Row(
            children: <Widget>[
              Visibility(
                visible:true,
                child: Expanded(
                  child: Container(
                    // padding: const EdgeInsets.symmetric(vertical: 8.0),
                    margin:
                    const EdgeInsets.only(left: 47, top: 8,),
                    child: const ShadowTextField(hint: '',margin: 16),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  margin: const EdgeInsets.only(top: 8, right: 47),
                  child:const ShadowTextField(hint: '',margin: 16,),
                ),
              ),
            ],
          ),
          Visibility(
            visible: true,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              margin: const EdgeInsets.only(left: 16, top: 8, right: 16),
              child: const ShadowTextField(hint: '',),
            ),
          ),

          const SizedBox(height: 80,),
          RoundedCornerButton(text: 'PAY', onTap: (){
            Get.to(const AgendaScreen());
          }),
          ],
      ),
    );
  }
}
