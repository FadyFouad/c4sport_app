import 'package:c4sport_app/ui/routes/app_routes.dart';
import 'package:c4sport_app/ui/screens/coaches_list/binding/coach_list_binding.dart';
import 'package:c4sport_app/ui/screens/coaches_list/coach_list_screen.dart';
import 'package:c4sport_app/ui/screens/authentication/login_screen.dart';
import 'package:c4sport_app/ui/screens/splash_screen.dart';
import 'package:get/get.dart';

/*
╔═══════════════════════════════════════════════════╗
║ Created by Fady Fouad on 3/15/2022 at 9:39 AM.    ║
║═══════════════════════════════════════════════════║
║ fady.fouad.a@gmail.com.                           ║
╚═══════════════════════════════════════════════════╝
*/

class AppPages{
  static final pages = [
    GetPage(
      name: Routes.root,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: Routes.loginScreen,
      page: () => LoginScreen(),
    ),
    GetPage(
      name: Routes.coachesListScreen,
      page: () => CoachesListScreen(),
      binding: CoachListBinding(),
    ),
  ];
}