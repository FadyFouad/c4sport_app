import 'package:flutter/material.dart';

/*
╔═══════════════════════════════════════════════════╗
║ Created by Fady Fouad on 3/15/2022 at 9:21 AM.    ║
║═══════════════════════════════════════════════════║
║ fady.fouad.a@gmail.com.                           ║
╚═══════════════════════════════════════════════════╝
*/

class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton(
      {Key? key,
      required this.label,
      required this.width,
      required this.onTap,
      required this.icon,
      required this.color})
      : super(key: key);

  final String label;
  final double width;
  final String icon;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        width: width,
        height: 40,
        child: ElevatedButton(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Image.asset('assets/images/$icon.png'),
                ),
                // Icon(Icons.add_photo_alternate_outlined),
                Text(label.toUpperCase(), style: const TextStyle(fontSize: 14)),
                const SizedBox(),
              ],
            ),
            style: ElevatedButton.styleFrom(
              primary: color,
              // foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              // backgroundColor: MaterialStateProperty.all<Color>(color),
            ),
            onPressed: onTap),
      ),
    );
  }
}
