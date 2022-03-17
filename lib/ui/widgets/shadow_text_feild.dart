import 'package:c4sport_app/utils/app_colors.dart';
import 'package:flutter/material.dart';

/*
╔═══════════════════════════════════════════════════╗
║ Created by Fady Fouad on 3/17/2022 at 10:39 AM.   ║
║═══════════════════════════════════════════════════║
║ fady.fouad.a@gmail.com.                           ║
╚═══════════════════════════════════════════════════╝
*/

class ShadowTextField extends StatelessWidget {
  const ShadowTextField({Key? key, this.prefixIcon,required this.hint, this.controller, this.margin=47}) : super(key: key);

  final TextEditingController? controller;
  final Widget? prefixIcon;
  final double margin;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 37,
      margin:  EdgeInsets.only(
        left: margin,
        right: margin,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0x29000000),
            offset: Offset(0, 3),
            blurRadius: 6,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 4.0),
        child: TextFormField(
          controller: controller,
          textAlign: TextAlign.center ,
          decoration: InputDecoration(
            prefixIcon: prefixIcon ?? prefixIcon,
            suffixIcon: const Icon(Icons.check,color: greenColor),
            border: InputBorder.none,
            hintText: hint,
          ),
        ),
      ),
    );
  }
}
