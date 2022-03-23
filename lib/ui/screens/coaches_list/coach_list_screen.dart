import 'package:c4sport_app/ui/screens/coaches_list/controller/coaches_controller.dart';
import 'package:c4sport_app/ui/widgets/abdo/coach_item_widget.dart';
import 'package:c4sport_app/ui/widgets/app_bar.dart';
import 'package:c4sport_app/ui/widgets/app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

/*
╔═══════════════════════════════════════════════════╗
║ Created by Fady Fouad on 3/15/2022 at 10:01 AM.   ║
║═══════════════════════════════════════════════════║
║ fady.fouad.a@gmail.com.                           ║
╚═══════════════════════════════════════════════════╝
*/

class CoachesListScreen extends GetView<CoachListController> {
  const CoachesListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int crossAxisCount = 2;
    return SafeArea(
        child: Scaffold(
          drawer: const AppDrawer(),
          appBar: const CustomAppBar(
            title: 'AppBar',
            actions: [],
          ),
          body: Obx(() {
            var list = controller.coachesList.value;
            return MasonryGridView.count(
              crossAxisCount: crossAxisCount,
              mainAxisSpacing: 2,
              crossAxisSpacing: 4,
              itemCount: list.length,
              itemBuilder: (context, index) {
                return CoachItemWidget(coach: list[index],);
              },
            );
          }),
        ));
  }
}
