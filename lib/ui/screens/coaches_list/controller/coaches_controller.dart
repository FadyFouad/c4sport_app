import 'package:c4sport_app/data/network/coaches_api.dart';
import 'package:c4sport_app/models/api_response.dart';
import 'package:c4sport_app/models/coach_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

/*
╔═══════════════════════════════════════════════════╗
║ Created by Fady Fouad on 3/23/2022 at 10:42 AM.   ║
║═══════════════════════════════════════════════════║
║ fady.fouad.a@gmail.com.                           ║
╚═══════════════════════════════════════════════════╝
*/

/*

==> Network --> data

==> Local (sqflite,shared preference) --> local

==> UI -->

==>

*/


class CoachListController extends GetxController{

  var coachesList = List<CoachModel>.empty(growable: true).obs;


  @override
  void onInit() async {
   getCoachesList();
  }
  @override
  void onClose() {

  }

  @override
  void onReady() {

  }

  getCoachesList()async{
    final logger = Logger();
    ApiResponse response = await CoachesApi().getCoachesList(
        callback: (status, message, coachesList) {
          logger.i(status);
          logger.i(message);
          logger.i('$coachesList');

        });
    coachesList.value = response.data as List<CoachModel>;
    update();
  }
}
