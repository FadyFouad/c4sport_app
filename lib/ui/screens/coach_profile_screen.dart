import 'package:c4sport_app/ui/screens/authentication/pay_by_card_screen.dart';
import 'package:c4sport_app/ui/widgets/app_bar.dart';
import 'package:c4sport_app/ui/widgets/app_drawer.dart';
import 'package:c4sport_app/utils/app_colors.dart';
import 'package:c4sport_app/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/*
╔═══════════════════════════════════════════════════╗
║ Created by Fady Fouad on 3/16/2022 at 10:14 AM.   ║
║═══════════════════════════════════════════════════║
║ fady.fouad.a@gmail.com.                           ║
╚═══════════════════════════════════════════════════╝
*/

class CoachProfileScreen extends StatefulWidget {
  const CoachProfileScreen({Key? key}) : super(key: key);

  @override
  State<CoachProfileScreen> createState() => _CoachProfileScreenState();
}

class _CoachProfileScreenState extends State<CoachProfileScreen> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        drawer: const AppDrawer(),
        appBar: const CustomAppBar(
          title: '',
          actions: [],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  color: primaryColor,
                  alignment: Alignment.topCenter,
                  width: width,
                  child: Image.asset(
                    'assets/images/different_type_cyclists.png',
                    width: width,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Amr Ali El amery
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text("Amr Ali El amery", style: normalTextStyle_700),
                          // Zayed City, Egypt
                          Text("Zayed City, Egypt",
                              style: normalTextStyle_400,
                              textAlign: TextAlign.left),
                        ],
                      ),
                      const Icon(Icons.share, color: whiteColor),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: height * .3 -
                            (kToolbarHeight +
                                MediaQuery.of(context).padding.top)),
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30),
                          topLeft: Radius.circular(30),
                        ),
                        color: whiteColor,
                      ),
                      width: width,
                      height: height * .7,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 32),
                        child: ListView(
                          children: [
                            // WeightLifting
                            _buildLabeledIcon(
                              label: 'WeightLifting',
                              icon: const Icon(Icons.access_alarm_sharp,
                                  color: primaryColor),
                            ),
                            const SizedBox(
                              height: 36,
                            ),
                            // Amr's Bio
                            _buildTitleText(title: 'Amr\'s Bio'),
                            // Amr holds a BS in Physical Education as well as a MS in  Exercise Science and Health Promotion.  He
                            const Text(
                                "Amr holds a BS in Physical Education as well as a MS in Exercise Science and Health Promotion. He is a Certified Strength and Conditioning Specialist (CSCS). He has a background in health and fitness as well as athletic performance training with over 10 years of certification and experience in the field. His passion for fitness began through his love of sports and developed as a varsity athlete in Weightlifting.",
                                style: normalTextStyle_500,
                                textAlign: TextAlign.left),
                            const SizedBox(
                              height: 32,
                            ),
                            _buildTitleText(title: 'Amr\'s Bio'),
                            _buildUnorderedListItem(),
                            _buildUnorderedListItem(),
                            _buildUnorderedListItem(),
                            Padding(
                              padding:const  EdgeInsets.all(16.0),
                              child: Text("View time slot",
                                  style: normalTextStyle_700.copyWith(color: primaryColor,fontSize: 14),
                                  textAlign: TextAlign.left),
                            ),
                            _buildTitleText(title: 'Other Sports'),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _buildLabeledIcon(
                                  label: 'CrossFit',
                                  icon: const Icon(Icons.access_alarm_sharp,
                                      color: primaryColor),
                                ),
                                _buildLabeledIcon(
                                  label: 'Body Building',
                                  icon: const Icon(Icons.access_alarm_sharp,
                                      color: primaryColor),
                                ),
                                const SizedBox(),
                              ],
                            ),
                            _buildTitleText(title: 'Training Packages'),
                            const BookingListTileItem(isBooked: false),
                            const BookingListTileItem(isBooked: false),
                            const BookingListTileItem(isBooked: true),
                            const BookingListTileItem(isBooked: false),
                            const BookingListTileItem(isBooked: false),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      decoration: const BoxDecoration(
                          color: accentColor,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(30),
                            topLeft: Radius.circular(30),
                          )),
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.access_alarm_sharp),
                        label: const Text('CONNECT'),
                        style: ElevatedButton.styleFrom(
                            primary: accentColor,
                            shadowColor: Colors.transparent),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Row _buildLabeledIcon({required String label, required Widget icon}) {
    return Row(
      children: [
        icon,
        Text(label,
            style: normalTextStyle_700.copyWith(
                color: primaryColor, fontSize: 8.0),
            textAlign: TextAlign.left),
      ],
    );
  }

  Row _buildUnorderedListItem() {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 10.0,
            width: 10.0,
            decoration: const BoxDecoration(
              color: Colors.black,
              shape: BoxShape.circle,
            ),
          ),
        ),
        Text('BS in Physical Education',
            style: normalTextStyle_500.copyWith(color: primaryColor),
            textAlign: TextAlign.left),
      ],
    );
  }

  _buildTitleText({required String title}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(title,
          style: normalTextStyle_700.copyWith(color: accentColor),
          textAlign: TextAlign.left),
    );
  }
}

class BookingListTileItem extends StatelessWidget {
  const BookingListTileItem({Key? key, required this.isBooked})
      : super(key: key);
  final bool isBooked;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("Individual Session",
          style: normalTextStyle_700.copyWith(color: primaryColor,fontSize: 16.0),
          textAlign: TextAlign.left),
      subtitle: Text("250 LE/Session",
          style: normalTextStyle_400.copyWith(color: primaryColor,fontSize: 14),
          textAlign: TextAlign.left),
      trailing: isBooked
          ? TextButton(
              onPressed: null,
              child: Text("SUBSCRIBED",
                  style: normalTextStyle_700.copyWith(color: greenColor,fontSize: 12),
                  textAlign: TextAlign.center),
            )
          : ElevatedButton(
              onPressed: () {
                Get.to(const PayByCardScreen());
              },
              child: const Text('bookNow'),
              style: ElevatedButton.styleFrom(primary: accentColor)),
    );
  }
}
