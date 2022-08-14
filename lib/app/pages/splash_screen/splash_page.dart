
import 'package:get/get.dart';
import 'package:school_driver/app/data/global/global%20Auth/auth_binding.dart';
import 'package:school_driver/app/pages/splash_screen/splash_screen.dart';
import 'package:school_driver/app/route/routs.dart';

class SplashPage  extends GetPage{
  SplashPage():super(
      name: AppRouters.SPLASH_SCREEN,
      page: () => SplashScreen(),
      binding: AuthBinding(),
      transitionDuration: const Duration(milliseconds: 500));

}