import 'package:c4sport_app/utils/app_colors.dart';
import 'package:c4sport_app/utils/styles.dart';
import 'package:flutter/material.dart';

/*
╔═══════════════════════════════════════════════════╗
║ Created by Fady Fouad on 3/15/2022 at 12:26 PM.   ║
║═══════════════════════════════════════════════════║
║ fady.fouad.a@gmail.com.                           ║
╚═══════════════════════════════════════════════════╝
*/

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(30), topRight: Radius.circular(30)),
        ),
        width: MediaQuery.of(context).size.width * 0.70, //70% of the screen
        child: Column(
          // padding: EdgeInsets.zero,
          children: <Widget>[
            Expanded(
              child: Column(
                children: [
                  ///close
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Align(
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(Icons.close),
                      ),
                      alignment: Alignment.topLeft,
                    ),
                  ),
                  Container(
                    width: 78,
                    height: 78,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(
                        color: accentColor,
                        width: 2,
                      ),
                    ),
                    child: Image.asset('assets/images/app_logo.png'),
                  ),
                  const SizedBox(
                    height: 5,
                  ),

                  /// Rutger Reman
                  Text(
                    "Rutger Reman",
                    style: normalTextStyle_700.copyWith(color: primaryColor),
                  ),
                  const SizedBox(
                    height: 5,
                  ),

                  /// Edit Profile Details
                  Text("Edit Profile Details",
                      style: normalTextStyle_400.copyWith(color: accentColor),
                      textAlign: TextAlign.left),

                  /// Rectangle 16
                  const SizedBox(
                    height: 20,
                  ),
                  const Divider(
                      endIndent: 32,
                      indent: 32,
                      color: Color(0xffcbcbcb),
                      thickness: 1),
                  _buildDrawerList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildDrawerList() {
    return Column(
      children: [
        _buildDrawerItem(label: 'My Sports'),
        _buildDrawerItem(label: 'Achievements '),
        _buildDrawerItem(label: 'Messages '),
        _buildDrawerItem(label: 'My Cart'),
        _buildDrawerItem(label: 'Coaching'),
        _buildDrawerItem(label: 'Venues'),
        _buildDrawerItem(label: 'Sport Health'),
        _buildDrawerItem(label: 'Settings'),
      ],
    );
  }

  _buildDrawerItem({required String label}) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 42.0, left: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(
                Icons.access_alarm_sharp,
                color: accentColor,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(label,
                    style: darkTextStyle_400, textAlign: TextAlign.left),
              ),
            ],
          ),
        ),
        const Divider(
            endIndent: 45, indent: 20, color: Color(0xffcbcbcb), thickness: 1),
      ],
    );
  }
}
