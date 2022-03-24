import 'package:c4sport_app/ui/routes/app_pages.dart';
import 'package:c4sport_app/ui/routes/app_routes.dart';
import 'package:c4sport_app/ui/screens/coach_profile_screen.dart';
import 'package:c4sport_app/ui/screens/coaches_list/binding/coach_list_binding.dart';
import 'package:c4sport_app/ui/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
        primarySwatch: Colors.deepOrange,
      ),
      initialRoute: Routes.root,
      // initialBinding: CoachListBinding(),
      getPages: AppPages.pages,
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
//   late final AnimationController _controller;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(vsync: this);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Lottie.asset(
//               'assets/loading_lottie.json',
//               onLoaded: (composition) {
//                 // Configure the AnimationController with the duration of the
//                 // Lottie file and start the animation.
//                 _controller
//                   ..duration = composition.duration
//                   ..forward();
//               },
//               controller: _controller,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
