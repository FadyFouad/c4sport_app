import 'package:c4sport_app/utils/app_colors.dart';
import 'package:flutter/material.dart';

/*
╔═══════════════════════════════════════════════════╗
║ Created by Fady Fouad on 3/17/2022 at 12:13 PM.   ║
║═══════════════════════════════════════════════════║
║ fady.fouad.a@gmail.com.                           ║
╚═══════════════════════════════════════════════════╝
*/


class RoundedCornerButton extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback onTap;
  final double miniWidth;

  const RoundedCornerButton({
    Key? key,
    required this.text,
    required this.onTap,
    this.miniWidth = 250.0,
    this.color = primaryColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("$text".toUpperCase(),
                style: const TextStyle(fontSize: 14)),
          ),
          style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(Size(miniWidth, 50)),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              backgroundColor: MaterialStateProperty.all<Color>(color),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(36.0),
                  ))),
          onPressed: onTap),
    );
  }
}
