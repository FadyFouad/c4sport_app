import 'package:c4sport_app/ui/screens/coach_profile_screen.dart';
import 'package:c4sport_app/ui/widgets/app_bar.dart';
import 'package:c4sport_app/ui/widgets/app_drawer.dart';
import 'package:c4sport_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
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
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,crossAxisSpacing: 4,
                  mainAxisSpacing: 16
                ),
                itemCount: 11,
                itemBuilder: (_, index) =>
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                            onTap: () {
                              Get.to(CoachProfileScreen());
                            },
                            child: Container(
                        child: Center(
                        child: Card(
                            elevation: 50,
                            color: primaryColor,
                            shadowColor: Colors.black,
                            child: Wrap(
                              alignment: WrapAlignment.start,
                              children: [
                                Stack(
                                  children: [
                                    Column(
                                      children: [
                                        Container(
                                          height: 130,
                                          color: primaryColor,
                                          child: Image.asset(
                                            'assets/images/different_type_cyclists.png',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Container(
                                          width: double.infinity,
                                          color: Colors.white,
                                          child: Column(
                                            children: [
                                              Text(
                                                'Mohammed Marzog',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  color: primaryColor,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                'Zaid City',
                                                style: TextStyle(
                                                  fontSize: 10,
                                                  color: primaryColor,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                'OverAll Rank',
                                                style: TextStyle(
                                                  fontSize: 10,
                                                  color: primaryColor,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              RatingBar.builder(
                                                initialRating: 3,
                                                minRating: 1,
                                                direction: Axis.horizontal,
                                                allowHalfRating: true,
                                                itemCount: 5,
                                                itemSize: 15.0,
                                                itemPadding: EdgeInsets
                                                    .symmetric(
                                                    horizontal: 2.0),
                                                itemBuilder: (context, _) =>
                                                    Icon(
                                                      Icons.star,
                                                      color: accentColor,
                                                    ),
                                                onRatingUpdate: (rating) {
                                                  print(rating);
                                                },
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),


                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          CircleAvatar(
                                              backgroundColor: Colors.white,
                                              radius: 15,
                                              child: Padding(
                                                padding: const EdgeInsets.all(
                                                    5.0),
                                                child: Image.asset(
                                                  'assets/images/weight.png',
                                                  color: primaryColor,
                                                ),
                                              )
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10.0),
                                            child: Text(
                                              'Weight Lifting',
                                              style: TextStyle(
                                                fontSize: 10,
                                                color: Colors.white,
                                                fontWeight: FontWeight.normal,
                                              ), //Textstyle
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      right: 0,
                                      child: Container(
                                        height: 40,
                                        width: 40,
                                        child: Stack(
                                          alignment: Alignment.bottomRight,
                                          children: [
                                            Image.asset(
                                              'assets/images/bottom_corner.png',
                                              fit: BoxFit.fitWidth,
                                              alignment: Alignment.bottomLeft,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 4.0, left: 4.0),
                                              child: Image.asset(
                                                'assets/images/three_white_dots.png',
                                                fit: BoxFit.fitWidth,
                                                alignment: Alignment.center,
                                                height: 15,
                                                width: 15,
                                              ),
                                            ),
                                          ],

                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            )
                        ),
                      ), //Card
                    )),
          )),
    ),)
    )
    ,
    );
  }
}
