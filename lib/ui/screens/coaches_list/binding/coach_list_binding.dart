import 'package:c4sport_app/ui/screens/coaches_list/controller/coaches_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/*
╔═══════════════════════════════════════════════════╗
║ Created by Fady Fouad on 3/23/2022 at 12:25 PM.   ║
║═══════════════════════════════════════════════════║
║ fady.fouad.a@gmail.com.                           ║
╚═══════════════════════════════════════════════════╝
*/

class CoachListBinding extends Bindings{
  @override
  void dependencies() {
    Get.put<CoachListController>(CoachListController());
  }
}