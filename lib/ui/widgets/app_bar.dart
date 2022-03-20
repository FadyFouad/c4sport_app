import 'package:flutter/material.dart';

/*
╔═══════════════════════════════════════════════════╗
║ Created by Fady Fouad on 3/15/2022 at 3:18 PM.    ║
║═══════════════════════════════════════════════════║
║ fady.fouad.a@gmail.com.                           ║
╚═══════════════════════════════════════════════════╝
*/

class CustomAppBar extends StatefulWidget with PreferredSizeWidget {
  const CustomAppBar(
      {Key? key, this.title = '', this.subtitle = '', required this.actions, this.bottom})
      : super(key: key);

  final String title;
  final String subtitle;
  final Widget? bottom;
  final List<Widget> actions;

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CustomAppBarState extends State<CustomAppBar> {
  void _handleDrawerButtonEnd() {
    Scaffold.of(context).openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: _handleDrawerButtonEnd,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset(
              'assets/icons/menu_ico.png',
              height: 24,
              width: 24,
            ),
          ),
        ),
        bottom: widget.bottom == null ? null : PreferredSize(
            preferredSize: const Size.fromHeight(48.0),
            child: widget.bottom!),
        toolbarHeight: kToolbarHeight + 100,
        title: SizedBox(
          height: 100,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(child: SizedBox()),
                Image.asset(
                  'assets/icons/notifi_ico.png',
                  height: 36,
                ),
                SizedBox(
                  width: 4,
                ),
                Image.asset(
                  'assets/icons/store_ico.png',
                  height: 22,
                ),
              ],
            ),
          ),
        ),
        actions: widget.actions,
      ),
    );
  }
}
