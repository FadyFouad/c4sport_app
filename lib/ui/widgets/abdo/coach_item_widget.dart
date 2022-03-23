import 'package:c4sport_app/models/coach_model.dart';
import 'package:c4sport_app/ui/screens/coach_profile_screen.dart';
import 'package:c4sport_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

/*
╔═══════════════════════════════════════════════════╗
║ Created by AbdElqioom on 3/20/2022 at 10:41 AM.   ║
║═══════════════════════════════════════════════════║
║ fady.fouad.a@gmail.com.                           ║
╚═══════════════════════════════════════════════════╝
*/

class CoachItemWidget extends StatelessWidget {
  const CoachItemWidget({Key? key, required this.coach}) : super(key: key);

  final CoachModel coach;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Get.to(const CoachProfileScreen());
        },
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
                            // height: 130,
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
                                  coach.name!,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: primaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                 Text(
                                  coach.email!,
                                  style:const TextStyle(
                                    fontSize: 10,
                                    color: primaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Text(
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
                                  itemPadding: const EdgeInsets
                                      .symmetric(
                                      horizontal: 2.0),
                                  itemBuilder: (context, _) =>
                                  const  Icon(
                                        Icons.star,
                                        color: accentColor,
                                      ),
                                  onRatingUpdate: (rating) {
                                    // print(rating);
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
                            const Padding(
                              padding: EdgeInsets.symmetric(
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
                        child: SizedBox(
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
        ));
  }
}
