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
  const ShadowTextField(
      {Key? key,
      this.prefixIcon,
      this.suffixIcon,
      this.onChanged,
      this.border,
      required this.hint,
      this.validator,
      this.obscureText = false,
      this.textInputType =  TextInputType.text,
      this.maxLength =  256,
      this.controller,
      this.margin = 47})
      : super(key: key);

  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>?  onChanged;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final double margin;
  final InputBorder? border;
  final String hint;
  final bool obscureText;
  final TextInputType  textInputType;
  final int  maxLength;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 37,
      // margin: EdgeInsets.only(
      //   left: margin,
      //   right: margin,
      // ),
      decoration:  BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(5),
        boxShadow:const [
           BoxShadow(
            color: Color(0x29000000),
            offset: Offset(0, 3),
            blurRadius: 6,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 0),
        child: TextFormField(
          keyboardType: textInputType,
          maxLength: maxLength,
          obscureText: obscureText,
          validator: validator,
          controller: controller,
          textAlign: TextAlign.center,
          onChanged: onChanged,
          obscuringCharacter: '*',
          decoration: InputDecoration(
            isDense: true,
            counterText: '',
            contentPadding: const EdgeInsets.all(10.0),
            // decoration: InputDecoration(
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            //             border: InputBorder.none,
            hintText: hint,
            //           ),
            fillColor: whiteColor,
            focusedBorder: const OutlineInputBorder(
              borderSide:  BorderSide(
                color: Color(0xffc2c2c2),
                width: 1.0,
              ),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: lightGreyColor,
                width: 1.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
