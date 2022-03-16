import 'package:c4sport_app/ui/screens/coach_profile_screen.dart';
import 'package:c4sport_app/ui/widgets/app_bar.dart';
import 'package:c4sport_app/ui/widgets/app_drawer.dart';
import 'package:c4sport_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/*
╔═══════════════════════════════════════════════════╗
║ Created by Fady Fouad on 3/15/2022 at 10:01 AM.   ║
║═══════════════════════════════════════════════════║
║ fady.fouad.a@gmail.com.                           ║
╚═══════════════════════════════════════════════════╝
*/

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          drawer: const AppDrawer(),
          appBar: CustomAppBar(
            title: 'AppBar',
            actions: [],
          ),
          body: Container(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount( crossAxisCount: 2,),
              itemCount: 11,
              itemBuilder: (_,index)=> Center(child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(onTap:(){Get.to(CoachProfileScreen());},child: Container(color: index % 3  == 0 ? accentColor :primaryColor,)),
              )),
            ),
          )),
    );
  }
}
